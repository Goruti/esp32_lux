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

--- @class st.zwave.CommandClass.Powerlevel
--- @alias Powerlevel st.zwave.CommandClass.Powerlevel
---
--- Supported versions: 1
---
--- @field public SET number 0x01 - POWERLEVEL_SET command id
--- @field public GET number 0x02 - POWERLEVEL_GET command id
--- @field public REPORT number 0x03 - POWERLEVEL_REPORT command id
--- @field public TEST_NODE_SET number 0x04 - POWERLEVEL_TEST_NODE_SET command id
--- @field public TEST_NODE_GET number 0x05 - POWERLEVEL_TEST_NODE_GET command id
--- @field public TEST_NODE_REPORT number 0x06 - POWERLEVEL_TEST_NODE_REPORT command id
local Powerlevel = {}
Powerlevel.SET = 0x01
Powerlevel.GET = 0x02
Powerlevel.REPORT = 0x03
Powerlevel.TEST_NODE_SET = 0x04
Powerlevel.TEST_NODE_GET = 0x05
Powerlevel.TEST_NODE_REPORT = 0x06

Powerlevel._commands = {
  [Powerlevel.SET] = "SET",
  [Powerlevel.GET] = "GET",
  [Powerlevel.REPORT] = "REPORT",
  [Powerlevel.TEST_NODE_SET] = "TEST_NODE_SET",
  [Powerlevel.TEST_NODE_GET] = "TEST_NODE_GET",
  [Powerlevel.TEST_NODE_REPORT] = "TEST_NODE_REPORT"
}

--- Instantiate a versioned instance of the Powerlevel Command Class module, optionally setting strict to require explicit passing of all parameters to constructors.
---
--- @param params st.zwave.CommandClass.Params command class instance parameters
--- @return st.zwave.CommandClass.Powerlevel versioned command class instance
function Powerlevel:init(params)
  local version = params and params.version or nil
  if (params or {}).strict ~= nil then
  local strict = params.strict
  else
  local strict = true -- default
  end
  local strict = params and params.strict or nil
  assert(version == nil or zw._versions[zw.POWERLEVEL][version] ~= nil, "unsupported version")
  assert(strict == nil or type(strict) == "boolean", "strict must be a boolean")
  local mt = {
    __index = self
  }
  local instance = setmetatable({}, mt)
  instance._serialization_version = version
  instance._strict = strict
  return instance
end

setmetatable(Powerlevel, {
  __call = Powerlevel.init
})

Powerlevel._serialization_version = nil
Powerlevel._strict = false
zw._deserialization_versions = zw.deserialization_versions or {}
zw._versions = zw._versions or {}
setmetatable(zw._deserialization_versions, { __index = zw._versions })
zw._versions[zw.POWERLEVEL] = {
  [1] = true
}

--- @class st.zwave.CommandClass.Powerlevel.SetV1Args
--- @alias SetV1Args st.zwave.CommandClass.Powerlevel.SetV1Args
--- @field public power_level integer see :lua:class:`Powerlevel.power_level <st.zwave.CommandClass.Powerlevel.power_level>`
--- @field public timeout integer [0,255]
local SetV1Args = {}

