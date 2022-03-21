dofile('upnp.lua')

-- Init main network services
function wifi_sta_start(ssid, pwd)
    local wifi_config = {
        ssid=ssid,
        pwd=pwd,
        auto=true
    }
    wifi.sta.config(wifi_config, true)
    print('connecting to wifi...')
end

---------------------
-- Wifi event monitor
-- callbacks:
--
-- STATION Start
wifi.sta.on(
        "start",
        function ()
            print(
                    'service: station\r\n'..
                    'action: started')
        end)

-- STATION Stop
wifi.sta.on(
        "stop",
        function ()
            print(
                    'service: station\r\n'..
                    'action: stopped')
        end)

-- STATION Connected
wifi.sta.on(
        "connected",
        function(evt, info)
            print(
                    'service: station\r\n'..
                    'status: connected\r\n'..
                    'ssid: '..info.ssid..'\r\n'..
                    'channel: '..info.channel..'\r\n'..
                    'bssid: '..info.bssid..'\r\n')
        end)

-- STATION Disconnected
wifi.sta.on(
        "disconnected",
        function(evt, info)
            print(
                    'service: station\r\n'..
                    'status: disconnected\r\n'..
                    'reason: '..info.reason..'\r\n'..
                    'ssid: '..info.ssid..'\r\n'..
                    'bssid: '..info.bssid..'\r\n')
            WIFI_DIS_COUNT = WIFI_DIS_COUNT + 1
            if WIFI_DIS_COUNT >= 50 then
                print("Disable Station Configuration")
                --wifi.sta.config({ssid="", pwd="", auto=false}, true)
                wifi.mode(wifi.STATIONAP, true)
                wifi.ap.config(WIFI_AP_CONFIG)
            end
            --Turn Off WIFI LED
            gpio.write(BLUE_LED, 0)
        end)

-- STATION IP Ready
wifi.sta.on(
        "got_ip",
        function(evt, info)
            print("Disable AP")
            wifi.mode(wifi.STATION, true)
            DEV.IP_ADDR=info.ip
            print(
                    'service: station\r\n'..
                    'status: ip ready\r\n'..
                    'action: start UPnP Socket\r\n'..
                    'ip: '..info.ip..'\r\n'..
                    'netmask: '..info.netmask..'\r\n'..
                    'gateway: '..info.gw..'\r\n')
            if wifi.getmode() ~= wifi.STATION then
                wifi.mode(wifi.STATION, true)
            end
            --Turn ON WIFI LED
            gpio.write(BLUE_LED, 1)
            -- initialize Disconnected counter
            WIFI_DIS_COUNT = 0
            -- initialize ssdp session
            upnp_start()
        end)

-- ACCESS POINT Start
wifi.ap.on(
        "start",
        function ()
            print(
                    'service: access point\r\n'..
                    'action: started')
        end)

-- ACCESS POINT Stop
wifi.ap.on(
        "stop",
        function ()
            print(
                    'service: access point\r\n'..
                    'action: stopped')
        end)

-- ACCESS POINT New Client
wifi.ap.on(
        "sta_connected",
        function (evt, info)
            print(
                    'service: access point\r\n'..
                    'action: start LAN AP socket\r\n'..
                    'status: client connected\r\n'..
                    'MAC: '..info.mac..'\r\n'..
                    'ID: '..info.id..'\r\n')

        end)

-- ACCESS POINT Client Disconnected
wifi.ap.on(
        "sta_disconnected",
        function (evt, info)
            print(
                    'service: access point\r\n'..
                    'status: client disconnected\r\n'..
                    'MAC: '..info.mac..'\r\n'..
                    'ID: '..info.id..'\r\n')

        end)