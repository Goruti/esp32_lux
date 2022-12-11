local caps = require('st.capabilities')
local neturl = require('net.url')
local log = require('log')
local json = require('dkjson')
local cosock = require "cosock"
local http = cosock.asyncify "socket.http"
local ltn12 = require('ltn12')

local command_handler = {}

---------------
-- Ping command
function command_handler.ping(address, port, device)
    local ping_data = {
        ip=address,
        port=port,
        ext_uuid=device.id
    }
    return command_handler.send_lan_command(
            'POST',
            device.device_network_id,
            'ping',
            ping_data
    )
end
------------------
-- Refresh command
function command_handler.refresh(_, device)
    local success, data = command_handler.send_lan_command(
            'GET',
            device.device_network_id,
            'refresh'
    )

    -- Check success
    if success then
        -- Monkey patch due to issues
        -- on ltn12 lib to fully sink
        -- JSON payload into table. Last
        -- bracket is missing.
        --
        -- Update below when fixed:
        --local raw_data = json.decode(table.concat(data))
        --local raw_data = json.decode(table.concat(data)..'}')
        local raw_data = json.decode(table.concat(data))

        -- Define online status
        device:online()

        -- Refresh data
        if raw_data then
            if raw_data.lux then
                log.trace('Refreshing illuminance Level: '..json.encode(raw_data.lux))
                device:emit_event(caps.illuminanceMeasurement.illuminance(tonumber(raw_data.lux)))
            end
            if raw_data.f_temp then
                log.trace('Refreshing forecast temperature: '..json.encode(raw_data.f_temp))
                device:emit_event(caps.temperatureMeasurement.temperature(tonumber(raw_data.f_temp)))
            end
        end

    else
        log.error('failed to poll device state')
        -- Set device as offline
        device:offline()
    end
end

------------------------
-- Send LAN HTTP Request
function command_handler.send_lan_command(method, url, path, body)
    local dest_url = url..'/'..path
    local res_body, r = {}, {}

    local query = neturl.buildQuery(body or {})
    if query then dest_url = dest_url..'?'..query end

    client, code, headers, status = http.request({
        method = method,
        url = dest_url,
        sink = ltn12.sink.table(res_body),
        headers = {
            ['Content-Type'] = 'application/x-www-urlencoded'
        }})


    -- Handle response
    r['code'], r['headers'], r['status'], r['response'] = code, headers, status, res_body
    log.trace("r: "..json.encode(r))

    if code == 200 then
        return true, res_body
    end
    return false, nil
end

return command_handler