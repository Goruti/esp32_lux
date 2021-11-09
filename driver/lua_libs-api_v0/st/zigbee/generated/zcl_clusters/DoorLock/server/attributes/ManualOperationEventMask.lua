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

--- @class st.zigbee.zcl.clusters.DoorLock.ManualOperationEventMask
--- @alias ManualOperationEventMask
---
--- @field public ID number 0x0043 the ID of this attribute
--- @field public NAME string "ManualOperationEventMask" the name of this attribute
--- @field public data_type st.zigbee.data_types.Bitmap16 the data type of this attribute
--- @field public MANUAL_OP_UNKNOWN_OR_MS number 1
--- @field public MANUAL_OP_THUMBTURN_LOCK number 2
--- @field public MANUAL_OP_THUMBTURN_UNLOCK number 4
--- @field public MANUAL_OP_ONE_TOUCH_LOCK number 8
--- @field public MANUAL_OP_KEY_LOCK number 16
--- @field public MANUAL_OP_KEY_UNLOCK number 32
--- @field public MANUAL_OP_AUTO_LOCK number 64
--- @field public MANUAL_OP_SCHEDULE_LOCK number 128
--- @field public MANUAL_OP_SCHEDULE_UNLOCK number 256
--- @field public MANUAL_OP_LOCK number 512
--- @field public MANUAL_OP_UNLOCK number 1024
local ManualOperationEventMask = {
  ID = 0x0043,
  NAME = "ManualOperationEventMask",
  base_type = data_types.Bitmap16,
}

ManualOperationEventMask.BASE_MASK                  = 0xFFFF
ManualOperationEventMask.MANUAL_OP_UNKNOWN_OR_MS    = 0x0001
ManualOperationEventMask.MANUAL_OP_THUMBTURN_LOCK   = 0x0002
ManualOperationEventMask.MANUAL_OP_THUMBTURN_UNLOCK = 0x0004
ManualOperationEventMask.MANUAL_OP_ONE_TOUCH_LOCK   = 0x0008
ManualOperationEventMask.MANUAL_OP_KEY_LOCK         = 0x0010
ManualOperationEventMask.MANUAL_OP_KEY_UNLOCK       = 0x0020
ManualOperationEventMask.MANUAL_OP_AUTO_LOCK        = 0x0040
ManualOperationEventMask.MANUAL_OP_SCHEDULE_LOCK    = 0x0080
ManualOperationEventMask.MANUAL_OP_SCHEDULE_UNLOCK  = 0x0100
ManualOperationEventMask.MANUAL_OP_LOCK             = 0x0200
ManualOperationEventMask.MANUAL_OP_UNLOCK           = 0x0400


ManualOperationEventMask.mask_fields = {
  BASE_MASK = 0xFFFF,
  MANUAL_OP_UNKNOWN_OR_MS = 0x0001,
  MANUAL_OP_THUMBTURN_LOCK = 0x0002,
  MANUAL_OP_THUMBTURN_UNLOCK = 0x0004,
  MANUAL_OP_ONE_TOUCH_LOCK = 0x0008,
  MANUAL_OP_KEY_LOCK = 0x0010,
  MANUAL_OP_KEY_UNLOCK = 0x0020,
  MANUAL_OP_AUTO_LOCK = 0x0040,
  MANUAL_OP_SCHEDULE_LOCK = 0x0080,
  MANUAL_OP_SCHEDULE_UNLOCK = 0x0100,
  MANUAL_OP_LOCK = 0x0200,
  MANUAL_OP_UNLOCK = 0x0400,
}


--- @function ManualOperationEventMask:is_manual_op_unknown_or_ms_set
--- @return boolean True if the value of MANUAL_OP_UNKNOWN_OR_MS is non-zero
ManualOperationEventMask.is_manual_op_unknown_or_ms_set = function(self)
  return (self.value & self.MANUAL_OP_UNKNOWN_OR_MS) ~= 0
end
 
--- @function ManualOperationEventMask:set_manual_op_unknown_or_ms
--- Set the value of the bit in the MANUAL_OP_UNKNOWN_OR_MS field to 1
ManualOperationEventMask.set_manual_op_unknown_or_ms = function(self)
  self.value = self.value | self.MANUAL_OP_UNKNOWN_OR_MS
end

--- @function ManualOperationEventMask:unset_manual_op_unknown_or_ms
--- Set the value of the bits in the MANUAL_OP_UNKNOWN_OR_MS field to 0
ManualOperationEventMask.unset_manual_op_unknown_or_ms = function(self)
  self.value = self.value & (~self.MANUAL_OP_UNKNOWN_OR_MS & self.BASE_MASK)
