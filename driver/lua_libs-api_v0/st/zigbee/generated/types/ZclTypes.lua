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

--- @class st.zigbee.zcl.types.ZclTypes: st.zigbee.data_types.Enum8
--- @alias ZclTypes
---
--- @field public byte_length number 1
--- @field public NODATA number 0
--- @field public DATA8 number 8
--- @field public DATA16 number 9
--- @field public DATA24 number 10
--- @field public DATA32 number 11
--- @field public DATA40 number 12
--- @field public DATA48 number 13
--- @field public DATA56 number 14
--- @field public DATA64 number 15
--- @field public BOOL number 16
--- @field public MAP8 number 24
--- @field public MAP16 number 25
--- @field public MAP24 number 26
--- @field public MAP32 number 27
--- @field public MAP40 number 28
--- @field public MAP48 number 29
--- @field public MAP56 number 30
--- @field public MAP64 number 31
--- @field public UINT8 number 32
--- @field public UINT16 number 33
--- @field public UINT24 number 34
--- @field public UINT32 number 35
--- @field public UINT40 number 36
--- @field public UINT48 number 37
--- @field public UINT56 number 38
--- @field public UINT64 number 39
--- @field public INT8 number 40
--- @field public INT16 number 41
--- @field public INT24 number 42
--- @field public INT32 number 43
--- @field public INT40 number 44
--- @field public INT48 number 45
--- @field public INT56 number 46
--- @field public INT64 number 47
--- @field public ENUM8 number 48
--- @field public ENUM16 number 49
--- @field public SEMI number 56
--- @field public SINGLE number 57
--- @field public DOUBLE number 58
--- @field public OCTSTR number 65
--- @field public STRING number 66
--- @field public OCTSTR16 number 67
--- @field public STRING16 number 68
--- @field public ARRAY number 72
--- @field public STRUCT number 76
--- @field public SET number 80
--- @field public BAG number 81
--- @field public TO_D number 224
--- @field public DATE number 225
--- @field public UTC number 226
--- @field public CLUSTER_ID number 232
--- @field public ATTRIB_ID number 233
--- @field public BAC_OID number 234
--- @field public EUI64 number 240
--- @field public KEY128 number 241
--- @field public UNK number 255
local ZclTypes = {}
local new_mt = EnumABC.new_mt({NAME = "ZclTypes", ID = data_types.name_to_id_map["Enum8"]}, 1)
new_mt.__index.pretty_print = function(self)
  local name_lookup = {
    [self.NODATA]     = "NODATA",
    [self.DATA8]      = "DATA8",
    [self.DATA16]     = "DATA16",
    [self.DATA24]     = "DATA24",
    [self.DATA32]     = "DATA32",
    [self.DATA40]     = "DATA40",
    [self.DATA48]     = "DATA48",
    [self.DATA56]     = "DATA56",
    [self.DATA64]     = "DATA64",
    [self.BOOL]       = "BOOL",
    [self.MAP8]       = "MAP8",
    [self.MAP16]      = "MAP16",
    [self.MAP24]      = "MAP24",
    [self.MAP32]      = "MAP32",
    [self.MAP40]      = "MAP40",
    [self.MAP48]      = "MAP48",
    [self.MAP56]      = "MAP56",
    [self.MAP64]      = "MAP64",
    [self.UINT8]      = "UINT8",
    [self.UINT16]     = "UINT16",
    [self.UINT24]     = "UINT24",
    [self.UINT32]     = "UINT32",
    [self.UINT40]     = "UINT40",
    [self.UINT48]     = "UINT48",
    [self.UINT56]     = "UINT56",
    [self.UINT64]     = "UINT64",
    [self.INT8]       = "INT8",
    [self.INT16]      = "INT16",
    [self.INT24]      = "INT24",
    [self.INT32]      = "INT32",
    [self.INT40]      = "INT40",
    [self.INT48]      = "INT48",
    [self.INT56]      = "INT56",
    [self.INT64]      = "INT64",
    [self.ENUM8]      = "ENUM8",
    [self.ENUM16]     = "ENUM16",
    [self.SEMI]       = "SEMI",
    [self.SINGLE]     = "SINGLE",
    [self.DOUBLE]     = "DOUBLE",
    [self.OCTSTR]     = "OCTSTR",
    [self.STRING]     = "STRING",
    [self.OCTSTR16]   = "OCTSTR16",
    [self.STRING16]   = "STRING16",
    [self.ARRAY]      = "ARRAY",
    [self.STRUCT]     = "STRUCT",
    [self.SET]        = "SET",
    [self.BAG]        = "BAG",
    [self.TO_D]       = "TO_D",
    [self.DATE]       = "DATE",
    [self.UTC]        = "UTC",
    [self.CLUSTER_ID] = "CLUSTER_ID",
    [self.ATTRIB_ID]  = "ATTRIB_ID",
    [self.BAC_OID]    = "BAC_OID",
    [self.EUI64]      = "EUI64",
    [self.KEY128]     = "KEY128",
    [self.UNK]        = "UNK",
  }
  return string.format("%s: %s", self.NAME or self.field_name, name_lookup[self.value] or string.format("%d", self.value))
