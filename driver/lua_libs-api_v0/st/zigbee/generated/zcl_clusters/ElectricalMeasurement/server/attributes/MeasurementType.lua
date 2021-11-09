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

--- @class st.zigbee.zcl.clusters.ElectricalMeasurement.MeasurementType
--- @alias MeasurementType
---
--- @field public ID number 0x0000 the ID of this attribute
--- @field public NAME string "MeasurementType" the name of this attribute
--- @field public data_type st.zigbee.data_types.Bitmap32 the data type of this attribute
--- @field public ACTIVE_MEASUREMENT_AC number 1
--- @field public REACTIVE_MEASUREMENT_AC number 2
--- @field public APPARENT_MEASUREMENT_AC number 4
--- @field public PHASE_A_MEASUREMENT number 8
--- @field public PHASE_B_MEASUREMENT number 16
--- @field public PHASE_C_MEASUREMENT number 32
--- @field public DC_MEASUREMENT number 64
--- @field public HARMONICS_MEASUREMENT number 128
--- @field public POWER_QUALITY_MEASUREMENT number 256
local MeasurementType = {
  ID = 0x0000,
  NAME = "MeasurementType",
  base_type = data_types.Bitmap32,
}

MeasurementType.BASE_MASK                 = 0xFFFFFFFF
MeasurementType.ACTIVE_MEASUREMENT_AC     = 0x00000001
MeasurementType.REACTIVE_MEASUREMENT_AC   = 0x00000002
MeasurementType.APPARENT_MEASUREMENT_AC   = 0x00000004
MeasurementType.PHASE_A_MEASUREMENT       = 0x00000008
MeasurementType.PHASE_B_MEASUREMENT       = 0x00000010
MeasurementType.PHASE_C_MEASUREMENT       = 0x00000020
MeasurementType.DC_MEASUREMENT            = 0x00000040
MeasurementType.HARMONICS_MEASUREMENT     = 0x00000080
MeasurementType.POWER_QUALITY_MEASUREMENT = 0x00000100


MeasurementType.mask_fields = {
  BASE_MASK = 0xFFFFFFFF,
  ACTIVE_MEASUREMENT_AC = 0x00000001,
  REACTIVE_MEASUREMENT_AC = 0x00000002,
  APPARENT_MEASUREMENT_AC = 0x00000004,
  PHASE_A_MEASUREMENT = 0x00000008,
  PHASE_B_MEASUREMENT = 0x00000010,
  PHASE_C_MEASUREMENT = 0x00000020,
  DC_MEASUREMENT = 0x00000040,
  HARMONICS_MEASUREMENT = 0x00000080,
  POWER_QUALITY_MEASUREMENT = 0x00000100,
}


--- @function MeasurementType:is_active_measurement_ac_set
--- @return boolean True if the value of ACTIVE_MEASUREMENT_AC is non-zero
MeasurementType.is_active_measurement_ac_set = function(self)
  return (self.value & self.ACTIVE_MEASUREMENT_AC) ~= 0
end
 
--- @function MeasurementType:set_active_measurement_ac
--- Set the value of the bit in the ACTIVE_MEASUREMENT_AC field to 1
MeasurementType.set_active_measurement_ac = function(self)
  self.value = self.value | self.ACTIVE_MEASUREMENT_AC
end

--- @function MeasurementType:unset_active_measurement_ac
--- Set the value of the bits in the ACTIVE_MEASUREMENT_AC field to 0
MeasurementType.unset_active_measurement_ac = function(self)
  self.value = self.value & (~self.ACTIVE_MEASUREMENT_AC & self.BASE_MASK)
end

--- @function MeasurementType:is_reactive_measurement_ac_set
--- @return boolean True if the value of REACTIVE_MEASUREMENT_AC is non-zero
MeasurementType.is_reactive_measurement_ac_set = function(self)
  return (self.value & self.REACTIVE_MEASUREMENT_AC) ~= 0
end
 
--- @function MeasurementType:set_reactive_measurement_ac
--- Set the value of the bit in the REACTIVE_MEASUREMENT_AC field to 1
MeasurementType.set_reactive_measurement_ac = function(self)
  self.value = self.value | self.REACTIVE_MEASUREMENT_AC
