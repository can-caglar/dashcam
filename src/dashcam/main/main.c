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

uint8_t rx_buffer[2] = {0};

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


esp_err_t i2c_write_slave_register(uint8_t addr, uint8_t data)
{
    i2c_cmd_handle_t cmd;
    esp_err_t err;

    // TODO: ERROR CHECKING for input params

    ESP_LOGI(TAG, "Writing to register [%2x]", addr);

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

    ESP_LOGI(TAG, "Finished writing data [%02x]", data);

exit:

    i2c_cmd_link_delete(cmd);

    return err;
}

esp_err_t i2c_read_slave_register(uint8_t addr, uint8_t* rx_buf)
{
    i2c_cmd_handle_t cmd;
    esp_err_t err;

    // TODO: ERROR CHECKING for input params

    ESP_LOGI(TAG, "Reading address [%2x]", addr);

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
    err = i2c_master_read(cmd, &rx_buffer, sizeof(uint8_t), ACK_EN);
    if (err) goto exit;

    //6. Stop bit
    err = i2c_master_stop(cmd);
    if (err) goto exit;

    //7. Execute command
    err = i2c_master_cmd_begin(I2C_PORT, cmd, pdMS_TO_TICKS(I2C_MASTER_TIMEOUT_MS));

    ESP_LOGI(TAG, "Received data [%02x],[%02x]", rx_buffer[0], rx_buffer[1]);

exit:

    i2c_cmd_link_delete(cmd);

    return err;
}

esp_err_t init_mcp23017()
{
    // IOCON.BANK should be 0 during boot, so 
}

void app_main(void)
{
    // Vars
    i2c_config_t i2cconfig;
    esp_err_t err;

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

    uint8_t testData = 0x55;
    uint8_t reg = 0x00;

    while(1)
    {
        ESP_LOGI(TAG, "Read register %02x in 3 seconds...", reg);
        vTaskDelay(pdMS_TO_TICKS(3000));

        err = i2c_read_slave_register(reg, &rx_buffer);
        if (err)
        {
            ESP_LOGE(TAG, "%s", esp_err_to_name(err));
        }

        ESP_LOGI(TAG, "Write %02x to register %02x in 3 seconds...", testData, reg);
        vTaskDelay(pdMS_TO_TICKS(3000));
        err = i2c_write_slave_register(reg, testData);
        if (err)
        {
            ESP_LOGE(TAG, "%s", esp_err_to_name(err));
        }

        ESP_LOGI(TAG, "Incrementing test data...\n");
        testData++;
    }

    // 7. Delete driver to release resources used by i2c drier.
    i2c_driver_delete(I2C_PORT);
}