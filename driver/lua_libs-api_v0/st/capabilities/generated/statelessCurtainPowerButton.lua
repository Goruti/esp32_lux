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

return [[{"name": "Stateless Curtain Power Button", "status": "proposed", "attributes": {"availableCurtainPowerButtons": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "array", "items": {"type": "string", "enum": ["open", "close", "pause"]}}}}, "type": "JSON_OBJECT"}}, "commands": {"setButton": {"arguments": [{"name": "button", "required": true, "schema": {"type": "string", "enum": ["open", "close", "pause"]}, "type": "ENUM", "values": ["open", "close", "pause"]}]}}, "public": true, "id": "statelessCurtainPowerButton", "version": 1}]]