end

--- @function MeasurementType:unset_reactive_measurement_ac
--- Set the value of the bits in the REACTIVE_MEASUREMENT_AC field to 0
MeasurementType.unset_reactive_measurement_ac = function(self)
  self.value = self.value & (~self.REACTIVE_MEASUREMENT_AC & self.BASE_MASK)
end

--- @function MeasurementType:is_apparent_measurement_ac_set
--- @return boolean True if the value of APPARENT_MEASUREMENT_AC is non-zero
MeasurementType.is_apparent_measurement_ac_set = function(self)
  return (self.value & self.APPARENT_MEASUREMENT_AC) ~= 0
end
 
--- @function MeasurementType:set_apparent_measurement_ac
--- Set the value of the bit in the APPARENT_MEASUREMENT_AC field to 1
MeasurementType.set_apparent_measurement_ac = function(self)
  self.value = self.value | self.APPARENT_MEASUREMENT_AC
end

--- @function MeasurementType:unset_apparent_measurement_ac
--- Set the value of the bits in the APPARENT_MEASUREMENT_AC field to 0
MeasurementType.unset_apparent_measurement_ac = function(self)
  self.value = self.value & (~self.APPARENT_MEASUREMENT_AC & self.BASE_MASK)
end

--- @function MeasurementType:is_phase_a_measurement_set
--- @return boolean True if the value of PHASE_A_MEASUREMENT is non-zero
MeasurementType.is_phase_a_measurement_set = function(self)
  return (self.value & self.PHASE_A_MEASUREMENT) ~= 0
end
 
--- @function MeasurementType:set_phase_a_measurement
--- Set the value of the bit in the PHASE_A_MEASUREMENT field to 1
MeasurementType.set_phase_a_measurement = function(self)
  self.value = self.value | self.PHASE_A_MEASUREMENT
end

--- @function MeasurementType:unset_phase_a_measurement
--- Set the value of the bits in the PHASE_A_MEASUREMENT field to 0
MeasurementType.unset_phase_a_measurement = function(self)
  self.value = self.value & (~self.PHASE_A_MEASUREMENT & self.BASE_MASK)
end

--- @function MeasurementType:is_phase_b_measurement_set
--- @return boolean True if the value of PHASE_B_MEASUREMENT is non-zero
MeasurementType.is_phase_b_measurement_set = function(self)
  return (self.value & self.PHASE_B_MEASUREMENT) ~= 0
end
 
--- @function MeasurementType:set_phase_b_measurement
--- Set the value of the bit in the PHASE_B_MEASUREMENT field to 1
MeasurementType.set_phase_b_measurement = function(self)
  self.value = self.value | self.PHASE_B_MEASUREMENT
end

--- @function MeasurementType:unset_phase_b_measurement
--- Set the value of the bits in the PHASE_B_MEASUREMENT field to 0
MeasurementType.unset_phase_b_measurement = function(self)
  self.value = self.value & (~self.PHASE_B_MEASUREMENT & self.BASE_MASK)
end

--- @function MeasurementType:is_phase_c_measurement_set
--- @return boolean True if the value of PHASE_C_MEASUREMENT is non-zero
MeasurementType.is_phase_c_measurement_set = function(self)
  return (self.value & self.PHASE_C_MEASUREMENT) ~= 0
end
 
--- @function MeasurementType:set_phase_c_measurement
--- Set the value of the bit in the PHASE_C_MEASUREMENT field to 1
MeasurementType.set_phase_c_measurement = function(self)
  self.value = self.value | self.PHASE_C_MEASUREMENT
end

--- @function MeasurementType:unset_phase_c_measurement
--- Set the value of the bits in the PHASE_C_MEASUREMENT field to 0
MeasurementType.unset_phase_c_measurement = function(self)
  self.value = self.value & (~self.PHASE_C_MEASUREMENT & self.BASE_MASK)
end

--- @function MeasurementType:is_dc_measurement_set
--- @return boolean True if the value of DC_MEASUREMENT is non-zero
MeasurementType.is_dc_measurement_set = function(self)
  return (self.value & self.DC_MEASUREMENT) ~= 0
