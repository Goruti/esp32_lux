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

--- @class st.zwave.CommandClass.ApplicationCapability
--- @alias ApplicationCapability st.zwave.CommandClass.ApplicationCapability
---
--- Supported versions: 1
---
--- @field public COMMAND_COMMAND_CLASS_NOT_SUPPORTED number 0x01 - COMMAND_COMMAND_CLASS_NOT_SUPPORTED command id
local ApplicationCapability = {}
ApplicationCapability.COMMAND_COMMAND_CLASS_NOT_SUPPORTED = 0x01

ApplicationCapability._commands = {
  [ApplicationCapability.COMMAND_COMMAND_CLASS_NOT_SUPPORTED] = "COMMAND_COMMAND_CLASS_NOT_SUPPORTED"
}

--- Instantiate a versioned instance of the ApplicationCapability Command Class module, optionally setting strict to require explicit passing of all parameters to constructors.
---
--- @param params st.zwave.CommandClass.Params command class instance parameters
--- @return st.zwave.CommandClass.ApplicationCapability versioned command class instance
function ApplicationCapability:init(params)
  local version = params and params.version or nil
  if (params or {}).strict ~= nil then
  local strict = params.strict
  else
  local strict = true -- default
  end
  local strict = params and params.strict or nil
  assert(version == nil or zw._versions[zw.APPLICATION_CAPABILITY][version] ~= nil, "unsupported version")
  assert(strict == nil or type(strict) == "boolean", "strict must be a boolean")
  local mt = {
    __index = self
  }
  local instance = setmetatable({}, mt)
  instance._serialization_version = version
  instance._strict = strict
  return instance
end

setmetatable(ApplicationCapability, {
  __call = ApplicationCapability.init
})

ApplicationCapability._serialization_version = nil
ApplicationCapability._strict = false
zw._deserialization_versions = zw.deserialization_versions or {}
zw._versions = zw._versions or {}
setmetatable(zw._deserialization_versions, { __index = zw._versions })
zw._versions[zw.APPLICATION_CAPABILITY] = {
  [1] = true
}

--- @class st.zwave.CommandClass.ApplicationCapability.CommandCommandClassNotSupportedV1Args
--- @alias CommandCommandClassNotSupportedV1Args st.zwave.CommandClass.ApplicationCapability.CommandCommandClassNotSupportedV1Args
--- @field public dynamic boolean
--- @field public offending_command_class integer
--- @field public offending_command integer [0,255]
local CommandCommandClassNotSupportedV1Args = {}

--- @class st.zwave.CommandClass.ApplicationCapability.CommandCommandClassNotSupportedV1:st.zwave.Command
--- @alias CommandCommandClassNotSupportedV1 st.zwave.CommandClass.ApplicationCapability.CommandCommandClassNotSupportedV1
---
--- v1 COMMAND_COMMAND_CLASS_NOT_SUPPORTED
---
--- @field public cmd_class number 0x57
--- @field public cmd_id number 0x01
--- @field public version number 1
--- @field public args st.zwave.CommandClass.ApplicationCapability.CommandCommandClassNotSupportedV1Args command-specific arguments
local CommandCommandClassNotSupportedV1 = {}
setmetatable(CommandCommandClassNotSupportedV1, {
  __index = zw.Command,
  __call = function(cls, self, ...)
    local mt = {
      __index = function(tbl, key)
        if key == "payload" then
          return tbl:serialize()
        else
          return cls[key]
        end
      end,
      __tostring = zw.Command.pretty_print,
      __eq = zw.Command.equals
    }
    local instance = setmetatable({}, mt)
    instance:init(self, ...)
    return instance
  end,
})

--- Initialize a v1 COMMAND_COMMAND_CLASS_NOT_SUPPORTED object.
---
--- @param module st.zwave.CommandClass.ApplicationCapability command class module instance
--- @param args st.zwave.CommandClass.ApplicationCapability.CommandCommandClassNotSupportedV1Args command-specific arguments
function CommandCommandClassNotSupportedV1:init(module, args, ...)
  zw.Command._parse(self, module, zw.APPLICATION_CAPABILITY, ApplicationCapability.COMMAND_COMMAND_CLASS_NOT_SUPPORTED, 1, args, ...)
end