end
new_mt.__tostring = new_mt.__index.pretty_print
new_mt.__index.NODATA     = 0x00
new_mt.__index.DATA8      = 0x08
new_mt.__index.DATA16     = 0x09
new_mt.__index.DATA24     = 0x0A
new_mt.__index.DATA32     = 0x0B
new_mt.__index.DATA40     = 0x0C
new_mt.__index.DATA48     = 0x0D
new_mt.__index.DATA56     = 0x0E
new_mt.__index.DATA64     = 0x0F
new_mt.__index.BOOL       = 0x10
new_mt.__index.MAP8       = 0x18
new_mt.__index.MAP16      = 0x19
new_mt.__index.MAP24      = 0x1A
new_mt.__index.MAP32      = 0x1B
new_mt.__index.MAP40      = 0x1C
new_mt.__index.MAP48      = 0x1D
new_mt.__index.MAP56      = 0x1E
new_mt.__index.MAP64      = 0x1F
new_mt.__index.UINT8      = 0x20
new_mt.__index.UINT16     = 0x21
new_mt.__index.UINT24     = 0x22
new_mt.__index.UINT32     = 0x23
new_mt.__index.UINT40     = 0x24
new_mt.__index.UINT48     = 0x25
new_mt.__index.UINT56     = 0x26
new_mt.__index.UINT64     = 0x27
new_mt.__index.INT8       = 0x28
new_mt.__index.INT16      = 0x29
new_mt.__index.INT24      = 0x2A
new_mt.__index.INT32      = 0x2B
new_mt.__index.INT40      = 0x2C
new_mt.__index.INT48      = 0x2D
new_mt.__index.INT56      = 0x2E
new_mt.__index.INT64      = 0x2F
new_mt.__index.ENUM8      = 0x30
new_mt.__index.ENUM16     = 0x31
new_mt.__index.SEMI       = 0x38
new_mt.__index.SINGLE     = 0x39
new_mt.__index.DOUBLE     = 0x3A
new_mt.__index.OCTSTR     = 0x41
new_mt.__index.STRING     = 0x42
new_mt.__index.OCTSTR16   = 0x43
new_mt.__index.STRING16   = 0x44
new_mt.__index.ARRAY      = 0x48
new_mt.__index.STRUCT     = 0x4C
new_mt.__index.SET        = 0x50
new_mt.__index.BAG        = 0x51
new_mt.__index.TO_D       = 0xE0
new_mt.__index.DATE       = 0xE1
new_mt.__index.UTC        = 0xE2
new_mt.__index.CLUSTER_ID = 0xE8
new_mt.__index.ATTRIB_ID  = 0xE9
new_mt.__index.BAC_OID    = 0xEA
new_mt.__index.EUI64      = 0xF0
new_mt.__index.KEY128     = 0xF1
new_mt.__index.UNK        = 0xFF

setmetatable(ZclTypes, new_mt)

return ZclTypes
