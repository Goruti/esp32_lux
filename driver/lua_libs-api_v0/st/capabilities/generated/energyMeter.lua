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

return [[{"name": "Energy Meter", "status": "live", "attributes": {"energy": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "number"}, "unit": {"type": "string", "enum": ["Wh", "kWh", "mWh", "kVAh"], "default": "kWh"}}, "required": ["value"]}, "type": "NUMBER"}}, "commands": {"resetEnergyMeter": {"arguments": []}}, "public": true, "id": "energyMeter", "ocfResourceType": "x.com.st.energymeter", "version": 1}]]