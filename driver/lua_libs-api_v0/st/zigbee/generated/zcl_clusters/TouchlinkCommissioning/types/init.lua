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

local types_mt = {}
types_mt.__types_cache = {}
types_mt.__index = function(self, key)
  if types_mt.__types_cache[key] == nil then
    local req_loc = string.format("st.zigbee.generated.zcl_clusters.TouchlinkCommissioning.types.%s", key)
    local cluster_type = require(req_loc)
    types_mt.__types_cache[key] = cluster_type
  end
  return types_mt.__types_cache[key]
end


--- @class st.zigbee.zcl.clusters.TouchlinkCommissioningTypes
---
--- @field public TLKeyIndex st.zigbee.zcl.clusters.TouchlinkCommissioning.types.TLKeyIndex
--- @field public TLZigbeeInformation st.zigbee.zcl.clusters.TouchlinkCommissioning.types.TLZigbeeInformation
--- @field public TLTouchlinkInformation st.zigbee.zcl.clusters.TouchlinkCommissioning.types.TLTouchlinkInformation
--- @field public TLVersion st.zigbee.zcl.clusters.TouchlinkCommissioning.types.TLVersion
--- @field public TLDeviceInformationRecord st.zigbee.zcl.clusters.TouchlinkCommissioning.types.TLDeviceInformationRecord
--- @field public TLStatus st.zigbee.zcl.clusters.TouchlinkCommissioning.types.TLStatus
--- @field public TLGroupInformationRecord st.zigbee.zcl.clusters.TouchlinkCommissioning.types.TLGroupInformationRecord
--- @field public TLEndpointInformationRecord st.zigbee.zcl.clusters.TouchlinkCommissioning.types.TLEndpointInformationRecord
--- @field public TLRangeBeginEnd st.zigbee.zcl.clusters.TouchlinkCommissioning.types.TLRangeBeginEnd
--- @field public KeyBitmask st.zigbee.zcl.clusters.TouchlinkCommissioning.types.KeyBitmask

local TouchlinkCommissioningTypes = {}

setmetatable(TouchlinkCommissioningTypes, types_mt)

return TouchlinkCommissioningTypes
