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

return [[{"name": "Demand Response Load Control", "status": "proposed", "attributes": {"drlcStatus": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"$ref": "DemandResponseLoadControlStatus"}}, "required": ["value"]}, "type": "JSON_OBJECT"}}, "commands": {"requestDrlcAction": {"arguments": [{"name": "drlcType", "required": true, "schema": {"$ref": "DrlcType"}, "type": "NUMBER"}, {"name": "drlcLevel", "required": true, "schema": {"$ref": "DrlcLevel"}, "type": "NUMBER"}, {"name": "start", "required": true, "schema": {"$ref": "Iso8601Date"}, "type": "STRING"}, {"name": "duration", "required": true, "schema": {"$ref": "PositiveInteger"}, "type": "NUMBER"}, {"name": "reportingPeriod", "schema": {"$ref": "PositiveInteger"}, "type": "NUMBER", "required": false}]}, "overrideDrlcAction": {"arguments": [{"name": "value", "required": true, "schema": {"type": "boolean"}, "type": "BOOLEAN"}]}}, "public": true, "id": "demandResponseLoadControl", "ocfResourceType": "oic.r.energy.drlc", "version": 1}]]
