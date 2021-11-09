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
local path = require "path"
local yaml = require "yaml"

-- TODO: is there a way to handle this that isn't hardcoded?
-- TODO: handle this at the same time we are handling capability defs after
--       inventory is added
local canonical_preference_definitions = {
  humidityOffset = {
    title = "Humidity Offset",
    description = "Enter a percentage to adjust the humidity.",
    preferenceType = "integer",
    definition = {
      minimum = -10,
      maximum = 10,
      default = 0
    }
  },
  motionSensitivity = {
    definition={
      default="2",
      options={
        [0] = "disabled",
        [1] = "low",
        [2] = "medium",
        [3] = "high",
      },
    },
    description="Motion Sensitivity",
    preferenceType="enumeration",
    title="Motion Sensitivity",
  },
  password = {
    definition={
      stringType="password",
    },
    description="Password",
    preferenceType="string",
    title="Password",
  },
  presetPosition={
    definition={
      default=50,
      maximum=100,
      minimum=0,
    },
    description="Preset Position",
    preferenceType="integer",
    title="Preset Position",
  },
  reportingInterval={
    definition={
      default=12,
      maximum=1440,
      minimum=5,
    },
    description="Reporting interval (in minutes)",
    preferenceType="integer",
    title="Reporting Interval",
  },
  tempOffset={
    definition={
      default=0.0,
      maximum=10.0,
      minimum=-10.0,
    },
    description="Temperature Offset",
    preferenceType="number",
    title="TempOffset",
  },
  username={
    definition={
      stringType="text",
    },
    description="Username",
    preferenceType="string",
    title="Username",
  }
}

local utils = {}

utils.UNIT_TEST_FAILURE = function() end
utils.END_OF_TESTS = function() end

function utils.get_profile_definition(profile_file_name)
  local caller_path = path.Path(debug.getinfo(2, "S").source:sub(2))
  local src_path = caller_path:get_dir_pos("src") and caller_path:to_dir("src") or path.Path("")
  local profile_path = src_path:parent():append("profiles"):append(profile_file_name):to_string()
  local profile_file, message = io.open(profile_path)
  assert(profile_file, message)
  local raw_profile_table = yaml.eval(profile_file:read("a"))
  io.close(profile_file)
  local output_profile = { components = {}, preferences = {} }
  for _, comp in ipairs(raw_profile_table.components) do
    output_profile.components[comp.id] = comp
  end
  if (raw_profile_table.preferences ~= nil) then
    for _, pref in ipairs(raw_profile_table.preferences) do
      -- Inline preference
      if pref.title ~= nil then
        output_profile.preferences[pref.title] = pref
      end
      -- Canonical preference
      if pref.id ~= nil then
        output_profile.preferences[pref.id] = canonical_preference_definitions[pref.id]
      end
    end
  end
  return output_profile
end

return utils