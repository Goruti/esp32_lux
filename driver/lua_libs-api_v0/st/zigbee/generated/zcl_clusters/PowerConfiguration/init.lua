local cluster_base = require "st.zigbee.cluster_base"
local PowerConfigurationClientAttributes = require "st.zigbee.generated.zcl_clusters.PowerConfiguration.client.attributes" 
local PowerConfigurationServerAttributes = require "st.zigbee.generated.zcl_clusters.PowerConfiguration.server.attributes" 
local PowerConfigurationClientCommands = require "st.zigbee.generated.zcl_clusters.PowerConfiguration.client.commands"
local PowerConfigurationServerCommands = require "st.zigbee.generated.zcl_clusters.PowerConfiguration.server.commands"
local PowerConfigurationTypes = require "st.zigbee.generated.zcl_clusters.PowerConfiguration.types"

-- Copyright 2021 SmartThings
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

-- DO NOT EDIT: this code is automatically generated by tools/zigbee-lib_generator/generate_clusters_from_xml.py
-- Script version: b'a686d7136f2660129d59035a67b283a2364a2c55'
-- ZCL XML version: 7.2

--- @class st.zigbee.zcl.clusters.PowerConfiguration
--- @alias PowerConfiguration
---
--- @field public ID number 0x0001 the ID of this cluster
--- @field public NAME string "PowerConfiguration" the name of this cluster
--- @field public attributes st.zigbee.zcl.clusters.PowerConfigurationServerAttributes | st.zigbee.zcl.clusters.PowerConfigurationClientAttributes
--- @field public commands st.zigbee.zcl.clusters.PowerConfigurationServerCommands | st.zigbee.zcl.clusters.PowerConfigurationClientCommands
--- @field public types st.zigbee.zcl.clusters.PowerConfigurationTypes
local PowerConfiguration = {}

PowerConfiguration.ID = 0x0001
PowerConfiguration.NAME = "PowerConfiguration"
PowerConfiguration.server = {}
PowerConfiguration.client = {}
PowerConfiguration.server.attributes = PowerConfigurationServerAttributes:set_parent_cluster(PowerConfiguration) 
PowerConfiguration.client.attributes = PowerConfigurationClientAttributes:set_parent_cluster(PowerConfiguration) 
PowerConfiguration.server.commands = PowerConfigurationServerCommands:set_parent_cluster(PowerConfiguration)
PowerConfiguration.client.commands = PowerConfigurationClientCommands:set_parent_cluster(PowerConfiguration)
PowerConfiguration.types = PowerConfigurationTypes

--- Find an attribute by id
---
--- @param command_id number
function PowerConfiguration:get_attribute_by_id(attr_id)
  local attr_id_map = {
    [0x0000] = "MainsVoltage",
    [0x0001] = "MainsFrequency",
    [0x0010] = "MainsAlarmMask",
    [0x0011] = "MainsVoltageMinThreshold",
    [0x0012] = "MainsVoltageMaxThreshold",
    [0x0013] = "MainsVoltageDwellTripPoint",
    [0x0020] = "BatteryVoltage",
    [0x0021] = "BatteryPercentageRemaining",
    [0x0030] = "BatteryManufacturer",
    [0x0031] = "BatterySize",
    [0x0032] = "BatteryAHrRating",
    [0x0033] = "BatteryQuantity",
    [0x0034] = "BatteryRatedVoltage",
    [0x0035] = "BatteryAlarmMask",
    [0x0036] = "BatteryVoltageMinThreshold",
    [0x0037] = "BatteryVoltageThreshold1",
    [0x0038] = "BatteryVoltageThreshold2",
    [0x0039] = "BatteryVoltageThreshold3",
    [0x003A] = "BatteryPercentageMinThreshold",
    [0x003B] = "BatteryPercentageThreshold1",
    [0x003C] = "BatteryPercentageThreshold2",
    [0x003D] = "BatteryPercentageThreshold3",
    [0x003E] = "BatteryAlarmState",
    [0x0040] = "Battery2Voltage",
    [0x0041] = "Battery2PercentageRemaining",
    [0x0050] = "Battery2Manufacturer",
    [0x0051] = "Battery2Size",
    [0x0052] = "Battery2AHrRating",
    [0x0053] = "Battery2Quantity",
    [0x0054] = "Battery2RatedVoltage",
    [0x0055] = "Battery2AlarmMask",
    [0x0056] = "Battery2VoltageMinThreshold",
    [0x0057] = "Battery2VoltageThreshold1",
    [0x0058] = "Battery2VoltageThreshold2",
    [0x0059] = "Battery2VoltageThreshold3",
    [0x005A] = "Battery2PercentageMinThreshold",
    [0x005B] = "Battery2PercentageThreshold1",
    [0x005C] = "Battery2PercentageThreshold2",
    [0x005D] = "Battery2PercentageThreshold3",
    [0x005E] = "Battery2AlarmState",
    [0x0060] = "Battery3Voltage",
    [0x0061] = "Battery3PercentageRemaining",
    [0x0070] = "Battery3Manufacturer",
    [0x0071] = "Battery3Size",
    [0x0072] = "Battery3AHrRating",
    [0x0073] = "Battery3Quantity",
    [0x0074] = "Battery3RatedVoltage",
    [0x0075] = "Battery3AlarmMask",
    [0x0076] = "Battery3VoltageMinThreshold",
    [0x0077] = "Battery3VoltageThreshold1",
    [0x0078] = "Battery3VoltageThreshold2",
    [0x0079] = "Battery3VoltageThreshold3",
    [0x007A] = "Battery3PercentageMinThreshold",
    [0x007B] = "Battery3PercentageThreshold1",
    [0x007C] = "Battery3PercentageThreshold2",
    [0x007D] = "Battery3PercentageThreshold3",
    [0x007E] = "Battery3AlarmState",
  }
  local attr_name = attr_id_map[attr_id]
  if attr_name ~= nil then
    return self.attributes[attr_name]
  end
  return nil
