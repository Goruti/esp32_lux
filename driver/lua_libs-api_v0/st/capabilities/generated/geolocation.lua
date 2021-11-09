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

return [[{"id": "geolocation", "name": "Geolocation", "status": "proposed", "public": true, "attributes": {"latitude": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "integer", "maximum": 90, "minimum": -90}}}, "type": "NUMBER"}, "longitude": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "integer", "maximum": 180, "minimum": -180}}}, "type": "NUMBER"}, "method": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"$ref": "String"}}}, "type": "STRING"}, "accuracy": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "number", "minimum": 0}}}, "type": "NUMBER"}, "altitudeAccuracy": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "number", "minimum": 0}}}, "type": "NUMBER"}, "heading": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "number", "minimum": 0, "maximum": 360}}}, "type": "NUMBER"}, "speed": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "number", "minimum": 0}}}, "type": "NUMBER"}, "lastUpdateTime": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"$ref": "PositiveInteger"}}}, "type": "NUMBER"}}, "commands": {}, "version": 1}]]
