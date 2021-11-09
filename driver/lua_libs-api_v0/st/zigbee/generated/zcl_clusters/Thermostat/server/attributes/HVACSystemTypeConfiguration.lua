local cluster_base = require "st.zigbee.cluster_base"
local data_types = require "st.zigbee.data_types"

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

--- @class st.zigbee.zcl.clusters.Thermostat.HVACSystemTypeConfiguration
--- @alias HVACSystemTypeConfiguration
---
--- @field public ID number 0x0009 the ID of this attribute
--- @field public NAME string "HVACSystemTypeConfiguration" the name of this attribute
--- @field public data_type st.zigbee.data_types.Bitmap8 the data type of this attribute
--- @field public COOLING_SYSTEM_STAGE number 3
--- @field public HEATING_SYSTEM_STAGE number 12
--- @field public HEATING_SYSTEM_TYPE number 16
--- @field public HEATING_FUEL_SOURCE number 32
local HVACSystemTypeConfiguration = {
  ID = 0x0009,
  NAME = "HVACSystemTypeConfiguration",
  base_type = data_types.Bitmap8,
}

HVACSystemTypeConfiguration.BASE_MASK            = 0xFF
HVACSystemTypeConfiguration.COOLING_SYSTEM_STAGE = 0x03
HVACSystemTypeConfiguration.HEATING_SYSTEM_STAGE = 0x0C
HVACSystemTypeConfiguration.HEATING_SYSTEM_TYPE  = 0x10
HVACSystemTypeConfiguration.HEATING_FUEL_SOURCE  = 0x20


HVACSystemTypeConfiguration.mask_fields = {
  BASE_MASK = 0xFF,
  COOLING_SYSTEM_STAGE = 0x03,
  HEATING_SYSTEM_STAGE = 0x0C,
  HEATING_SYSTEM_TYPE = 0x10,
  HEATING_FUEL_SOURCE = 0x20,
}


--- @function HVACSystemTypeConfiguration:is_cooling_system_stage_set
--- @return boolean True if the value of COOLING_SYSTEM_STAGE is non-zero
HVACSystemTypeConfiguration.is_cooling_system_stage_set = function(self)
  return (self.value & self.COOLING_SYSTEM_STAGE) ~= 0
end
 
--- @function HVACSystemTypeConfiguration:set_cooling_system_stage
--- Set the value of the bits in the COOLING_SYSTEM_STAGE field
--- @param fieldVal number the value to set the bitfield to
HVACSystemTypeConfiguration.set_cooling_system_stage = function(self, fieldVal)
  if ((fieldVal & ~(self.COOLING_SYSTEM_STAGE >> 0)) ~= 0) then
    error("value too large for COOLING_SYSTEM_STAGE")
  end
  self.value = self.value | (fieldVal << 0)
end

--- @function HVACSystemTypeConfiguration:get_cooling_system_stage
--- Get the value of the bits in the COOLING_SYSTEM_STAGE field
HVACSystemTypeConfiguration.get_cooling_system_stage = function(self)
  return ((self.value & self.COOLING_SYSTEM_STAGE)) >> 0
end

--- @function HVACSystemTypeConfiguration:unset_cooling_system_stage
--- Set the value of the bits in the COOLING_SYSTEM_STAGE field to 0
HVACSystemTypeConfiguration.unset_cooling_system_stage = function(self)
  self.value = self.value & (~self.COOLING_SYSTEM_STAGE & self.BASE_MASK)
end

--- @function HVACSystemTypeConfiguration:is_heating_system_stage_set
--- @return boolean True if the value of HEATING_SYSTEM_STAGE is non-zero
HVACSystemTypeConfiguration.is_heating_system_stage_set = function(self)
  return (self.value & self.HEATING_SYSTEM_STAGE) ~= 0
end
 
--- @function HVACSystemTypeConfiguration:set_heating_system_stage
--- Set the value of the bits in the HEATING_SYSTEM_STAGE field
--- @param fieldVal number the value to set the bitfield to
HVACSystemTypeConfiguration.set_heating_system_stage = function(self, fieldVal)
  if ((fieldVal & ~(self.HEATING_SYSTEM_STAGE >> 2)) ~= 0) then
    error("value too large for HEATING_SYSTEM_STAGE")
  end
  self.value = self.value | (fieldVal << 2)