end
  
--- Find a server command by id
---
--- @param command_id number
function PowerConfiguration:get_server_command_by_id(command_id)
  local server_id_map = {
  }
  if server_id_map[command_id] ~= nil then
    return self.server.commands[server_id_map[command_id]]
  end
  return nil
end

--- Find a client command by id
---
--- @param command_id number
function PowerConfiguration:get_client_command_by_id(command_id)
  local client_id_map = {
  }
  if client_id_map[command_id] ~= nil then
    return self.client.commands[client_id_map[command_id]]
  end
  return nil
end

PowerConfiguration.attribute_direction_map = {
  ["MainsVoltage"] = "server",
  ["MainsFrequency"] = "server",
  ["MainsAlarmMask"] = "server",
  ["MainsVoltageMinThreshold"] = "server",
  ["MainsVoltageMaxThreshold"] = "server",
  ["MainsVoltageDwellTripPoint"] = "server",
  ["BatteryVoltage"] = "server",
  ["BatteryPercentageRemaining"] = "server",
  ["BatteryManufacturer"] = "server",
  ["BatterySize"] = "server",
  ["BatteryAHrRating"] = "server",
  ["BatteryQuantity"] = "server",
  ["BatteryRatedVoltage"] = "server",
  ["BatteryAlarmMask"] = "server",
  ["BatteryVoltageMinThreshold"] = "server",
  ["BatteryVoltageThreshold1"] = "server",
  ["BatteryVoltageThreshold2"] = "server",
  ["BatteryVoltageThreshold3"] = "server",
  ["BatteryPercentageMinThreshold"] = "server",
  ["BatteryPercentageThreshold1"] = "server",
  ["BatteryPercentageThreshold2"] = "server",
  ["BatteryPercentageThreshold3"] = "server",
  ["BatteryAlarmState"] = "server",
  ["Battery2Voltage"] = "server",
  ["Battery2PercentageRemaining"] = "server",
  ["Battery2Manufacturer"] = "server",
  ["Battery2Size"] = "server",
  ["Battery2AHrRating"] = "server",
  ["Battery2Quantity"] = "server",
  ["Battery2RatedVoltage"] = "server",
  ["Battery2AlarmMask"] = "server",
  ["Battery2VoltageMinThreshold"] = "server",
  ["Battery2VoltageThreshold1"] = "server",
  ["Battery2VoltageThreshold2"] = "server",
  ["Battery2VoltageThreshold3"] = "server",
  ["Battery2PercentageMinThreshold"] = "server",
  ["Battery2PercentageThreshold1"] = "server",
  ["Battery2PercentageThreshold2"] = "server",
  ["Battery2PercentageThreshold3"] = "server",
  ["Battery2AlarmState"] = "server",
  ["Battery3Voltage"] = "server",
  ["Battery3PercentageRemaining"] = "server",
  ["Battery3Manufacturer"] = "server",
  ["Battery3Size"] = "server",
  ["Battery3AHrRating"] = "server",
  ["Battery3Quantity"] = "server",
  ["Battery3RatedVoltage"] = "server",
  ["Battery3AlarmMask"] = "server",
  ["Battery3VoltageMinThreshold"] = "server",
  ["Battery3VoltageThreshold1"] = "server",
  ["Battery3VoltageThreshold2"] = "server",
  ["Battery3VoltageThreshold3"] = "server",
  ["Battery3PercentageMinThreshold"] = "server",
  ["Battery3PercentageThreshold1"] = "server",
  ["Battery3PercentageThreshold2"] = "server",
  ["Battery3PercentageThreshold3"] = "server",
  ["Battery3AlarmState"] = "server",
}
PowerConfiguration.command_direction_map = {}

local attribute_helper_mt = {}
attribute_helper_mt.__index = function(self, key)
  local direction = PowerConfiguration.attribute_direction_map[key]
  if direction == nil then
    error(string.format("Referenced unknown attribute %s on cluster %s", key, PowerConfiguration.NAME))
  end
  return PowerConfiguration[direction].attributes[key] 
end
PowerConfiguration.attributes = {}
setmetatable(PowerConfiguration.attributes, attribute_helper_mt)

local command_helper_mt = {}
command_helper_mt.__index = function(self, key)
  local direction = PowerConfiguration.command_direction_map[key]
  if direction == nil then
    error(string.format("Referenced unknown command %s on cluster %s", key, PowerConfiguration.NAME))
  end
  return PowerConfiguration[direction].commands[key] 
end
PowerConfiguration.commands = {}
setmetatable(PowerConfiguration.commands, command_helper_mt)

setmetatable(PowerConfiguration, {__index = cluster_base})

return PowerConfiguration
