--  ESP32 FW ADDED MODULES: file,gpio,http,i2c,net,node,sjson,time,tmr,uart,wifi

-- Load config & modules
dofile('config.lua')
dofile('wifi.lua')
dofile('server.lua')
dofile('read_lux.lua')
dofile('tools.lua')
dofile('get_weather.lua')

--  Run the garbage collector if the allocation fails.
--  If the allocation fails even after running the garbage collector, the allocator will
--  return with error
node.egc.setmode(node.egc.ON_ALLOC_FAILURE)

--Turn On LEDs
gpio.write(RED_LED, 1)
gpio.write(BLUE_LED, 1)
--Init CHECK_WEATHER counter
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
-- init reading_lux --> this is started from wifi.wifi.sta.on("got_ip",...
--lux_reading_start()
-- init get_weather --> this is started from wifi.wifi.sta.on("got_ip",...
--get_weather_start()