end

--- @function ManualOperationEventMask:is_manual_op_thumbturn_lock_set
--- @return boolean True if the value of MANUAL_OP_THUMBTURN_LOCK is non-zero
ManualOperationEventMask.is_manual_op_thumbturn_lock_set = function(self)
  return (self.value & self.MANUAL_OP_THUMBTURN_LOCK) ~= 0
end
 
--- @function ManualOperationEventMask:set_manual_op_thumbturn_lock
--- Set the value of the bit in the MANUAL_OP_THUMBTURN_LOCK field to 1
ManualOperationEventMask.set_manual_op_thumbturn_lock = function(self)
  self.value = self.value | self.MANUAL_OP_THUMBTURN_LOCK
end

--- @function ManualOperationEventMask:unset_manual_op_thumbturn_lock
--- Set the value of the bits in the MANUAL_OP_THUMBTURN_LOCK field to 0
ManualOperationEventMask.unset_manual_op_thumbturn_lock = function(self)
  self.value = self.value & (~self.MANUAL_OP_THUMBTURN_LOCK & self.BASE_MASK)
end

--- @function ManualOperationEventMask:is_manual_op_thumbturn_unlock_set
--- @return boolean True if the value of MANUAL_OP_THUMBTURN_UNLOCK is non-zero
ManualOperationEventMask.is_manual_op_thumbturn_unlock_set = function(self)
  return (self.value & self.MANUAL_OP_THUMBTURN_UNLOCK) ~= 0
end
 
--- @function ManualOperationEventMask:set_manual_op_thumbturn_unlock
--- Set the value of the bit in the MANUAL_OP_THUMBTURN_UNLOCK field to 1
ManualOperationEventMask.set_manual_op_thumbturn_unlock = function(self)
  self.value = self.value | self.MANUAL_OP_THUMBTURN_UNLOCK
end

--- @function ManualOperationEventMask:unset_manual_op_thumbturn_unlock
--- Set the value of the bits in the MANUAL_OP_THUMBTURN_UNLOCK field to 0
ManualOperationEventMask.unset_manual_op_thumbturn_unlock = function(self)
  self.value = self.value & (~self.MANUAL_OP_THUMBTURN_UNLOCK & self.BASE_MASK)
end

--- @function ManualOperationEventMask:is_manual_op_one_touch_lock_set
--- @return boolean True if the value of MANUAL_OP_ONE_TOUCH_LOCK is non-zero
ManualOperationEventMask.is_manual_op_one_touch_lock_set = function(self)
  return (self.value & self.MANUAL_OP_ONE_TOUCH_LOCK) ~= 0
end
 
--- @function ManualOperationEventMask:set_manual_op_one_touch_lock
--- Set the value of the bit in the MANUAL_OP_ONE_TOUCH_LOCK field to 1
ManualOperationEventMask.set_manual_op_one_touch_lock = function(self)
  self.value = self.value | self.MANUAL_OP_ONE_TOUCH_LOCK
end

--- @function ManualOperationEventMask:unset_manual_op_one_touch_lock
--- Set the value of the bits in the MANUAL_OP_ONE_TOUCH_LOCK field to 0
ManualOperationEventMask.unset_manual_op_one_touch_lock = function(self)
  self.value = self.value & (~self.MANUAL_OP_ONE_TOUCH_LOCK & self.BASE_MASK)
end

--- @function ManualOperationEventMask:is_manual_op_key_lock_set
--- @return boolean True if the value of MANUAL_OP_KEY_LOCK is non-zero
ManualOperationEventMask.is_manual_op_key_lock_set = function(self)
  return (self.value & self.MANUAL_OP_KEY_LOCK) ~= 0
end
 
--- @function ManualOperationEventMask:set_manual_op_key_lock
--- Set the value of the bit in the MANUAL_OP_KEY_LOCK field to 1
ManualOperationEventMask.set_manual_op_key_lock = function(self)
  self.value = self.value | self.MANUAL_OP_KEY_LOCK
end

--- @function ManualOperationEventMask:unset_manual_op_key_lock
--- Set the value of the bits in the MANUAL_OP_KEY_LOCK field to 0
ManualOperationEventMask.unset_manual_op_key_lock = function(self)
  self.value = self.value & (~self.MANUAL_OP_KEY_LOCK & self.BASE_MASK)
end