end

--- @function HVACSystemTypeConfiguration:get_heating_system_stage
--- Get the value of the bits in the HEATING_SYSTEM_STAGE field
HVACSystemTypeConfiguration.get_heating_system_stage = function(self)
  return ((self.value & self.HEATING_SYSTEM_STAGE)) >> 2
end

--- @function HVACSystemTypeConfiguration:unset_heating_system_stage
--- Set the value of the bits in the HEATING_SYSTEM_STAGE field to 0
HVACSystemTypeConfiguration.unset_heating_system_stage = function(self)
  self.value = self.value & (~self.HEATING_SYSTEM_STAGE & self.BASE_MASK)
end

--- @function HVACSystemTypeConfiguration:is_heating_system_type_set
--- @return boolean True if the value of HEATING_SYSTEM_TYPE is non-zero
HVACSystemTypeConfiguration.is_heating_system_type_set = function(self)
  return (self.value & self.HEATING_SYSTEM_TYPE) ~= 0
end
 
--- @function HVACSystemTypeConfiguration:set_heating_system_type
--- Set the value of the bit in the HEATING_SYSTEM_TYPE field to 1
HVACSystemTypeConfiguration.set_heating_system_type = function(self)
  self.value = self.value | self.HEATING_SYSTEM_TYPE
end

--- @function HVACSystemTypeConfiguration:unset_heating_system_type
--- Set the value of the bits in the HEATING_SYSTEM_TYPE field to 0
HVACSystemTypeConfiguration.unset_heating_system_type = function(self)
  self.value = self.value & (~self.HEATING_SYSTEM_TYPE & self.BASE_MASK)
end

--- @function HVACSystemTypeConfiguration:is_heating_fuel_source_set
--- @return boolean True if the value of HEATING_FUEL_SOURCE is non-zero
HVACSystemTypeConfiguration.is_heating_fuel_source_set = function(self)
  return (self.value & self.HEATING_FUEL_SOURCE) ~= 0
end
 
--- @function HVACSystemTypeConfiguration:set_heating_fuel_source
--- Set the value of the bit in the HEATING_FUEL_SOURCE field to 1
HVACSystemTypeConfiguration.set_heating_fuel_source = function(self)
  self.value = self.value | self.HEATING_FUEL_SOURCE
end

--- @function HVACSystemTypeConfiguration:unset_heating_fuel_source
--- Set the value of the bits in the HEATING_FUEL_SOURCE field to 0
HVACSystemTypeConfiguration.unset_heating_fuel_source = function(self)
  self.value = self.value & (~self.HEATING_FUEL_SOURCE & self.BASE_MASK)
end


HVACSystemTypeConfiguration.mask_methods = {
  is_cooling_system_stage_set = HVACSystemTypeConfiguration.is_cooling_system_stage_set,
  set_cooling_system_stage = HVACSystemTypeConfiguration.set_cooling_system_stage,
  get_cooling_system_stage = HVACSystemTypeConfiguration.get_cooling_system_stage,
  unset_cooling_system_stage = HVACSystemTypeConfiguration.unset_cooling_system_stage,
  is_heating_system_stage_set = HVACSystemTypeConfiguration.is_heating_system_stage_set,
  set_heating_system_stage = HVACSystemTypeConfiguration.set_heating_system_stage,
  get_heating_system_stage = HVACSystemTypeConfiguration.get_heating_system_stage,
  unset_heating_system_stage = HVACSystemTypeConfiguration.unset_heating_system_stage,
  is_heating_system_type_set = HVACSystemTypeConfiguration.is_heating_system_type_set,
  set_heating_system_type = HVACSystemTypeConfiguration.set_heating_system_type,
  unset_heating_system_type = HVACSystemTypeConfiguration.unset_heating_system_type,
  is_heating_fuel_source_set = HVACSystemTypeConfiguration.is_heating_fuel_source_set,
  set_heating_fuel_source = HVACSystemTypeConfiguration.set_heating_fuel_source,
  unset_heating_fuel_source = HVACSystemTypeConfiguration.unset_heating_fuel_source,
}

