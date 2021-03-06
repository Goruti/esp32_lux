local lux = require('luxure')
local cosock = require('cosock').socket
local json = require('dkjson')
local log = require('log')

local hub_server = {}

function hub_server.start(driver)
    local server = lux.Server.new_with(cosock.tcp(), {env='debug'})

    -- Register server
    driver:register_channel_handler(server.sock, function ()
        server:tick()
    end)

    -- Endpoint
    server:post('/push-state', function (req, res)
        local body = json.decode(req:get_body())
        log.trace("[push-state:in:body] "..json.encode(body))
        local device = driver:get_device_info(body.uuid)
        if body.lux then
            driver:set_lux(device, tonumber(body.lux))
        end
        res:send('HTTP/1.1 200 OK')
    end)

    server:listen()
    driver.server = server
end

return hub_server