/* Hello World Example
   This example code is in the Public Domain (or CC0 licensed, at your option.)
   Unless required by applicable law or agreed to in writing, this
   software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
   CONDITIONS OF ANY KIND, either express or implied.
*/
#include <stdio.h>
#include "sdkconfig.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_system.h"
#include "esp_spi_flash.h"
#include "esp_log.h"
#include "driver/i2c.h"
#include "esp_err.h"
#include "memory.h"

#define SDA GPIO_NUM_3
#define SCL GPIO_NUM_16 
#define I2C_MAX_CLOCK_SPEED 400000
#define I2C_MASTER_TIMEOUT_MS 1000

#define IOEXPANDER_ADDR 0x20

#define OPCODE_AND_RW(slave_addr, rw) ((slave_addr << 1) | (rw))
#define READ_BIT(buffer, bit) ((buffer) >> (bit) & 1)

#define I2C_PORT I2C_NUM_0

#define ACK_EN 1
#define NACK   0

const char* TAG = "DASHCAM_MAIN";

// Below is the IOCON.BANK = 0 addressing
#define IODIRA      0x00
#define IODIRB      0x01
#define IPOLA       0x02
#define IPOLB       0x03
#define GPINTENA    0x04
#define GPINTENB    0x05
#define DEFVALA     0x06
#define DEFVALB     0x07
#define INTCONA    0x08
#define INTCONB     0x09
#define IOCONA      0x0A
#define IOCONB      0x0B
#define GPPUA       0x0C
#define GPPUB       0x0D
#define INTFA       0x0E
#define INTFB       0x0F
#define INTCAPA     0x10
#define INTCAPB     0x11
#define GPIOA       0x12
#define GPIOB       0x13
#define OLATA       0x14
#define OLATB       0x15

#define IO_EXPANDER_INPUT  1
#define IO_EXPANDER_OUTPUT 0

#define OK_BUTTON 7
#define DOWN_BUTTON 6
#define BLUE_LED 5
#define USB_DETECT 4

// IOCON bits
#define IOCON_INTPOL (1 << 1)
#define IOCON_ODR    (1 << 2)


enum gpio_bank
{
    PORT_A = 0,
    PORT_B = 1
};

enum io_direction
{
    DIR_OUTPUT = 0,
    DIR_INPUT = 1
};

enum pull_up_state
{
  PULLUP_DISABLED = 0,
  PULLUP_ENABLED = 1,
  PULLUP_NOT_APPLICABLE = 2,
};

enum interrupt_trigger
{
    MCP_RISING = 0,
    MCP_FALLING = 1,
    MCP_ANY = 2,
};

// Prototypes
esp_err_t init_gpio(enum gpio_bank bank, const uint8_t gpio_number, enum io_direction dir, enum pull_up_state pullup_en);
esp_err_t configure_interrupt(enum gpio_bank bank, uint8_t gpio_number, enum interrupt_trigger int_trigger);

esp_err_t i2c_write_slave_register(uint8_t addr, uint8_t data)
{
    i2c_cmd_handle_t cmd;
    esp_err_t err = ESP_OK;

    // TODO: ERROR CHECKING for input params

    ESP_LOGI(TAG, "Writing [0x%2x] to register %2x", data, addr);

     // 1. CMD link  
    cmd = i2c_cmd_link_create();

    // 2. Start bit
    err = i2c_master_start(cmd);
    if (err) goto exit;

    //3. OP (opcode + read/write) - requires an ACK
    err = i2c_master_write_byte(cmd, OPCODE_AND_RW(IOEXPANDER_ADDR, I2C_MASTER_WRITE), ACK_EN);
    if (err) goto exit;

    //4. Write register address - requires an ACK
    err = i2c_master_write_byte(cmd, addr, ACK_EN);
    if (err) goto exit;

    //5. SR condition (start stop / restart)
    err = i2c_master_start(cmd);
    if (err) goto exit;

    //6. OP (opcode + write) - requires an ACK
    err = i2c_master_write_byte(cmd, OPCODE_AND_RW(IOEXPANDER_ADDR, I2C_MASTER_WRITE), ACK_EN);
    if (err) goto exit;

    //7. Write 1 byte to slave register
    err = i2c_master_write_byte(cmd, data, NACK);
    if (err) goto exit;

    //6. Stop bit
    err = i2c_master_stop(cmd);
    if (err) goto exit;

    //7. Execute command
    err = i2c_master_cmd_begin(I2C_PORT, cmd, pdMS_TO_TICKS(I2C_MASTER_TIMEOUT_MS));

    ESP_LOGI(TAG, "Finished writing data [0x%02x] to address %02x", data, addr);

exit:

    i2c_cmd_link_delete(cmd);

    if (err) ESP_LOGE(TAG, "%s", esp_err_to_name(err));

    return err;
}

