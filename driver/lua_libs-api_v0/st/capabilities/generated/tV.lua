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

return [[{"name": "TV", "status": "live", "attributes": {"channel": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"$ref": "PositiveInteger"}}}, "type": "NUMBER", "actedOnBy": ["channelDown", "channelUp"]}, "movieMode": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"$ref": "String"}}}, "type": "STRING"}, "picture": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"$ref": "String"}}}, "type": "STRING"}, "power": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"$ref": "String"}}}, "type": "STRING"}, "sound": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"$ref": "String"}}}, "type": "STRING"}, "volume": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"$ref": "PositiveInteger"}}}, "type": "NUMBER", "actedOnBy": ["volumeDown", "volumeUp"]}}, "commands": {"channelDown": {"arguments": []}, "channelUp": {"arguments": []}, "volumeDown": {"arguments": []}, "volumeUp": {"arguments": []}}, "public": false, "id": "tV", "version": 1}]]
