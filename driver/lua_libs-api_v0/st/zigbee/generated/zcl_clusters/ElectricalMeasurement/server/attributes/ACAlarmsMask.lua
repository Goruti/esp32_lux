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

--- @class st.zigbee.zcl.clusters.ElectricalMeasurement.ACAlarmsMask
--- @alias ACAlarmsMask
---
--- @field public ID number 0x0800 the ID of this attribute
--- @field public NAME string "ACAlarmsMask" the name of this attribute
--- @field public data_type st.zigbee.data_types.Bitmap16 the data type of this attribute
--- @field public VOLTAGE_OVERLOAD number 1
--- @field public CURRENT_OVERLOAD number 2
--- @field public ACTIVE_POWER_OVERLOAD number 4
--- @field public REACTIVE_POWER_OVERLOAD number 8
--- @field public AVERAGE_RMS_OVER_VOLTAGE number 16
--- @field public AVERAGE_RMS_UNDER_VOLTAGE number 32
--- @field public RMS_EXTREME_OVER_VOLTAGE number 64
--- @field public RMS_EXTREME_UNDER_VOLTAGE number 128
--- @field public RMS_VOLTAGE_SAG number 256
--- @field public RMS_VOLTAGE_SWELL number 512
local ACAlarmsMask = {
  ID = 0x0800,
  NAME = "ACAlarmsMask",
  base_type = data_types.Bitmap16,
}

ACAlarmsMask.BASE_MASK                 = 0xFFFF
ACAlarmsMask.VOLTAGE_OVERLOAD          = 0x0001
ACAlarmsMask.CURRENT_OVERLOAD          = 0x0002
ACAlarmsMask.ACTIVE_POWER_OVERLOAD     = 0x0004
ACAlarmsMask.REACTIVE_POWER_OVERLOAD   = 0x0008
ACAlarmsMask.AVERAGE_RMS_OVER_VOLTAGE  = 0x0010
ACAlarmsMask.AVERAGE_RMS_UNDER_VOLTAGE = 0x0020
ACAlarmsMask.RMS_EXTREME_OVER_VOLTAGE  = 0x0040
ACAlarmsMask.RMS_EXTREME_UNDER_VOLTAGE = 0x0080
ACAlarmsMask.RMS_VOLTAGE_SAG           = 0x0100
ACAlarmsMask.RMS_VOLTAGE_SWELL         = 0x0200


ACAlarmsMask.mask_fields = {
  BASE_MASK = 0xFFFF,
  VOLTAGE_OVERLOAD = 0x0001,
  CURRENT_OVERLOAD = 0x0002,
  ACTIVE_POWER_OVERLOAD = 0x0004,
  REACTIVE_POWER_OVERLOAD = 0x0008,
  AVERAGE_RMS_OVER_VOLTAGE = 0x0010,
  AVERAGE_RMS_UNDER_VOLTAGE = 0x0020,
  RMS_EXTREME_OVER_VOLTAGE = 0x0040,
  RMS_EXTREME_UNDER_VOLTAGE = 0x0080,
  RMS_VOLTAGE_SAG = 0x0100,
  RMS_VOLTAGE_SWELL = 0x0200,
}


--- @function ACAlarmsMask:is_voltage_overload_set
--- @return boolean True if the value of VOLTAGE_OVERLOAD is non-zero
ACAlarmsMask.is_voltage_overload_set = function(self)
  return (self.value & self.VOLTAGE_OVERLOAD) ~= 0
end
 
--- @function ACAlarmsMask:set_voltage_overload
--- Set the value of the bit in the VOLTAGE_OVERLOAD field to 1
ACAlarmsMask.set_voltage_overload = function(self)
  self.value = self.value | self.VOLTAGE_OVERLOAD
end

--- @function ACAlarmsMask:unset_voltage_overload
--- Set the value of the bits in the VOLTAGE_OVERLOAD field to 0
ACAlarmsMask.unset_voltage_overload = function(self)
  self.value = self.value & (~self.VOLTAGE_OVERLOAD & self.BASE_MASK)
