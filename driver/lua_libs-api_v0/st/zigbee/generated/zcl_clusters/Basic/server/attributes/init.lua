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
    local req_loc = string.format("st.zigbee.generated.zcl_clusters.Basic.server.attributes.%s", key)
    local raw_def = require(req_loc)
    local cluster = rawget(self, "_cluster")
    raw_def:set_parent_cluster(cluster)
    attr_mt.__attr_cache[key] = raw_def 
  end
  return attr_mt.__attr_cache[key]
end


--- @class st.zigbee.zcl.clusters.BasicServerAttributes
---
--- @field public ZCLVersion st.zigbee.zcl.clusters.Basic.ZCLVersion
--- @field public ApplicationVersion st.zigbee.zcl.clusters.Basic.ApplicationVersion
--- @field public StackVersion st.zigbee.zcl.clusters.Basic.StackVersion
--- @field public HWVersion st.zigbee.zcl.clusters.Basic.HWVersion
--- @field public ManufacturerName st.zigbee.zcl.clusters.Basic.ManufacturerName
--- @field public ModelIdentifier st.zigbee.zcl.clusters.Basic.ModelIdentifier
--- @field public DateCode st.zigbee.zcl.clusters.Basic.DateCode
--- @field public PowerSource st.zigbee.zcl.clusters.Basic.PowerSource
--- @field public GenericDeviceClass st.zigbee.zcl.clusters.Basic.GenericDeviceClass
--- @field public GenericDeviceType st.zigbee.zcl.clusters.Basic.GenericDeviceType
--- @field public ProductCode st.zigbee.zcl.clusters.Basic.ProductCode
--- @field public ProductURL st.zigbee.zcl.clusters.Basic.ProductURL
--- @field public ManufacturerVersionDetails st.zigbee.zcl.clusters.Basic.ManufacturerVersionDetails
--- @field public SerialNumber st.zigbee.zcl.clusters.Basic.SerialNumber
--- @field public ProductLabel st.zigbee.zcl.clusters.Basic.ProductLabel
--- @field public LocationDescription st.zigbee.zcl.clusters.Basic.LocationDescription
--- @field public PhysicalEnvironment st.zigbee.zcl.clusters.Basic.PhysicalEnvironment
--- @field public DeviceEnabled st.zigbee.zcl.clusters.Basic.DeviceEnabled
--- @field public AlarmMask st.zigbee.zcl.clusters.Basic.AlarmMask
--- @field public DisableLocalConfig st.zigbee.zcl.clusters.Basic.DisableLocalConfig
--- @field public SWBuildID st.zigbee.zcl.clusters.Basic.SWBuildID

local BasicServerAttributes = {}

function BasicServerAttributes:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(BasicServerAttributes, attr_mt)

return BasicServerAttributes