--- @class st.zwave.CommandClass.Powerlevel.SetV1:st.zwave.Command
--- @alias SetV1 st.zwave.CommandClass.Powerlevel.SetV1
---
--- v1 POWERLEVEL_SET
---
--- @field public cmd_class number 0x73
--- @field public cmd_id number 0x01
--- @field public version number 1
--- @field public args st.zwave.CommandClass.Powerlevel.SetV1Args command-specific arguments
local SetV1 = {}
setmetatable(SetV1, {
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

--- Initialize a v1 POWERLEVEL_SET object.
---
--- @param module st.zwave.CommandClass.Powerlevel command class module instance
--- @param args st.zwave.CommandClass.Powerlevel.SetV1Args command-specific arguments
function SetV1:init(module, args, ...)
  zw.Command._parse(self, module, zw.POWERLEVEL, Powerlevel.SET, 1, args, ...)
end

--- Serialize v1 POWERLEVEL_SET arguments.
---
--- @return string serialized payload
function SetV1:serialize()
  local writer = buf.Writer()
  local args = self.args
  writer:write_u8(args.power_level)
  writer:write_u8(args.timeout)
  return writer.buf
end

--- Deserialize a v1 POWERLEVEL_SET payload.
---
--- @return st.zwave.CommandClass.Powerlevel.SetV1Args deserialized arguments
function SetV1:deserialize()
  local reader = buf.Reader(self.payload)
  reader:read_u8("power_level")
  reader:read_u8("timeout")
  return reader.parsed
end

--- Return a deep copy of self.args, merging defaults for unset, but required parameters.
---
--- @param self st.zwave.CommandClass.Powerlevel.SetV1
--- @return st.zwave.CommandClass.Powerlevel.SetV1Args
function SetV1._defaults(self)
  local args = {}
  args.power_level = self.args.power_level or 0
  args.timeout = self.args.timeout or 0
  return args
end

--- Return a deep copy of self.args, merging defaults for all unset parameters.
---
--- @param self st.zwave.CommandClass.Powerlevel.SetV1
--- @return st.zwave.CommandClass.Powerlevel.SetV1Args
function SetV1._template(self)
  local args = self:_defaults()
  return args
end

--- Set defaults for any required, but unset arguments.
---
--- @param self st.zwave.CommandClass.Powerlevel.SetV1
function SetV1._set_defaults(self)
  local defaults = self:_defaults()
  utils.merge(self.args, defaults)
end

--- Set const reflectors to allow enum stringification.
---
--- @param self st.zwave.CommandClass.Powerlevel.SetV1
function SetV1._set_reflectors(self)
  local args = self.args
  args._reflect = args._reflect or {}
  args._reflect.power_level = function()
    return zw._reflect(
      Powerlevel._reflect_power_level,
      args.power_level
    )
  end
end

--- @class st.zwave.CommandClass.Powerlevel.GetV1Args
--- @alias GetV1Args st.zwave.CommandClass.Powerlevel.GetV1Args
local GetV1Args = {}

--- @class st.zwave.CommandClass.Powerlevel.GetV1:st.zwave.Command
--- @alias GetV1 st.zwave.CommandClass.Powerlevel.GetV1
---
--- v1 POWERLEVEL_GET
---
--- @field public cmd_class number 0x73
--- @field public cmd_id number 0x02
--- @field public version number 1
--- @field public args st.zwave.CommandClass.Powerlevel.GetV1Args command-specific arguments
local GetV1 = {}
setmetatable(GetV1, {
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

--- Initialize a v1 POWERLEVEL_GET object.
---
--- @param module st.zwave.CommandClass.Powerlevel command class module instance
--- @param args st.zwave.CommandClass.Powerlevel.GetV1Args command-specific arguments
function GetV1:init(module, args, ...)
  zw.Command._parse(self, module, zw.POWERLEVEL, Powerlevel.GET, 1, args, ...)
end

--- Serialize v1 POWERLEVEL_GET arguments.
---
--- @return string serialized payload
function GetV1:serialize()
  local writer = buf.Writer()
  return writer.buf
end

--- Deserialize a v1 POWERLEVEL_GET payload.
---
--- @return st.zwave.CommandClass.Powerlevel.GetV1Args deserialized arguments
function GetV1:deserialize()
  local reader = buf.Reader(self.payload)
  return reader.parsed
end

--- Return a deep copy of self.args, merging defaults for unset, but required parameters.
---
--- @param self st.zwave.CommandClass.Powerlevel.GetV1
--- @return st.zwave.CommandClass.Powerlevel.GetV1Args
function GetV1._defaults(self)
  return {}
end

--- Return a deep copy of self.args, merging defaults for all unset parameters.
---
--- @param self st.zwave.CommandClass.Powerlevel.GetV1
--- @return st.zwave.CommandClass.Powerlevel.GetV1Args
function GetV1._template(self)
  return {}
end

--- Set defaults for any required, but unset arguments.
---
--- @param self st.zwave.CommandClass.Powerlevel.GetV1
function GetV1._set_defaults(self)
  local defaults = self:_defaults()
  utils.merge(self.args, defaults)
end

--- Set const reflectors to allow enum stringification.
---
--- @param self st.zwave.CommandClass.Powerlevel.GetV1
function GetV1._set_reflectors(self)
end

--- @class st.zwave.CommandClass.Powerlevel.ReportV1Args
--- @alias ReportV1Args st.zwave.CommandClass.Powerlevel.ReportV1Args
--- @field public power_level integer see :lua:class:`Powerlevel.power_level <st.zwave.CommandClass.Powerlevel.power_level>`
--- @field public timeout integer [0,255]
local ReportV1Args = {}

--- @class st.zwave.CommandClass.Powerlevel.ReportV1:st.zwave.Command
--- @alias ReportV1 st.zwave.CommandClass.Powerlevel.ReportV1
---
--- v1 POWERLEVEL_REPORT
---
--- @field public cmd_class number 0x73
--- @field public cmd_id number 0x03
--- @field public version number 1
--- @field public args st.zwave.CommandClass.Powerlevel.ReportV1Args command-specific arguments
local ReportV1 = {}
setmetatable(ReportV1, {
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

--- Initialize a v1 POWERLEVEL_REPORT object.
---
--- @param module st.zwave.CommandClass.Powerlevel command class module instance
--- @param args st.zwave.CommandClass.Powerlevel.ReportV1Args command-specific arguments
function ReportV1:init(module, args, ...)
  zw.Command._parse(self, module, zw.POWERLEVEL, Powerlevel.REPORT, 1, args, ...)
end

--- Serialize v1 POWERLEVEL_REPORT arguments.
---
--- @return string serialized payload
function ReportV1:serialize()
  local writer = buf.Writer()
  local args = self.args
  writer:write_u8(args.power_level)
  writer:write_u8(args.timeout)
  return writer.buf
end

--- Deserialize a v1 POWERLEVEL_REPORT payload.
---
--- @return st.zwave.CommandClass.Powerlevel.ReportV1Args deserialized arguments
function ReportV1:deserialize()
  local reader = buf.Reader(self.payload)
  reader:read_u8("power_level")
  reader:read_u8("timeout")
  return reader.parsed
end

--- Return a deep copy of self.args, merging defaults for unset, but required parameters.
---
--- @param self st.zwave.CommandClass.Powerlevel.ReportV1
--- @return st.zwave.CommandClass.Powerlevel.ReportV1Args
function ReportV1._defaults(self)
  local args = {}
  args.power_level = self.args.power_level or 0
  args.timeout = self.args.timeout or 0
  return args
end

--- Return a deep copy of self.args, merging defaults for all unset parameters.
---
--- @param self st.zwave.CommandClass.Powerlevel.ReportV1
--- @return st.zwave.CommandClass.Powerlevel.ReportV1Args
function ReportV1._template(self)
  local args = self:_defaults()
  return args
end

--- Set defaults for any required, but unset arguments.
---
--- @param self st.zwave.CommandClass.Powerlevel.ReportV1
function ReportV1._set_defaults(self)
  local defaults = self:_defaults()
  utils.merge(self.args, defaults)
end

--- Set const reflectors to allow enum stringification.
---
--- @param self st.zwave.CommandClass.Powerlevel.ReportV1
function ReportV1._set_reflectors(self)
  local args = self.args
  args._reflect = args._reflect or {}
  args._reflect.power_level = function()
    return zw._reflect(
      Powerlevel._reflect_power_level,
      args.power_level
    )
  end
end

--- @class st.zwave.CommandClass.Powerlevel.TestNodeSetV1Args
--- @alias TestNodeSetV1Args st.zwave.CommandClass.Powerlevel.TestNodeSetV1Args
--- @field public test_node_id integer see :lua:class:`Powerlevel.test_node_id <st.zwave.CommandClass.Powerlevel.test_node_id>`
--- @field public power_level integer see :lua:class:`Powerlevel.power_level <st.zwave.CommandClass.Powerlevel.power_level>`
--- @field public test_frame_count integer [0,65535]
local TestNodeSetV1Args = {}

--- @class st.zwave.CommandClass.Powerlevel.TestNodeSetV1:st.zwave.Command
--- @alias TestNodeSetV1 st.zwave.CommandClass.Powerlevel.TestNodeSetV1
---
--- v1 POWERLEVEL_TEST_NODE_SET
---
--- @field public cmd_class number 0x73
--- @field public cmd_id number 0x04
--- @field public version number 1
--- @field public args st.zwave.CommandClass.Powerlevel.TestNodeSetV1Args command-specific arguments
local TestNodeSetV1 = {}
setmetatable(TestNodeSetV1, {
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

--- Initialize a v1 POWERLEVEL_TEST_NODE_SET object.
---
--- @param module st.zwave.CommandClass.Powerlevel command class module instance
--- @param args st.zwave.CommandClass.Powerlevel.TestNodeSetV1Args command-specific arguments
function TestNodeSetV1:init(module, args, ...)
  zw.Command._parse(self, module, zw.POWERLEVEL, Powerlevel.TEST_NODE_SET, 1, args, ...)
end

--- Serialize v1 POWERLEVEL_TEST_NODE_SET arguments.
---
--- @return string serialized payload
function TestNodeSetV1:serialize()
  local writer = buf.Writer()
  local args = self.args
  writer:write_u8(args.test_node_id)
  writer:write_u8(args.power_level)
  writer:write_be_u16(args.test_frame_count)
  return writer.buf
end

--- Deserialize a v1 POWERLEVEL_TEST_NODE_SET payload.
---
--- @return st.zwave.CommandClass.Powerlevel.TestNodeSetV1Args deserialized arguments
function TestNodeSetV1:deserialize()
  local reader = buf.Reader(self.payload)
  reader:read_u8("test_node_id")
  reader:read_u8("power_level")
  reader:read_be_u16("test_frame_count")
  return reader.parsed
end

--- Return a deep copy of self.args, merging defaults for unset, but required parameters.
---
--- @param self st.zwave.CommandClass.Powerlevel.TestNodeSetV1
--- @return st.zwave.CommandClass.Powerlevel.TestNodeSetV1Args
function TestNodeSetV1._defaults(self)
  local args = {}
  args.test_node_id = self.args.test_node_id or 0
  args.power_level = self.args.power_level or 0
  args.test_frame_count = self.args.test_frame_count or 0
  return args
end

--- Return a deep copy of self.args, merging defaults for all unset parameters.
---
--- @param self st.zwave.CommandClass.Powerlevel.TestNodeSetV1
--- @return st.zwave.CommandClass.Powerlevel.TestNodeSetV1Args
function TestNodeSetV1._template(self)
  local args = self:_defaults()
  return args
end

--- Set defaults for any required, but unset arguments.
---
--- @param self st.zwave.CommandClass.Powerlevel.TestNodeSetV1
function TestNodeSetV1._set_defaults(self)
  local defaults = self:_defaults()
  utils.merge(self.args, defaults)
end

--- Set const reflectors to allow enum stringification.
---
--- @param self st.zwave.CommandClass.Powerlevel.TestNodeSetV1
function TestNodeSetV1._set_reflectors(self)
  local args = self.args
  args._reflect = args._reflect or {}
  args._reflect.power_level = function()
    return zw._reflect(
      Powerlevel._reflect_power_level,
      args.power_level
    )
  end
end

--- @class st.zwave.CommandClass.Powerlevel.TestNodeGetV1Args
--- @alias TestNodeGetV1Args st.zwave.CommandClass.Powerlevel.TestNodeGetV1Args
local TestNodeGetV1Args = {}

--- @class st.zwave.CommandClass.Powerlevel.TestNodeGetV1:st.zwave.Command
--- @alias TestNodeGetV1 st.zwave.CommandClass.Powerlevel.TestNodeGetV1
---
--- v1 POWERLEVEL_TEST_NODE_GET
---
--- @field public cmd_class number 0x73
--- @field public cmd_id number 0x05
--- @field public version number 1
--- @field public args st.zwave.CommandClass.Powerlevel.TestNodeGetV1Args command-specific arguments
local TestNodeGetV1 = {}
setmetatable(TestNodeGetV1, {
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

--- Initialize a v1 POWERLEVEL_TEST_NODE_GET object.
---
--- @param module st.zwave.CommandClass.Powerlevel command class module instance
--- @param args st.zwave.CommandClass.Powerlevel.TestNodeGetV1Args command-specific arguments
function TestNodeGetV1:init(module, args, ...)
  zw.Command._parse(self, module, zw.POWERLEVEL, Powerlevel.TEST_NODE_GET, 1, args, ...)
end

--- Serialize v1 POWERLEVEL_TEST_NODE_GET arguments.
---
--- @return string serialized payload
function TestNodeGetV1:serialize()
  local writer = buf.Writer()
  return writer.buf
end

--- Deserialize a v1 POWERLEVEL_TEST_NODE_GET payload.
---
--- @return st.zwave.CommandClass.Powerlevel.TestNodeGetV1Args deserialized arguments
function TestNodeGetV1:deserialize()
  local reader = buf.Reader(self.payload)
  return reader.parsed
end

--- Return a deep copy of self.args, merging defaults for unset, but required parameters.
---
--- @param self st.zwave.CommandClass.Powerlevel.TestNodeGetV1
--- @return st.zwave.CommandClass.Powerlevel.TestNodeGetV1Args
function TestNodeGetV1._defaults(self)
  return {}
end

--- Return a deep copy of self.args, merging defaults for all unset parameters.
---
--- @param self st.zwave.CommandClass.Powerlevel.TestNodeGetV1
--- @return st.zwave.CommandClass.Powerlevel.TestNodeGetV1Args
function TestNodeGetV1._template(self)
  return {}
end

--- Set defaults for any required, but unset arguments.
---
--- @param self st.zwave.CommandClass.Powerlevel.TestNodeGetV1
function TestNodeGetV1._set_defaults(self)
  local defaults = self:_defaults()
  utils.merge(self.args, defaults)
end

--- Set const reflectors to allow enum stringification.
---
--- @param self st.zwave.CommandClass.Powerlevel.TestNodeGetV1
function TestNodeGetV1._set_reflectors(self)
end

--- @class st.zwave.CommandClass.Powerlevel.TestNodeReportV1Args
--- @alias TestNodeReportV1Args st.zwave.CommandClass.Powerlevel.TestNodeReportV1Args
--- @field public test_node_id integer see :lua:class:`Powerlevel.test_node_id <st.zwave.CommandClass.Powerlevel.test_node_id>`
--- @field public status_of_operation integer see :lua:class:`Powerlevel.status_of_operation <st.zwave.CommandClass.Powerlevel.status_of_operation>`
--- @field public test_frame_count integer [0,65535]
local TestNodeReportV1Args = {}

--- @class st.zwave.CommandClass.Powerlevel.TestNodeReportV1:st.zwave.Command
--- @alias TestNodeReportV1 st.zwave.CommandClass.Powerlevel.TestNodeReportV1
---
--- v1 POWERLEVEL_TEST_NODE_REPORT
---
--- @field public cmd_class number 0x73
--- @field public cmd_id number 0x06
--- @field public version number 1
--- @field public args st.zwave.CommandClass.Powerlevel.TestNodeReportV1Args command-specific arguments
local TestNodeReportV1 = {}
setmetatable(TestNodeReportV1, {
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

--- Initialize a v1 POWERLEVEL_TEST_NODE_REPORT object.
---
--- @param module st.zwave.CommandClass.Powerlevel command class module instance
--- @param args st.zwave.CommandClass.Powerlevel.TestNodeReportV1Args command-specific arguments
function TestNodeReportV1:init(module, args, ...)
  zw.Command._parse(self, module, zw.POWERLEVEL, Powerlevel.TEST_NODE_REPORT, 1, args, ...)
end

--- Serialize v1 POWERLEVEL_TEST_NODE_REPORT arguments.
---
--- @return string serialized payload
function TestNodeReportV1:serialize()
  local writer = buf.Writer()
  local args = self.args
  writer:write_u8(args.test_node_id)
  writer:write_u8(args.status_of_operation)
  writer:write_be_u16(args.test_frame_count)
  return writer.buf
end

--- Deserialize a v1 POWERLEVEL_TEST_NODE_REPORT payload.
---
--- @return st.zwave.CommandClass.Powerlevel.TestNodeReportV1Args deserialized arguments
function TestNodeReportV1:deserialize()
  local reader = buf.Reader(self.payload)
  reader:read_u8("test_node_id")
  reader:read_u8("status_of_operation")
  reader:read_be_u16("test_frame_count")
  return reader.parsed
end

--- Return a deep copy of self.args, merging defaults for unset, but required parameters.
---
--- @param self st.zwave.CommandClass.Powerlevel.TestNodeReportV1
--- @return st.zwave.CommandClass.Powerlevel.TestNodeReportV1Args
function TestNodeReportV1._defaults(self)
  local args = {}
  args.test_node_id = self.args.test_node_id or 0
  args.status_of_operation = self.args.status_of_operation or 0
  args.test_frame_count = self.args.test_frame_count or 0
  return args
end

--- Return a deep copy of self.args, merging defaults for all unset parameters.
---
--- @param self st.zwave.CommandClass.Powerlevel.TestNodeReportV1
--- @return st.zwave.CommandClass.Powerlevel.TestNodeReportV1Args
function TestNodeReportV1._template(self)
  local args = self:_defaults()
  return args
end

--- Set defaults for any required, but unset arguments.
---
--- @param self st.zwave.CommandClass.Powerlevel.TestNodeReportV1
function TestNodeReportV1._set_defaults(self)
  local defaults = self:_defaults()
  utils.merge(self.args, defaults)
end

--- Set const reflectors to allow enum stringification.
---
--- @param self st.zwave.CommandClass.Powerlevel.TestNodeReportV1
function TestNodeReportV1._set_reflectors(self)
  local args = self.args
  args._reflect = args._reflect or {}
  args._reflect.test_node_id = function()
    return zw._reflect(
      Powerlevel._reflect_test_node_id,
      args.test_node_id
    )
  end
  args._reflect = args._reflect or {}
  args._reflect.status_of_operation = function()
    return zw._reflect(
      Powerlevel._reflect_status_of_operation,
      args.status_of_operation
    )
  end
end

--- @class st.zwave.CommandClass.Powerlevel.Set
--- @alias _Set st.zwave.CommandClass.Powerlevel.Set
---
--- Dynamically versioned POWERLEVEL_SET
---
--- Supported versions: 1; unique base versions: 1
---
--- @field public cmd_class number 0x73
--- @field public cmd_id number 0x01
--- @field public version number 1
--- @field public args st.zwave.CommandClass.Powerlevel.SetV1Args
local _Set = {}
setmetatable(_Set, {
  __call = function(cls, self, ...)
    return cls:construct(self, ...)
  end,
})

--- Construct a POWERLEVEL_SET object at the module instance serialization version.
---
--- @param module st.zwave.CommandClass.Powerlevel command class module instance
--- @param args st.zwave.CommandClass.Powerlevel.SetV1Args command-specific arguments
--- @return st.zwave.CommandClass.Powerlevel.Set
function _Set:construct(module, args, ...)
  return zw.Command._construct(module, Powerlevel.SET, module._serialization_version, args, ...)
end

--- @class st.zwave.CommandClass.Powerlevel.Get
--- @alias _Get st.zwave.CommandClass.Powerlevel.Get
---
--- Dynamically versioned POWERLEVEL_GET
---
--- Supported versions: 1; unique base versions: 1
---
--- @field public cmd_class number 0x73
--- @field public cmd_id number 0x02
--- @field public version number 1
--- @field public args st.zwave.CommandClass.Powerlevel.GetV1Args
local _Get = {}
setmetatable(_Get, {
  __call = function(cls, self, ...)
    return cls:construct(self, ...)
  end,
})

--- Construct a POWERLEVEL_GET object at the module instance serialization version.
---
--- @param module st.zwave.CommandClass.Powerlevel command class module instance
--- @param args st.zwave.CommandClass.Powerlevel.GetV1Args command-specific arguments
--- @return st.zwave.CommandClass.Powerlevel.Get
function _Get:construct(module, args, ...)
  return zw.Command._construct(module, Powerlevel.GET, module._serialization_version, args, ...)
end

--- @class st.zwave.CommandClass.Powerlevel.Report
--- @alias _Report st.zwave.CommandClass.Powerlevel.Report
---
--- Dynamically versioned POWERLEVEL_REPORT
---
--- Supported versions: 1; unique base versions: 1
---
--- @field public cmd_class number 0x73
--- @field public cmd_id number 0x03
--- @field public version number 1
--- @field public args st.zwave.CommandClass.Powerlevel.ReportV1Args
local _Report = {}
setmetatable(_Report, {
  __call = function(cls, self, ...)
    return cls:construct(self, ...)
  end,
})

--- Construct a POWERLEVEL_REPORT object at the module instance serialization version.
---
--- @param module st.zwave.CommandClass.Powerlevel command class module instance
--- @param args st.zwave.CommandClass.Powerlevel.ReportV1Args command-specific arguments
--- @return st.zwave.CommandClass.Powerlevel.Report
function _Report:construct(module, args, ...)
  return zw.Command._construct(module, Powerlevel.REPORT, module._serialization_version, args, ...)
end

--- @class st.zwave.CommandClass.Powerlevel.TestNodeSet
--- @alias _TestNodeSet st.zwave.CommandClass.Powerlevel.TestNodeSet
---
--- Dynamically versioned POWERLEVEL_TEST_NODE_SET
---
--- Supported versions: 1; unique base versions: 1
---
--- @field public cmd_class number 0x73
--- @field public cmd_id number 0x04
--- @field public version number 1
--- @field public args st.zwave.CommandClass.Powerlevel.TestNodeSetV1Args
local _TestNodeSet = {}
setmetatable(_TestNodeSet, {
  __call = function(cls, self, ...)
    return cls:construct(self, ...)
  end,
})

--- Construct a POWERLEVEL_TEST_NODE_SET object at the module instance serialization version.
---
--- @param module st.zwave.CommandClass.Powerlevel command class module instance
--- @param args st.zwave.CommandClass.Powerlevel.TestNodeSetV1Args command-specific arguments
--- @return st.zwave.CommandClass.Powerlevel.TestNodeSet
function _TestNodeSet:construct(module, args, ...)
  return zw.Command._construct(module, Powerlevel.TEST_NODE_SET, module._serialization_version, args, ...)
end

--- @class st.zwave.CommandClass.Powerlevel.TestNodeGet
--- @alias _TestNodeGet st.zwave.CommandClass.Powerlevel.TestNodeGet
---
--- Dynamically versioned POWERLEVEL_TEST_NODE_GET
---
--- Supported versions: 1; unique base versions: 1
---
--- @field public cmd_class number 0x73
--- @field public cmd_id number 0x05
--- @field public version number 1
--- @field public args st.zwave.CommandClass.Powerlevel.TestNodeGetV1Args
local _TestNodeGet = {}
setmetatable(_TestNodeGet, {
  __call = function(cls, self, ...)
    return cls:construct(self, ...)
  end,
})

--- Construct a POWERLEVEL_TEST_NODE_GET object at the module instance serialization version.
---
--- @param module st.zwave.CommandClass.Powerlevel command class module instance
--- @param args st.zwave.CommandClass.Powerlevel.TestNodeGetV1Args command-specific arguments
--- @return st.zwave.CommandClass.Powerlevel.TestNodeGet
function _TestNodeGet:construct(module, args, ...)
  return zw.Command._construct(module, Powerlevel.TEST_NODE_GET, module._serialization_version, args, ...)
end

--- @class st.zwave.CommandClass.Powerlevel.TestNodeReport
--- @alias _TestNodeReport st.zwave.CommandClass.Powerlevel.TestNodeReport
---
--- Dynamically versioned POWERLEVEL_TEST_NODE_REPORT
---
--- Supported versions: 1; unique base versions: 1
---
--- @field public cmd_class number 0x73
--- @field public cmd_id number 0x06
--- @field public version number 1
--- @field public args st.zwave.CommandClass.Powerlevel.TestNodeReportV1Args
local _TestNodeReport = {}
setmetatable(_TestNodeReport, {
  __call = function(cls, self, ...)
    return cls:construct(self, ...)
  end,
})

--- Construct a POWERLEVEL_TEST_NODE_REPORT object at the module instance serialization version.
---
--- @param module st.zwave.CommandClass.Powerlevel command class module instance
--- @param args st.zwave.CommandClass.Powerlevel.TestNodeReportV1Args command-specific arguments
--- @return st.zwave.CommandClass.Powerlevel.TestNodeReport
function _TestNodeReport:construct(module, args, ...)
  return zw.Command._construct(module, Powerlevel.TEST_NODE_REPORT, module._serialization_version, args, ...)
end

Powerlevel.SetV1 = SetV1
Powerlevel.GetV1 = GetV1
Powerlevel.ReportV1 = ReportV1
Powerlevel.TestNodeSetV1 = TestNodeSetV1
Powerlevel.TestNodeGetV1 = TestNodeGetV1
Powerlevel.TestNodeReportV1 = TestNodeReportV1
Powerlevel.Set = _Set
Powerlevel.Get = _Get
Powerlevel.Report = _Report
Powerlevel.TestNodeSet = _TestNodeSet
Powerlevel.TestNodeGet = _TestNodeGet
Powerlevel.TestNodeReport = _TestNodeReport

Powerlevel._lut = {
  [0] = { -- dynamically versioned constructors
    [Powerlevel.SET] = Powerlevel.Set,
    [Powerlevel.GET] = Powerlevel.Get,
    [Powerlevel.REPORT] = Powerlevel.Report,
    [Powerlevel.TEST_NODE_SET] = Powerlevel.TestNodeSet,
    [Powerlevel.TEST_NODE_GET] = Powerlevel.TestNodeGet,
    [Powerlevel.TEST_NODE_REPORT] = Powerlevel.TestNodeReport
  },
  [1] = { -- version 1
    [Powerlevel.SET] = Powerlevel.SetV1,
    [Powerlevel.GET] = Powerlevel.GetV1,
    [Powerlevel.REPORT] = Powerlevel.ReportV1,
    [Powerlevel.TEST_NODE_SET] = Powerlevel.TestNodeSetV1,
    [Powerlevel.TEST_NODE_GET] = Powerlevel.TestNodeGetV1,
    [Powerlevel.TEST_NODE_REPORT] = Powerlevel.TestNodeReportV1
  }
}
--- @class st.zwave.CommandClass.Powerlevel.power_level
--- @alias power_level st.zwave.CommandClass.Powerlevel.power_level
--- @field public NORMAL_POWER number 0x00
--- @field public MINUS1D_BM number 0x01
--- @field public MINUS2D_BM number 0x02
--- @field public MINUS3D_BM number 0x03
--- @field public MINUS4D_BM number 0x04
--- @field public MINUS5D_BM number 0x05
--- @field public MINUS6D_BM number 0x06
--- @field public MINUS7D_BM number 0x07
--- @field public MINUS8D_BM number 0x08
--- @field public MINUS9D_BM number 0x09
local power_level = {
  NORMAL_POWER = 0x00,
  MINUS1D_BM = 0x01,
  MINUS2D_BM = 0x02,
  MINUS3D_BM = 0x03,
  MINUS4D_BM = 0x04,
  MINUS5D_BM = 0x05,
  MINUS6D_BM = 0x06,
  MINUS7D_BM = 0x07,
  MINUS8D_BM = 0x08,
  MINUS9D_BM = 0x09
}
Powerlevel.power_level = power_level
Powerlevel._reflect_power_level = zw._reflection_builder(Powerlevel.power_level)

--- @class st.zwave.CommandClass.Powerlevel.status_of_operation
--- @alias status_of_operation st.zwave.CommandClass.Powerlevel.status_of_operation
--- @field public ZW_TEST_FAILED number 0x00
--- @field public ZW_TEST_SUCCES number 0x01
--- @field public ZW_TEST_INPROGRESS number 0x02
local status_of_operation = {
  ZW_TEST_FAILED = 0x00,
  ZW_TEST_SUCCES = 0x01,
  ZW_TEST_INPROGRESS = 0x02
}
Powerlevel.status_of_operation = status_of_operation
Powerlevel._reflect_status_of_operation = zw._reflection_builder(Powerlevel.status_of_operation)

--- @class st.zwave.CommandClass.Powerlevel.test_node_id
--- @alias test_node_id st.zwave.CommandClass.Powerlevel.test_node_id
--- @field public ZW_TEST_NOT_A_NODEID number 0x00
local test_node_id = {
  ZW_TEST_NOT_A_NODEID = 0x00
}
Powerlevel.test_node_id = test_node_id
Powerlevel._reflect_test_node_id = zw._reflection_builder(Powerlevel.test_node_id)


return Powerlevel