end

--- @function ACAlarmsMask:is_current_overload_set
--- @return boolean True if the value of CURRENT_OVERLOAD is non-zero
ACAlarmsMask.is_current_overload_set = function(self)
  return (self.value & self.CURRENT_OVERLOAD) ~= 0
end
 
--- @function ACAlarmsMask:set_current_overload
--- Set the value of the bit in the CURRENT_OVERLOAD field to 1
ACAlarmsMask.set_current_overload = function(self)
  self.value = self.value | self.CURRENT_OVERLOAD
end

--- @function ACAlarmsMask:unset_current_overload
--- Set the value of the bits in the CURRENT_OVERLOAD field to 0
ACAlarmsMask.unset_current_overload = function(self)
  self.value = self.value & (~self.CURRENT_OVERLOAD & self.BASE_MASK)
end

--- @function ACAlarmsMask:is_active_power_overload_set
--- @return boolean True if the value of ACTIVE_POWER_OVERLOAD is non-zero
ACAlarmsMask.is_active_power_overload_set = function(self)
  return (self.value & self.ACTIVE_POWER_OVERLOAD) ~= 0
end
 
--- @function ACAlarmsMask:set_active_power_overload
--- Set the value of the bit in the ACTIVE_POWER_OVERLOAD field to 1
ACAlarmsMask.set_active_power_overload = function(self)
  self.value = self.value | self.ACTIVE_POWER_OVERLOAD
end

--- @function ACAlarmsMask:unset_active_power_overload
--- Set the value of the bits in the ACTIVE_POWER_OVERLOAD field to 0
ACAlarmsMask.unset_active_power_overload = function(self)
  self.value = self.value & (~self.ACTIVE_POWER_OVERLOAD & self.BASE_MASK)
end

--- @function ACAlarmsMask:is_reactive_power_overload_set
--- @return boolean True if the value of REACTIVE_POWER_OVERLOAD is non-zero
ACAlarmsMask.is_reactive_power_overload_set = function(self)
  return (self.value & self.REACTIVE_POWER_OVERLOAD) ~= 0
end
 
--- @function ACAlarmsMask:set_reactive_power_overload
--- Set the value of the bit in the REACTIVE_POWER_OVERLOAD field to 1
ACAlarmsMask.set_reactive_power_overload = function(self)
  self.value = self.value | self.REACTIVE_POWER_OVERLOAD
end

--- @function ACAlarmsMask:unset_reactive_power_overload
--- Set the value of the bits in the REACTIVE_POWER_OVERLOAD field to 0
ACAlarmsMask.unset_reactive_power_overload = function(self)
  self.value = self.value & (~self.REACTIVE_POWER_OVERLOAD & self.BASE_MASK)
end

--- @function ACAlarmsMask:is_average_rms_over_voltage_set
--- @return boolean True if the value of AVERAGE_RMS_OVER_VOLTAGE is non-zero
ACAlarmsMask.is_average_rms_over_voltage_set = function(self)
  return (self.value & self.AVERAGE_RMS_OVER_VOLTAGE) ~= 0
end
 
--- @function ACAlarmsMask:set_average_rms_over_voltage
--- Set the value of the bit in the AVERAGE_RMS_OVER_VOLTAGE field to 1
ACAlarmsMask.set_average_rms_over_voltage = function(self)
  self.value = self.value | self.AVERAGE_RMS_OVER_VOLTAGE
end

--- @function ACAlarmsMask:unset_average_rms_over_voltage
--- Set the value of the bits in the AVERAGE_RMS_OVER_VOLTAGE field to 0
ACAlarmsMask.unset_average_rms_over_voltage = function(self)
  self.value = self.value & (~self.AVERAGE_RMS_OVER_VOLTAGE & self.BASE_MASK)
end

