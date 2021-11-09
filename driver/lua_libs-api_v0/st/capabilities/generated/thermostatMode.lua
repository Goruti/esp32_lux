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

return [[{"name": "Thermostat Mode", "status": "live", "attributes": {"thermostatMode": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"$ref": "ThermostatMode"}, "data": {"type": "object", "additionalProperties": false, "properties": {"supportedThermostatModes": {"type": "array", "items": {"$ref": "ThermostatMode"}}}}}, "required": ["value"]}, "type": "ENUM", "values": ["asleep", "auto", "autowitheco", "autowithreset", "autochangeover", "autochangeoveractive", "autocool", "autoheat", "auxheatonly", "auxiliaryemergencyheat", "away", "cool", "custom", "dayoff", "dryair", "eco", "emergency heat", "emergencyheat", "emergencyheatactive", "energysavecool", "energysaveheat", "fanonly", "frostguard", "furnace", "heat", "heatingoff", "home", "in", "manual", "moistair", "off", "out", "resume", "rush hour", "rushhour", "schedule", "southernaway"], "setter": "setThermostatMode", "enumCommands": [{"command": "auto", "value": "auto"}, {"command": "cool", "value": "cool"}, {"command": "emergencyHeat", "value": "emergency heat"}, {"command": "heat", "value": "heat"}, {"command": "off", "value": "off"}]}, "supportedThermostatModes": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "array", "items": {"$ref": "ThermostatMode"}}}}, "type": "JSON_OBJECT"}}, "commands": {"auto": {"arguments": []}, "cool": {"arguments": []}, "emergencyHeat": {"arguments": []}, "heat": {"arguments": []}, "off": {"arguments": []}, "setThermostatMode": {"arguments": [{"name": "mode", "required": true, "schema": {"$ref": "ThermostatMode"}, "type": "ENUM", "values": ["asleep", "auto", "autowitheco", "autowithreset", "autochangeover", "autochangeoveractive", "autocool", "autoheat", "auxheatonly", "auxiliaryemergencyheat", "away", "cool", "custom", "dayoff", "dryair", "eco", "emergency heat", "emergencyheat", "emergencyheatactive", "energysavecool", "energysaveheat", "fanonly", "frostguard", "furnace", "heat", "heatingoff", "home", "in", "manual", "moistair", "off", "out", "resume", "rush hour", "rushhour", "schedule", "southernaway"]}]}}, "public": true, "id": "thermostatMode", "ocfResourceType": "x.com.st.mode.thermostat", "version": 1}]]
