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

return [[{"name": "Video Clips", "status": "proposed", "attributes": {"videoClip": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"$ref": "VideoClip"}}, "required": ["value"]}, "type": "JSON_OBJECT", "actedOnBy": ["captureClip"]}}, "commands": {"captureClip": {"arguments": [{"name": "duration", "required": true, "schema": {"$ref": "PositiveInteger"}, "type": "NUMBER"}, {"name": "preFetch", "required": true, "schema": {"$ref": "PositiveInteger"}, "type": "NUMBER"}]}}, "public": true, "id": "videoClips", "version": 1}]]
