function get_weather()
    local headers = {
        ["Accept"] = "application/json",
        ["Connection"] = "close"
    }
    http.get(WS_URL, { headers = headers },
            function(code, data)
                if (code < 0) then
                    print("Failed to get weather data")
                    gpio.write(BLUE_LED, 1)
                    --node.restart()
                    collectgarbage()
                else
                    if gpio.read(BLUE_LED) then gpio.write(BLUE_LED, 0) end
                    local weather = sjson.decode(data)
                    DEV.cache.f_temp = math_round(math_average({math_average(weather.daily.temperature_2m_min),math_average(weather.daily.temperature_2m_max)}),2)
                    --print("f_temp: ", DEV.cache.f_temp)
                    notify_st({ f_temp = DEV.cache.f_temp } )
                end
            end)
            
    collectgarbage()
end

function get_weather_start()
    print("Starting get_weather_start")
    get_weather()
    tmr.create():alarm(WS_LOOP_TIME_MS, tmr.ALARM_AUTO, function() get_weather() end)
end