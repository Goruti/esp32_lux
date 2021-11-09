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

return [[{"name": "Dew Point", "status": "proposed", "attributes": {"dewpoint": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"$ref": "TemperatureValue"}, "unit": {"$ref": "TemperatureUnit"}}, "required": ["value", "unit"]}, "type": "NUMBER"}}, "commands": {}, "public": true, "id": "dewPoint", "version": 1}]]
