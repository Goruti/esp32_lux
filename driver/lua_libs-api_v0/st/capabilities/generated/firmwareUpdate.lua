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

return [[{"name": "Firmware Update", "status": "proposed", "attributes": {"availableVersion": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "string"}}}, "type": "STRING"}, "currentVersion": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "string"}}}, "type": "STRING"}, "lastUpdateTime": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"$ref": "Iso8601Date"}}}, "type": "DATE"}, "lastUpdateStatus": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "string", "enum": ["updateSucceeded", "updateFailed"]}}}, "type": "ENUM", "values": ["updateSucceeded", "updateFailed"]}, "lastUpdateStatusReason": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "string"}}}, "type": "STRING"}, "state": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "string", "enum": ["normalOperation", "updateInProgress"]}}}, "type": "ENUM", "values": ["normalOperation", "updateInProgress"]}}, "commands": {"checkForFirmwareUpdate": {"arguments": []}, "updateFirmware": {"arguments": []}}, "public": true, "id": "firmwareUpdate", "version": 1}]]
