local data_types = require "st.zigbee.data_types"
local utils = require "st.zigbee.utils"
local log = require "log"

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

-----------------------------------------------------------
-- Groups command RemoveAllGroups
-----------------------------------------------------------

--- @class st.zigbee.zcl.clusters.Groups.RemoveAllGroups
--- @alias RemoveAllGroups
---
--- @field public ID number 0x04 the ID of this command
--- @field public NAME string "RemoveAllGroups" the name of this command
local RemoveAllGroups = {}
RemoveAllGroups.NAME = "RemoveAllGroups"
RemoveAllGroups.ID = 0x04
RemoveAllGroups.args_def = {}

function RemoveAllGroups:get_fields()
  local fields = {}
  for _, v in ipairs(self.args_def) do
    if v.is_array then
      if self[v.name .. "_list"] ~= nil then
        for _, entry in ipairs(self[v.name .. "_list"]) do
          fields[#fields + 1] = entry
        end
      end
    else
      if self[v.name] ~= nil then
        fields[#fields + 1] = self[v.name]
      end
    end
  end
  return fields
end

RemoveAllGroups.get_length = utils.length_from_fields
RemoveAllGroups._serialize = utils.serialize_from_fields
RemoveAllGroups.pretty_print = utils.print_from_fields

--- Deserialize this command
---
--- @param buf buf the bytes of the command body
--- @return RemoveAllGroups
function RemoveAllGroups.deserialize(buf)
  local out = {}
  for _, v in ipairs(RemoveAllGroups.args_def) do
    if buf:remain() > 0 then
      if v.is_array then
        local entry_name = v.name .. "_list"
        out[entry_name] = {}
        while buf:remain() > 0 do
          out[entry_name][#out[entry_name] + 1] = v.data_type.deserialize(buf)
        end
      else
        out[v.name] = v.data_type.deserialize(buf)
      end
    elseif not v.optional then
      log.debug("Missing command arg " .. v.name .. " for deserializing RemoveAllGroups")
    end
  end
  setmetatable(out, {__index = RemoveAllGroups})
  out:set_field_names()
  return out
end

function RemoveAllGroups:set_field_names()
  for _, v in ipairs(self.args_def) do
    if self[v.name] ~= nil then
      self[v.name].field_name = v.name
    end
  end
end

--- Build a version of this message as if it came from the device
---
--- @param device st.zigbee.Device the device to build the message from
--- @return st.zigbee.ZigbeeMessageRx The full Zigbee message containing this command body
function RemoveAllGroups.build_test_rx(device)
  local out = {}
  local args = {}
  for i,v in ipairs(RemoveAllGroups.args_def) do
    if v.optional and args[i] == nil then
      out[v.name] = nil
    elseif not v.optional and args[i] == nil then
      out[v.name] = data_types.validate_or_build_type(v.default, v.data_type, v.name)   
    elseif v.is_array then
      local validated_list = {}
      for j, entry in ipairs(args[i]) do
        validated_list[j] = data_types.validate_or_build_type(entry, v.data_type, v.name .. tostring(j))
      end
      out[v.name .. "_list"] = validated_list
    else
      out[v.name] = data_types.validate_or_build_type(args[i], v.data_type, v.name)
    end
  end
  setmetatable(out, {__index = RemoveAllGroups})
  out:set_field_names()
  return RemoveAllGroups._cluster:build_test_rx_cluster_specific_command(device, out, "server")
end

--- Initialize the RemoveAllGroups command
---
--- @param self RemoveAllGroups the template class for this command
--- @param device st.zigbee.Device the device to build this message to
--- @return st.zigbee.ZigbeeMessageTx the full command addressed to the device
function RemoveAllGroups:init(device)
  local out = {}
  local args = {}
  if #args > #self.args_def then
    error(self.NAME .. " received too many arguments")
  end
  for i,v in ipairs(self.args_def) do
    if v.optional and args[i] == nil then
      out[v.name] = nil
    elseif not v.optional and args[i] == nil then
      out[v.name] = data_types.validate_or_build_type(v.default, v.data_type, v.name)   
    elseif v.is_array then
      local validated_list = {}
      for j, entry in ipairs(args[i]) do
        validated_list[j] = data_types.validate_or_build_type(entry, v.data_type, v.name .. tostring(j))
      end
      out[v.name .. "_list"] = validated_list
    else
      out[v.name] = data_types.validate_or_build_type(args[i], v.data_type, v.name)
    end
  end
  setmetatable(out, {
    __index = RemoveAllGroups,
    __tostring = RemoveAllGroups.pretty_print
  })
  out:set_field_names()
  return self._cluster:build_cluster_specific_command(device, out, "server")
end

function RemoveAllGroups:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(RemoveAllGroups, {__call = RemoveAllGroups.init})

return RemoveAllGroups
