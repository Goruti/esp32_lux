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

return [[{"name": "Thermostat Fan Mode", "status": "live", "attributes": {"thermostatFanMode": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"$ref": "ThermostatFanMode"}, "data": {"type": "object", "additionalProperties": false, "properties": {"supportedThermostatFanModes": {"type": "array", "items": {"$ref": "ThermostatFanMode"}}}}}, "required": ["value"]}, "type": "ENUM", "values": ["auto", "circulate", "followschedule", "on"], "setter": "setThermostatFanMode", "enumCommands": [{"command": "fanAuto", "value": "auto"}, {"command": "fanCirculate", "value": "circulate"}, {"command": "fanOn", "value": "on"}]}, "supportedThermostatFanModes": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "array", "items": {"$ref": "ThermostatFanMode"}}}}, "type": "JSON_OBJECT"}}, "commands": {"fanAuto": {"arguments": []}, "fanCirculate": {"arguments": []}, "fanOn": {"arguments": []}, "setThermostatFanMode": {"arguments": [{"name": "mode", "required": true, "schema": {"$ref": "ThermostatFanMode"}, "type": "ENUM", "values": ["auto", "circulate", "followschedule", "on"]}]}}, "public": true, "id": "thermostatFanMode", "ocfResourceType": "x.com.st.mode.fan.thermostat", "version": 1}]]
