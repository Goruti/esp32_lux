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

--- @class st.zigbee.zcl.clusters.Thermostat.ThermostatProgrammingOperationMode
--- @alias ThermostatProgrammingOperationMode
---
--- @field public ID number 0x0025 the ID of this attribute
--- @field public NAME string "ThermostatProgrammingOperationMode" the name of this attribute
--- @field public data_type st.zigbee.data_types.Bitmap8 the data type of this attribute
--- @field public PROGRAMMING_MODE number 1
--- @field public AUTO_OR_RECOVERY number 2
--- @field public ECONOMY_OR_ENERGY_STAR number 4
local ThermostatProgrammingOperationMode = {
  ID = 0x0025,
  NAME = "ThermostatProgrammingOperationMode",
  base_type = data_types.Bitmap8,
}

ThermostatProgrammingOperationMode.BASE_MASK              = 0xFF
ThermostatProgrammingOperationMode.PROGRAMMING_MODE       = 0x01
ThermostatProgrammingOperationMode.AUTO_OR_RECOVERY       = 0x02
ThermostatProgrammingOperationMode.ECONOMY_OR_ENERGY_STAR = 0x04


ThermostatProgrammingOperationMode.mask_fields = {
  BASE_MASK = 0xFF,
  PROGRAMMING_MODE = 0x01,
  AUTO_OR_RECOVERY = 0x02,
  ECONOMY_OR_ENERGY_STAR = 0x04,
}


--- @function ThermostatProgrammingOperationMode:is_programming_mode_set
--- @return boolean True if the value of PROGRAMMING_MODE is non-zero
ThermostatProgrammingOperationMode.is_programming_mode_set = function(self)
  return (self.value & self.PROGRAMMING_MODE) ~= 0
end
 
--- @function ThermostatProgrammingOperationMode:set_programming_mode
--- Set the value of the bit in the PROGRAMMING_MODE field to 1
ThermostatProgrammingOperationMode.set_programming_mode = function(self)
  self.value = self.value | self.PROGRAMMING_MODE
end

--- @function ThermostatProgrammingOperationMode:unset_programming_mode
--- Set the value of the bits in the PROGRAMMING_MODE field to 0
ThermostatProgrammingOperationMode.unset_programming_mode = function(self)
  self.value = self.value & (~self.PROGRAMMING_MODE & self.BASE_MASK)
end

--- @function ThermostatProgrammingOperationMode:is_auto_or_recovery_set
--- @return boolean True if the value of AUTO_OR_RECOVERY is non-zero
ThermostatProgrammingOperationMode.is_auto_or_recovery_set = function(self)
  return (self.value & self.AUTO_OR_RECOVERY) ~= 0
end
 
--- @function ThermostatProgrammingOperationMode:set_auto_or_recovery
--- Set the value of the bit in the AUTO_OR_RECOVERY field to 1
ThermostatProgrammingOperationMode.set_auto_or_recovery = function(self)
  self.value = self.value | self.AUTO_OR_RECOVERY
end

--- @function ThermostatProgrammingOperationMode:unset_auto_or_recovery
--- Set the value of the bits in the AUTO_OR_RECOVERY field to 0
ThermostatProgrammingOperationMode.unset_auto_or_recovery = function(self)
  self.value = self.value & (~self.AUTO_OR_RECOVERY & self.BASE_MASK)
end

--- @function ThermostatProgrammingOperationMode:is_economy_or_energy_star_set
--- @return boolean True if the value of ECONOMY_OR_ENERGY_STAR is non-zero
ThermostatProgrammingOperationMode.is_economy_or_energy_star_set = function(self)
  return (self.value & self.ECONOMY_OR_ENERGY_STAR) ~= 0
end
 
--- @function ThermostatProgrammingOperationMode:set_economy_or_energy_star
--- Set the value of the bit in the ECONOMY_OR_ENERGY_STAR field to 1
ThermostatProgrammingOperationMode.set_economy_or_energy_star = function(self)
  self.value = self.value | self.ECONOMY_OR_ENERGY_STAR
end

--- @function ThermostatProgrammingOperationMode:unset_economy_or_energy_star
--- Set the value of the bits in the ECONOMY_OR_ENERGY_STAR field to 0
ThermostatProgrammingOperationMode.unset_economy_or_energy_star = function(self)
  self.value = self.value & (~self.ECONOMY_OR_ENERGY_STAR & self.BASE_MASK)
end