esp_err_t i2c_read_slave_register(uint8_t addr, uint8_t* rx_buf)
{
    i2c_cmd_handle_t cmd;
    esp_err_t err = ESP_OK;
    *rx_buf = 0x00;

    // TODO: ERROR CHECKING for input params

    ESP_LOGI(TAG, "Reading address 0x%2x", addr);

     // 1. CMD link  
    cmd = i2c_cmd_link_create();

    // 2. Start bit
    err = i2c_master_start(cmd);
    if (err) goto exit;

    //3. OP (opcode + read/write) - requires an ACK
    err = i2c_master_write_byte(cmd, OPCODE_AND_RW(IOEXPANDER_ADDR, I2C_MASTER_WRITE), ACK_EN);
    if (err) goto exit;

    //4. Write register address - requires an ACK
    err = i2c_master_write_byte(cmd, addr, ACK_EN);
    if (err) goto exit;

    //5. SR condition (start stop / restart)
    err = i2c_master_start(cmd);
    if (err) goto exit;

    //6. OP (opcode + read/write) - requires an ACK
    err = i2c_master_write_byte(cmd, OPCODE_AND_RW (IOEXPANDER_ADDR, I2C_MASTER_READ), ACK_EN);
    if (err) goto exit;

    //7. Read x bytes from slave
    err = i2c_master_read(cmd, rx_buf, sizeof(uint8_t), ACK_EN);
    if (err) goto exit;

    //6. Stop bit
    err = i2c_master_stop(cmd);
    if (err) goto exit;

    //7. Execute command
    err = i2c_master_cmd_begin(I2C_PORT, cmd, pdMS_TO_TICKS(I2C_MASTER_TIMEOUT_MS));

    ESP_LOGI(TAG, "Register 0x%02x = [0x%02x]", addr, rx_buf[0]);

exit:

    i2c_cmd_link_delete(cmd);

    if (err) ESP_LOGE(TAG, "%s", esp_err_to_name(err));

    return err;
}

esp_err_t init_mcp23017()
{
    // Note, IOCON.BANK should be 0 during boot, so we know how the registers 
    // will be addressed

    esp_err_t err = ESP_OK;

    // GPIO A7 is BUTTON OK (input)
    init_gpio(PORT_A, OK_BUTTON, DIR_INPUT, PULLUP_ENABLED);
    configure_interrupt(PORT_A, OK_BUTTON, MCP_ANY);

    // GPIO A6 is BUTTON UP (input)
    init_gpio(PORT_A, DOWN_BUTTON, DIR_INPUT, PULLUP_ENABLED);

    // GPIO A5 is LED (output)
    init_gpio(PORT_A, BLUE_LED, DIR_OUTPUT, PULLUP_NOT_APPLICABLE);
    
    // GPIO A4 is input (USB Detect)
    init_gpio(PORT_A, USB_DETECT, DIR_INPUT, PULLUP_DISABLED);

    return err;
}

esp_err_t init_gpio(enum gpio_bank bank, const uint8_t gpio_number, enum io_direction dir, enum pull_up_state pullup_en)
{
    uint8_t recv_buffer = 0x00; // variable to hold register values
    esp_err_t err = ESP_OK;

    ESP_LOGI(TAG, "Initializing GPIO. Bank = %d, IO NUM = %d, DIREC = %d, PULLUP EN? %d", bank, gpio_number, dir, pullup_en);

    /////////////////////// Error checking ///////////////////////////

    if (gpio_number > 7)
    {
        ESP_LOGE(TAG, "GPIO number is invalid = %d", gpio_number);
        return ESP_ERR_INVALID_ARG;
    }

    //////////////////// Set up GPIO direction //////////////////////

    ESP_LOGI(TAG, "Setting up direction");
    // Read register (if bank is B, the register will be +1 of bank A)
    err = i2c_read_slave_register(IODIRA + (int)bank, &recv_buffer);
    if (err) return err;
  
    // Modify this bit only
    if (dir == DIR_OUTPUT)
    {
        // clear bit
        recv_buffer &= ~(1 << gpio_number);
    }
    else
    {
        // set bit
        recv_buffer |= (1 << gpio_number);
    }

    // Write new register values
    err = i2c_write_slave_register(IODIRA + (int)bank, recv_buffer);
    if (err) return err;

    /////////////////// Set up GPIO pullup (if input) /////////////////////

    // Set up GPIO pull_up if it is an input
    if (dir == DIR_INPUT)
    {
        ESP_LOGI(TAG, "Setting up pullup");
        // Read register and change only the bit we are interested in
        err = i2c_read_slave_register(GPPUA + (int)bank, &recv_buffer);
        if (err) return err;

        if (pullup_en == PULLUP_ENABLED)
        {
            recv_buffer |= (1 << gpio_number);  // high if pullup en
        }
        else
        {
            recv_buffer &= ~(1 << gpio_number);  // low if pullup disabled
        }

        err = i2c_write_slave_register(GPPUA + (int)bank, recv_buffer);
        if (err) return err;
    }
    else
    {
        ESP_LOGI(TAG, "Skipping pullup configuration as pin is input");
    }

    ESP_LOGI(TAG, "GPIO initialization complete!");

    return err;
}

