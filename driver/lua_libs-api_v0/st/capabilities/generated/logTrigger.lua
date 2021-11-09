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

return [[{"name": "Log Trigger", "status": "proposed", "attributes": {"logState": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "string", "enum": ["idle", "inProgress"]}}}, "type": "ENUM", "values": ["idle", "inProgress"]}, "logRequestState": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "string", "enum": ["idle", "triggerRequired"]}}}, "type": "ENUM", "values": ["idle", "triggerRequired"]}, "logInfo": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"$ref": "JsonObject"}}, "required": ["value"]}, "type": "JSON_OBJECT"}}, "commands": {"triggerLog": {"arguments": []}, "triggerLogWithLogInfo": {"arguments": [{"name": "logInfo", "required": true, "schema": {"$ref": "JsonObject"}, "type": "JSON_OBJECT"}]}, "triggerLogWithUrl": {"arguments": [{"name": "url", "required": false, "type": "STRING", "schema": {"$ref": "URL"}}]}}, "public": true, "id": "logTrigger", "version": 1}]]
