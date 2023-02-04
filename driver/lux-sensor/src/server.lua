local lux = require('luxure')
local cosock = require('cosock')
local json = require('st.json')
local log = require('log')

local hub_server = {}

function hub_server.start(driver)
    --[UPDATES] https://community.smartthings.com/t/debug-creating-drivers-for-lan-devices-with-smartthings-edge/243769/15
    --(OLD VERSION....) local server = lux.Server.new_with(cosock.tcp(), {env='debug'})
    local server = lux.Server.new_with(cosock.socket.tcp(), {env='debug'})

    -- Register server
    -- (OLD VERSION....) driver:register_channel_handler(server.sock, function ()
    -- (OLD VERSION....)     server:tick()
    -- (OLD VERSION....) end)

    cosock.spawn(function()
        --nayelyz Version
        --local client = serversock:accept()
        --watch_socket(client)

        -- Rlgarner54 Version
        while true do 
            server:tick()
        end
    end)

    -- Endpoint
    server:post('/push-state', function (req, res)
        local body = json.decode(req:get_body())
        log.trace("[push-state:in:body] "..json.encode(body))
        local device = driver:get_device_info(body.uuid)

        if body.lux then
            driver:set_lux(device, tonumber(body.lux))
        end
        if body.f_temp then
            driver:set_f_temp(device, tonumber(body.f_temp))
        end

        res:send('HTTP/1.1 200 OK')
    end)

    server:listen()
    driver.server = server
end

return hub_server