--- @function ACAlarmsMask:is_average_rms_under_voltage_set
--- @return boolean True if the value of AVERAGE_RMS_UNDER_VOLTAGE is non-zero
ACAlarmsMask.is_average_rms_under_voltage_set = function(self)
  return (self.value & self.AVERAGE_RMS_UNDER_VOLTAGE) ~= 0
end
 
--- @function ACAlarmsMask:set_average_rms_under_voltage
--- Set the value of the bit in the AVERAGE_RMS_UNDER_VOLTAGE field to 1
ACAlarmsMask.set_average_rms_under_voltage = function(self)
  self.value = self.value | self.AVERAGE_RMS_UNDER_VOLTAGE
end

--- @function ACAlarmsMask:unset_average_rms_under_voltage
--- Set the value of the bits in the AVERAGE_RMS_UNDER_VOLTAGE field to 0
ACAlarmsMask.unset_average_rms_under_voltage = function(self)
  self.value = self.value & (~self.AVERAGE_RMS_UNDER_VOLTAGE & self.BASE_MASK)
end

--- @function ACAlarmsMask:is_rms_extreme_over_voltage_set
--- @return boolean True if the value of RMS_EXTREME_OVER_VOLTAGE is non-zero
ACAlarmsMask.is_rms_extreme_over_voltage_set = function(self)
  return (self.value & self.RMS_EXTREME_OVER_VOLTAGE) ~= 0
end
 
--- @function ACAlarmsMask:set_rms_extreme_over_voltage
--- Set the value of the bit in the RMS_EXTREME_OVER_VOLTAGE field to 1
ACAlarmsMask.set_rms_extreme_over_voltage = function(self)
  self.value = self.value | self.RMS_EXTREME_OVER_VOLTAGE
end

--- @function ACAlarmsMask:unset_rms_extreme_over_voltage
--- Set the value of the bits in the RMS_EXTREME_OVER_VOLTAGE field to 0
ACAlarmsMask.unset_rms_extreme_over_voltage = function(self)
  self.value = self.value & (~self.RMS_EXTREME_OVER_VOLTAGE & self.BASE_MASK)
end

--- @function ACAlarmsMask:is_rms_extreme_under_voltage_set
--- @return boolean True if the value of RMS_EXTREME_UNDER_VOLTAGE is non-zero
ACAlarmsMask.is_rms_extreme_under_voltage_set = function(self)
  return (self.value & self.RMS_EXTREME_UNDER_VOLTAGE) ~= 0
end
 
--- @function ACAlarmsMask:set_rms_extreme_under_voltage
--- Set the value of the bit in the RMS_EXTREME_UNDER_VOLTAGE field to 1
ACAlarmsMask.set_rms_extreme_under_voltage = function(self)
  self.value = self.value | self.RMS_EXTREME_UNDER_VOLTAGE
end

--- @function ACAlarmsMask:unset_rms_extreme_under_voltage
--- Set the value of the bits in the RMS_EXTREME_UNDER_VOLTAGE field to 0
ACAlarmsMask.unset_rms_extreme_under_voltage = function(self)
  self.value = self.value & (~self.RMS_EXTREME_UNDER_VOLTAGE & self.BASE_MASK)
end

--- @function ACAlarmsMask:is_rms_voltage_sag_set
--- @return boolean True if the value of RMS_VOLTAGE_SAG is non-zero
ACAlarmsMask.is_rms_voltage_sag_set = function(self)
  return (self.value & self.RMS_VOLTAGE_SAG) ~= 0
end
 
--- @function ACAlarmsMask:set_rms_voltage_sag
--- Set the value of the bit in the RMS_VOLTAGE_SAG field to 1
ACAlarmsMask.set_rms_voltage_sag = function(self)
  self.value = self.value | self.RMS_VOLTAGE_SAG
end

--- @function ACAlarmsMask:unset_rms_voltage_sag
--- Set the value of the bits in the RMS_VOLTAGE_SAG field to 0
ACAlarmsMask.unset_rms_voltage_sag = function(self)
  self.value = self.value & (~self.RMS_VOLTAGE_SAG & self.BASE_MASK)
