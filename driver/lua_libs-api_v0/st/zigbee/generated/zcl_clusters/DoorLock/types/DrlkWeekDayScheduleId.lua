local data_types = require "st.zigbee.data_types"
local UintABC = require "st.zigbee.data_types.base_defs.UintABC"

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

--- @class st.zigbee.zcl.clusters.DoorLock.types.DrlkWeekDayScheduleId : st.zigbee.data_types.Uint8
---
local DrlkWeekDayScheduleId = {}
local new_mt = UintABC.new_mt({NAME = "DrlkWeekDayScheduleId", ID = data_types.name_to_id_map["Uint8"]}, 1)
setmetatable(DrlkWeekDayScheduleId, new_mt)
return DrlkWeekDayScheduleId
