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

--- @class st.zigbee.zcl.clusters.DeviceTemperatureConfiguration.DeviceTempAlarmMask
--- @alias DeviceTempAlarmMask
---
--- @field public ID number 0x0010 the ID of this attribute
--- @field public NAME string "DeviceTempAlarmMask" the name of this attribute
--- @field public data_type st.zigbee.data_types.Bitmap8 the data type of this attribute
--- @field public DEVICE_TEMPERATURE_TOO_LOW number 1
--- @field public DEVICE_TEMPERATURE_TOO_HIGH number 2
local DeviceTempAlarmMask = {
  ID = 0x0010,
  NAME = "DeviceTempAlarmMask",
  base_type = data_types.Bitmap8,
}

DeviceTempAlarmMask.BASE_MASK                   = 0xFF
DeviceTempAlarmMask.DEVICE_TEMPERATURE_TOO_LOW  = 0x01
DeviceTempAlarmMask.DEVICE_TEMPERATURE_TOO_HIGH = 0x02


DeviceTempAlarmMask.mask_fields = {
  BASE_MASK = 0xFF,
  DEVICE_TEMPERATURE_TOO_LOW = 0x01,
  DEVICE_TEMPERATURE_TOO_HIGH = 0x02,
}


--- @function DeviceTempAlarmMask:is_device_temperature_too_low_set
--- @return boolean True if the value of DEVICE_TEMPERATURE_TOO_LOW is non-zero
DeviceTempAlarmMask.is_device_temperature_too_low_set = function(self)
  return (self.value & self.DEVICE_TEMPERATURE_TOO_LOW) ~= 0
end
 
--- @function DeviceTempAlarmMask:set_device_temperature_too_low
--- Set the value of the bit in the DEVICE_TEMPERATURE_TOO_LOW field to 1
DeviceTempAlarmMask.set_device_temperature_too_low = function(self)
  self.value = self.value | self.DEVICE_TEMPERATURE_TOO_LOW
end

--- @function DeviceTempAlarmMask:unset_device_temperature_too_low
--- Set the value of the bits in the DEVICE_TEMPERATURE_TOO_LOW field to 0
DeviceTempAlarmMask.unset_device_temperature_too_low = function(self)
  self.value = self.value & (~self.DEVICE_TEMPERATURE_TOO_LOW & self.BASE_MASK)
end

--- @function DeviceTempAlarmMask:is_device_temperature_too_high_set
--- @return boolean True if the value of DEVICE_TEMPERATURE_TOO_HIGH is non-zero
DeviceTempAlarmMask.is_device_temperature_too_high_set = function(self)
  return (self.value & self.DEVICE_TEMPERATURE_TOO_HIGH) ~= 0
end
 
--- @function DeviceTempAlarmMask:set_device_temperature_too_high
--- Set the value of the bit in the DEVICE_TEMPERATURE_TOO_HIGH field to 1
DeviceTempAlarmMask.set_device_temperature_too_high = function(self)
  self.value = self.value | self.DEVICE_TEMPERATURE_TOO_HIGH
end

--- @function DeviceTempAlarmMask:unset_device_temperature_too_high
--- Set the value of the bits in the DEVICE_TEMPERATURE_TOO_HIGH field to 0
DeviceTempAlarmMask.unset_device_temperature_too_high = function(self)
  self.value = self.value & (~self.DEVICE_TEMPERATURE_TOO_HIGH & self.BASE_MASK)
end


DeviceTempAlarmMask.mask_methods = {
  is_device_temperature_too_low_set = DeviceTempAlarmMask.is_device_temperature_too_low_set,
  set_device_temperature_too_low = DeviceTempAlarmMask.set_device_temperature_too_low,
  unset_device_temperature_too_low = DeviceTempAlarmMask.unset_device_temperature_too_low,
  is_device_temperature_too_high_set = DeviceTempAlarmMask.is_device_temperature_too_high_set,
  set_device_temperature_too_high = DeviceTempAlarmMask.set_device_temperature_too_high,
  unset_device_temperature_too_high = DeviceTempAlarmMask.unset_device_temperature_too_high,
}

