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
#define INTCONTA    0x08
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

esp_err_t init_gpio(enum gpio_bank bank, const uint8_t gpio_number, enum io_direction dir, enum pull_up_state pullup_en);

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

    // GPIO A6 is BUTTON UP (input)
    init_gpio(PORT_A, DOWN_BUTTON, DIR_INPUT, PULLUP_ENABLED);

    // GPIO A5 is LED (output)
    init_gpio(PORT_A, BLUE_LED, DIR_OUTPUT, PULLUP_NOT_APPLICABLE);
    
    // GPIO A4 is input (USB Detect)
    init_gpio(PORT_A, USB_DETECT, DIR_INPUT, PULLUP_DISABLED);

    return err;
}

// esp_err_t mcp23017_init_gpio(uint8_t gpio, uint8_t dir);

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


esp_err_t mcp23017_write_gpio(enum gpio_bank bank, uint8_t gpio_number, uint8_t value)
{
    uint8_t reading = 0x00;
    esp_err_t err = ESP_OK;
    uint8_t gpio_register = GPIOA + (int)bank;

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


esp_err_t mcp23017_read_gpio(enum gpio_bank bank, uint8_t gpio_number, uint8_t* ret)
{
    uint8_t reading = 0x00;
    esp_err_t err = ESP_OK;
    uint8_t gpio_address = GPIOA + (int)bank;

    // Get reading of register
    err = i2c_read_slave_register(gpio_address, &reading);

    // Print to console and store in arg 
    *ret = (reading >> gpio_number) & 1;
    ESP_LOGI(TAG, "GPIO %d Read Complete! Result = %x", gpio_number, *ret);

    return err;
}


void app_main(void)
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

    const uint16_t delay_ms = 1000;
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

        // Read button OK
        ESP_LOGI(TAG, "Will start inputs in %d seconds...", delay_ms/1000);
        vTaskDelay(pdMS_TO_TICKS(delay_ms));
        while (1)
        {
            for (int i=0; i<100; i++)
            {
                mcp23017_read_gpio(PORT_A, OK_BUTTON, &data);
                ESP_LOGI(TAG, "Button OK = %hhu", data);

                mcp23017_read_gpio(PORT_A, DOWN_BUTTON, &data);
                ESP_LOGI(TAG, "Button DOWN = %hhu", data);

                mcp23017_read_gpio(PORT_A, USB_DETECT, &data);
                ESP_LOGI(TAG, "USB Detect = %hhu", data);

                // Turn on blue LED based off of usb detect
                mcp23017_write_gpio(PORT_A, BLUE_LED, data);

                vTaskDelay(pdMS_TO_TICKS(250));
            }
            break;
        }


    }

    // 7. Delete driver to release resources used by i2c drier.
    i2c_driver_delete(I2C_PORT);
}