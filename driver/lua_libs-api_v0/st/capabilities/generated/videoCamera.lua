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

return [[{"name": "Video Camera", "status": "live", "attributes": {"camera": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "string", "enum": ["off", "on", "restarting", "unavailable"]}}}, "type": "ENUM", "values": ["off", "on", "restarting", "unavailable"], "enumCommands": [{"command": "on", "value": "on"}, {"command": "off", "value": "off"}]}, "mute": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"$ref": "MuteState"}}}, "type": "ENUM", "values": ["muted", "unmuted"], "enumCommands": [{"command": "mute", "value": "muted"}, {"command": "unmute", "value": "unmuted"}]}, "settings": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"$ref": "JsonObject"}}, "required": ["value"]}, "type": "JSON_OBJECT"}, "statusMessage": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"$ref": "String"}}}, "type": "STRING"}}, "commands": {"flip": {"arguments": []}, "mute": {"arguments": []}, "off": {"arguments": []}, "on": {"arguments": []}, "unmute": {"arguments": []}}, "public": false, "id": "videoCamera", "version": 1}]]
