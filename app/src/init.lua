--  ESP32 FW ADDED MODULES: file,http,i2c,net,node,sjson,tmr,wifi

-- Load config & modules
dofile('config.lua')
dofile('wifi.lua')
dofile('server.lua')
dofile('read_lux.lua')

---------------------------
-- Init Device Access Point
--print('access point ready...')
if wifi.getmode() ~= wifi.STATION then
    wifi.mode(wifi.STATIONAP, true)
    wifi.ap.config(WIFI_AP_CONFIG)
end

wifi.start()

----------------------------
-- init GPIO
gpio.config({gpio={RED_LED, BLUE_LED}, dir=gpio.OUT})
-- init server
server_start()
-- init reading_lux
lux_reading_start()