local cluster_base = require "st.zigbee.cluster_base"
local RelativeHumidityClientAttributes = require "st.zigbee.generated.zcl_clusters.RelativeHumidity.client.attributes" 
local RelativeHumidityServerAttributes = require "st.zigbee.generated.zcl_clusters.RelativeHumidity.server.attributes" 
local RelativeHumidityClientCommands = require "st.zigbee.generated.zcl_clusters.RelativeHumidity.client.commands"
local RelativeHumidityServerCommands = require "st.zigbee.generated.zcl_clusters.RelativeHumidity.server.commands"
local RelativeHumidityTypes = require "st.zigbee.generated.zcl_clusters.RelativeHumidity.types"

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

--- @class st.zigbee.zcl.clusters.RelativeHumidity
--- @alias RelativeHumidity
---
--- @field public ID number 0x0405 the ID of this cluster
--- @field public NAME string "RelativeHumidity" the name of this cluster
--- @field public attributes st.zigbee.zcl.clusters.RelativeHumidityServerAttributes | st.zigbee.zcl.clusters.RelativeHumidityClientAttributes
--- @field public commands st.zigbee.zcl.clusters.RelativeHumidityServerCommands | st.zigbee.zcl.clusters.RelativeHumidityClientCommands
--- @field public types st.zigbee.zcl.clusters.RelativeHumidityTypes
local RelativeHumidity = {}

RelativeHumidity.ID = 0x0405
RelativeHumidity.NAME = "RelativeHumidity"
RelativeHumidity.server = {}
RelativeHumidity.client = {}
RelativeHumidity.server.attributes = RelativeHumidityServerAttributes:set_parent_cluster(RelativeHumidity) 
RelativeHumidity.client.attributes = RelativeHumidityClientAttributes:set_parent_cluster(RelativeHumidity) 
RelativeHumidity.server.commands = RelativeHumidityServerCommands:set_parent_cluster(RelativeHumidity)
RelativeHumidity.client.commands = RelativeHumidityClientCommands:set_parent_cluster(RelativeHumidity)
RelativeHumidity.types = RelativeHumidityTypes

--- Find an attribute by id
---
--- @param command_id number
function RelativeHumidity:get_attribute_by_id(attr_id)
  local attr_id_map = {
    [0x0000] = "MeasuredValue",
    [0x0001] = "MinMeasuredValue",
    [0x0002] = "MaxMeasuredValue",
    [0x0003] = "Tolerance",
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
function RelativeHumidity:get_server_command_by_id(command_id)
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
function RelativeHumidity:get_client_command_by_id(command_id)
  local client_id_map = {
  }
  if client_id_map[command_id] ~= nil then
    return self.client.commands[client_id_map[command_id]]
  end
  return nil
end

RelativeHumidity.attribute_direction_map = {
  ["MeasuredValue"] = "server",
  ["MinMeasuredValue"] = "server",
  ["MaxMeasuredValue"] = "server",
  ["Tolerance"] = "server",
}
RelativeHumidity.command_direction_map = {}

local attribute_helper_mt = {}
attribute_helper_mt.__index = function(self, key)
  local direction = RelativeHumidity.attribute_direction_map[key]
  if direction == nil then
    error(string.format("Referenced unknown attribute %s on cluster %s", key, RelativeHumidity.NAME))
  end
  return RelativeHumidity[direction].attributes[key] 
end
RelativeHumidity.attributes = {}
setmetatable(RelativeHumidity.attributes, attribute_helper_mt)

local command_helper_mt = {}
command_helper_mt.__index = function(self, key)
  local direction = RelativeHumidity.command_direction_map[key]
  if direction == nil then
    error(string.format("Referenced unknown command %s on cluster %s", key, RelativeHumidity.NAME))
  end
  return RelativeHumidity[direction].commands[key] 
end
RelativeHumidity.commands = {}
setmetatable(RelativeHumidity.commands, command_helper_mt)

setmetatable(RelativeHumidity, {__index = cluster_base})

return RelativeHumidity
