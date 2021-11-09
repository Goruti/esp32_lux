--  ESP32 FW ADDED MODULES: file,http,i2c,net,node,sjson,tmr,wifi

-- Load config & modules
dofile('config.lua')
dofile('wifi.lua')
--dofile('device_control.lua')
dofile('server.lua')
dofile('upnp.lua')

---------------------------
--GLOBAL VARIALBES
WIFI_DIS_COUNT = 0

---------------------------
-- Init Device Access Point
--print('access point ready...')
if wifi.getmode() ~= wifi.STATION then
    wifi.mode(wifi.SOFTAP, true)
    wifi.ap.config(WIFI_AP_CONFIG)
end

--wifi.start()

----------------------------
-- init GPIO
gpio.config({gpio={RED_LED, BLUE_LED}, dir=gpio.OUT})
-- init server
--server_start()

----------------------------
    -- tsl2561
--tsl2561 = require("tsl2561")
--tsl2561.init(SDA_PIN, SCL_PIN)
--lux = tsl2561.readVisibleLux()
--
--    -- release module
--tsl2561 = nil
--package.loaded["tsl2561"]=nil

id=i2c.SW
LUX_ADDR=0x39
REGISTER = 0x00
VALUE = 0x03
i2c.setup(id, SDA_PIN, SCL_PIN, i2c.SLOW)

-- attempt to read chip id and compare against expected value
function simple_check_chip(dev_address, dev_register, value)
i2c.start(id)
--assert(i2c.address(id, dev_address, i2c.TRANSMITTER) , "!!i2c device did not ACK first address operation" )
i2c.address(id, dev_address, i2c.TRANSMITTER)
i2c.write(id, dev_register)
i2c.write(id, value)

i2c.start(id) -- repeated start condition
--assert( i2c.address(id, dev_address, i2c.RECEIVER) , "!!i2c device did not ACK second address operation" )
i2c.address(id, dev_address, i2c.RECEIVER)
print("REGISTER ", dev_register, " Value: ", i2c.read(id, 1):byte())
i2c.stop(id)
end
--

print("Chip check, should succeed if chip is present and functional")
simple_check_chip(LUX_ADDR, REGISTER, VALUE)
