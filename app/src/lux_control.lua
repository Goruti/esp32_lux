function lux_loop()
    while true do
        tsl2591 = require("tsl2591")
        tsl2591.init(ID, SDA_PIN, SCL_PIN, i2c.SLOW)
        tsl2591.set_gain(TSL2591_GAIN_25X, TSL2591_INT_TIME_600MS)
        vis, ir = tsl2591.read()
        tsl2591 = nil
        collectgarbage()
        print("visible: ", vis)
        verify_lux(vis)
        wait(1)
    end
end

---------------------
function verify_lux(lux)
    if lux <= 80:
        if abs(lux - previous_lux) > 15:
            notify_st(lux)
            previous_lux = lux
        elseif lux == 0 and lux != previous_lux:
            notify_st(lux)
            previous_lux = lux
        elseif 80 < lux <= 700:
            if abs(lux - previous_lux) > 10:
                notify_st(lux)
                previous_lux = lux
        elseif 700 < lux <= 1000:
            -- report if variance is more than 5%
            previous_lux = previous_lux if previous_lux else 0.01
            if 100*abs((lux - previous_lux)/previous_lux) > 5:
                notify_st(lux)
                previous_lux = lux
        elseif 1000 < lux <= 1500:
            -- report if variance is more than 20%
            previous_lux = previous_lux if previous_lux else 0.01
            if 100*abs((lux - previous_lux)/previous_lux) > 20:
                notify_st(lux)
                previous_lux = lux
        elseif 1500 < lux:
            -- report if variance is more than 25%
            previous_lux = previous_lux if previous_lux else 0.01
            if 100*abs((lux - previous_lux)/previous_lux) > 25:
                notify_st(lux)
                previous_lux = lux
end

---------------------
function notify_st(lux)
    if not DEV.HUB.addr or not DEV.HUB.port or not DEV.ext_uuid then
        print('NO HUB REGISTERED')
        return nil
    end
    local body = {"lux": lux}
    -- push_state(data, prot, addr, port, ext_uuid)
    push_state(body, "http", DEV.HUB.addr, DEV.HUB.port, DEV.ext_uuid)
end

---------------------
-- Push Remote State
local function push_state(data, prot, addr, port, ext_uuid)
    -- Prepare URL
    local url = string.format('%s://%s:%s/push-state', prot, addr, port)

    -- JSONstringify table
    data.uuid = ext_uuid
    local data = sjson.encode(data)

    local headers = 'Content-Type: application/json'

    print('PUSH STATE\r\nURL: '..url..'\r\nDATA: '..data)
    return http.post(url, { headers = headers }, data,
            function(code, data)
                if (code < 0) then
                  print("HTTP request failed")
                else
                  print(code, data)
                end
            end)
end
