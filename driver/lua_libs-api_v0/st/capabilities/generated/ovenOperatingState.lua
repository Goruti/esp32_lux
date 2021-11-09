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

return [[{"name": "Oven Operating State", "status": "proposed", "attributes": {"machineState": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "string", "enum": ["ready", "running", "paused"]}}}, "type": "ENUM", "values": ["ready", "running", "paused"], "setter": "setMachineState", "actedOnBy": ["stop"]}, "supportedMachineStates": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "array", "items": {"type": "string", "enum": ["ready", "running", "paused"]}}}}, "type": "JSON_OBJECT"}, "ovenJobState": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "string", "enum": ["cleaning", "cooking", "cooling", "draining", "preheat", "ready", "rinsing"]}}}, "type": "ENUM", "values": ["cleaning", "cooking", "cooling", "draining", "preheat", "ready", "rinsing"]}, "completionTime": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"$ref": "Iso8601Date"}}, "required": ["value"]}, "type": "DATE"}, "operationTime": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"$ref": "PositiveInteger"}}}, "type": "NUMBER", "actedOnBy": ["stop"]}, "progress": {"schema": {"$ref": "IntegerPercent"}, "type": "NUMBER"}}, "commands": {"setMachineState": {"arguments": [{"name": "state", "required": true, "schema": {"type": "string", "enum": ["stop"]}, "type": "ENUM", "values": ["stop"]}]}, "stop": {"arguments": []}, "start": {"arguments": [{"name": "mode", "required": false, "schema": {"$ref": "OvenMode"}, "type": "ENUM", "values": ["heating", "grill", "warming", "defrosting", "Conventional", "Bake", "BottomHeat", "ConvectionBake", "ConvectionRoast", "Broil", "ConvectionBroil", "SteamCook", "SteamBake", "SteamRoast", "SteamBottomHeatplusConvection", "Microwave", "MWplusGrill", "MWplusConvection", "MWplusHotBlast", "MWplusHotBlast2", "SlimMiddle", "SlimStrong", "SlowCook", "Proof", "Dehydrate", "Others"]}, {"name": "time", "required": false, "schema": {"$ref": "PositiveInteger"}, "type": "NUMBER"}, {"name": "setpoint", "required": false, "schema": {"$ref": "PositiveInteger"}, "type": "NUMBER"}]}}, "public": true, "id": "ovenOperatingState", "ocfResourceType": "x.com.st.operationalstate.oven", "version": 1}]]