end

--- @function ACAlarmsMask:is_rms_voltage_swell_set
--- @return boolean True if the value of RMS_VOLTAGE_SWELL is non-zero
ACAlarmsMask.is_rms_voltage_swell_set = function(self)
  return (self.value & self.RMS_VOLTAGE_SWELL) ~= 0
end
 
--- @function ACAlarmsMask:set_rms_voltage_swell
--- Set the value of the bit in the RMS_VOLTAGE_SWELL field to 1
ACAlarmsMask.set_rms_voltage_swell = function(self)
  self.value = self.value | self.RMS_VOLTAGE_SWELL
end

--- @function ACAlarmsMask:unset_rms_voltage_swell
--- Set the value of the bits in the RMS_VOLTAGE_SWELL field to 0
ACAlarmsMask.unset_rms_voltage_swell = function(self)
  self.value = self.value & (~self.RMS_VOLTAGE_SWELL & self.BASE_MASK)
end


ACAlarmsMask.mask_methods = {
  is_voltage_overload_set = ACAlarmsMask.is_voltage_overload_set,
  set_voltage_overload = ACAlarmsMask.set_voltage_overload,
  unset_voltage_overload = ACAlarmsMask.unset_voltage_overload,
  is_current_overload_set = ACAlarmsMask.is_current_overload_set,
  set_current_overload = ACAlarmsMask.set_current_overload,
  unset_current_overload = ACAlarmsMask.unset_current_overload,
  is_active_power_overload_set = ACAlarmsMask.is_active_power_overload_set,
  set_active_power_overload = ACAlarmsMask.set_active_power_overload,
  unset_active_power_overload = ACAlarmsMask.unset_active_power_overload,
  is_reactive_power_overload_set = ACAlarmsMask.is_reactive_power_overload_set,
  set_reactive_power_overload = ACAlarmsMask.set_reactive_power_overload,
  unset_reactive_power_overload = ACAlarmsMask.unset_reactive_power_overload,
  is_average_rms_over_voltage_set = ACAlarmsMask.is_average_rms_over_voltage_set,
  set_average_rms_over_voltage = ACAlarmsMask.set_average_rms_over_voltage,
  unset_average_rms_over_voltage = ACAlarmsMask.unset_average_rms_over_voltage,
  is_average_rms_under_voltage_set = ACAlarmsMask.is_average_rms_under_voltage_set,
  set_average_rms_under_voltage = ACAlarmsMask.set_average_rms_under_voltage,
  unset_average_rms_under_voltage = ACAlarmsMask.unset_average_rms_under_voltage,
  is_rms_extreme_over_voltage_set = ACAlarmsMask.is_rms_extreme_over_voltage_set,
  set_rms_extreme_over_voltage = ACAlarmsMask.set_rms_extreme_over_voltage,
  unset_rms_extreme_over_voltage = ACAlarmsMask.unset_rms_extreme_over_voltage,
  is_rms_extreme_under_voltage_set = ACAlarmsMask.is_rms_extreme_under_voltage_set,
  set_rms_extreme_under_voltage = ACAlarmsMask.set_rms_extreme_under_voltage,
  unset_rms_extreme_under_voltage = ACAlarmsMask.unset_rms_extreme_under_voltage,
  is_rms_voltage_sag_set = ACAlarmsMask.is_rms_voltage_sag_set,
  set_rms_voltage_sag = ACAlarmsMask.set_rms_voltage_sag,
  unset_rms_voltage_sag = ACAlarmsMask.unset_rms_voltage_sag,
  is_rms_voltage_swell_set = ACAlarmsMask.is_rms_voltage_swell_set,
  set_rms_voltage_swell = ACAlarmsMask.set_rms_voltage_swell,
  unset_rms_voltage_swell = ACAlarmsMask.unset_rms_voltage_swell,
}