--- @function ManualOperationEventMask:is_manual_op_key_unlock_set
--- @return boolean True if the value of MANUAL_OP_KEY_UNLOCK is non-zero
ManualOperationEventMask.is_manual_op_key_unlock_set = function(self)
  return (self.value & self.MANUAL_OP_KEY_UNLOCK) ~= 0
end
 
--- @function ManualOperationEventMask:set_manual_op_key_unlock
--- Set the value of the bit in the MANUAL_OP_KEY_UNLOCK field to 1
ManualOperationEventMask.set_manual_op_key_unlock = function(self)
  self.value = self.value | self.MANUAL_OP_KEY_UNLOCK
end

--- @function ManualOperationEventMask:unset_manual_op_key_unlock
--- Set the value of the bits in the MANUAL_OP_KEY_UNLOCK field to 0
ManualOperationEventMask.unset_manual_op_key_unlock = function(self)
  self.value = self.value & (~self.MANUAL_OP_KEY_UNLOCK & self.BASE_MASK)
end

--- @function ManualOperationEventMask:is_manual_op_auto_lock_set
--- @return boolean True if the value of MANUAL_OP_AUTO_LOCK is non-zero
ManualOperationEventMask.is_manual_op_auto_lock_set = function(self)
  return (self.value & self.MANUAL_OP_AUTO_LOCK) ~= 0
end
 
--- @function ManualOperationEventMask:set_manual_op_auto_lock
--- Set the value of the bit in the MANUAL_OP_AUTO_LOCK field to 1
ManualOperationEventMask.set_manual_op_auto_lock = function(self)
  self.value = self.value | self.MANUAL_OP_AUTO_LOCK
end

--- @function ManualOperationEventMask:unset_manual_op_auto_lock
--- Set the value of the bits in the MANUAL_OP_AUTO_LOCK field to 0
ManualOperationEventMask.unset_manual_op_auto_lock = function(self)
  self.value = self.value & (~self.MANUAL_OP_AUTO_LOCK & self.BASE_MASK)
end

--- @function ManualOperationEventMask:is_manual_op_schedule_lock_set
--- @return boolean True if the value of MANUAL_OP_SCHEDULE_LOCK is non-zero
ManualOperationEventMask.is_manual_op_schedule_lock_set = function(self)
  return (self.value & self.MANUAL_OP_SCHEDULE_LOCK) ~= 0
end
 
--- @function ManualOperationEventMask:set_manual_op_schedule_lock
--- Set the value of the bit in the MANUAL_OP_SCHEDULE_LOCK field to 1
ManualOperationEventMask.set_manual_op_schedule_lock = function(self)
  self.value = self.value | self.MANUAL_OP_SCHEDULE_LOCK
end

--- @function ManualOperationEventMask:unset_manual_op_schedule_lock
--- Set the value of the bits in the MANUAL_OP_SCHEDULE_LOCK field to 0
ManualOperationEventMask.unset_manual_op_schedule_lock = function(self)
  self.value = self.value & (~self.MANUAL_OP_SCHEDULE_LOCK & self.BASE_MASK)
end

--- @function ManualOperationEventMask:is_manual_op_schedule_unlock_set
--- @return boolean True if the value of MANUAL_OP_SCHEDULE_UNLOCK is non-zero
ManualOperationEventMask.is_manual_op_schedule_unlock_set = function(self)
  return (self.value & self.MANUAL_OP_SCHEDULE_UNLOCK) ~= 0
end
 
--- @function ManualOperationEventMask:set_manual_op_schedule_unlock
--- Set the value of the bit in the MANUAL_OP_SCHEDULE_UNLOCK field to 1
ManualOperationEventMask.set_manual_op_schedule_unlock = function(self)
  self.value = self.value | self.MANUAL_OP_SCHEDULE_UNLOCK
end

--- @function ManualOperationEventMask:unset_manual_op_schedule_unlock
--- Set the value of the bits in the MANUAL_OP_SCHEDULE_UNLOCK field to 0
ManualOperationEventMask.unset_manual_op_schedule_unlock = function(self)
  self.value = self.value & (~self.MANUAL_OP_SCHEDULE_UNLOCK & self.BASE_MASK)
end

--- @function ManualOperationEventMask:is_manual_op_lock_set
--- @return boolean True if the value of MANUAL_OP_LOCK is non-zero
ManualOperationEventMask.is_manual_op_lock_set = function(self)
  return (self.value & self.MANUAL_OP_LOCK) ~= 0
end
 
--- @function ManualOperationEventMask:set_manual_op_lock
--- Set the value of the bit in the MANUAL_OP_LOCK field to 1
ManualOperationEventMask.set_manual_op_lock = function(self)
  self.value = self.value | self.MANUAL_OP_LOCK
