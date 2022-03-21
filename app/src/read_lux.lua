
function lux_init()
    tsl2591 = require("tsl2591")
    tsl2591.init(TSL_ID, TSL_SDA_PIN, TSL_SCL_PIN, i2c.SLOW)
    -- set gain and integration time
    -- see tsl2591.lua for a list of options
    --tsl2591.set_gain(gain, itime)
    collectgarbage()
end

function calc_lux(gain, itime, ch0, ch1)
    atime = (itime + 1)*100

    if gain == 0 then
        again = 1.0
    elseif gain == 1 then
        again = 25.0
    elseif gain == 2 then
        again = 428.0
    elseif gain == 3 then
        again = 9876.0
    end

    cpl = (atime * again) / LUX_DF
    lux1 = (ch0 - (LUX_COEFB * ch1)) / cpl
    lux2 = ((LUX_COEFC * ch0) - (LUX_COEFD * ch1)) / cpl

    collectgarbage()
    return math.max(lux1, lux2)
end

function get_lux()
    local gain = TSL2591_GAIN_25X
    local itime = TSL2591_INT_TIME_300MS

    tsl2591.set_gain(gain, itime)
    local ch0, ch1 = tsl2591.read()

    while ch0 == 65535 or ch1 == 65535 do
        if gain > 0 then
            gain = gain-1
        elseif itime > 0 then
            itime = itime-1
        else
            break
        end
        tsl2591.set_gain(gain, itime)
        ch0, ch1 = tsl2591.read()
    end

    while ch0 < 10 or ch1 < 10 do
        if gain < 3 then
            gain = gain+1
        elseif itime < 5 then
            itime = itime+1
        else
            break
        end
        tsl2591.set_gain(gain, itime)
        ch0, ch1 = tsl2591.read()
    end
    collectgarbage()
    return calc_lux(gain, itime, ch0, ch1)
end

function round(num, len)
    local mult = 10^(len or 0)
    return math.floor(num * mult + 0.5) / mult
end

function lux_reading_start()
    lux_init()
    local previous_lux = -1

    tmr.create():alarm(TSL_LOOP_TIME_MS, tmr.ALARM_AUTO, function()
        DEV.cache.lux = round(get_lux(), 2)
        --print("Lux: "..DEV.cache.lux)

        if DEV.cache.lux ~= previous_lux then
            notify_st({ lux = DEV.cache.lux })
        end
        --if lux <= 80 then
        --    if abs(lux - previous_lux) > 15 then
        --        notify_st({ lux = lux })
        --        previous_lux = lux
        --    elseif lux == 0 and lux ~= previous_lux then
        --        notify_st({ lux = lux })
        --        previous_lux = lux
        --    end
        --elseif 80 < lux <= 700 then
        --    if abs(lux - previous_lux) > 10 then
        --        notify_st({ lux = lux })
        --        previous_lux = lux
        --    end
        --elseif 700 < lux <= 1000 then
        --    -- report if variance is more than 5%
        --    previous_lux = previous_lux or 0.01
        --    if 100*abs((lux - previous_lux)/previous_lux) > 5 then
        --        notify_st({ lux = lux })
        --        previous_lux = lux
        --    end
        --elseif 1000 < lux <= 1500 then
        --    -- report if variance is more than 20%
        --    previous_lux = previous_lux or 0.01
        --    if 100*abs((lux - previous_lux)/previous_lux) > 20 then
        --        notify_st({ lux = lux })
        --        previous_lux = lux
        --    end
        --elseif 1500 < lux then
        --    -- report if variance is more than 25%
        --    previous_lux = previous_lux or 0.01
        --    if 100*abs((lux - previous_lux)/previous_lux) > 25 then
        --        notify_st({ lux = lux })
        --        previous_lux = lux
        --    end
        --end

        collectgarbage()
    end)
end

function notify_st(lux_body)
    push_state(lux_body)
end
