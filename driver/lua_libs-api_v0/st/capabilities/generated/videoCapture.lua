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

return [[{"name": "Video Capture", "status": "live", "attributes": {"clip": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"$ref": "JsonObject"}}, "required": ["value"]}, "type": "JSON_OBJECT", "actedOnBy": ["capture"]}, "stream": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"$ref": "JsonObject"}}, "required": ["value"]}, "type": "JSON_OBJECT"}}, "commands": {"capture": {"arguments": [{"name": "startTime", "type": "DATE", "required": true, "schema": {"$ref": "Iso8601Date"}}, {"name": "captureTime", "type": "DATE", "required": true, "schema": {"$ref": "Iso8601Date"}}, {"name": "endTime", "type": "DATE", "required": true, "schema": {"$ref": "Iso8601Date"}}, {"name": "correlationId", "type": "STRING", "required": false, "schema": {"$ref": "String"}}, {"name": "reason", "type": "STRING", "required": false, "schema": {"$ref": "String"}}]}}, "public": false, "id": "videoCapture", "version": 1}]]
