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

return [[{"name": "Washer Mode", "status": "proposed", "attributes": {"washerMode": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"$ref": "WasherMode"}}, "required": ["value"]}, "type": "ENUM", "values": ["regular", "heavy", "rinse", "spinDry"], "setter": "setWasherMode"}}, "commands": {"setWasherMode": {"arguments": [{"name": "mode", "required": true, "schema": {"$ref": "WasherMode"}, "type": "ENUM", "values": ["regular", "heavy", "rinse", "spinDry"]}]}}, "public": true, "id": "washerMode", "ocfResourceType": "x.com.st.mode.washer", "version": 1}]]
