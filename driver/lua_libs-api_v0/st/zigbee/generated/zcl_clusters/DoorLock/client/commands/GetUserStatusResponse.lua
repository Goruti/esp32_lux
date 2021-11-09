local data_types = require "st.zigbee.data_types"
local utils = require "st.zigbee.utils"
local log = require "log"
local DrlkUserStatusType = require "st.zigbee.generated.zcl_clusters.DoorLock.types.DrlkUserStatus"

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
-- DoorLock command GetUserStatusResponse
-----------------------------------------------------------

--- @class st.zigbee.zcl.clusters.DoorLock.GetUserStatusResponse
--- @alias GetUserStatusResponse
---
--- @field public ID number 0x0A the ID of this command
--- @field public NAME string "GetUserStatusResponse" the name of this command
--- @field public user_id st.zigbee.data_types.Uint16
--- @field public user_status st.zigbee.zcl.clusters.DoorLock.types.DrlkUserStatus
local GetUserStatusResponse = {}
GetUserStatusResponse.NAME = "GetUserStatusResponse"
GetUserStatusResponse.ID = 0x0A
GetUserStatusResponse.args_def = {
  {
    name = "user_id",
    optional = false,
    data_type = data_types.Uint16,
    is_complex = false,
    is_array = false,
    default = 0x0000,
  },
  {
    name = "user_status",
    optional = false,
    data_type = DrlkUserStatusType,
    is_complex = false,
    is_array = false,
    default = 0x00,
  },
}

function GetUserStatusResponse:get_fields()
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

GetUserStatusResponse.get_length = utils.length_from_fields
GetUserStatusResponse._serialize = utils.serialize_from_fields
GetUserStatusResponse.pretty_print = utils.print_from_fields

--- Deserialize this command
---
--- @param buf buf the bytes of the command body
--- @return GetUserStatusResponse
function GetUserStatusResponse.deserialize(buf)
  local out = {}
  for _, v in ipairs(GetUserStatusResponse.args_def) do
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
      log.debug("Missing command arg " .. v.name .. " for deserializing GetUserStatusResponse")
    end
  end
  setmetatable(out, {__index = GetUserStatusResponse})
  out:set_field_names()
  return out
end

function GetUserStatusResponse:set_field_names()
  for _, v in ipairs(self.args_def) do
    if self[v.name] ~= nil then
      self[v.name].field_name = v.name
    end
  end
end

--- Build a version of this message as if it came from the device
---
--- @param device st.zigbee.Device the device to build the message from
--- @param user_id st.zigbee.data_types.Uint16
--- @param user_status st.zigbee.zcl.clusters.DoorLock.types.DrlkUserStatus
--- @return st.zigbee.ZigbeeMessageRx The full Zigbee message containing this command body
function GetUserStatusResponse.build_test_rx(device, user_id, user_status)
  local out = {}
  local args = {user_id, user_status}
  for i,v in ipairs(GetUserStatusResponse.args_def) do
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
  setmetatable(out, {__index = GetUserStatusResponse})
  out:set_field_names()
  return GetUserStatusResponse._cluster:build_test_rx_cluster_specific_command(device, out, "client")
end

--- Initialize the GetUserStatusResponse command
---
--- @param self GetUserStatusResponse the template class for this command
--- @param device st.zigbee.Device the device to build this message to
--- @param user_id st.zigbee.data_types.Uint16
--- @param user_status st.zigbee.zcl.clusters.DoorLock.types.DrlkUserStatus
--- @return st.zigbee.ZigbeeMessageTx the full command addressed to the device
function GetUserStatusResponse:init(device, user_id, user_status)
  local out = {}
  local args = {user_id, user_status}
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
    __index = GetUserStatusResponse,
    __tostring = GetUserStatusResponse.pretty_print
  })
  out:set_field_names()
  return self._cluster:build_cluster_specific_command(device, out, "client")
end

function GetUserStatusResponse:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(GetUserStatusResponse, {__call = GetUserStatusResponse.init})

return GetUserStatusResponse