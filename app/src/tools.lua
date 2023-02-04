function math_round(num, len)
    if num then
        local mult = 10^(len or 0)
        return math.floor(num * mult + 0.5) / mult
    else
        return nil
    end
end

function notify_st(body)
    if not DEV.HUB.addr or not DEV.HUB.port or not DEV.HUB.ext_uuid then
        print('NO HUB REGISTERED')
        collectgarbage()
    else
        -- Prepare URL
        local url = string.format('http://%s:%s/push-state', DEV.HUB.addr, DEV.HUB.port)
        -- JSONstringify table
        body.uuid = DEV.HUB.ext_uuid
        local headers = {
            ["Content-Type"] = "application/json",
            ["Connection"] = "close"
        }
        print('PUSH STATE\r\nURL: '..url..'\r\nHEADER: '..sjson.encode(headers)..'\r\nDATA: '..sjson.encode(body))
        http.post(url, { headers = headers }, sjson.encode(body),
            function(code, data)
                if (code < 0) then
                    --print("Failed to Notify Smartthings")
                    gpio.write(BLUE_LED, 1)
                    --node.restart()
                else
                    if gpio.read(BLUE_LED) then gpio.write(BLUE_LED, 0) end
                end
                collectgarbage()
            end
        )
    end
end

function math_average(t)
    if t then
        local sum = 0
        for _,v in pairs(t) do -- Get the sum of all numbers in t
            sum = sum + v
        end
        return sum / #t
    else
        return nil
    end

end