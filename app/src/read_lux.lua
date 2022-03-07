
function lux_init()
    tsl2591 = require("tsl2591")
    tsl2591.init(TSL_ID, TSL_SDA_PIN, TSL_SCL_PIN, i2c.SLOW)
    -- set gain and integration time
    -- see tsl2591.lua for a list of options
    tsl2591.set_gain(TSL2591_GAIN_25X, TSL2591_INT_TIME_600MS)
    collectgarbage()
end

function lux_reading_start()
    lux_init()
    tmr.create():alarm(TSL_LOOP_TIME_MS, tmr.ALARM_AUTO, function()
        vis, ir = tsl2591.read()

        print("CH0 (visible):", vis)
        print("CH1 (IR):", ir)

        DEV.cache.lux = vis
        nofify_st({ lux = vis })
        collectgarbage()
    end)
end

function nofify_st(lux_body)
    push_state(lux_body)
end
