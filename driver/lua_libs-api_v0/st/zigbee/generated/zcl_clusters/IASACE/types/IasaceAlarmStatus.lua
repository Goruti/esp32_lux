local data_types = require "st.zigbee.data_types"
local EnumABC = require "st.zigbee.data_types.base_defs.EnumABC"

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

--- @class st.zigbee.zcl.clusters.IASACE.types.IasaceAlarmStatus: st.zigbee.data_types.Enum8
--- @alias IasaceAlarmStatus
---
--- @field public byte_length number 1
--- @field public NO_ALARM number 0
--- @field public BURGLER number 1
--- @field public FIRE number 2
--- @field public EMERGENCY number 3
--- @field public POLICE_PANIC number 4
--- @field public FIRE_PANIC number 5
--- @field public EMERGENCY_PANIC number 6
local IasaceAlarmStatus = {}
local new_mt = EnumABC.new_mt({NAME = "IasaceAlarmStatus", ID = data_types.name_to_id_map["Enum8"]}, 1)
new_mt.__index.pretty_print = function(self)
  local name_lookup = {
    [self.NO_ALARM]        = "NO_ALARM",
    [self.BURGLER]         = "BURGLER",
    [self.FIRE]            = "FIRE",
    [self.EMERGENCY]       = "EMERGENCY",
    [self.POLICE_PANIC]    = "POLICE_PANIC",
    [self.FIRE_PANIC]      = "FIRE_PANIC",
    [self.EMERGENCY_PANIC] = "EMERGENCY_PANIC",
  }
  return string.format("%s: %s", self.NAME or self.field_name, name_lookup[self.value] or string.format("%d", self.value))
end
new_mt.__tostring = new_mt.__index.pretty_print
new_mt.__index.NO_ALARM        = 0x00
new_mt.__index.BURGLER         = 0x01
new_mt.__index.FIRE            = 0x02
new_mt.__index.EMERGENCY       = 0x03
new_mt.__index.POLICE_PANIC    = 0x04
new_mt.__index.FIRE_PANIC      = 0x05
new_mt.__index.EMERGENCY_PANIC = 0x06

setmetatable(IasaceAlarmStatus, new_mt)

return IasaceAlarmStatus