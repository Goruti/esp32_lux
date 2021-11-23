local res_handler = {}

function res_handler.error(error_code, body)
    -- Monkey patch on default header
    -- because the Driver socket.http/ltn12
    -- response handler fails to
    -- handle text/plain responses
    --
    -- Update below when fixed:
    --local cnt_type = 'text/plain'
    local cnt_type = ''
    local status = 'HTTP/1.1 '..error_code..' OK'
    local cache_stat = 'Cache-Control : no-cache, private'

    -- Handle NULL response body
    body = body or ''

    -- Handle Content-Type Header
    if type(body) == 'string' then
        -- HTML Response
        if body:find('html') then
            cnt_type = 'Content-Type: text/html'
            -- XML Response
        elseif body:find('xml') then
            cnt_type = 'Content-Type: text/xml'
        end
        -- JSON Response
    elseif type(body) == 'table' then
        cnt_type = 'Content-Type: application/json'
        body = sjson.encode(body)
    end

    -- Handle Content-Length Header
    local cnt_length = 'Content-Length: '..#body

    -- Build response
    local res = {}
    table.insert(res, status)
    table.insert(res, cache_stat)
    table.insert(res, cnt_length)
    table.insert(res, cnt_type)

    res = {table.concat(res, '\r\n'), body}
    return table.concat(res, '\r\n\r\n')
end

-- HTML Views
function res_handler.WIFI_CONFIG_VIEW(nets)
    return table.concat({"<html>",
                         "<head>",
                         "<meta name=\"viewport\"",
                         "content=\"width=device-width, initial-scale=1\">",
                         "</head>",
                         "<body>",
                         "<h3>Wifi setup</h3>",
                         "<p>Configure your WiFi Router</p>",
                         "<form action=\"/config_wifi\" method=\"post\">",
                         "<div id=\"inject_networks\">SSID:<br></div>",
                         "<br>",
                         "<label for=\"pwd\">Password:</label><br>",
                         "<input type=\"password\" id=\"pwd\" name=\"pwd\"><br>",
                         "<input type=\"checkbox\" onclick=\"showPwd()\">Show Password",
                         "<br>",
                         "<br>",
                         "<button type=\"submit\">Connect</button>",
                         "</form>",
                         "</body>",
                         "</html>",
                         "<script>",
                         "var net_wrapper = document.getElementById(\"inject_networks\");",
                         "var nets ="..nets..";",
                         "var selectList = document.createElement(\"select\");",
                         "selectList.setAttribute(\"id\", \"ssid\");",
                         "selectList.setAttribute(\"name\", \"ssid\");",
                         "net_wrapper.appendChild(selectList);",
                         "nets.forEach(el => {",
                         "var option = document.createElement(\"option\");",
                         "option.setAttribute(\"value\", el.ssid);",
                         "option.text = el.ssid;",
                         "selectList.appendChild(option);",
                         "})",
                         "function showPwd() {",
                         "var x = document.getElementById(\"pwd\");",
                         "if (x.type === \"password\") {",
                         "x.type = \"text\";",
                         "} else {",
                         "x.type = \"password\";",
                         "}",
                         "}",
                        "</script>"
    },'\r\n')
end

res_handler.INTERNAL_ERROR = "Internal Server Error"
res_handler.METHOD_NOT_ALLOWED = "Method Not Allowed"
res_handler.NOT_FOUND = "Page or File Not Found "

res_handler.WIFI_ERROR =
[[<!DOCTYPE html><html>
<head>
<meta name="viewport"
content="width=device-width, initial-scale=1">
</head>
<body>
<h3>Wifi setup</h3>
<p style="color: red;">ERROR CONFIGURING WIFI</p>
</body>
</html>]]

res_handler.REDIRECT_VIEW =
[[<!DOCTYPE html><html>
<head>
<meta name="viewport"
content="width=device-width, initial-scale=1">
</head>
<body>
  <h3>Connecting...</h3>
  <p>You can switch back to your main network...</p>
</body>
</html>]]

res_handler.CONTROL_VIEW=
[[<!DOCTYPE html><html>
<head>
<meta name="viewport"
content="width=device-width, initial-scale=1">
</head>
<body>
  <h2>Device Control</h2>
  <div>
  <h4>Switch</h4>
  <button onclick="onOff('on')">ON</button>
  <button onclick="onOff('off')">OFF</button>
  </div>
  <div>
  <h4>Switch Level</h4>
  <input type="range" min="0" max="100" value="0" id="switch-level">
  </div>
<script>
  let slider = document.getElementById('switch-level');
  slider.onmouseup = () => sendLevel();
  // callback debouncer
  let debounce = (callback, timeout=300) => {
    let timer;
    return (...args) => {
      clearTimeout(timer);
      timer = setTimeout(() => { callback.apply(this, args); }, timeout);
    }
  }

  let onOff = debounce(async(val) => {
    console.log(`local command - switch=${val}`);
    await fetch(`/control?switch=${val}`);
  });

  let sendLevel = debounce(async() => {
    console.log(`local command - level=${slider.value}`);
    await fetch(`/control?level=${slider.value}`);
  })
</script>
</body>
</html>]]

res_handler.DEVICE_INFO_XML =
table.concat({
    "<?xml version='1.0'?>",
    "<root xmlns='urn:schemas-upnp-org:device-1-0 configId='1'>",
    "<specVersion>",
    "<major>2</major>",
    "<minor>0</minor>",
    "</specVersion>",
    "<device>",
    "<deviceType>urn:SmartThingsCommunity:device:Light:1</deviceType>",
    "<presentationURL>/</presentationURL>",
    "<friendlyName>"..DEV.NAME.."</friendlyName>",
    "<manufacturer>"..DEV.MN.."</manufacturer>",
    "<manufacturerURL>https://community.smartthings.com</manufacturerURL>",
    "<modelName>RGB LightBulb</modelName>",
    "<serialNumber>"..DEV.SN.."</serialNumber>",
    "<UDN>uuid:"..DEV.CHIP_ID.."-"..DEV.SN.."</UDN>",
    "</device></root>"
}, '\r\n')

return res_handler