--- Add additional functionality to the base type object
---
--- @param base_type_obj st.zigbee.data_types.Bitmap16 the base data type object to add functionality to
function ACAlarmsMask:augment_type(base_type_obj)
  for k, v in pairs(self.mask_fields) do
    base_type_obj[k] = v
  end
  for k, v in pairs(self.mask_methods) do
    base_type_obj[k] = v
  end
  
  base_type_obj.field_name = self.NAME
  base_type_obj.pretty_print = self.pretty_print
end

function ACAlarmsMask.pretty_print(value_obj)
  local zb_utils = require "st.zigbee.utils" 
  local pattern = ">I" .. value_obj.byte_length
  return string.format("%s: %s[0x]", value_obj.field_name or value_obj.NAME, ACAlarmsMask.NAME, zb_utils.pretty_print_hex_str(string.pack(pattern, value_obj.value)))
end

--- @function ACAlarmsMask:build_test_attr_report
---
--- Build a Rx Zigbee message as if a device reported this attribute
--- @param device st.zigbee.Device
--- @param data st.zigbee.data_types.Bitmap16 the attribute value
--- @return st.zigbee.ZigbeeMessageRx containing an AttributeReport body
ACAlarmsMask.build_test_attr_report = cluster_base.build_test_attr_report

--- @function ACAlarmsMask:build_test_read_attr_response
---
--- Build a Rx Zigbee message as if a device sent a read response for this attribute
--- @param device st.zigbee.Device
--- @param data st.zigbee.data_types.Bitmap16 the attribute value
--- @return st.zigbee.ZigbeeMessageRx containing an ReadAttributeResponse body
ACAlarmsMask.build_test_read_attr_response = cluster_base.build_test_read_attr_response

--- Create a Bitmap16 object of this attribute with any additional features provided for the attribute
---
--- This is also usable with the ACAlarmsMask(...) syntax
---
--- @vararg vararg the values needed to construct a Bitmap16
--- @return st.zigbee.data_types.Bitmap16
function ACAlarmsMask:new_value(...)
    local o = self.base_type(table.unpack({...}))
    self:augment_type(o)
    return o
end

--- Construct a st.zigbee.ZigbeeMessageTx to read this attribute from a device
---
--- @param device st.zigbee.Device
--- @return st.zigbee.ZigbeeMessageTx containing a ReadAttribute body
function ACAlarmsMask:read(device)
    return cluster_base.read_attribute(device, data_types.ClusterId(self._cluster.ID), data_types.AttributeId(self.ID))
end

--- Construct a st.zigbee.ZigbeeMessageTx to configure this attribute for reporting on a device
---
--- @param device st.zigbee.Device
--- @param min_rep_int number|st.zigbee.data_types.Uint16 the minimum interval allowed between reports of this attribute
--- @param max_rep_int number|st.zigbee.data_types.Uint16 the maximum interval allowed between reports of this attribute
--- @return st.zigbee.ZigbeeMessageTx containing a ConfigureReporting body
function ACAlarmsMask:configure_reporting(device, min_rep_int, max_rep_int)
  local min = data_types.validate_or_build_type(min_rep_int, data_types.Uint16, "minimum_reporting_interval")
  local max = data_types.validate_or_build_type(max_rep_int, data_types.Uint16, "maximum_reporting_interval")
  local rep_change = nil
  return cluster_base.configure_reporting(device, data_types.ClusterId(self._cluster.ID), data_types.AttributeId(self.ID), data_types.ZigbeeDataType(self.base_type.ID), min, max, rep_change)
end

--- Write a value to this attribute on a device
---
--- @param device st.zigbee.Device
--- @param value st.zigbee.data_types.Bitmap16 the value to write
function ACAlarmsMask:write(device, value)
  local data = data_types.validate_or_build_type(value, self.base_type)
  self:augment_type(data)
  return cluster_base.write_attribute(device, data_types.ClusterId(self._cluster.ID), data_types.AttributeId(self.ID), data)
end

function ACAlarmsMask:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(ACAlarmsMask, {__call = ACAlarmsMask.new_value})
return ACAlarmsMask
