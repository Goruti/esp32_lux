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

return [[{"name": "Color Control", "status": "live", "attributes": {"color": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"$ref": "String"}}}, "type": "STRING", "setter": "setColor", "actedOnBy": ["setHue", "setSaturation"]}, "hue": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"$ref": "PositiveNumber"}}}, "type": "NUMBER", "setter": "setHue"}, "saturation": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"$ref": "PositiveNumber"}}}, "type": "NUMBER", "setter": "setSaturation"}}, "commands": {"setColor": {"arguments": [{"name": "color", "required": true, "type": "COLOR_MAP", "schema": {"$ref": "color-map"}}]}, "setHue": {"arguments": [{"name": "hue", "required": true, "schema": {"$ref": "PositiveNumber"}, "type": "NUMBER"}]}, "setSaturation": {"arguments": [{"name": "saturation", "required": true, "schema": {"$ref": "PositiveNumber"}, "type": "NUMBER"}]}}, "public": true, "id": "colorControl", "ocfResourceType": "oic.r.colour.chroma", "version": 1}]]