end

--- @function ManualOperationEventMask:unset_manual_op_lock
--- Set the value of the bits in the MANUAL_OP_LOCK field to 0
ManualOperationEventMask.unset_manual_op_lock = function(self)
  self.value = self.value & (~self.MANUAL_OP_LOCK & self.BASE_MASK)
end

--- @function ManualOperationEventMask:is_manual_op_unlock_set
--- @return boolean True if the value of MANUAL_OP_UNLOCK is non-zero
ManualOperationEventMask.is_manual_op_unlock_set = function(self)
  return (self.value & self.MANUAL_OP_UNLOCK) ~= 0
end
 
--- @function ManualOperationEventMask:set_manual_op_unlock
--- Set the value of the bit in the MANUAL_OP_UNLOCK field to 1
ManualOperationEventMask.set_manual_op_unlock = function(self)
  self.value = self.value | self.MANUAL_OP_UNLOCK
end

--- @function ManualOperationEventMask:unset_manual_op_unlock
--- Set the value of the bits in the MANUAL_OP_UNLOCK field to 0
ManualOperationEventMask.unset_manual_op_unlock = function(self)
  self.value = self.value & (~self.MANUAL_OP_UNLOCK & self.BASE_MASK)
end


ManualOperationEventMask.mask_methods = {
  is_manual_op_unknown_or_ms_set = ManualOperationEventMask.is_manual_op_unknown_or_ms_set,
  set_manual_op_unknown_or_ms = ManualOperationEventMask.set_manual_op_unknown_or_ms,
  unset_manual_op_unknown_or_ms = ManualOperationEventMask.unset_manual_op_unknown_or_ms,
  is_manual_op_thumbturn_lock_set = ManualOperationEventMask.is_manual_op_thumbturn_lock_set,
  set_manual_op_thumbturn_lock = ManualOperationEventMask.set_manual_op_thumbturn_lock,
  unset_manual_op_thumbturn_lock = ManualOperationEventMask.unset_manual_op_thumbturn_lock,
  is_manual_op_thumbturn_unlock_set = ManualOperationEventMask.is_manual_op_thumbturn_unlock_set,
  set_manual_op_thumbturn_unlock = ManualOperationEventMask.set_manual_op_thumbturn_unlock,
  unset_manual_op_thumbturn_unlock = ManualOperationEventMask.unset_manual_op_thumbturn_unlock,
  is_manual_op_one_touch_lock_set = ManualOperationEventMask.is_manual_op_one_touch_lock_set,
  set_manual_op_one_touch_lock = ManualOperationEventMask.set_manual_op_one_touch_lock,
  unset_manual_op_one_touch_lock = ManualOperationEventMask.unset_manual_op_one_touch_lock,
  is_manual_op_key_lock_set = ManualOperationEventMask.is_manual_op_key_lock_set,
  set_manual_op_key_lock = ManualOperationEventMask.set_manual_op_key_lock,
  unset_manual_op_key_lock = ManualOperationEventMask.unset_manual_op_key_lock,
  is_manual_op_key_unlock_set = ManualOperationEventMask.is_manual_op_key_unlock_set,
  set_manual_op_key_unlock = ManualOperationEventMask.set_manual_op_key_unlock,
  unset_manual_op_key_unlock = ManualOperationEventMask.unset_manual_op_key_unlock,
  is_manual_op_auto_lock_set = ManualOperationEventMask.is_manual_op_auto_lock_set,
  set_manual_op_auto_lock = ManualOperationEventMask.set_manual_op_auto_lock,
  unset_manual_op_auto_lock = ManualOperationEventMask.unset_manual_op_auto_lock,
  is_manual_op_schedule_lock_set = ManualOperationEventMask.is_manual_op_schedule_lock_set,
  set_manual_op_schedule_lock = ManualOperationEventMask.set_manual_op_schedule_lock,
  unset_manual_op_schedule_lock = ManualOperationEventMask.unset_manual_op_schedule_lock,
  is_manual_op_schedule_unlock_set = ManualOperationEventMask.is_manual_op_schedule_unlock_set,
  set_manual_op_schedule_unlock = ManualOperationEventMask.set_manual_op_schedule_unlock,
  unset_manual_op_schedule_unlock = ManualOperationEventMask.unset_manual_op_schedule_unlock,
  is_manual_op_lock_set = ManualOperationEventMask.is_manual_op_lock_set,
  set_manual_op_lock = ManualOperationEventMask.set_manual_op_lock,
  unset_manual_op_lock = ManualOperationEventMask.unset_manual_op_lock,
  is_manual_op_unlock_set = ManualOperationEventMask.is_manual_op_unlock_set,
  set_manual_op_unlock = ManualOperationEventMask.set_manual_op_unlock,
  unset_manual_op_unlock = ManualOperationEventMask.unset_manual_op_unlock,
}

