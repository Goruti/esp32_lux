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

--- @class st.zigbee.zcl.types.ProfileIntervalPeriod: st.zigbee.data_types.Enum8
--- @alias ProfileIntervalPeriod
---
--- @field public byte_length number 1
--- @field public DAILY number 0
--- @field public TYPE_60MINUTES number 1
--- @field public TYPE_30MINUTES number 2
--- @field public TYPE_15MINUTES number 3
--- @field public TYPE_10MINUTES number 4
--- @field public TYPE_7DOT5MINUTES number 5
--- @field public TYPE_5MINUTES number 6
--- @field public TYPE_2DOT5MINUTES number 7
local ProfileIntervalPeriod = {}
local new_mt = EnumABC.new_mt({NAME = "ProfileIntervalPeriod", ID = data_types.name_to_id_map["Enum8"]}, 1)
new_mt.__index.pretty_print = function(self)
  local name_lookup = {
    [self.DAILY]             = "DAILY",
    [self.TYPE_60MINUTES]    = "TYPE_60MINUTES",
    [self.TYPE_30MINUTES]    = "TYPE_30MINUTES",
    [self.TYPE_15MINUTES]    = "TYPE_15MINUTES",
    [self.TYPE_10MINUTES]    = "TYPE_10MINUTES",
    [self.TYPE_7DOT5MINUTES] = "TYPE_7DOT5MINUTES",
    [self.TYPE_5MINUTES]     = "TYPE_5MINUTES",
    [self.TYPE_2DOT5MINUTES] = "TYPE_2DOT5MINUTES",
  }
  return string.format("%s: %s", self.NAME or self.field_name, name_lookup[self.value] or string.format("%d", self.value))
end
new_mt.__tostring = new_mt.__index.pretty_print
new_mt.__index.DAILY             = 0x00
new_mt.__index.TYPE_60MINUTES    = 0x01
new_mt.__index.TYPE_30MINUTES    = 0x02
new_mt.__index.TYPE_15MINUTES    = 0x03
new_mt.__index.TYPE_10MINUTES    = 0x04
new_mt.__index.TYPE_7DOT5MINUTES = 0x05
new_mt.__index.TYPE_5MINUTES     = 0x06
new_mt.__index.TYPE_2DOT5MINUTES = 0x07

setmetatable(ProfileIntervalPeriod, new_mt)

return ProfileIntervalPeriod