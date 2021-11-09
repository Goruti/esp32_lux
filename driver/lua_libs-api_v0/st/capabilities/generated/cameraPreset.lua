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

return [[{"id": "cameraPreset", "version": 1, "status": "proposed", "public": true, "name": "Camera Preset", "attributes": {"presets": {"type": "JSON_OBJECT", "schema": {"type": "object", "properties": {"value": {"type": "array", "items": {"title": "Camera Preset", "type": "object", "additionalProperties": false, "properties": {"name": {"type": "string"}, "id": {"type": "string"}, "data": {"$ref": "JsonObject"}}, "required": ["name", "id", "data"]}}}, "additionalProperties": false, "required": ["value"]}, "enumCommands": []}}, "commands": {"execute": {"arguments": [{"name": "id", "required": true, "type": "STRING", "schema": {"type": "string"}}]}, "create": {"arguments": [{"name": "name", "required": true, "type": "STRING", "schema": {"title": "String", "type": "string", "maxLength": 255}}, {"name": "id", "required": false, "type": "STRING", "schema": {"title": "String", "type": "string", "maxLength": 255}}, {"name": "data", "required": false, "type": "JSON_OBJECT", "schema": {"$ref": "JsonObject"}}]}, "delete": {"arguments": [{"name": "id", "required": true, "type": "STRING", "schema": {"type": "string"}}]}, "update": {"arguments": [{"name": "id", "required": true, "type": "STRING", "schema": {"title": "String", "type": "string", "maxLength": 255}}, {"name": "name", "required": false, "type": "STRING", "schema": {"title": "String", "type": "string", "maxLength": 255}}, {"name": "data", "required": false, "type": "JSON_OBJECT", "schema": {"$ref": "JsonObject"}}]}}}]]