end
 
--- @function MeasurementType:set_dc_measurement
--- Set the value of the bit in the DC_MEASUREMENT field to 1
MeasurementType.set_dc_measurement = function(self)
  self.value = self.value | self.DC_MEASUREMENT
end

--- @function MeasurementType:unset_dc_measurement
--- Set the value of the bits in the DC_MEASUREMENT field to 0
MeasurementType.unset_dc_measurement = function(self)
  self.value = self.value & (~self.DC_MEASUREMENT & self.BASE_MASK)
end

--- @function MeasurementType:is_harmonics_measurement_set
--- @return boolean True if the value of HARMONICS_MEASUREMENT is non-zero
MeasurementType.is_harmonics_measurement_set = function(self)
  return (self.value & self.HARMONICS_MEASUREMENT) ~= 0
end
 
--- @function MeasurementType:set_harmonics_measurement
--- Set the value of the bit in the HARMONICS_MEASUREMENT field to 1
MeasurementType.set_harmonics_measurement = function(self)
  self.value = self.value | self.HARMONICS_MEASUREMENT
end

--- @function MeasurementType:unset_harmonics_measurement
--- Set the value of the bits in the HARMONICS_MEASUREMENT field to 0
MeasurementType.unset_harmonics_measurement = function(self)
  self.value = self.value & (~self.HARMONICS_MEASUREMENT & self.BASE_MASK)
end

--- @function MeasurementType:is_power_quality_measurement_set
--- @return boolean True if the value of POWER_QUALITY_MEASUREMENT is non-zero
MeasurementType.is_power_quality_measurement_set = function(self)
  return (self.value & self.POWER_QUALITY_MEASUREMENT) ~= 0
end
 
--- @function MeasurementType:set_power_quality_measurement
--- Set the value of the bit in the POWER_QUALITY_MEASUREMENT field to 1
MeasurementType.set_power_quality_measurement = function(self)
  self.value = self.value | self.POWER_QUALITY_MEASUREMENT
end

--- @function MeasurementType:unset_power_quality_measurement
--- Set the value of the bits in the POWER_QUALITY_MEASUREMENT field to 0
MeasurementType.unset_power_quality_measurement = function(self)
  self.value = self.value & (~self.POWER_QUALITY_MEASUREMENT & self.BASE_MASK)
end


MeasurementType.mask_methods = {
  is_active_measurement_ac_set = MeasurementType.is_active_measurement_ac_set,
  set_active_measurement_ac = MeasurementType.set_active_measurement_ac,
  unset_active_measurement_ac = MeasurementType.unset_active_measurement_ac,
  is_reactive_measurement_ac_set = MeasurementType.is_reactive_measurement_ac_set,
  set_reactive_measurement_ac = MeasurementType.set_reactive_measurement_ac,
  unset_reactive_measurement_ac = MeasurementType.unset_reactive_measurement_ac,
  is_apparent_measurement_ac_set = MeasurementType.is_apparent_measurement_ac_set,
  set_apparent_measurement_ac = MeasurementType.set_apparent_measurement_ac,
  unset_apparent_measurement_ac = MeasurementType.unset_apparent_measurement_ac,
  is_phase_a_measurement_set = MeasurementType.is_phase_a_measurement_set,
  set_phase_a_measurement = MeasurementType.set_phase_a_measurement,
  unset_phase_a_measurement = MeasurementType.unset_phase_a_measurement,
  is_phase_b_measurement_set = MeasurementType.is_phase_b_measurement_set,
  set_phase_b_measurement = MeasurementType.set_phase_b_measurement,
  unset_phase_b_measurement = MeasurementType.unset_phase_b_measurement,
  is_phase_c_measurement_set = MeasurementType.is_phase_c_measurement_set,
  set_phase_c_measurement = MeasurementType.set_phase_c_measurement,
  unset_phase_c_measurement = MeasurementType.unset_phase_c_measurement,
  is_dc_measurement_set = MeasurementType.is_dc_measurement_set,
  set_dc_measurement = MeasurementType.set_dc_measurement,
  unset_dc_measurement = MeasurementType.unset_dc_measurement,
  is_harmonics_measurement_set = MeasurementType.is_harmonics_measurement_set,
  set_harmonics_measurement = MeasurementType.set_harmonics_measurement,
  unset_harmonics_measurement = MeasurementType.unset_harmonics_measurement,
  is_power_quality_measurement_set = MeasurementType.is_power_quality_measurement_set,
  set_power_quality_measurement = MeasurementType.set_power_quality_measurement,
  unset_power_quality_measurement = MeasurementType.unset_power_quality_measurement,
}