--- Add additional functionality to the base type object
---
--- @param base_type_obj st.zigbee.data_types.Bitmap8 the base data type object to add functionality to
function DeviceTempAlarmMask:augment_type(base_type_obj)
  for k, v in pairs(self.mask_fields) do
    base_type_obj[k] = v
  end
  for k, v in pairs(self.mask_methods) do
    base_type_obj[k] = v
  end
  
  base_type_obj.field_name = self.NAME
  base_type_obj.pretty_print = self.pretty_print
end

function DeviceTempAlarmMask.pretty_print(value_obj)
  local zb_utils = require "st.zigbee.utils" 
  local pattern = ">I" .. value_obj.byte_length
  return string.format("%s: %s[0x]", value_obj.field_name or value_obj.NAME, DeviceTempAlarmMask.NAME, zb_utils.pretty_print_hex_str(string.pack(pattern, value_obj.value)))
end

--- @function DeviceTempAlarmMask:build_test_attr_report
---
--- Build a Rx Zigbee message as if a device reported this attribute
--- @param device st.zigbee.Device
--- @param data st.zigbee.data_types.Bitmap8 the attribute value
--- @return st.zigbee.ZigbeeMessageRx containing an AttributeReport body
DeviceTempAlarmMask.build_test_attr_report = cluster_base.build_test_attr_report

--- @function DeviceTempAlarmMask:build_test_read_attr_response
---
--- Build a Rx Zigbee message as if a device sent a read response for this attribute
--- @param device st.zigbee.Device
--- @param data st.zigbee.data_types.Bitmap8 the attribute value
--- @return st.zigbee.ZigbeeMessageRx containing an ReadAttributeResponse body
DeviceTempAlarmMask.build_test_read_attr_response = cluster_base.build_test_read_attr_response

--- Create a Bitmap8 object of this attribute with any additional features provided for the attribute
---
--- This is also usable with the DeviceTempAlarmMask(...) syntax
---
--- @vararg vararg the values needed to construct a Bitmap8
--- @return st.zigbee.data_types.Bitmap8
function DeviceTempAlarmMask:new_value(...)
    local o = self.base_type(table.unpack({...}))
    self:augment_type(o)
    return o
end

--- Construct a st.zigbee.ZigbeeMessageTx to read this attribute from a device
---
--- @param device st.zigbee.Device
--- @return st.zigbee.ZigbeeMessageTx containing a ReadAttribute body
function DeviceTempAlarmMask:read(device)
    return cluster_base.read_attribute(device, data_types.ClusterId(self._cluster.ID), data_types.AttributeId(self.ID))
end

--- Construct a st.zigbee.ZigbeeMessageTx to configure this attribute for reporting on a device
---
--- @param device st.zigbee.Device
--- @param min_rep_int number|st.zigbee.data_types.Uint16 the minimum interval allowed between reports of this attribute
--- @param max_rep_int number|st.zigbee.data_types.Uint16 the maximum interval allowed between reports of this attribute
--- @return st.zigbee.ZigbeeMessageTx containing a ConfigureReporting body
function DeviceTempAlarmMask:configure_reporting(device, min_rep_int, max_rep_int)
  local min = data_types.validate_or_build_type(min_rep_int, data_types.Uint16, "minimum_reporting_interval")
  local max = data_types.validate_or_build_type(max_rep_int, data_types.Uint16, "maximum_reporting_interval")
  local rep_change = nil
  return cluster_base.configure_reporting(device, data_types.ClusterId(self._cluster.ID), data_types.AttributeId(self.ID), data_types.ZigbeeDataType(self.base_type.ID), min, max, rep_change)
end

--- Write a value to this attribute on a device
---
--- @param device st.zigbee.Device
--- @param value st.zigbee.data_types.Bitmap8 the value to write
function DeviceTempAlarmMask:write(device, value)
  local data = data_types.validate_or_build_type(value, self.base_type)
  self:augment_type(data)
  return cluster_base.write_attribute(device, data_types.ClusterId(self._cluster.ID), data_types.AttributeId(self.ID), data)
end

function DeviceTempAlarmMask:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(DeviceTempAlarmMask, {__call = DeviceTempAlarmMask.new_value})
return DeviceTempAlarmMask
