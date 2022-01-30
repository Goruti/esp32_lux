--  ESP32 FW ADDED MODULES: file,http,i2c,net,node,sjson,tmr,wifi

-- Load config & modules
dofile('config.lua')
dofile('wifi.lua')
<<<<<<< HEAD
=======
dofile('lux_control.lua')
>>>>>>> a35279a6e19106d48716b08e340b891b837b8729
dofile('server.lua')
dofile('read_lux.lua')

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

wifi.start()

----------------------------
-- init GPIO
gpio.config({gpio={RED_LED, BLUE_LED}, dir=gpio.OUT})
-- init server
server_start()
<<<<<<< HEAD
-- init reading_lux
lux_reading_start()

=======

----------------------------
-- tsl2591
lux_loop()

>>>>>>> a35279a6e19106d48716b08e340b891b837b8729
