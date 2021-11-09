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

--- @class st.zigbee.zcl.clusters.WindowCovering.WindowCoveringType
--- @alias WindowCoveringType
---
--- @field public ID number 0x0000 the ID of this attribute
--- @field public NAME string "WindowCoveringType" the name of this attribute
--- @field public data_type st.zigbee.data_types.Enum8 the data type of this attribute
--- @field public ROLLERSHADE number 0
--- @field public ROLLERSHADE2MOTOR number 1
--- @field public ROLLERSHADE_EXTERIOR number 2
--- @field public ROLLERSHADE_EXTERIOR2MOTOR number 3
--- @field public DRAPERY number 4
--- @field public AWNING number 5
--- @field public SHUTTER number 6
--- @field public TILT_BLIND_TILT_ONLY number 7
--- @field public TILT_BLIND_LIFT_AND_TILT number 8
--- @field public PROJECTOR_SCREEN number 9
local WindowCoveringType = {
  ID = 0x0000,
  NAME = "WindowCoveringType",
  base_type = data_types.Enum8,
}

WindowCoveringType.ROLLERSHADE                = 0x00
WindowCoveringType.ROLLERSHADE2MOTOR          = 0x01
WindowCoveringType.ROLLERSHADE_EXTERIOR       = 0x02
WindowCoveringType.ROLLERSHADE_EXTERIOR2MOTOR = 0x03
WindowCoveringType.DRAPERY                    = 0x04
WindowCoveringType.AWNING                     = 0x05
WindowCoveringType.SHUTTER                    = 0x06
WindowCoveringType.TILT_BLIND_TILT_ONLY       = 0x07
WindowCoveringType.TILT_BLIND_LIFT_AND_TILT   = 0x08
WindowCoveringType.PROJECTOR_SCREEN           = 0x09


WindowCoveringType.enum_fields = {
    [WindowCoveringType.ROLLERSHADE]                = "ROLLERSHADE",
    [WindowCoveringType.ROLLERSHADE2MOTOR]          = "ROLLERSHADE2MOTOR",
    [WindowCoveringType.ROLLERSHADE_EXTERIOR]       = "ROLLERSHADE_EXTERIOR",
    [WindowCoveringType.ROLLERSHADE_EXTERIOR2MOTOR] = "ROLLERSHADE_EXTERIOR2MOTOR",
    [WindowCoveringType.DRAPERY]                    = "DRAPERY",
    [WindowCoveringType.AWNING]                     = "AWNING",
    [WindowCoveringType.SHUTTER]                    = "SHUTTER",
    [WindowCoveringType.TILT_BLIND_TILT_ONLY]       = "TILT_BLIND_TILT_ONLY",
    [WindowCoveringType.TILT_BLIND_LIFT_AND_TILT]   = "TILT_BLIND_LIFT_AND_TILT",
    [WindowCoveringType.PROJECTOR_SCREEN]           = "PROJECTOR_SCREEN",
}

--- Add additional functionality to the base type object
---
--- @param base_type_obj st.zigbee.data_types.Enum8 the base data type object to add functionality to
function WindowCoveringType:augment_type(base_type_obj)
  for value, key in pairs(self.enum_fields) do
    base_type_obj[key] = value
  end
  base_type_obj.field_name = self.NAME
  base_type_obj.pretty_print = self.pretty_print
end

function WindowCoveringType.pretty_print(value_obj)
  return string.format("%s: %s[%s]", value_obj.field_name or value_obj.NAME, WindowCoveringType.NAME, WindowCoveringType.enum_fields[value_obj.value])
end

--- @function WindowCoveringType:build_test_attr_report
---
--- Build a Rx Zigbee message as if a device reported this attribute
--- @param device st.zigbee.Device
--- @param data st.zigbee.data_types.Enum8 the attribute value
--- @return st.zigbee.ZigbeeMessageRx containing an AttributeReport body
WindowCoveringType.build_test_attr_report = cluster_base.build_test_attr_report

--- @function WindowCoveringType:build_test_read_attr_response
---
--- Build a Rx Zigbee message as if a device sent a read response for this attribute
--- @param device st.zigbee.Device
--- @param data st.zigbee.data_types.Enum8 the attribute value
--- @return st.zigbee.ZigbeeMessageRx containing an ReadAttributeResponse body
WindowCoveringType.build_test_read_attr_response = cluster_base.build_test_read_attr_response

--- Create a Enum8 object of this attribute with any additional features provided for the attribute
---
--- This is also usable with the WindowCoveringType(...) syntax
---
--- @vararg vararg the values needed to construct a Enum8
--- @return st.zigbee.data_types.Enum8
function WindowCoveringType:new_value(...)
    local o = self.base_type(table.unpack({...}))
    self:augment_type(o)
    return o
end

--- Construct a st.zigbee.ZigbeeMessageTx to read this attribute from a device
---
--- @param device st.zigbee.Device
--- @return st.zigbee.ZigbeeMessageTx containing a ReadAttribute body
function WindowCoveringType:read(device)
    return cluster_base.read_attribute(device, data_types.ClusterId(self._cluster.ID), data_types.AttributeId(self.ID))
end

--- Construct a st.zigbee.ZigbeeMessageTx to configure this attribute for reporting on a device
---
--- @param device st.zigbee.Device
--- @param min_rep_int number|st.zigbee.data_types.Uint16 the minimum interval allowed between reports of this attribute
--- @param max_rep_int number|st.zigbee.data_types.Uint16 the maximum interval allowed between reports of this attribute
--- @return st.zigbee.ZigbeeMessageTx containing a ConfigureReporting body
function WindowCoveringType:configure_reporting(device, min_rep_int, max_rep_int)
  local min = data_types.validate_or_build_type(min_rep_int, data_types.Uint16, "minimum_reporting_interval")
  local max = data_types.validate_or_build_type(max_rep_int, data_types.Uint16, "maximum_reporting_interval")
  local rep_change = nil
  return cluster_base.configure_reporting(device, data_types.ClusterId(self._cluster.ID), data_types.AttributeId(self.ID), data_types.ZigbeeDataType(self.base_type.ID), min, max, rep_change)
end

function WindowCoveringType:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(WindowCoveringType, {__call = WindowCoveringType.new_value})
return WindowCoveringType