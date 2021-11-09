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

return [[{"name": "Fan Oscillation Mode", "status": "proposed", "attributes": {"fanOscillationMode": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"$ref": "FanOscillationMode"}}}, "type": "ENUM", "values": ["fixed", "vertical", "horizontal", "all", "indirect", "direct", "fixedCenter", "fixedLeft", "fixedRight", "far", "wide", "mid", "spot", "swing"]}, "supportedFanOscillationModes": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"items": {"$ref": "FanOscillationMode"}, "type": "array"}}, "required": ["value"]}, "type": "JSON_OBJECT"}}, "commands": {"setFanOscillationMode": {"arguments": [{"name": "fanOscillationMode", "required": true, "schema": {"$ref": "FanOscillationMode"}, "type": "ENUM", "values": ["fixed", "vertical", "horizontal", "all", "indirect", "direct", "fixedCenter", "fixedLeft", "fixedRight", "far", "wide", "mid", "spot", "swing"]}]}}, "public": true, "id": "fanOscillationMode", "version": 1}]]
