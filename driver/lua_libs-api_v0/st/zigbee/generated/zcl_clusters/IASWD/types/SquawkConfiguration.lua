local data_types = require "st.zigbee.data_types"
local BitmapABC = require "st.zigbee.data_types.base_defs.BitmapABC"

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

--- @class st.zigbee.zcl.clusters.IASWD.types.SquawkConfiguration: st.zigbee.data_types.Bitmap8
--- @alias SquawkConfiguration
---
--- @field public byte_length number 1
--- @field public SQUAWK_LEVEL number 3
--- @field public SQUAWK_STROBE_ACTIVE number 8
--- @field public SQUAWK_MODE number 240
local SquawkConfiguration = {}
local new_mt = BitmapABC.new_mt({NAME = "SquawkConfiguration", ID = data_types.name_to_id_map["Bitmap8"]}, 1)
new_mt.__index.BASE_MASK            = 0xFF
new_mt.__index.SQUAWK_LEVEL         = 0x03
new_mt.__index.SQUAWK_STROBE_ACTIVE = 0x08
new_mt.__index.SQUAWK_MODE          = 0xF0

--- @function SquawkConfiguration:is_squawk_level_set
--- @return boolean True if the value of SQUAWK_LEVEL is non-zero
new_mt.__index.is_squawk_level_set = function(self)
  return (self.value & self.SQUAWK_LEVEL) ~= 0
end
 
--- @function SquawkConfiguration:set_squawk_level
--- Set the value of the bits in the SQUAWK_LEVEL field
--- @param fieldVal number the value to set the bitfield to
new_mt.__index.set_squawk_level = function(self, fieldVal)
  if ((fieldVal & ~(self.SQUAWK_LEVEL >> 0)) ~= 0) then
    error("value too large for SQUAWK_LEVEL")
  end
  self.value = self.value | (fieldVal << 0)
end

--- @function SquawkConfiguration:get_squawk_level
--- Get the value of the bits in the SQUAWK_LEVEL field
new_mt.__index.get_squawk_level = function(self)
  return ((self.value & self.SQUAWK_LEVEL)) >> 0
end

--- @function SquawkConfiguration:unset_squawk_level
--- Set the value of the bits in the SQUAWK_LEVEL field to 0
new_mt.__index.unset_squawk_level = function(self)
  self.value = self.value & (~self.SQUAWK_LEVEL & self.BASE_MASK)
end

--- @function SquawkConfiguration:is_squawk_strobe_active_set
--- @return boolean True if the value of SQUAWK_STROBE_ACTIVE is non-zero
new_mt.__index.is_squawk_strobe_active_set = function(self)
  return (self.value & self.SQUAWK_STROBE_ACTIVE) ~= 0
end
 
--- @function SquawkConfiguration:set_squawk_strobe_active
--- Set the value of the bit in the SQUAWK_STROBE_ACTIVE field to 1
new_mt.__index.set_squawk_strobe_active = function(self)
  self.value = self.value | self.SQUAWK_STROBE_ACTIVE
end

--- @function SquawkConfiguration:unset_squawk_strobe_active
--- Set the value of the bits in the SQUAWK_STROBE_ACTIVE field to 0
new_mt.__index.unset_squawk_strobe_active = function(self)
  self.value = self.value & (~self.SQUAWK_STROBE_ACTIVE & self.BASE_MASK)
end

--- @function SquawkConfiguration:is_squawk_mode_set
--- @return boolean True if the value of SQUAWK_MODE is non-zero
new_mt.__index.is_squawk_mode_set = function(self)
  return (self.value & self.SQUAWK_MODE) ~= 0
end
 
--- @function SquawkConfiguration:set_squawk_mode
--- Set the value of the bits in the SQUAWK_MODE field
--- @param fieldVal number the value to set the bitfield to
new_mt.__index.set_squawk_mode = function(self, fieldVal)
  if ((fieldVal & ~(self.SQUAWK_MODE >> 4)) ~= 0) then
    error("value too large for SQUAWK_MODE")
  end
  self.value = self.value | (fieldVal << 4)
end

--- @function SquawkConfiguration:get_squawk_mode
--- Get the value of the bits in the SQUAWK_MODE field
new_mt.__index.get_squawk_mode = function(self)
  return ((self.value & self.SQUAWK_MODE)) >> 4
end

--- @function SquawkConfiguration:unset_squawk_mode
--- Set the value of the bits in the SQUAWK_MODE field to 0
new_mt.__index.unset_squawk_mode = function(self)
  self.value = self.value & (~self.SQUAWK_MODE & self.BASE_MASK)
end

setmetatable(SquawkConfiguration, new_mt)
return SquawkConfiguration