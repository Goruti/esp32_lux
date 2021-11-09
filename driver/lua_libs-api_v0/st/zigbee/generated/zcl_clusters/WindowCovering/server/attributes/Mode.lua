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

--- @class st.zigbee.zcl.clusters.WindowCovering.Mode
--- @alias Mode
---
--- @field public ID number 0x0017 the ID of this attribute
--- @field public NAME string "Mode" the name of this attribute
--- @field public data_type st.zigbee.data_types.Bitmap8 the data type of this attribute
--- @field public MOTOR_DIRECTION_REVERSED number 1
--- @field public CALIBRATION_MODE number 2
--- @field public MAINTENANCE_MODE number 4
--- @field public LED_FEEDBACK number 8
local Mode = {
  ID = 0x0017,
  NAME = "Mode",
  base_type = data_types.Bitmap8,
}

Mode.BASE_MASK                = 0xFF
Mode.MOTOR_DIRECTION_REVERSED = 0x01
Mode.CALIBRATION_MODE         = 0x02
Mode.MAINTENANCE_MODE         = 0x04
Mode.LED_FEEDBACK             = 0x08


Mode.mask_fields = {
  BASE_MASK = 0xFF,
  MOTOR_DIRECTION_REVERSED = 0x01,
  CALIBRATION_MODE = 0x02,
  MAINTENANCE_MODE = 0x04,
  LED_FEEDBACK = 0x08,
}


--- @function Mode:is_motor_direction_reversed_set
--- @return boolean True if the value of MOTOR_DIRECTION_REVERSED is non-zero
Mode.is_motor_direction_reversed_set = function(self)
  return (self.value & self.MOTOR_DIRECTION_REVERSED) ~= 0
end
 
--- @function Mode:set_motor_direction_reversed
--- Set the value of the bit in the MOTOR_DIRECTION_REVERSED field to 1
Mode.set_motor_direction_reversed = function(self)
  self.value = self.value | self.MOTOR_DIRECTION_REVERSED
end

--- @function Mode:unset_motor_direction_reversed
--- Set the value of the bits in the MOTOR_DIRECTION_REVERSED field to 0
Mode.unset_motor_direction_reversed = function(self)
  self.value = self.value & (~self.MOTOR_DIRECTION_REVERSED & self.BASE_MASK)
end

--- @function Mode:is_calibration_mode_set
--- @return boolean True if the value of CALIBRATION_MODE is non-zero
Mode.is_calibration_mode_set = function(self)
  return (self.value & self.CALIBRATION_MODE) ~= 0
end
 
--- @function Mode:set_calibration_mode
--- Set the value of the bit in the CALIBRATION_MODE field to 1
Mode.set_calibration_mode = function(self)
  self.value = self.value | self.CALIBRATION_MODE
end

--- @function Mode:unset_calibration_mode
--- Set the value of the bits in the CALIBRATION_MODE field to 0
Mode.unset_calibration_mode = function(self)
  self.value = self.value & (~self.CALIBRATION_MODE & self.BASE_MASK)
end

--- @function Mode:is_maintenance_mode_set
--- @return boolean True if the value of MAINTENANCE_MODE is non-zero
Mode.is_maintenance_mode_set = function(self)
  return (self.value & self.MAINTENANCE_MODE) ~= 0
end
 
--- @function Mode:set_maintenance_mode
--- Set the value of the bit in the MAINTENANCE_MODE field to 1
Mode.set_maintenance_mode = function(self)
  self.value = self.value | self.MAINTENANCE_MODE
end

--- @function Mode:unset_maintenance_mode
--- Set the value of the bits in the MAINTENANCE_MODE field to 0
Mode.unset_maintenance_mode = function(self)
  self.value = self.value & (~self.MAINTENANCE_MODE & self.BASE_MASK)
end

--- @function Mode:is_led_feedback_set
--- @return boolean True if the value of LED_FEEDBACK is non-zero
Mode.is_led_feedback_set = function(self)
  return (self.value & self.LED_FEEDBACK) ~= 0
end
 
--- @function Mode:set_led_feedback
--- Set the value of the bit in the LED_FEEDBACK field to 1
Mode.set_led_feedback = function(self)
  self.value = self.value | self.LED_FEEDBACK
end

--- @function Mode:unset_led_feedback
--- Set the value of the bits in the LED_FEEDBACK field to 0
Mode.unset_led_feedback = function(self)
  self.value = self.value & (~self.LED_FEEDBACK & self.BASE_MASK)
