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

--- @class st.zigbee.zcl.clusters.IASACE.types.ArmMode: st.zigbee.data_types.Enum8
--- @alias ArmMode
---
--- @field public byte_length number 1
--- @field public DISARM number 0
--- @field public ARM_DAY_HOME_ZONES_ONLY number 1
--- @field public ARM_NIGHT_SLEEP_ZONES_ONLY number 2
--- @field public ARM_ALL_ZONES number 3
local ArmMode = {}
local new_mt = EnumABC.new_mt({NAME = "ArmMode", ID = data_types.name_to_id_map["Enum8"]}, 1)
new_mt.__index.pretty_print = function(self)
  local name_lookup = {
    [self.DISARM]                     = "DISARM",
    [self.ARM_DAY_HOME_ZONES_ONLY]    = "ARM_DAY_HOME_ZONES_ONLY",
    [self.ARM_NIGHT_SLEEP_ZONES_ONLY] = "ARM_NIGHT_SLEEP_ZONES_ONLY",
    [self.ARM_ALL_ZONES]              = "ARM_ALL_ZONES",
  }
  return string.format("%s: %s", self.NAME or self.field_name, name_lookup[self.value] or string.format("%d", self.value))
end
new_mt.__tostring = new_mt.__index.pretty_print
new_mt.__index.DISARM                     = 0x00
new_mt.__index.ARM_DAY_HOME_ZONES_ONLY    = 0x01
new_mt.__index.ARM_NIGHT_SLEEP_ZONES_ONLY = 0x02
new_mt.__index.ARM_ALL_ZONES              = 0x03

setmetatable(ArmMode, new_mt)

return ArmMode
