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

return [[{"name": "Geofence", "status": "proposed", "attributes": {"name": {"schema": {"type": "object", "properties": {"value": {"type": "string"}}, "additionalProperties": false, "required": ["value"]}, "setter": "setName", "type": "STRING"}, "geofence": {"schema": {"type": "object", "properties": {"value": {"$ref": "GeofenceRadiusData"}}, "additionalProperties": false, "required": ["value"]}, "setter": "setGeofence", "type": "JSON_OBJECT"}, "enableState": {"schema": {"type": "object", "properties": {"value": {"$ref": "EnableState"}}, "additionalProperties": false, "required": ["value"]}, "setter": "setEnableState", "type": "ENUM", "values": ["enabled", "disabled"]}}, "commands": {"setName": {"arguments": [{"name": "name", "required": true, "schema": {"type": "string"}, "type": "STRING"}]}, "setGeofence": {"arguments": [{"name": "geofence", "required": true, "schema": {"$ref": "GeofenceRadiusData"}, "type": "JSON_OBJECT"}]}, "setEnableState": {"arguments": [{"name": "enableState", "required": true, "schema": {"$ref": "EnableState"}, "type": "ENUM", "values": ["enabled", "disabled"]}]}}, "public": true, "id": "geofence", "ocfResourceType": "x.com.st.geofence", "version": 1}]]
