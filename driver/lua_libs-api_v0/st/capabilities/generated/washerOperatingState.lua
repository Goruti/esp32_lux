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

return [[{"name": "Washer Operating State", "status": "proposed", "attributes": {"machineState": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"$ref": "MachineState"}}, "required": ["value"]}, "type": "ENUM", "values": ["pause", "run", "stop"], "setter": "setMachineState"}, "supportedMachineStates": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "array", "items": {"$ref": "MachineState"}}}}, "type": "JSON_OBJECT"}, "washerJobState": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "string", "enum": ["airWash", "cooling", "delayWash", "drying", "finish", "none", "preWash", "rinse", "spin", "wash", "weightSensing", "wrinklePrevent"]}, "constraints": {"type": "object", "additionalProperties": false, "properties": {"values": {"type": "array", "items": {"type": "string", "enum": ["airWash", "cooling", "delayWash", "drying", "finish", "none", "preWash", "rinse", "spin", "wash", "weightSensing", "wrinklePrevent"]}}}}}, "required": ["value"]}, "type": "ENUM", "values": ["airWash", "cooling", "delayWash", "drying", "finish", "none", "preWash", "rinse", "spin", "wash", "weightSensing", "wrinklePrevent"]}, "completionTime": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"$ref": "Iso8601Date"}}, "required": ["value"]}, "type": "DATE"}}, "commands": {"setMachineState": {"arguments": [{"name": "state", "required": true, "schema": {"$ref": "MachineState"}, "type": "ENUM", "values": ["pause", "run", "stop"]}]}}, "public": true, "id": "washerOperatingState", "ocfResourceType": "x.com.st.operationalstate.washer", "version": 1}]]
