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

return [[{"id": "ocf", "name": "Ocf", "status": "proposed", "attributes": {"n": {"schema": {"$ref": "StringAttribute"}, "type": "STRING", "actedOnBy": ["postOcfCommand"]}, "icv": {"schema": {"$ref": "StringAttribute"}, "type": "STRING", "actedOnBy": ["postOcfCommand"]}, "dmv": {"schema": {"$ref": "StringAttribute"}, "type": "STRING", "actedOnBy": ["postOcfCommand"]}, "di": {"schema": {"$ref": "StringAttribute"}, "type": "STRING", "actedOnBy": ["postOcfCommand"]}, "pi": {"schema": {"$ref": "StringAttribute"}, "type": "STRING", "actedOnBy": ["postOcfCommand"]}, "mnmn": {"schema": {"$ref": "StringAttribute"}, "type": "STRING", "actedOnBy": ["postOcfCommand"]}, "mnml": {"schema": {"$ref": "StringAttribute"}, "type": "STRING", "actedOnBy": ["postOcfCommand"]}, "mnmo": {"schema": {"$ref": "StringAttribute"}, "type": "STRING", "actedOnBy": ["postOcfCommand"]}, "mndt": {"schema": {"$ref": "StringAttribute"}, "type": "STRING", "actedOnBy": ["postOcfCommand"]}, "mnpv": {"schema": {"$ref": "StringAttribute"}, "type": "STRING", "actedOnBy": ["postOcfCommand"]}, "mnos": {"schema": {"$ref": "StringAttribute"}, "type": "STRING", "actedOnBy": ["postOcfCommand"]}, "mnhw": {"schema": {"$ref": "StringAttribute"}, "type": "STRING", "actedOnBy": ["postOcfCommand"]}, "mnfv": {"schema": {"$ref": "StringAttribute"}, "type": "STRING", "actedOnBy": ["postOcfCommand"]}, "mnsl": {"schema": {"$ref": "StringAttribute"}, "type": "STRING", "actedOnBy": ["postOcfCommand"]}, "st": {"schema": {"$ref": "StringAttribute"}, "type": "STRING", "actedOnBy": ["postOcfCommand"]}, "vid": {"schema": {"$ref": "StringAttribute"}, "type": "STRING", "actedOnBy": ["postOcfCommand"]}}, "commands": {"postOcfCommand": {"arguments": [{"name": "href", "required": true, "schema": {"$ref": "String"}, "type": "STRING"}, {"name": "value", "required": true, "schema": {"$ref": "JsonObject"}, "type": "JSON_OBJECT"}]}}, "public": false, "version": 1}]]
