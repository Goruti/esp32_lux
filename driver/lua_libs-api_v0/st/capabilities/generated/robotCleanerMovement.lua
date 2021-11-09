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

return [[{"name": "Robot Cleaner Movement", "status": "proposed", "attributes": {"robotCleanerMovement": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "string", "enum": ["homing", "idle", "charging", "alarm", "powerOff", "reserve", "point", "after", "cleaning", "pause"]}}, "required": ["value"]}, "type": "ENUM", "values": ["homing", "idle", "charging", "alarm", "powerOff", "reserve", "point", "after", "cleaning", "pause"], "setter": "setRobotCleanerMovement"}}, "commands": {"setRobotCleanerMovement": {"arguments": [{"name": "mode", "required": true, "schema": {"type": "string", "enum": ["homing", "idle", "charging", "alarm", "powerOff", "reserve", "point", "after", "cleaning", "pause"]}, "type": "ENUM", "values": ["homing", "idle", "charging", "alarm", "powerOff", "reserve", "point", "after", "cleaning", "pause"]}]}}, "public": true, "id": "robotCleanerMovement", "ocfResourceType": "x.com.st.robot.cleaner.movement", "version": 1}]]