ThermostatProgrammingOperationMode.mask_methods = {
  is_programming_mode_set = ThermostatProgrammingOperationMode.is_programming_mode_set,
  set_programming_mode = ThermostatProgrammingOperationMode.set_programming_mode,
  unset_programming_mode = ThermostatProgrammingOperationMode.unset_programming_mode,
  is_auto_or_recovery_set = ThermostatProgrammingOperationMode.is_auto_or_recovery_set,
  set_auto_or_recovery = ThermostatProgrammingOperationMode.set_auto_or_recovery,
  unset_auto_or_recovery = ThermostatProgrammingOperationMode.unset_auto_or_recovery,
  is_economy_or_energy_star_set = ThermostatProgrammingOperationMode.is_economy_or_energy_star_set,
  set_economy_or_energy_star = ThermostatProgrammingOperationMode.set_economy_or_energy_star,
  unset_economy_or_energy_star = ThermostatProgrammingOperationMode.unset_economy_or_energy_star,
}

--- Add additional functionality to the base type object
---
--- @param base_type_obj st.zigbee.data_types.Bitmap8 the base data type object to add functionality to
function ThermostatProgrammingOperationMode:augment_type(base_type_obj)
  for k, v in pairs(self.mask_fields) do
    base_type_obj[k] = v
  end
  for k, v in pairs(self.mask_methods) do
    base_type_obj[k] = v
  end
  
  base_type_obj.field_name = self.NAME
  base_type_obj.pretty_print = self.pretty_print
end

function ThermostatProgrammingOperationMode.pretty_print(value_obj)
  local zb_utils = require "st.zigbee.utils" 
  local pattern = ">I" .. value_obj.byte_length
  return string.format("%s: %s[0x]", value_obj.field_name or value_obj.NAME, ThermostatProgrammingOperationMode.NAME, zb_utils.pretty_print_hex_str(string.pack(pattern, value_obj.value)))
end

--- @function ThermostatProgrammingOperationMode:build_test_attr_report
---
--- Build a Rx Zigbee message as if a device reported this attribute
--- @param device st.zigbee.Device
--- @param data st.zigbee.data_types.Bitmap8 the attribute value
--- @return st.zigbee.ZigbeeMessageRx containing an AttributeReport body
ThermostatProgrammingOperationMode.build_test_attr_report = cluster_base.build_test_attr_report

--- @function ThermostatProgrammingOperationMode:build_test_read_attr_response
---
--- Build a Rx Zigbee message as if a device sent a read response for this attribute
--- @param device st.zigbee.Device
--- @param data st.zigbee.data_types.Bitmap8 the attribute value
--- @return st.zigbee.ZigbeeMessageRx containing an ReadAttributeResponse body
ThermostatProgrammingOperationMode.build_test_read_attr_response = cluster_base.build_test_read_attr_response

--- Create a Bitmap8 object of this attribute with any additional features provided for the attribute
---
--- This is also usable with the ThermostatProgrammingOperationMode(...) syntax
---
--- @vararg vararg the values needed to construct a Bitmap8
--- @return st.zigbee.data_types.Bitmap8
function ThermostatProgrammingOperationMode:new_value(...)
    local o = self.base_type(table.unpack({...}))
    self:augment_type(o)
    return o
end

--- Construct a st.zigbee.ZigbeeMessageTx to read this attribute from a device
---
--- @param device st.zigbee.Device
--- @return st.zigbee.ZigbeeMessageTx containing a ReadAttribute body
function ThermostatProgrammingOperationMode:read(device)
    return cluster_base.read_attribute(device, data_types.ClusterId(self._cluster.ID), data_types.AttributeId(self.ID))
end

--- Construct a st.zigbee.ZigbeeMessageTx to configure this attribute for reporting on a device
---
--- @param device st.zigbee.Device
--- @param min_rep_int number|st.zigbee.data_types.Uint16 the minimum interval allowed between reports of this attribute
--- @param max_rep_int number|st.zigbee.data_types.Uint16 the maximum interval allowed between reports of this attribute
--- @return st.zigbee.ZigbeeMessageTx containing a ConfigureReporting body
function ThermostatProgrammingOperationMode:configure_reporting(device, min_rep_int, max_rep_int)
  local min = data_types.validate_or_build_type(min_rep_int, data_types.Uint16, "minimum_reporting_interval")
  local max = data_types.validate_or_build_type(max_rep_int, data_types.Uint16, "maximum_reporting_interval")
  local rep_change = nil
  return cluster_base.configure_reporting(device, data_types.ClusterId(self._cluster.ID), data_types.AttributeId(self.ID), data_types.ZigbeeDataType(self.base_type.ID), min, max, rep_change)
end

--- Write a value to this attribute on a device
---
--- @param device st.zigbee.Device
--- @param value st.zigbee.data_types.Bitmap8 the value to write
function ThermostatProgrammingOperationMode:write(device, value)
  local data = data_types.validate_or_build_type(value, self.base_type)
  self:augment_type(data)
  return cluster_base.write_attribute(device, data_types.ClusterId(self._cluster.ID), data_types.AttributeId(self.ID), data)
end

function ThermostatProgrammingOperationMode:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(ThermostatProgrammingOperationMode, {__call = ThermostatProgrammingOperationMode.new_value})
return ThermostatProgrammingOperationMode
