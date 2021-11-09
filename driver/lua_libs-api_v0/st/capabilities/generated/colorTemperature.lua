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

return [[{"name": "Color Temperature", "status": "live", "attributes": {"colorTemperature": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "integer", "minimum": 1, "maximum": 30000}, "unit": {"type": "string", "enum": ["K"], "default": "K"}}, "required": ["value"]}, "type": "NUMBER", "setter": "setColorTemperature"}}, "commands": {"setColorTemperature": {"arguments": [{"name": "temperature", "required": true, "schema": {"type": "integer", "minimum": 1, "maximum": 30000}, "type": "NUMBER"}]}}, "public": true, "id": "colorTemperature", "ocfResourceType": "x.com.st.color.temperature", "version": 1}]]