--- Add additional functionality to the base type object
---
--- @param base_type_obj st.zigbee.data_types.Bitmap8 the base data type object to add functionality to
function HVACSystemTypeConfiguration:augment_type(base_type_obj)
  for k, v in pairs(self.mask_fields) do
    base_type_obj[k] = v
  end
  for k, v in pairs(self.mask_methods) do
    base_type_obj[k] = v
  end
  
  base_type_obj.field_name = self.NAME
  base_type_obj.pretty_print = self.pretty_print
end

function HVACSystemTypeConfiguration.pretty_print(value_obj)
  local zb_utils = require "st.zigbee.utils" 
  local pattern = ">I" .. value_obj.byte_length
  return string.format("%s: %s[0x]", value_obj.field_name or value_obj.NAME, HVACSystemTypeConfiguration.NAME, zb_utils.pretty_print_hex_str(string.pack(pattern, value_obj.value)))
end

--- @function HVACSystemTypeConfiguration:build_test_attr_report
---
--- Build a Rx Zigbee message as if a device reported this attribute
--- @param device st.zigbee.Device
--- @param data st.zigbee.data_types.Bitmap8 the attribute value
--- @return st.zigbee.ZigbeeMessageRx containing an AttributeReport body
HVACSystemTypeConfiguration.build_test_attr_report = cluster_base.build_test_attr_report

--- @function HVACSystemTypeConfiguration:build_test_read_attr_response
---
--- Build a Rx Zigbee message as if a device sent a read response for this attribute
--- @param device st.zigbee.Device
--- @param data st.zigbee.data_types.Bitmap8 the attribute value
--- @return st.zigbee.ZigbeeMessageRx containing an ReadAttributeResponse body
HVACSystemTypeConfiguration.build_test_read_attr_response = cluster_base.build_test_read_attr_response

--- Create a Bitmap8 object of this attribute with any additional features provided for the attribute
---
--- This is also usable with the HVACSystemTypeConfiguration(...) syntax
---
--- @vararg vararg the values needed to construct a Bitmap8
--- @return st.zigbee.data_types.Bitmap8
function HVACSystemTypeConfiguration:new_value(...)
    local o = self.base_type(table.unpack({...}))
    self:augment_type(o)
    return o
end

--- Construct a st.zigbee.ZigbeeMessageTx to read this attribute from a device
---
--- @param device st.zigbee.Device
--- @return st.zigbee.ZigbeeMessageTx containing a ReadAttribute body
function HVACSystemTypeConfiguration:read(device)
    return cluster_base.read_attribute(device, data_types.ClusterId(self._cluster.ID), data_types.AttributeId(self.ID))
end

--- Construct a st.zigbee.ZigbeeMessageTx to configure this attribute for reporting on a device
---
--- @param device st.zigbee.Device
--- @param min_rep_int number|st.zigbee.data_types.Uint16 the minimum interval allowed between reports of this attribute
--- @param max_rep_int number|st.zigbee.data_types.Uint16 the maximum interval allowed between reports of this attribute
--- @return st.zigbee.ZigbeeMessageTx containing a ConfigureReporting body
function HVACSystemTypeConfiguration:configure_reporting(device, min_rep_int, max_rep_int)
  local min = data_types.validate_or_build_type(min_rep_int, data_types.Uint16, "minimum_reporting_interval")
  local max = data_types.validate_or_build_type(max_rep_int, data_types.Uint16, "maximum_reporting_interval")
  local rep_change = nil
  return cluster_base.configure_reporting(device, data_types.ClusterId(self._cluster.ID), data_types.AttributeId(self.ID), data_types.ZigbeeDataType(self.base_type.ID), min, max, rep_change)
end

--- Write a value to this attribute on a device
---
--- @param device st.zigbee.Device
--- @param value st.zigbee.data_types.Bitmap8 the value to write
function HVACSystemTypeConfiguration:write(device, value)
  local data = data_types.validate_or_build_type(value, self.base_type)
  self:augment_type(data)
  return cluster_base.write_attribute(device, data_types.ClusterId(self._cluster.ID), data_types.AttributeId(self.ID), data)
end

function HVACSystemTypeConfiguration:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(HVACSystemTypeConfiguration, {__call = HVACSystemTypeConfiguration.new_value})
return HVACSystemTypeConfiguration
