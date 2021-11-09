local cluster_base = require "st.zigbee.cluster_base"
local ShadeConfigurationClientAttributes = require "st.zigbee.generated.zcl_clusters.ShadeConfiguration.client.attributes" 
local ShadeConfigurationServerAttributes = require "st.zigbee.generated.zcl_clusters.ShadeConfiguration.server.attributes" 
local ShadeConfigurationClientCommands = require "st.zigbee.generated.zcl_clusters.ShadeConfiguration.client.commands"
local ShadeConfigurationServerCommands = require "st.zigbee.generated.zcl_clusters.ShadeConfiguration.server.commands"
local ShadeConfigurationTypes = require "st.zigbee.generated.zcl_clusters.ShadeConfiguration.types"

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

--- @class st.zigbee.zcl.clusters.ShadeConfiguration
--- @alias ShadeConfiguration
---
--- @field public ID number 0x0100 the ID of this cluster
--- @field public NAME string "ShadeConfiguration" the name of this cluster
--- @field public attributes st.zigbee.zcl.clusters.ShadeConfigurationServerAttributes | st.zigbee.zcl.clusters.ShadeConfigurationClientAttributes
--- @field public commands st.zigbee.zcl.clusters.ShadeConfigurationServerCommands | st.zigbee.zcl.clusters.ShadeConfigurationClientCommands
--- @field public types st.zigbee.zcl.clusters.ShadeConfigurationTypes
local ShadeConfiguration = {}

ShadeConfiguration.ID = 0x0100
ShadeConfiguration.NAME = "ShadeConfiguration"
ShadeConfiguration.server = {}
ShadeConfiguration.client = {}
ShadeConfiguration.server.attributes = ShadeConfigurationServerAttributes:set_parent_cluster(ShadeConfiguration) 
ShadeConfiguration.client.attributes = ShadeConfigurationClientAttributes:set_parent_cluster(ShadeConfiguration) 
ShadeConfiguration.server.commands = ShadeConfigurationServerCommands:set_parent_cluster(ShadeConfiguration)
ShadeConfiguration.client.commands = ShadeConfigurationClientCommands:set_parent_cluster(ShadeConfiguration)
ShadeConfiguration.types = ShadeConfigurationTypes

--- Find an attribute by id
---
--- @param command_id number
function ShadeConfiguration:get_attribute_by_id(attr_id)
  local attr_id_map = {
    [0x0000] = "PhysicalClosedLimit",
    [0x0001] = "MotorStepSize",
    [0x0002] = "Status",
    [0x0010] = "ClosedLimit",
    [0x0011] = "Mode",
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
function ShadeConfiguration:get_server_command_by_id(command_id)
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
function ShadeConfiguration:get_client_command_by_id(command_id)
  local client_id_map = {
  }
  if client_id_map[command_id] ~= nil then
    return self.client.commands[client_id_map[command_id]]
  end
  return nil
end

ShadeConfiguration.attribute_direction_map = {
  ["PhysicalClosedLimit"] = "server",
  ["MotorStepSize"] = "server",
  ["Status"] = "server",
  ["ClosedLimit"] = "server",
  ["Mode"] = "server",
}
ShadeConfiguration.command_direction_map = {}

local attribute_helper_mt = {}
attribute_helper_mt.__index = function(self, key)
  local direction = ShadeConfiguration.attribute_direction_map[key]
  if direction == nil then
    error(string.format("Referenced unknown attribute %s on cluster %s", key, ShadeConfiguration.NAME))
  end
  return ShadeConfiguration[direction].attributes[key] 
end
ShadeConfiguration.attributes = {}
setmetatable(ShadeConfiguration.attributes, attribute_helper_mt)

local command_helper_mt = {}
command_helper_mt.__index = function(self, key)
  local direction = ShadeConfiguration.command_direction_map[key]
  if direction == nil then
    error(string.format("Referenced unknown command %s on cluster %s", key, ShadeConfiguration.NAME))
  end
  return ShadeConfiguration[direction].commands[key] 
end
ShadeConfiguration.commands = {}
setmetatable(ShadeConfiguration.commands, command_helper_mt)

setmetatable(ShadeConfiguration, {__index = cluster_base})

return ShadeConfiguration