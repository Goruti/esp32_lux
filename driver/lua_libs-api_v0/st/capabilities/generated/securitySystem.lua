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

return [[{"name": "Security System", "status": "live", "attributes": {"securitySystemStatus": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "string", "enum": ["armedAway", "armedStay", "disarmed"]}}, "required": ["value"]}, "type": "ENUM", "values": ["armedAway", "armedStay", "disarmed"], "enumCommands": [{"command": "armStay", "value": "armedStay"}, {"command": "armAway", "value": "armedAway"}, {"command": "disarm", "value": "disarmed"}]}, "alarm": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"$ref": "String"}}, "required": ["value"]}, "type": "STRING"}}, "commands": {"armStay": {"arguments": [{"name": "bypassAll", "required": true, "schema": {"type": "boolean"}, "type": "BOOLEAN"}]}, "armAway": {"arguments": [{"name": "bypassAll", "required": true, "schema": {"type": "boolean"}, "type": "BOOLEAN"}]}, "disarm": {"arguments": []}}, "public": false, "id": "securitySystem", "version": 1}]]
