-- Socket Config
-- UDP UPnP
MC_PORT=1900
LOCAL_ADDR='0.0.0.0'
MC_ADDR='239.255.255.250'

-- TCP Server
SRV_PORT=80

--------------------
-- Wifi Access Point
-- config
WIFI_AP_CONFIG = {
    ssid='LuxSensor-ESP32',
    pwd='paravosp@p@',
    max=1
}

--------------
-- Device info
DEV = {
    CHIP_ID=string.format('%x', node.chipid()),
    SN='SN-ESP32-696',
    MN='SmartThingsCommunity',
    NAME='LuxSensorESP32',
    TYPE='LAN',
    ext_uuid=nil,
    HUB={ addr=nil, port=nil },
    cache={},
    IP_ADDR=nil
}

--------------
-- GPIO info
--Red, yellow: 1.8-2.0V, Blue, green: 3.0-3.2V, White: 3.0-3.2V
RED_LED=32
BLUE_LED=33

--------------
-- TSL2591
<<<<<<< HEAD
SDA_PIN = 21
SCL_PIN = 22
=======
SDA_PIN = 18
SCL_PIN = 19
>>>>>>> a35279a6e19106d48716b08e340b891b837b8729
