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

return [[{"id": "color", "status": "proposed", "public": true, "name": "Color", "attributes": {"colorValue": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "object", "additionalProperties": false, "properties": {"hue": {"type": "number", "minimum": 0.0, "maximum": 360.0}, "saturation": {"type": "number", "minimum": 0.0, "maximum": 100.0}}}}, "required": ["value"]}, "setter": "setColorValue", "type": "JSON_OBJECT"}}, "commands": {"setColorValue": {"arguments": [{"name": "colorValue", "required": true, "schema": {"type": "object", "additionalProperties": false, "properties": {"hue": {"type": "number", "minimum": 0.0, "maximum": 360.0}, "saturation": {"type": "number", "minimum": 0.0, "maximum": 100.0}}, "required": ["hue", "saturation"]}, "type": "JSON_OBJECT"}, {"name": "switchLevel", "schema": {"type": "integer", "minimum": 0, "maximum": 100}, "type": "NUMBER", "required": false}]}}, "version": 1}]]
