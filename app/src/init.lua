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
    -- tsl2591
--tsl2591 = require("tsl2591")
--tsl2591.init(ID, SDA_PIN, SCL_PIN, i2c.SLOW)
-- set gain and integration time
-- see tsl2591.lua for a list of options
--tsl2591.set_gain(TSL2591_GAIN_25X, TSL2591_INT_TIME_600MS)
--vis, ir = tsl2591.read()
--print("CH0 (visible):", vis)
--print("CH1 (IR):", ir)
