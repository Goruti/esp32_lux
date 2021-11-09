local cluster_base = require "st.zigbee.cluster_base"
local IdentifyClientAttributes = require "st.zigbee.generated.zcl_clusters.Identify.client.attributes" 
local IdentifyServerAttributes = require "st.zigbee.generated.zcl_clusters.Identify.server.attributes" 
local IdentifyClientCommands = require "st.zigbee.generated.zcl_clusters.Identify.client.commands"
local IdentifyServerCommands = require "st.zigbee.generated.zcl_clusters.Identify.server.commands"
local IdentifyTypes = require "st.zigbee.generated.zcl_clusters.Identify.types"

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

--- @class st.zigbee.zcl.clusters.Identify
--- @alias Identify
---
--- @field public ID number 0x0003 the ID of this cluster
--- @field public NAME string "Identify" the name of this cluster
--- @field public attributes st.zigbee.zcl.clusters.IdentifyServerAttributes | st.zigbee.zcl.clusters.IdentifyClientAttributes
--- @field public commands st.zigbee.zcl.clusters.IdentifyServerCommands | st.zigbee.zcl.clusters.IdentifyClientCommands
--- @field public types st.zigbee.zcl.clusters.IdentifyTypes
local Identify = {}

Identify.ID = 0x0003
Identify.NAME = "Identify"
Identify.server = {}
Identify.client = {}
Identify.server.attributes = IdentifyServerAttributes:set_parent_cluster(Identify) 
Identify.client.attributes = IdentifyClientAttributes:set_parent_cluster(Identify) 
Identify.server.commands = IdentifyServerCommands:set_parent_cluster(Identify)
Identify.client.commands = IdentifyClientCommands:set_parent_cluster(Identify)
Identify.types = IdentifyTypes

--- Find an attribute by id
---
--- @param command_id number
function Identify:get_attribute_by_id(attr_id)
  local attr_id_map = {
    [0x0000] = "IdentifyTime",
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
function Identify:get_server_command_by_id(command_id)
  local server_id_map = {
    [0x00] = "Identify",
    [0x01] = "IdentifyQuery",
    [0x40] = "TriggerEffect",
  }
  if server_id_map[command_id] ~= nil then
    return self.server.commands[server_id_map[command_id]]
  end
  return nil
end

--- Find a client command by id
---
--- @param command_id number
function Identify:get_client_command_by_id(command_id)
  local client_id_map = {
    [0x00] = "IdentifyQueryResponse",
  }
  if client_id_map[command_id] ~= nil then
    return self.client.commands[client_id_map[command_id]]
  end
  return nil
end

Identify.attribute_direction_map = {
  ["IdentifyTime"] = "server",
}
Identify.command_direction_map = {
  ["IdentifyQueryResponse"] = "client",
  ["Identify"] = "server",
  ["IdentifyQuery"] = "server",
  ["TriggerEffect"] = "server",
}

local attribute_helper_mt = {}
attribute_helper_mt.__index = function(self, key)
  local direction = Identify.attribute_direction_map[key]
  if direction == nil then
    error(string.format("Referenced unknown attribute %s on cluster %s", key, Identify.NAME))
  end
  return Identify[direction].attributes[key] 
end
Identify.attributes = {}
setmetatable(Identify.attributes, attribute_helper_mt)

local command_helper_mt = {}
command_helper_mt.__index = function(self, key)
  local direction = Identify.command_direction_map[key]
  if direction == nil then
    error(string.format("Referenced unknown command %s on cluster %s", key, Identify.NAME))
  end
  return Identify[direction].commands[key] 
end
Identify.commands = {}
setmetatable(Identify.commands, command_helper_mt)

setmetatable(Identify, {__index = cluster_base})

return Identify