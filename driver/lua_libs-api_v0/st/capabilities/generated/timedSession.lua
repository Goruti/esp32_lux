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

return [[{"name": "Timed Session", "status": "proposed", "attributes": {"sessionStatus": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "string", "enum": ["canceled", "paused", "running", "stopped"]}, "constraints": {"type": "object", "additionalProperties": false, "properties": {"values": {"type": "array", "items": {"type": "string", "enum": ["canceled", "paused", "running", "stopped"]}}}}}, "required": ["value"]}, "type": "ENUM", "values": ["canceled", "paused", "running", "stopped"], "enumCommands": [{"command": "cancel", "value": "canceled"}, {"command": "pause", "value": "paused"}, {"command": "start", "value": "running"}, {"command": "stop", "value": "stopped"}]}, "completionTime": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"$ref": "Iso8601Date"}}, "required": ["value"]}, "type": "DATE", "setter": "setCompletionTime"}}, "commands": {"cancel": {"arguments": []}, "pause": {"arguments": []}, "setCompletionTime": {"arguments": [{"name": "completionTime", "required": true, "schema": {"$ref": "Iso8601Date"}, "type": "DATE"}]}, "start": {"arguments": []}, "stop": {"arguments": []}}, "public": true, "id": "timedSession", "version": 1}]]
