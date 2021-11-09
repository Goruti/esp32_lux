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

return [[{"name": "Switch Level", "status": "live", "attributes": {"level": {"schema": {"$ref": "IntegerPercent"}, "type": "NUMBER", "setter": "setLevel"}}, "commands": {"setLevel": {"arguments": [{"name": "level", "schema": {"type": "integer", "minimum": 0, "maximum": 100}, "type": "NUMBER", "required": true}, {"name": "rate", "schema": {"$ref": "PositiveInteger"}, "type": "NUMBER", "required": false}]}}, "public": true, "id": "switchLevel", "ocfResourceType": "oic.r.light.dimming", "version": 1}]]
