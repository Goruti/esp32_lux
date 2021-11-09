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
    
-- THIS CODE IS AUTOMATICALLY GENERATED BY zwave_lib_generator/gen.py.  DO NOT HAND EDIT.
--
-- Generator script revision: b'a686d7136f2660129d59035a67b283a2364a2c55'
-- Protocol definition XML version: 2.7.4

local zw = require "st.zwave"
local buf = require "st.zwave.utils.buf"
local utils = require "st.utils"

--- @class st.zwave.CommandClass.ManufacturerProprietary
--- @alias ManufacturerProprietary st.zwave.CommandClass.ManufacturerProprietary
---
--- Supported versions: 1
---
local ManufacturerProprietary = {}

ManufacturerProprietary._commands = {
}

--- Instantiate a versioned instance of the ManufacturerProprietary Command Class module, optionally setting strict to require explicit passing of all parameters to constructors.
---
--- @param params st.zwave.CommandClass.Params command class instance parameters
--- @return st.zwave.CommandClass.ManufacturerProprietary versioned command class instance
function ManufacturerProprietary:init(params)
  local version = params and params.version or nil
  if (params or {}).strict ~= nil then
  local strict = params.strict
  else
  local strict = true -- default
  end
  local strict = params and params.strict or nil
  assert(version == nil or zw._versions[zw.MANUFACTURER_PROPRIETARY][version] ~= nil, "unsupported version")
  assert(strict == nil or type(strict) == "boolean", "strict must be a boolean")
  local mt = {
    __index = self
  }
  local instance = setmetatable({}, mt)
  instance._serialization_version = version
  instance._strict = strict
  return instance
end

setmetatable(ManufacturerProprietary, {
  __call = ManufacturerProprietary.init
})

ManufacturerProprietary._serialization_version = nil
ManufacturerProprietary._strict = false
zw._deserialization_versions = zw.deserialization_versions or {}
zw._versions = zw._versions or {}
setmetatable(zw._deserialization_versions, { __index = zw._versions })
zw._versions[zw.MANUFACTURER_PROPRIETARY] = {
  [1] = true
}

ManufacturerProprietary._lut = {
  [0] = { -- dynamically versioned constructors
  },
  [1] = { -- version 1
  }
}

return ManufacturerProprietary
