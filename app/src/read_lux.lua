
function lux_init()
    tsl2591 = require("tsl2591")
    tsl2591.init(ID, SDA_PIN, SCL_PIN, i2c.SLOW)
    -- set gain and integration time
    -- see tsl2591.lua for a list of options
    tsl2591.set_gain(TSL2591_GAIN_25X, TSL2591_INT_TIME_600MS)


function lux_reading_start()
    lux_init()
    while true do
        vis, ir = tsl2591.read()
        print("CH0 (visible):", vis)
        print("CH1 (IR):", ir)
        wait(1)
        end


