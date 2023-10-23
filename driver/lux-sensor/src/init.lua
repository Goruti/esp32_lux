local Driver = require('st.driver')
local caps = require('st.capabilities')

-- local imports
local discovery = require('discovery')
local lifecycles = require('lifecycles')
local commands = require('commands')
local server = require('server')

--------------------
-- Driver definition
local driver =
Driver(
        'LAN-LuxSensor',
        {
            discovery = discovery.start,
            lifecycle_handlers = lifecycles,
            supported_capabilities = {
                caps.illuminanceMeasurement,
                caps.temperatureMeasurement,
                caps.refresh
            },
            capability_handlers = {
                -- Refresh command handler
                [caps.refresh.ID] = {
                    [caps.refresh.commands.refresh.NAME] = commands.refresh
                }
            }
        }
)

---------------------------------------------
-- Get new  illuminance Measurement from the sensor
function driver:set_lux(device, lux)
    return device:emit_event(caps.illuminanceMeasurement.illuminance(lux))
end

-- Get new  forecast temperature Measurement from the sensor
function driver:set_f_temp(device, f_temp)
    return device:emit_event(caps.temperatureMeasurement.temperature({value=f_temp,unit="C"}))
end
-----------------------------
-- Initialize Hub server
-- that will open port to
-- allow bidirectional comms.
server.start(driver)

--------------------
-- Initialize Driver
driver:run()