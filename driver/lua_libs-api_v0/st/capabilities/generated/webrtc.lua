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

return [[{"name": "webrtc", "status": "live", "attributes": {"supportedFeatures": {"type": "JSON_OBJECT", "schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "array", "items": {"type": "string"}}}, "required": ["value"]}}, "audioOnly": {"type": "BOOLEAN", "schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "boolean"}}, "required": ["value"]}}, "sdpAnswer": {"type": "JSON_OBJECT", "schema": {"type": "object", "properties": {"value": {"type": "object", "additionalProperties": false, "properties": {"id": {"type": "string"}, "sdp": {"type": "string"}, "turn_url": {"type": "string"}, "turn_user": {"type": "string"}, "turn_pwd": {"type": "string"}}, "required": ["id", "sdp"]}}, "additionalProperties": false, "required": ["value"]}}, "talkback": {"type": "BOOLEAN", "schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "boolean"}}, "required": ["value"]}}, "stunUrl": {"type": "STRING", "schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"$ref": "URL"}}, "required": ["value"]}}}, "commands": {"sdpOffer": {"arguments": [{"name": "id", "required": true, "type": "STRING", "schema": {"type": "string"}}, {"name": "sdp", "required": true, "type": "STRING", "schema": {"type": "string"}}]}, "end": {"arguments": [{"name": "id", "required": true, "type": "STRING", "schema": {"type": "string"}}]}}, "public": false, "id": "webrtc", "ocfResourceType": "x.com.st.webrtc", "version": 1}]]
