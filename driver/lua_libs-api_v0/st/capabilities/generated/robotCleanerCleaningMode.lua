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

return [[{"name": "Robot Cleaner Cleaning Mode", "status": "proposed", "attributes": {"robotCleanerCleaningMode": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "string", "enum": ["auto", "part", "repeat", "manual", "stop", "map"]}}, "required": ["value"]}, "type": "ENUM", "values": ["auto", "part", "repeat", "manual", "stop", "map"], "setter": "setRobotCleanerCleaningMode"}}, "commands": {"setRobotCleanerCleaningMode": {"arguments": [{"name": "mode", "required": true, "schema": {"type": "string", "enum": ["auto", "part", "repeat", "manual", "stop"]}, "type": "ENUM", "values": ["auto", "part", "repeat", "manual", "stop"]}]}}, "public": true, "id": "robotCleanerCleaningMode", "ocfResourceType": "x.com.st.robot.cleaner.cleaning", "version": 1}]]