// Write to a gpio pin on bank A or B. 0 will write 0 to pin. Any other number will write 1.
esp_err_t mcp23017_write_gpio(enum gpio_bank bank, uint8_t gpio_number, uint8_t value)
{
    uint8_t reading = 0x00;
    esp_err_t err = ESP_OK;
    uint8_t gpio_register = GPIOA + (int)bank; // Write to OLATA/B if do not want to reset the interrupt pin.

    // Get reading of register (if bank B, the addr is GPIOA + 1)
    err = i2c_read_slave_register(gpio_register, &reading);
    if (err) return err;

    // Create bitmask
    if (value > 0)
    {
        reading |= (1 << gpio_number);  // set bit for high
    }
    else
    {
        reading &= ~(1 << gpio_number);  // clear bit for low
    }

    // Write to register
    err = i2c_write_slave_register(gpio_register, reading);
    
    ESP_LOGI(TAG, "GPIO Write Complete!");

    return err;
}

// Reads gpio of one of the banks. Returns register value for the bank. Use READ_BIT(,) macro to read value of bit.
esp_err_t mcp23017_read_gpio_bank(enum gpio_bank bank, uint8_t* ret)
{
    esp_err_t err = ESP_OK;
    uint8_t gpio_address = GPIOA + (int)bank;

    // Get reading of register
    err = i2c_read_slave_register(gpio_address, ret);
    return err;
}

/*
 * Function: mcp23017_read_gpio
 *
 * Params: enum gpio_bank bank GPIO bank A or B to read
 * 
 * Return: bool Returns true for high, false for low for that gpio pin.
 * 
 * */
bool mcp23017_read_gpio(enum gpio_bank bank, uint8_t gpio_number)
{
    // Store reading here
    uint8_t reg = 0x00;

    // Read the bank
    mcp23017_read_gpio_bank(bank, &reg);

    // Get this gpio number value
    bool result = READ_BIT(reg, gpio_number);

    // Log for debugging
    ESP_LOGI(TAG, "GPIO %d = %x", gpio_number, result);
    
    return result;
}

esp_err_t disable_interrupt(enum gpio_bank bank, uint8_t gpio_number)
{
    ESP_LOGI(TAG, "Disabling interrupt on Bank %d, GPIO number %d", bank, gpio_number);

    esp_err_t err = ESP_OK;
    uint8_t recvbuffer = 0x00;

    // Get int enable register
    err = i2c_read_slave_register(GPINTENA + (int)bank, &recvbuffer);
    if (err) return err;

    recvbuffer &= ~ (1 << gpio_number);  // turn off interrupt

    // Write to register to turn it off
    err = i2c_write_slave_register(GPINTENA + (int)bank, recvbuffer);

    ESP_LOGI(TAG, "Interrupt disabled for bank %d gpio %d!", bank, gpio_number);

    return err;
}

/* Configures interrupt on mcp23017. Auto configures interrupt pin as active high.
 *   // GPTINTEN - 1 means interrupt enabled
 *   // DEFVAL - The default value of pin. If opposite will trigger interrupt
 *   // INTCON - 1 means look at defval, otherwise just trigger if pin state changes (any).
 *   // IOCON.ODR = open-drain interrupt pin. if set high, INTPOL is ignored.
 *   // INTPOL - polarity of interrupt pin. 1 is active high, 0 active low.
 *   // INTCAP holds value of gpio at the time interrupt occured
 *   // INTF tells us which GPIO triggered the interrupt
 * */
