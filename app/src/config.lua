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
WIFI_DIS_COUNT=0

--------------
-- Device info
DEV = {
    CHIP_ID=node.chipid(),
    SN='SN-ESP32-696',
    MN='DiegoAntonino',
    NAME='LuxSensorESP32',
    TYPE='LAN',
    ext_uuid=nil,
    HUB={ addr=nil, port=nil },
    cache={ lux=nil, f_temp=nil },
    IP_ADDR=nil
}

--------------
-- GPIO info
--Red, yellow: 1.8-2.0V, Blue, green: 3.0-3.2V, White: 3.0-3.2V
RED_LED=32
BLUE_LED=33

--------------
-- TSL2591
TSL_ID=0
TSL_INT_PIN=27
TSL_SCL_PIN=18
TSL_SDA_PIN=19
TSL_LOOP_TIME_MS=60000

--------------
-- Weather Station
WS_LOOP_TIME_MS=6870947
WS_URL='https://api.open-meteo.com/v1/forecast?latitude=45.4462894&longitude=-73.4860939&daily=temperature_2m_max,temperature_2m_min&timezone=auto'
--------------
-- Error Notify Smartthings
PUSH_ERROR_NO_HUB_REGISTERED="NO_HUB_REGISTERED"
