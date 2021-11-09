local data_types = require "st.zigbee.data_types"
local utils = require "st.zigbee.utils"
local log = require "log"
local ImageTypeIdType = require "st.zigbee.generated.zcl_clusters.OTAUpgrade.types.ImageTypeId"
local FieldControlType = require "st.zigbee.generated.zcl_clusters.OTAUpgrade.types.FieldControl"

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
-- OTAUpgrade command ImagePageRequest
-----------------------------------------------------------

--- @class st.zigbee.zcl.clusters.OTAUpgrade.ImagePageRequest
--- @alias ImagePageRequest
---
--- @field public ID number 0x04 the ID of this command
--- @field public NAME string "ImagePageRequest" the name of this command
--- @field public field_control st.zigbee.zcl.clusters.OTAUpgrade.types.FieldControl
--- @field public manufacturer_code st.zigbee.data_types.Uint16
--- @field public image_type st.zigbee.zcl.clusters.OTAUpgrade.types.ImageTypeId
--- @field public file_version st.zigbee.data_types.Uint32
--- @field public file_offset st.zigbee.data_types.Uint32
--- @field public maximum_data_size st.zigbee.data_types.Uint8
--- @field public page_size st.zigbee.data_types.Uint16
--- @field public response_spacing st.zigbee.data_types.Uint16
--- @field public request_node_address st.zigbee.data_types.IeeeAddress
local ImagePageRequest = {}
ImagePageRequest.NAME = "ImagePageRequest"
ImagePageRequest.ID = 0x04
ImagePageRequest.args_def = {
  {
    name = "field_control",
    optional = false,
    data_type = FieldControlType,
    is_complex = false,
    is_array = false,
  },
  {
    name = "manufacturer_code",
    optional = false,
    data_type = data_types.Uint16,
    is_complex = false,
    is_array = false,
    default = 0x0000,
  },
  {
    name = "image_type",
    optional = false,
    data_type = ImageTypeIdType,
    is_complex = false,
    is_array = false,
    default = 0x0000,
  },
  {
    name = "file_version",
    optional = false,
    data_type = data_types.Uint32,
    is_complex = false,
    is_array = false,
    default = 0x00000000,
  },
  {
    name = "file_offset",
    optional = false,
    data_type = data_types.Uint32,
    is_complex = false,
    is_array = false,
    default = 0x00000000,
  },
  {
    name = "maximum_data_size",
    optional = false,
    data_type = data_types.Uint8,
    is_complex = false,
    is_array = false,
    default = 0x00,
  },
  {
    name = "page_size",
    optional = false,
    data_type = data_types.Uint16,
    is_complex = false,
    is_array = false,
    default = 0x0000,
  },
  {
    name = "response_spacing",
    optional = false,
    data_type = data_types.Uint16,
    is_complex = false,
    is_array = false,
    default = 0x0000,
  },
  {
    name = "request_node_address",
    optional = false,
    data_type = data_types.IeeeAddress,
    is_complex = false,
    is_array = false,
  },
}

function ImagePageRequest:get_fields()
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

ImagePageRequest.get_length = utils.length_from_fields
ImagePageRequest._serialize = utils.serialize_from_fields
ImagePageRequest.pretty_print = utils.print_from_fields

--- Deserialize this command
---
--- @param buf buf the bytes of the command body
--- @return ImagePageRequest
function ImagePageRequest.deserialize(buf)
  local out = {}
  for _, v in ipairs(ImagePageRequest.args_def) do
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
      log.debug("Missing command arg " .. v.name .. " for deserializing ImagePageRequest")
    end
  end
  setmetatable(out, {__index = ImagePageRequest})
  out:set_field_names()
  return out
end

function ImagePageRequest:set_field_names()
  for _, v in ipairs(self.args_def) do
    if self[v.name] ~= nil then
      self[v.name].field_name = v.name
    end
  end
end

--- Build a version of this message as if it came from the device
---
--- @param device st.zigbee.Device the device to build the message from
--- @param field_control st.zigbee.zcl.clusters.OTAUpgrade.types.FieldControl
--- @param manufacturer_code st.zigbee.data_types.Uint16
--- @param image_type st.zigbee.zcl.clusters.OTAUpgrade.types.ImageTypeId
--- @param file_version st.zigbee.data_types.Uint32
--- @param file_offset st.zigbee.data_types.Uint32
--- @param maximum_data_size st.zigbee.data_types.Uint8
--- @param page_size st.zigbee.data_types.Uint16
--- @param response_spacing st.zigbee.data_types.Uint16
--- @param request_node_address st.zigbee.data_types.IeeeAddress
--- @return st.zigbee.ZigbeeMessageRx The full Zigbee message containing this command body
function ImagePageRequest.build_test_rx(device, field_control, manufacturer_code, image_type, file_version, file_offset, maximum_data_size, page_size, response_spacing, request_node_address)
  local out = {}
  local args = {field_control, manufacturer_code, image_type, file_version, file_offset, maximum_data_size, page_size, response_spacing, request_node_address}
  for i,v in ipairs(ImagePageRequest.args_def) do
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
  setmetatable(out, {__index = ImagePageRequest})
  out:set_field_names()
  return ImagePageRequest._cluster:build_test_rx_cluster_specific_command(device, out, "server")
end

--- Initialize the ImagePageRequest command
---
--- @param self ImagePageRequest the template class for this command
--- @param device st.zigbee.Device the device to build this message to
--- @param field_control st.zigbee.zcl.clusters.OTAUpgrade.types.FieldControl
--- @param manufacturer_code st.zigbee.data_types.Uint16
--- @param image_type st.zigbee.zcl.clusters.OTAUpgrade.types.ImageTypeId
--- @param file_version st.zigbee.data_types.Uint32
--- @param file_offset st.zigbee.data_types.Uint32
--- @param maximum_data_size st.zigbee.data_types.Uint8
--- @param page_size st.zigbee.data_types.Uint16
--- @param response_spacing st.zigbee.data_types.Uint16
--- @param request_node_address st.zigbee.data_types.IeeeAddress
--- @return st.zigbee.ZigbeeMessageTx the full command addressed to the device
function ImagePageRequest:init(device, field_control, manufacturer_code, image_type, file_version, file_offset, maximum_data_size, page_size, response_spacing, request_node_address)
  local out = {}
  local args = {field_control, manufacturer_code, image_type, file_version, file_offset, maximum_data_size, page_size, response_spacing, request_node_address}
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
    __index = ImagePageRequest,
    __tostring = ImagePageRequest.pretty_print
  })
  out:set_field_names()
  return self._cluster:build_cluster_specific_command(device, out, "server")
end

function ImagePageRequest:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(ImagePageRequest, {__call = ImagePageRequest.init})

return ImagePageRequest