--- Add additional functionality to the base type object
---
--- @param base_type_obj st.zigbee.data_types.Bitmap16 the base data type object to add functionality to
function ManualOperationEventMask:augment_type(base_type_obj)
  for k, v in pairs(self.mask_fields) do
    base_type_obj[k] = v
  end
  for k, v in pairs(self.mask_methods) do
    base_type_obj[k] = v
  end
  
  base_type_obj.field_name = self.NAME
  base_type_obj.pretty_print = self.pretty_print
end

function ManualOperationEventMask.pretty_print(value_obj)
  local zb_utils = require "st.zigbee.utils" 
  local pattern = ">I" .. value_obj.byte_length
  return string.format("%s: %s[0x]", value_obj.field_name or value_obj.NAME, ManualOperationEventMask.NAME, zb_utils.pretty_print_hex_str(string.pack(pattern, value_obj.value)))
end

--- @function ManualOperationEventMask:build_test_attr_report
---
--- Build a Rx Zigbee message as if a device reported this attribute
--- @param device st.zigbee.Device
--- @param data st.zigbee.data_types.Bitmap16 the attribute value
--- @return st.zigbee.ZigbeeMessageRx containing an AttributeReport body
ManualOperationEventMask.build_test_attr_report = cluster_base.build_test_attr_report

--- @function ManualOperationEventMask:build_test_read_attr_response
---
--- Build a Rx Zigbee message as if a device sent a read response for this attribute
--- @param device st.zigbee.Device
--- @param data st.zigbee.data_types.Bitmap16 the attribute value
--- @return st.zigbee.ZigbeeMessageRx containing an ReadAttributeResponse body
ManualOperationEventMask.build_test_read_attr_response = cluster_base.build_test_read_attr_response

--- Create a Bitmap16 object of this attribute with any additional features provided for the attribute
---
--- This is also usable with the ManualOperationEventMask(...) syntax
---
--- @vararg vararg the values needed to construct a Bitmap16
--- @return st.zigbee.data_types.Bitmap16
function ManualOperationEventMask:new_value(...)
    local o = self.base_type(table.unpack({...}))
    self:augment_type(o)
    return o
end

--- Construct a st.zigbee.ZigbeeMessageTx to read this attribute from a device
---
--- @param device st.zigbee.Device
--- @return st.zigbee.ZigbeeMessageTx containing a ReadAttribute body
function ManualOperationEventMask:read(device)
    return cluster_base.read_attribute(device, data_types.ClusterId(self._cluster.ID), data_types.AttributeId(self.ID))
end

--- Construct a st.zigbee.ZigbeeMessageTx to configure this attribute for reporting on a device
---
--- @param device st.zigbee.Device
--- @param min_rep_int number|st.zigbee.data_types.Uint16 the minimum interval allowed between reports of this attribute
--- @param max_rep_int number|st.zigbee.data_types.Uint16 the maximum interval allowed between reports of this attribute
--- @return st.zigbee.ZigbeeMessageTx containing a ConfigureReporting body
function ManualOperationEventMask:configure_reporting(device, min_rep_int, max_rep_int)
  local min = data_types.validate_or_build_type(min_rep_int, data_types.Uint16, "minimum_reporting_interval")
  local max = data_types.validate_or_build_type(max_rep_int, data_types.Uint16, "maximum_reporting_interval")
  local rep_change = nil
  return cluster_base.configure_reporting(device, data_types.ClusterId(self._cluster.ID), data_types.AttributeId(self.ID), data_types.ZigbeeDataType(self.base_type.ID), min, max, rep_change)
end

--- Write a value to this attribute on a device
---
--- @param device st.zigbee.Device
--- @param value st.zigbee.data_types.Bitmap16 the value to write
function ManualOperationEventMask:write(device, value)
  local data = data_types.validate_or_build_type(value, self.base_type)
  self:augment_type(data)
  return cluster_base.write_attribute(device, data_types.ClusterId(self._cluster.ID), data_types.AttributeId(self.ID), data)
end

function ManualOperationEventMask:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(ManualOperationEventMask, {__call = ManualOperationEventMask.new_value})
return ManualOperationEventMask
