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

--- @class st.zigbee.zcl.clusters.Basic.AlarmMask
--- @alias AlarmMask
---
--- @field public ID number 0x0013 the ID of this attribute
--- @field public NAME string "AlarmMask" the name of this attribute
--- @field public data_type st.zigbee.data_types.Bitmap8 the data type of this attribute
--- @field public GENERAL_HARDWARE_FAULT number 1
--- @field public GENERAL_SOFTWARE_FAULT number 2
local AlarmMask = {
  ID = 0x0013,
  NAME = "AlarmMask",
  base_type = data_types.Bitmap8,
}

AlarmMask.BASE_MASK              = 0xFF
AlarmMask.GENERAL_HARDWARE_FAULT = 0x01
AlarmMask.GENERAL_SOFTWARE_FAULT = 0x02


AlarmMask.mask_fields = {
  BASE_MASK = 0xFF,
  GENERAL_HARDWARE_FAULT = 0x01,
  GENERAL_SOFTWARE_FAULT = 0x02,
}


--- @function AlarmMask:is_general_hardware_fault_set
--- @return boolean True if the value of GENERAL_HARDWARE_FAULT is non-zero
AlarmMask.is_general_hardware_fault_set = function(self)
  return (self.value & self.GENERAL_HARDWARE_FAULT) ~= 0
end
 
--- @function AlarmMask:set_general_hardware_fault
--- Set the value of the bit in the GENERAL_HARDWARE_FAULT field to 1
AlarmMask.set_general_hardware_fault = function(self)
  self.value = self.value | self.GENERAL_HARDWARE_FAULT
end

--- @function AlarmMask:unset_general_hardware_fault
--- Set the value of the bits in the GENERAL_HARDWARE_FAULT field to 0
AlarmMask.unset_general_hardware_fault = function(self)
  self.value = self.value & (~self.GENERAL_HARDWARE_FAULT & self.BASE_MASK)
end

--- @function AlarmMask:is_general_software_fault_set
--- @return boolean True if the value of GENERAL_SOFTWARE_FAULT is non-zero
AlarmMask.is_general_software_fault_set = function(self)
  return (self.value & self.GENERAL_SOFTWARE_FAULT) ~= 0
end
 
--- @function AlarmMask:set_general_software_fault
--- Set the value of the bit in the GENERAL_SOFTWARE_FAULT field to 1
AlarmMask.set_general_software_fault = function(self)
  self.value = self.value | self.GENERAL_SOFTWARE_FAULT
end

--- @function AlarmMask:unset_general_software_fault
--- Set the value of the bits in the GENERAL_SOFTWARE_FAULT field to 0
AlarmMask.unset_general_software_fault = function(self)
  self.value = self.value & (~self.GENERAL_SOFTWARE_FAULT & self.BASE_MASK)
end


AlarmMask.mask_methods = {
  is_general_hardware_fault_set = AlarmMask.is_general_hardware_fault_set,
  set_general_hardware_fault = AlarmMask.set_general_hardware_fault,
  unset_general_hardware_fault = AlarmMask.unset_general_hardware_fault,
  is_general_software_fault_set = AlarmMask.is_general_software_fault_set,
  set_general_software_fault = AlarmMask.set_general_software_fault,
  unset_general_software_fault = AlarmMask.unset_general_software_fault,
}

--- Add additional functionality to the base type object
---
--- @param base_type_obj st.zigbee.data_types.Bitmap8 the base data type object to add functionality to
function AlarmMask:augment_type(base_type_obj)
  for k, v in pairs(self.mask_fields) do
    base_type_obj[k] = v
  end
  for k, v in pairs(self.mask_methods) do
    base_type_obj[k] = v
  end
  
  base_type_obj.field_name = self.NAME
  base_type_obj.pretty_print = self.pretty_print
end

function AlarmMask.pretty_print(value_obj)
  local zb_utils = require "st.zigbee.utils" 
  local pattern = ">I" .. value_obj.byte_length
  return string.format("%s: %s[0x]", value_obj.field_name or value_obj.NAME, AlarmMask.NAME, zb_utils.pretty_print_hex_str(string.pack(pattern, value_obj.value)))
end

--- @function AlarmMask:build_test_attr_report
---
--- Build a Rx Zigbee message as if a device reported this attribute
--- @param device st.zigbee.Device
--- @param data st.zigbee.data_types.Bitmap8 the attribute value
--- @return st.zigbee.ZigbeeMessageRx containing an AttributeReport body
AlarmMask.build_test_attr_report = cluster_base.build_test_attr_report

--- @function AlarmMask:build_test_read_attr_response
---
--- Build a Rx Zigbee message as if a device sent a read response for this attribute
--- @param device st.zigbee.Device
--- @param data st.zigbee.data_types.Bitmap8 the attribute value
--- @return st.zigbee.ZigbeeMessageRx containing an ReadAttributeResponse body
AlarmMask.build_test_read_attr_response = cluster_base.build_test_read_attr_response

--- Create a Bitmap8 object of this attribute with any additional features provided for the attribute
---
--- This is also usable with the AlarmMask(...) syntax
---
--- @vararg vararg the values needed to construct a Bitmap8
--- @return st.zigbee.data_types.Bitmap8
function AlarmMask:new_value(...)
    local o = self.base_type(table.unpack({...}))
    self:augment_type(o)
    return o
end

--- Construct a st.zigbee.ZigbeeMessageTx to read this attribute from a device
---
--- @param device st.zigbee.Device
--- @return st.zigbee.ZigbeeMessageTx containing a ReadAttribute body
function AlarmMask:read(device)
    return cluster_base.read_attribute(device, data_types.ClusterId(self._cluster.ID), data_types.AttributeId(self.ID))
end

--- Construct a st.zigbee.ZigbeeMessageTx to configure this attribute for reporting on a device
---
--- @param device st.zigbee.Device
--- @param min_rep_int number|st.zigbee.data_types.Uint16 the minimum interval allowed between reports of this attribute
--- @param max_rep_int number|st.zigbee.data_types.Uint16 the maximum interval allowed between reports of this attribute
--- @return st.zigbee.ZigbeeMessageTx containing a ConfigureReporting body
function AlarmMask:configure_reporting(device, min_rep_int, max_rep_int)
  local min = data_types.validate_or_build_type(min_rep_int, data_types.Uint16, "minimum_reporting_interval")
  local max = data_types.validate_or_build_type(max_rep_int, data_types.Uint16, "maximum_reporting_interval")
  local rep_change = nil
  return cluster_base.configure_reporting(device, data_types.ClusterId(self._cluster.ID), data_types.AttributeId(self.ID), data_types.ZigbeeDataType(self.base_type.ID), min, max, rep_change)
end

--- Write a value to this attribute on a device
---
--- @param device st.zigbee.Device
--- @param value st.zigbee.data_types.Bitmap8 the value to write
function AlarmMask:write(device, value)
  local data = data_types.validate_or_build_type(value, self.base_type)
  self:augment_type(data)
  return cluster_base.write_attribute(device, data_types.ClusterId(self._cluster.ID), data_types.AttributeId(self.ID), data)
end

function AlarmMask:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(AlarmMask, {__call = AlarmMask.new_value})
return AlarmMask
