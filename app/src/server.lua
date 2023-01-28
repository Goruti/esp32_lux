local res = require('responses')

----------------------
-- Decode URI
local function hex_to_char(x)
    return string.char(tonumber(x, 16))
end

local function uri_decode(input)
    return input:gsub("%+", " "):gsub("%%(%x%x)", hex_to_char)
end

local function parseArgs(args)
    local r = {}
    if args == nil or args == "" then return r end
    for name, value in string.gmatch(args, "([^&=?]-)=([^&=?]+)") do
        if name ~= nil then r[name] = uri_decode(value) end
    end
    return r
end
----------------------
-- Parse Form Data
local function parseFormData(body)
    local data = {}
    --print("Parsing Form Data")
    for kv in string.gmatch(body, "%s*&?([^=]+=[^&]+)") do
        local key, value = string.match(kv, "(.*)=(.*)")
        --print("Parsed: ", key , " => ", value)
        if key ~= nil then data[key] = uri_decode(value) end
    end
    return data
end

----------------------
-- get params
local function parseUri(uri)
    local r = {}
    if uri == nil then return r end
    r.raw_uri = uri
    local questionMarkPos = uri:find("?")
    if questionMarkPos == nil then
        r.path = uri
        return r
    end
    r.path = uri:sub(0, questionMarkPos-1)
    r.args = parseArgs(uri:sub(questionMarkPos+1, #uri))
    return r
end

----------------------
-- Get Body
local function getBody(request)
    local getBody
    return function ()
        --print("Getting Request Data")
        if getBody then
            return getBody
        else
            --print("payload = [",  request, "]")

            local mimeType = string.match(request, "Content%-Type: ([%w/-]+)")
            local bodyStart = request:find("\r\n\r\n", 1, true)
            if not bodyStart then
                getBody = {}
            else
                local body = request:sub(bodyStart, #request)
                request = nil
                collectgarbage()
                --print("mimeType = [", mimeType, "]")
                --print("bodyStart = [", bodyStart, "]")
                --print("body = [", body, "]")

                if mimeType == "application/json" then
                    --print("JSON: " .. body)
                    getBody = sjson.decode(body)
                elseif mimeType == "application/x-www-form-urlencoded" then
                    getBody = parseFormData(body)
                else
                    getBody = {}
                end
            end
            return getBody
        end
    end
end
-----------------------
-- HTTP Response Parser
local function httpparse(request)
    --print("Request: \n", request)
    local e = request:find("\r\n", 1, true)
    if not e then return nil end
    local line = request:sub(1, e - 1)
    local r = {}
    local _, i, raw_uri
    _, i, r.method, raw_uri = line:find("^([A-Z]+) (.-) HTTP/[1-9]+.[0-9]+$")
    if r.method ~= "POST" and r.method ~= "GET" then
        --print("invalid request: ")
        return nil
    end
    --print("r.method: \n", r.method)
    --print("raw_uri: \n", raw_uri)
    r.uri = parseUri(raw_uri)
    r.getBody = getBody(request)
    return r
end

--------------------
-- Push Remote State
function push_state(body)
    if not DEV.HUB.addr or not DEV.HUB.port or not DEV.HUB.ext_uuid then
        --print('NO HUB REGISTERED')
        collectgarbage()
        return nil
    end
    -- Prepare URL
    local url = string.format('http://%s:%s/push-state', DEV.HUB.addr, DEV.HUB.port)
    -- JSONstringify table
    body.uuid = DEV.HUB.ext_uuid
    local headers = {
        ["Content-Type"] = "application/json"
    }
    --print('PUSH STATE\r\nURL: '..url..'\r\nDATA: '..sjson.encode(body))
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

-----------------
-- ESP32 Server
function server_start()
    -- Request receiver calback
    local function recv_cb(conn, data)
        -- parse http data
        --print("***** NEW REQUEST *****")
        local r = httpparse(data)

        if r == nil then
            collectgarbage()
            return conn:send(res.error("400", res.BAD_REQUEST))
        end

        print("incoming-req: ", sjson.encode(r))
        -- Collect WiFi Configuration
        -- params to initialize Wifi
        -- Station service.
        if r.method == "POST" then

            -- Resource that will allow to
            -- configure wifi
            if r.uri.path:find('/config_wifi') then
                r.body = r.getBody()
                if r.body.ssid and r.body.pwd then
                    --if pcall(wifi_sta_start(r.body.ssid, r.body.pwd)) then
                    --    conn:send(res.error("200", res.REDIRECT_VIEW))
                    --else
                    --    conn:send(res.error("500", res.INTERNAL_ERROR))
                    --end
                    --print("going to set up wifi with ssid", r.body.ssid, "and pwd: ", r.body.pwd)
                    wifi_sta_start(r.body.ssid, r.body.pwd)
                    return conn:send(res.error("200", res.REDIRECT_VIEW))
                else
                    return conn:send(res.error("400", res.BAD_REQUEST))
                end

            -- Resource that will allow to
            -- register a parent node (Hub)
            -- storing its address and port.
            elseif r.uri.path:find('/ping') then
                if r.uri.args and r.uri.args.ip and r.uri.args.port and r.uri.args.ext_uuid then
                    DEV.HUB.addr = r.uri.args.ip
                    DEV.HUB.port = r.uri.args.port
                    DEV.HUB.ext_uuid = r.uri.args.ext_uuid
                    --print('HUB LOCATION: http://'..
                    --                DEV.HUB.addr..':'..DEV.HUB.port..
                    --                '\r\nEXT_UUID: '..DEV.HUB.ext_uuid)
                    return conn:send(res.error("200"))
                else
                    return conn:send(res.error("400", res.BAD_REQUEST))
                end

            -- Resource that allows to
            -- unlink the registered
            -- parent node (Hub)
            elseif r.uri.path:find('/delete') then
                print('HUB REVOKED')
                DEV.HUB.addr = nil
                DEV.HUB.port = nil
                DEV.HUB.ext_uuid = nil
                return conn:send(res.error("200"))

            else
                return conn:send(
                        res.error("404", res.NOT_FOUND)
                )
            end -- end POST routing PATHS

        elseif r.method == "GET" then
            -- Resource that provides the
            -- metadata of the device.
            -- This resource is provided
            -- via ssdp response.
            if r.uri.path:find(DEV.NAME..'.xml') then
                return conn:send(res.error("200", res.DEVICE_INFO_XML))

                -- Resource that will allow
                -- device state poll retrieving
                -- the raw state at the DEV.cache
                -- table JSON formatted.
            elseif r.uri.path:find('/refresh') then
                print("Sending cache info: ", sjson.encode(DEV.cache))
                return conn:send(res.error("200", DEV.cache))

                -- Resource that allows
                -- WIFI CONFIGURATION
            elseif r.uri.path == "/" then
                print("ROOT PATH")
                if wifi.getmode() == wifi.SOFTAP then
                    wifi.mode(wifi.STATIONAP)
                    node.sleep({ secs = 2 })
                end

                wifi.sta.scan({}, function(err, arr)
                    if err then
                        print ("Scan failed:", err)
                        return conn:send(
                                res.error("500", res.WIFI_ERROR)
                        )
                    else
                        return conn:send(
                                res.error("200", res.WIFI_CONFIG_VIEW(sjson.encode(arr)))
                        )
                    end
                end)
            else
                return conn:send(
                        res.error("404", res.NOT_FOUND)
                )
            end   -- end GET routing PATHS
        else  -- else Method routing
            return conn:send(
                    res.error("405", res.METHOD_NOT_ALLOWED)
            )
        end -- end Method routing
        r = nil
        collectgarbage()
    end -- receive callback

    local server = net.createServer(net.TCP)
    server:listen(SRV_PORT, function(conn)
        conn:on('receive', recv_cb)
        conn:on('sent', function(conn) conn:close() end) -- close connection
    end)
end