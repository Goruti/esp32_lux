function get_weather()
    http.get(WS_URL, nil,
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
                    print("f_temp: ", DEV.cache.f_temp)
                    notify_st({ f_temp = DEV.cache.f_temp } )
                    collectgarbage()
                end
            end)
end

function get_weather_start()
    print("Starting get_weather_start")
    get_weather()
    --weather_timer = tmr.create()
    --weather_timer:register(WS_LOOP_TIME_MS, tmr.ALARM_AUTO, function() get_weather() end)
    --weather_timer:start()

    tmr.create():alarm(WS_LOOP_TIME_MS, tmr.ALARM_AUTO, function() get_weather() end)
end