esp_err_t configure_interrupt(enum gpio_bank bank, uint8_t gpio_number, enum interrupt_trigger int_trigger)
{
    ESP_LOGI(TAG, "Configuring GPIO bank %d GPIO number %d with interrupt %d", bank, gpio_number, int_trigger);

    esp_err_t err = ESP_OK;
    uint8_t recvbuffer = 0x00;
    uint8_t intcon = 0x00;
    uint8_t defval = 0x00;

    // Check if pin is input
    err = i2c_read_slave_register(IODIRA + (int)bank, &recvbuffer);
    if (err) return err;

    if ( ((recvbuffer > gpio_number) & 1) == IO_EXPANDER_OUTPUT)
    {
        ESP_LOGE(TAG, "Cannot set interrupt on an output pin (pin %d).", gpio_number);
        return ESP_ERR_INVALID_ARG;
    }

    err = i2c_read_slave_register(GPINTENA + (int)bank, &recvbuffer);
    if (err) return err;

    err = i2c_read_slave_register(DEFVALA + (int)bank, &defval);
    if (err) return err;

    err = i2c_read_slave_register(INTCONA + (int)bank, &intcon);
    if (err) return err;

    // Enable interrupt
    recvbuffer |= (1 << gpio_number);

    // Configure interrupt comparison
    switch(int_trigger)
    {
        case MCP_RISING:
        {
            intcon |= (1 << gpio_number); // set incon bit so int trigger based on defval
            defval &= ~(1 << gpio_number); // clear defval bit. so default value is 0, and will trigger at logic 1.
        }break;
        
        case MCP_FALLING:
        {
            intcon |= (1 << gpio_number); // set incon bit so int trigger based on defval
            defval &= ~(1 << gpio_number); // set defval bit. so default value is 1, and will trigger at logic 0.
        }break;

        case MCP_ANY:
        {
            intcon &= ~(1 << gpio_number); // clear incon bit so int trigger on any pin
        }break;
        default:
        {
            ESP_LOGE(TAG, "Received a bad interrupt config %d", int_trigger);
            return ESP_ERR_INVALID_ARG;
        }break;
    }

    // Write to defval
    err = i2c_write_slave_register(DEFVALA + (int)bank, defval);
    if (err) return err;

    // Write to intcon
    err = i2c_write_slave_register(INTCONA + (int)bank, intcon);
    if (err) return err;

    // Write to GPINTEN
    err = i2c_write_slave_register(GPINTENA + (int)bank, recvbuffer);
    if (err) return err;

    // Set interrupt polarity to active high
    err = i2c_read_slave_register(IOCONA + (int)bank, &recvbuffer);
    if (err) return err;

    err = i2c_write_slave_register(IOCONA + (int)bank, recvbuffer |= IOCON_INTPOL);

    ESP_LOGI(TAG, "Interrupt configured for bank %d gpio %d!", bank, gpio_number);

    return err;
}


void app_main(void) // TODO: Interrupts + header file
{
    // Vars
    i2c_config_t i2cconfig;

    // 1. Configuration - set the init params, master/slave GPIO pins for SDA
    // SCL, CLK speed etc

    i2cconfig.mode = I2C_MODE_MASTER;
    i2cconfig.sda_io_num = SDA;
    i2cconfig.scl_io_num = SCL;
    i2cconfig.sda_pullup_en = GPIO_PULLUP_DISABLE;
    i2cconfig.scl_pullup_en = GPIO_PULLUP_DISABLE;
    i2cconfig.master.clk_speed = I2C_MAX_CLOCK_SPEED;
    i2cconfig.clk_flags = 0;

    ESP_ERROR_CHECK(i2c_param_config(I2C_PORT, &i2cconfig));

    // 2. Install Driver- activate driver on one of two I2C controllers as mtr
    // or slave

    ESP_ERROR_CHECK(i2c_driver_install(I2C_PORT, i2cconfig.mode, 0, 0, 0));
    
    ESP_LOGI(TAG, "I2C initialized successfully.");

    init_mcp23017();

    ESP_LOGI(TAG, "MCP initialized successfully.");

    const uint16_t delay_ms = 2000;
    uint8_t data = 0x00;

    while(1)
    {

        // Turn on LED
        ESP_LOGI(TAG, "Turning on blue LED %d seconds...", delay_ms/1000);
        vTaskDelay(pdMS_TO_TICKS(delay_ms));
        mcp23017_write_gpio(PORT_A, BLUE_LED, 1);

        // Turning off blue LED
        ESP_LOGI(TAG, "Turning off blue LED %d seconds...", delay_ms/1000);
        vTaskDelay(pdMS_TO_TICKS(delay_ms));
        mcp23017_write_gpio(PORT_A, BLUE_LED, 0);

        // Read GPIO bank
        // ESP_LOGI(TAG, "Will read gpio bank A %d seconds...", delay_ms/1000);
        // vTaskDelay(pdMS_TO_TICKS(delay_ms)); 
        // mcp23017_read_gpio_bank(PORT_A, &data);

        // ESP_LOGI(TAG, "OK = %d |  DOWN = %d| USB = %d", 
        //     READ_BIT(data, OK_BUTTON),
        //     READ_BIT(data, DOWN_BUTTON),
        //     READ_BIT(data, USB_DETECT));
        


    }

    // 7. Delete driver to release resources used by i2c drier.
    i2c_driver_delete(I2C_PORT);
}