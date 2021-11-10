-- ***************************************************************************
-- TSL2591 module for ESP8266 with nodeMCU firmware
--
-- Written by quantalume
-- http://www.esp8266.com/viewtopic.php?f=19&t=1715
-- MIT license, http://opensource.org/licenses/MIT
-- ***************************************************************************

local moduleName = ...
local M = {}
_G[moduleName] = M

local i2c_id
local dev_addr = 0x29

TSL2591_GAIN_1X = 0
TSL2591_GAIN_25X = 1
TSL2591_GAIN_428X = 2
TSL2591_GAIN_9876X = 3
TSL2591_INT_TIME_100MS = 0
TSL2591_INT_TIME_200MS = 1
TSL2591_INT_TIME_300MS = 2
TSL2591_INT_TIME_400MS = 3
TSL2591_INT_TIME_500MS = 4
TSL2591_INT_TIME_600MS = 5
local TSL2591_ENABLE_REG = 0
local TSL2591_CONFIG_REG = 1
local TSL2591_STATUS_REG = 0x13
local TSL2591_AEN = 2
local TSL2591_PON = 1
local TSL2591_CH0_LOW = 0x14
local TSL2591_CH0_HIGH = 0x15
local TSL2591_CH1_LOW = 0x16
local TSL2591_CH1_HIGH = 0x17

-- Constants for LUX calculation
LUX_DF = 408.0
LUX_COEFB = 1.64  -- CH0 coefficient
LUX_COEFC = 0.59  -- CH1 coefficient A
LUX_COEFD = 0.86  -- CH2 coefficient B

local function read_reg(reg)
  i2c.start(i2c_id)
  i2c.address(i2c_id, dev_addr, i2c.TRANSMITTER)
  i2c.write(i2c_id, reg + 0xA0)
  i2c.stop(i2c_id)
  i2c.start(i2c_id)
  i2c.address(i2c_id, dev_addr, i2c.RECEIVER)
  c = i2c.read(i2c_id, 1)
  i2c.stop(i2c_id)
  return string.byte(c)
end

local function write_reg(reg, value)
  i2c.start(i2c_id)
  i2c.address(i2c_id, dev_addr, i2c.TRANSMITTER)
  i2c.write(i2c_id, reg + 0xA0)
  i2c.write(i2c_id, value)
  i2c.stop(i2c_id)
  return
end

function M.set_gain(gain, int_time)
  write_reg(TSL2591_CONFIG_REG, gain * 16 + int_time)
end

function M.init(id, sda, scl, speed)
  i2c_id = id
  i2c.setup(i2c_id, sda, scl, speed)

  -- Shut down device until needed
  write_reg(TSL2591_ENABLE_REG, 0)
end

function M.read()

  -- Turn oscillator on and begin conversion
  write_reg(TSL2591_ENABLE_REG, TSL2591_PON + TSL2591_AEN)

  -- Wait until conversion complete
  -- TODO: establish time-out error trap
  while read_reg(TSL2591_STATUS_REG) % 2 == 0 do end

  -- Conversion complete, shut down device
  write_reg(TSL2591_ENABLE_REG, 0)

  -- Read light values
  -- Device is double-buffered, so make sure we're returning latest values
  for i = 1, 2 do
    ch0 = read_reg(TSL2591_CH0_HIGH)*256 + read_reg(TSL2591_CH0_LOW)
    ch1 = read_reg(TSL2591_CH1_HIGH)*256 + read_reg(TSL2591_CH1_LOW)
  end

  return ch0, ch1  --ch0: visible, ch1: IR

end

return M