--- Serialize v1 COMMAND_COMMAND_CLASS_NOT_SUPPORTED arguments.
---
--- @return string serialized payload
function CommandCommandClassNotSupportedV1:serialize()
  local writer = buf.Writer()
  local args = self.args
  writer:write_bits(7, 0) -- reserved
  writer:write_bool(args.dynamic)
  writer:write_cmd_class(args.offending_command_class)
  writer:write_u8(args.offending_command)
  return writer.buf
end

--- Deserialize a v1 COMMAND_COMMAND_CLASS_NOT_SUPPORTED payload.
---
--- @return st.zwave.CommandClass.ApplicationCapability.CommandCommandClassNotSupportedV1Args deserialized arguments
function CommandCommandClassNotSupportedV1:deserialize()
  local reader = buf.Reader(self.payload)
  reader:read_bits(7) -- reserved
  reader:read_bool("dynamic")
  reader:read_cmd_class("offending_command_class")
  reader:read_u8("offending_command")
  return reader.parsed
end

--- Return a deep copy of self.args, merging defaults for unset, but required parameters.
---
--- @param self st.zwave.CommandClass.ApplicationCapability.CommandCommandClassNotSupportedV1
--- @return st.zwave.CommandClass.ApplicationCapability.CommandCommandClassNotSupportedV1Args
function CommandCommandClassNotSupportedV1._defaults(self)
  local args = {}
  args.dynamic = self.args.dynamic or false
  args.offending_command_class = self.args.offending_command_class or 0
  args.offending_command = self.args.offending_command or 0
  return args
end

--- Return a deep copy of self.args, merging defaults for all unset parameters.
---
--- @param self st.zwave.CommandClass.ApplicationCapability.CommandCommandClassNotSupportedV1
--- @return st.zwave.CommandClass.ApplicationCapability.CommandCommandClassNotSupportedV1Args
function CommandCommandClassNotSupportedV1._template(self)
  local args = self:_defaults()
  return args
end

--- Set defaults for any required, but unset arguments.
---
--- @param self st.zwave.CommandClass.ApplicationCapability.CommandCommandClassNotSupportedV1
function CommandCommandClassNotSupportedV1._set_defaults(self)
  local defaults = self:_defaults()
  utils.merge(self.args, defaults)
end

--- Set const reflectors to allow enum stringification.
---
--- @param self st.zwave.CommandClass.ApplicationCapability.CommandCommandClassNotSupportedV1
function CommandCommandClassNotSupportedV1._set_reflectors(self)
end

--- @class st.zwave.CommandClass.ApplicationCapability.CommandCommandClassNotSupported
--- @alias _CommandCommandClassNotSupported st.zwave.CommandClass.ApplicationCapability.CommandCommandClassNotSupported
---
--- Dynamically versioned COMMAND_COMMAND_CLASS_NOT_SUPPORTED
---
--- Supported versions: 1; unique base versions: 1
---
--- @field public cmd_class number 0x57
--- @field public cmd_id number 0x01
--- @field public version number 1
--- @field public args st.zwave.CommandClass.ApplicationCapability.CommandCommandClassNotSupportedV1Args
local _CommandCommandClassNotSupported = {}
setmetatable(_CommandCommandClassNotSupported, {
  __call = function(cls, self, ...)
    return cls:construct(self, ...)
  end,
})

--- Construct a COMMAND_COMMAND_CLASS_NOT_SUPPORTED object at the module instance serialization version.
---
--- @param module st.zwave.CommandClass.ApplicationCapability command class module instance
--- @param args st.zwave.CommandClass.ApplicationCapability.CommandCommandClassNotSupportedV1Args command-specific arguments
--- @return st.zwave.CommandClass.ApplicationCapability.CommandCommandClassNotSupported
function _CommandCommandClassNotSupported:construct(module, args, ...)
  return zw.Command._construct(module, ApplicationCapability.COMMAND_COMMAND_CLASS_NOT_SUPPORTED, module._serialization_version, args, ...)
end

ApplicationCapability.CommandCommandClassNotSupportedV1 = CommandCommandClassNotSupportedV1
ApplicationCapability.CommandCommandClassNotSupported = _CommandCommandClassNotSupported

ApplicationCapability._lut = {
  [0] = { -- dynamically versioned constructors
    [ApplicationCapability.COMMAND_COMMAND_CLASS_NOT_SUPPORTED] = ApplicationCapability.CommandCommandClassNotSupported
  },
  [1] = { -- version 1
    [ApplicationCapability.COMMAND_COMMAND_CLASS_NOT_SUPPORTED] = ApplicationCapability.CommandCommandClassNotSupportedV1
  }
}

return ApplicationCapability