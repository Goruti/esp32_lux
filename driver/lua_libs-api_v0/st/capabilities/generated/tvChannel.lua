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

return [[{"name": "Tv Channel", "status": "proposed", "attributes": {"tvChannel": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"$ref": "String"}}}, "type": "STRING", "setter": "setTvChannel", "actedOnBy": ["channelDown", "channelUp"]}, "tvChannelName": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"$ref": "String"}}}, "type": "STRING", "setter": "setTvChannelName"}}, "commands": {"setTvChannel": {"arguments": [{"name": "tvChannel", "required": true, "schema": {"$ref": "String"}, "type": "STRING"}]}, "channelUp": {"arguments": []}, "channelDown": {"arguments": []}, "setTvChannelName": {"arguments": [{"name": "tvChannelName", "required": false, "schema": {"$ref": "String"}, "type": "STRING"}]}}, "public": true, "id": "tvChannel", "ocfResourceType": "x.com.st.tvchannel", "version": 1}]]