end


Mode.mask_methods = {
  is_motor_direction_reversed_set = Mode.is_motor_direction_reversed_set,
  set_motor_direction_reversed = Mode.set_motor_direction_reversed,
  unset_motor_direction_reversed = Mode.unset_motor_direction_reversed,
  is_calibration_mode_set = Mode.is_calibration_mode_set,
  set_calibration_mode = Mode.set_calibration_mode,
  unset_calibration_mode = Mode.unset_calibration_mode,
  is_maintenance_mode_set = Mode.is_maintenance_mode_set,
  set_maintenance_mode = Mode.set_maintenance_mode,
  unset_maintenance_mode = Mode.unset_maintenance_mode,
  is_led_feedback_set = Mode.is_led_feedback_set,
  set_led_feedback = Mode.set_led_feedback,
  unset_led_feedback = Mode.unset_led_feedback,
}

--- Add additional functionality to the base type object
---
--- @param base_type_obj st.zigbee.data_types.Bitmap8 the base data type object to add functionality to
function Mode:augment_type(base_type_obj)
  for k, v in pairs(self.mask_fields) do
    base_type_obj[k] = v
  end
  for k, v in pairs(self.mask_methods) do
    base_type_obj[k] = v
  end
  
  base_type_obj.field_name = self.NAME
  base_type_obj.pretty_print = self.pretty_print
end

function Mode.pretty_print(value_obj)
  local zb_utils = require "st.zigbee.utils" 
  local pattern = ">I" .. value_obj.byte_length
  return string.format("%s: %s[0x]", value_obj.field_name or value_obj.NAME, Mode.NAME, zb_utils.pretty_print_hex_str(string.pack(pattern, value_obj.value)))
end

--- @function Mode:build_test_attr_report
---
--- Build a Rx Zigbee message as if a device reported this attribute
--- @param device st.zigbee.Device
--- @param data st.zigbee.data_types.Bitmap8 the attribute value
--- @return st.zigbee.ZigbeeMessageRx containing an AttributeReport body
Mode.build_test_attr_report = cluster_base.build_test_attr_report

--- @function Mode:build_test_read_attr_response
---
--- Build a Rx Zigbee message as if a device sent a read response for this attribute
--- @param device st.zigbee.Device
--- @param data st.zigbee.data_types.Bitmap8 the attribute value
--- @return st.zigbee.ZigbeeMessageRx containing an ReadAttributeResponse body
Mode.build_test_read_attr_response = cluster_base.build_test_read_attr_response

--- Create a Bitmap8 object of this attribute with any additional features provided for the attribute
---
--- This is also usable with the Mode(...) syntax
---
--- @vararg vararg the values needed to construct a Bitmap8
--- @return st.zigbee.data_types.Bitmap8
function Mode:new_value(...)
    local o = self.base_type(table.unpack({...}))
    self:augment_type(o)
    return o
end

--- Construct a st.zigbee.ZigbeeMessageTx to read this attribute from a device
---
--- @param device st.zigbee.Device
--- @return st.zigbee.ZigbeeMessageTx containing a ReadAttribute body
function Mode:read(device)
    return cluster_base.read_attribute(device, data_types.ClusterId(self._cluster.ID), data_types.AttributeId(self.ID))
end

--- Construct a st.zigbee.ZigbeeMessageTx to configure this attribute for reporting on a device
---
--- @param device st.zigbee.Device
--- @param min_rep_int number|st.zigbee.data_types.Uint16 the minimum interval allowed between reports of this attribute
--- @param max_rep_int number|st.zigbee.data_types.Uint16 the maximum interval allowed between reports of this attribute
--- @return st.zigbee.ZigbeeMessageTx containing a ConfigureReporting body
function Mode:configure_reporting(device, min_rep_int, max_rep_int)
  local min = data_types.validate_or_build_type(min_rep_int, data_types.Uint16, "minimum_reporting_interval")
  local max = data_types.validate_or_build_type(max_rep_int, data_types.Uint16, "maximum_reporting_interval")
  local rep_change = nil
  return cluster_base.configure_reporting(device, data_types.ClusterId(self._cluster.ID), data_types.AttributeId(self.ID), data_types.ZigbeeDataType(self.base_type.ID), min, max, rep_change)
end

function Mode:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(Mode, {__call = Mode.new_value})
return Mode
