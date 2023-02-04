local config = {}
-- device info
-- NOTE: In the future this information
-- may be submitted through the Developer
-- Workspace to avoid hardcoded values.
config.DEVICE_PROFILE='LuxSensor.v1'
config.DEVICE_TYPE='LAN'
-- SSDP Config
config.MC_ADDRESS='239.255.255.250'
config.MC_PORT=1900
config.MC_TIMEOUT=2
config.MSEARCH=table.concat({
    'M-SEARCH * HTTP/1.1',
    'HOST: '..config.MC_ADDRESS..':'..config.MC_PORT,
    'MAN: "ssdp:discover"',
    'MX: 4',
    'ST: urn:DiegoAntonino:device:LuxSensorESP32:1'
}, '\r\n')
config.SCHEDULE_PERIOD=300
return config