--- Add additional functionality to the base type object
---
--- @param base_type_obj st.zigbee.data_types.Bitmap32 the base data type object to add functionality to
function MeasurementType:augment_type(base_type_obj)
  for k, v in pairs(self.mask_fields) do
    base_type_obj[k] = v
  end
  for k, v in pairs(self.mask_methods) do
    base_type_obj[k] = v
  end
  
  base_type_obj.field_name = self.NAME
  base_type_obj.pretty_print = self.pretty_print
end

function MeasurementType.pretty_print(value_obj)
  local zb_utils = require "st.zigbee.utils" 
  local pattern = ">I" .. value_obj.byte_length
  return string.format("%s: %s[0x]", value_obj.field_name or value_obj.NAME, MeasurementType.NAME, zb_utils.pretty_print_hex_str(string.pack(pattern, value_obj.value)))
end

--- @function MeasurementType:build_test_attr_report
---
--- Build a Rx Zigbee message as if a device reported this attribute
--- @param device st.zigbee.Device
--- @param data st.zigbee.data_types.Bitmap32 the attribute value
--- @return st.zigbee.ZigbeeMessageRx containing an AttributeReport body
MeasurementType.build_test_attr_report = cluster_base.build_test_attr_report

--- @function MeasurementType:build_test_read_attr_response
---
--- Build a Rx Zigbee message as if a device sent a read response for this attribute
--- @param device st.zigbee.Device
--- @param data st.zigbee.data_types.Bitmap32 the attribute value
--- @return st.zigbee.ZigbeeMessageRx containing an ReadAttributeResponse body
MeasurementType.build_test_read_attr_response = cluster_base.build_test_read_attr_response

--- Create a Bitmap32 object of this attribute with any additional features provided for the attribute
---
--- This is also usable with the MeasurementType(...) syntax
---
--- @vararg vararg the values needed to construct a Bitmap32
--- @return st.zigbee.data_types.Bitmap32
function MeasurementType:new_value(...)
    local o = self.base_type(table.unpack({...}))
    self:augment_type(o)
    return o
end

--- Construct a st.zigbee.ZigbeeMessageTx to read this attribute from a device
---
--- @param device st.zigbee.Device
--- @return st.zigbee.ZigbeeMessageTx containing a ReadAttribute body
function MeasurementType:read(device)
    return cluster_base.read_attribute(device, data_types.ClusterId(self._cluster.ID), data_types.AttributeId(self.ID))
end

--- Construct a st.zigbee.ZigbeeMessageTx to configure this attribute for reporting on a device
---
--- @param device st.zigbee.Device
--- @param min_rep_int number|st.zigbee.data_types.Uint16 the minimum interval allowed between reports of this attribute
--- @param max_rep_int number|st.zigbee.data_types.Uint16 the maximum interval allowed between reports of this attribute
--- @return st.zigbee.ZigbeeMessageTx containing a ConfigureReporting body
function MeasurementType:configure_reporting(device, min_rep_int, max_rep_int)
  local min = data_types.validate_or_build_type(min_rep_int, data_types.Uint16, "minimum_reporting_interval")
  local max = data_types.validate_or_build_type(max_rep_int, data_types.Uint16, "maximum_reporting_interval")
  local rep_change = nil
  return cluster_base.configure_reporting(device, data_types.ClusterId(self._cluster.ID), data_types.AttributeId(self.ID), data_types.ZigbeeDataType(self.base_type.ID), min, max, rep_change)
end

function MeasurementType:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(MeasurementType, {__call = MeasurementType.new_value})
return MeasurementType
