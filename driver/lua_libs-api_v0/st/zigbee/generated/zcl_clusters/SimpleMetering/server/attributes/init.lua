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

local attr_mt = {}
attr_mt.__attr_cache = {}
attr_mt.__index = function(self, key)
  if attr_mt.__attr_cache[key] == nil then
    local req_loc = string.format("st.zigbee.generated.zcl_clusters.SimpleMetering.server.attributes.%s", key)
    local raw_def = require(req_loc)
    local cluster = rawget(self, "_cluster")
    raw_def:set_parent_cluster(cluster)
    attr_mt.__attr_cache[key] = raw_def 
  end
  return attr_mt.__attr_cache[key]
end


--- @class st.zigbee.zcl.clusters.SimpleMeteringServerAttributes
---
--- @field public CurrentSummationDelivered st.zigbee.zcl.clusters.SimpleMetering.CurrentSummationDelivered
--- @field public InstantaneousDemand st.zigbee.zcl.clusters.SimpleMetering.InstantaneousDemand
--- @field public Multiplier st.zigbee.zcl.clusters.SimpleMetering.Multiplier
--- @field public Divisor st.zigbee.zcl.clusters.SimpleMetering.Divisor

local SimpleMeteringServerAttributes = {}

function SimpleMeteringServerAttributes:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(SimpleMeteringServerAttributes, attr_mt)

return SimpleMeteringServerAttributes
