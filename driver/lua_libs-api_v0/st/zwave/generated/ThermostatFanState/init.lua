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

--- @class st.zwave.CommandClass.ThermostatFanState
--- @alias ThermostatFanState st.zwave.CommandClass.ThermostatFanState
---
--- Supported versions: 1,2
---
--- @field public GET number 0x02 - THERMOSTAT_FAN_STATE_GET command id
--- @field public REPORT number 0x03 - THERMOSTAT_FAN_STATE_REPORT command id
local ThermostatFanState = {}
ThermostatFanState.GET = 0x02
ThermostatFanState.REPORT = 0x03

ThermostatFanState._commands = {
  [ThermostatFanState.GET] = "GET",
  [ThermostatFanState.REPORT] = "REPORT"
}

--- Instantiate a versioned instance of the ThermostatFanState Command Class module, optionally setting strict to require explicit passing of all parameters to constructors.
---
--- @param params st.zwave.CommandClass.Params command class instance parameters
--- @return st.zwave.CommandClass.ThermostatFanState versioned command class instance
function ThermostatFanState:init(params)
  local version = params and params.version or nil
  if (params or {}).strict ~= nil then
  local strict = params.strict
  else
  local strict = true -- default
  end
  local strict = params and params.strict or nil
  assert(version == nil or zw._versions[zw.THERMOSTAT_FAN_STATE][version] ~= nil, "unsupported version")
  assert(strict == nil or type(strict) == "boolean", "strict must be a boolean")
  local mt = {
    __index = self
  }
  local instance = setmetatable({}, mt)
  instance._serialization_version = version
  instance._strict = strict
  return instance
end

setmetatable(ThermostatFanState, {
  __call = ThermostatFanState.init
})

ThermostatFanState._serialization_version = nil
ThermostatFanState._strict = false
zw._deserialization_versions = zw.deserialization_versions or {}
zw._versions = zw._versions or {}
setmetatable(zw._deserialization_versions, { __index = zw._versions })
zw._versions[zw.THERMOSTAT_FAN_STATE] = {
  [1] = true,
  [2] = true
}

--- @class st.zwave.CommandClass.ThermostatFanState.GetV1Args
--- @alias GetV1Args st.zwave.CommandClass.ThermostatFanState.GetV1Args
local GetV1Args = {}

--- @class st.zwave.CommandClass.ThermostatFanState.GetV1:st.zwave.Command
--- @alias GetV1 st.zwave.CommandClass.ThermostatFanState.GetV1
---
--- v1 and forward-compatible v2 THERMOSTAT_FAN_STATE_GET
---
--- @field public cmd_class number 0x45
--- @field public cmd_id number 0x02
--- @field public version number 1
--- @field public args st.zwave.CommandClass.ThermostatFanState.GetV1Args command-specific arguments
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

--- Initialize a v1 and forward-compatible v2 THERMOSTAT_FAN_STATE_GET object.
---
--- @param module st.zwave.CommandClass.ThermostatFanState command class module instance
--- @param args st.zwave.CommandClass.ThermostatFanState.GetV1Args command-specific arguments
function GetV1:init(module, args, ...)
  zw.Command._parse(self, module, zw.THERMOSTAT_FAN_STATE, ThermostatFanState.GET, 1, args, ...)
end

--- Serialize v1 or forward-compatible v2 THERMOSTAT_FAN_STATE_GET arguments.
---
--- @return string serialized payload
function GetV1:serialize()
  local writer = buf.Writer()
  return writer.buf
end

--- Deserialize a v1 or forward-compatible v2 THERMOSTAT_FAN_STATE_GET payload.
---
--- @return st.zwave.CommandClass.ThermostatFanState.GetV1Args deserialized arguments
function GetV1:deserialize()
  local reader = buf.Reader(self.payload)
  return reader.parsed
end

--- Return a deep copy of self.args, merging defaults for unset, but required parameters.
---
--- @param self st.zwave.CommandClass.ThermostatFanState.GetV1
--- @return st.zwave.CommandClass.ThermostatFanState.GetV1Args
function GetV1._defaults(self)
  return {}
end

--- Return a deep copy of self.args, merging defaults for all unset parameters.
---
--- @param self st.zwave.CommandClass.ThermostatFanState.GetV1
--- @return st.zwave.CommandClass.ThermostatFanState.GetV1Args
function GetV1._template(self)
  return {}
end

--- Set defaults for any required, but unset arguments.
---
--- @param self st.zwave.CommandClass.ThermostatFanState.GetV1
function GetV1._set_defaults(self)
  local defaults = self:_defaults()
  utils.merge(self.args, defaults)
end

--- Set const reflectors to allow enum stringification.
---
--- @param self st.zwave.CommandClass.ThermostatFanState.GetV1
function GetV1._set_reflectors(self)
end

--- @class st.zwave.CommandClass.ThermostatFanState.ReportV1Args
--- @alias ReportV1Args st.zwave.CommandClass.ThermostatFanState.ReportV1Args
--- @field public fan_operating_state integer see :lua:class:`ThermostatFanState.fan_operating_state <st.zwave.CommandClass.ThermostatFanState.fan_operating_state>`
local ReportV1Args = {}

--- @class st.zwave.CommandClass.ThermostatFanState.ReportV1:st.zwave.Command
--- @alias ReportV1 st.zwave.CommandClass.ThermostatFanState.ReportV1
---
--- v1 and forward-compatible v2 THERMOSTAT_FAN_STATE_REPORT
---
--- @field public cmd_class number 0x45
--- @field public cmd_id number 0x03
--- @field public version number 1
--- @field public args st.zwave.CommandClass.ThermostatFanState.ReportV1Args command-specific arguments
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

--- Initialize a v1 and forward-compatible v2 THERMOSTAT_FAN_STATE_REPORT object.
---
--- @param module st.zwave.CommandClass.ThermostatFanState command class module instance
--- @param args st.zwave.CommandClass.ThermostatFanState.ReportV1Args command-specific arguments
function ReportV1:init(module, args, ...)
  zw.Command._parse(self, module, zw.THERMOSTAT_FAN_STATE, ThermostatFanState.REPORT, 1, args, ...)
end

--- Serialize v1 or forward-compatible v2 THERMOSTAT_FAN_STATE_REPORT arguments.
---
--- @return string serialized payload
function ReportV1:serialize()
  local writer = buf.Writer()
  local args = self.args
  writer:write_bits(4, args.fan_operating_state)
  writer:write_bits(4, 0) -- reserved
  return writer.buf
end

--- Deserialize a v1 or forward-compatible v2 THERMOSTAT_FAN_STATE_REPORT payload.
---
--- @return st.zwave.CommandClass.ThermostatFanState.ReportV1Args deserialized arguments
function ReportV1:deserialize()
  local reader = buf.Reader(self.payload)
  reader:read_bits(4, "fan_operating_state")
  reader:read_bits(4) -- reserved
  return reader.parsed
end

--- Return a deep copy of self.args, merging defaults for unset, but required parameters.
---
--- @param self st.zwave.CommandClass.ThermostatFanState.ReportV1
--- @return st.zwave.CommandClass.ThermostatFanState.ReportV1Args
function ReportV1._defaults(self)
  local args = {}
  args.fan_operating_state = self.args.fan_operating_state or 0
  return args
end

--- Return a deep copy of self.args, merging defaults for all unset parameters.
---
--- @param self st.zwave.CommandClass.ThermostatFanState.ReportV1
--- @return st.zwave.CommandClass.ThermostatFanState.ReportV1Args
function ReportV1._template(self)
  local args = self:_defaults()
  return args
end

--- Set defaults for any required, but unset arguments.
---
--- @param self st.zwave.CommandClass.ThermostatFanState.ReportV1
function ReportV1._set_defaults(self)
  local defaults = self:_defaults()
  utils.merge(self.args, defaults)
end

--- Set const reflectors to allow enum stringification.
---
--- @param self st.zwave.CommandClass.ThermostatFanState.ReportV1
function ReportV1._set_reflectors(self)
  local args = self.args
  args._reflect = args._reflect or {}
  args._reflect.fan_operating_state = function()
    return zw._reflect(
      ThermostatFanState._reflect_fan_operating_state,
      args.fan_operating_state
    )
  end
end

--- @class st.zwave.CommandClass.ThermostatFanState.Get
--- @alias _Get st.zwave.CommandClass.ThermostatFanState.Get
---
--- Dynamically versioned THERMOSTAT_FAN_STATE_GET
---
--- Supported versions: 1,2; unique base versions: 1
---
--- @field public cmd_class number 0x45
--- @field public cmd_id number 0x02
--- @field public version number 1
--- @field public args st.zwave.CommandClass.ThermostatFanState.GetV1Args
local _Get = {}
setmetatable(_Get, {
  __call = function(cls, self, ...)
    return cls:construct(self, ...)
  end,
})

--- Construct a THERMOSTAT_FAN_STATE_GET object at the module instance serialization version.
---
--- @param module st.zwave.CommandClass.ThermostatFanState command class module instance
--- @param args st.zwave.CommandClass.ThermostatFanState.GetV1Args command-specific arguments
--- @return st.zwave.CommandClass.ThermostatFanState.Get
function _Get:construct(module, args, ...)
  return zw.Command._construct(module, ThermostatFanState.GET, module._serialization_version, args, ...)
end

--- @class st.zwave.CommandClass.ThermostatFanState.Report
--- @alias _Report st.zwave.CommandClass.ThermostatFanState.Report
---
--- Dynamically versioned THERMOSTAT_FAN_STATE_REPORT
---
--- Supported versions: 1,2; unique base versions: 1
---
--- @field public cmd_class number 0x45
--- @field public cmd_id number 0x03
--- @field public version number 1
--- @field public args st.zwave.CommandClass.ThermostatFanState.ReportV1Args
local _Report = {}
setmetatable(_Report, {
  __call = function(cls, self, ...)
    return cls:construct(self, ...)
  end,
})

--- Construct a THERMOSTAT_FAN_STATE_REPORT object at the module instance serialization version.
---
--- @param module st.zwave.CommandClass.ThermostatFanState command class module instance
--- @param args st.zwave.CommandClass.ThermostatFanState.ReportV1Args command-specific arguments
--- @return st.zwave.CommandClass.ThermostatFanState.Report
function _Report:construct(module, args, ...)
  return zw.Command._construct(module, ThermostatFanState.REPORT, module._serialization_version, args, ...)
end

ThermostatFanState.GetV1 = GetV1
ThermostatFanState.ReportV1 = ReportV1
ThermostatFanState.Get = _Get
ThermostatFanState.Report = _Report

ThermostatFanState._lut = {
  [0] = { -- dynamically versioned constructors
    [ThermostatFanState.GET] = ThermostatFanState.Get,
    [ThermostatFanState.REPORT] = ThermostatFanState.Report
  },
  [1] = { -- version 1
    [ThermostatFanState.GET] = ThermostatFanState.GetV1,
    [ThermostatFanState.REPORT] = ThermostatFanState.ReportV1
  },
  [2] = { -- version 2
    [ThermostatFanState.GET] = ThermostatFanState.GetV1,
    [ThermostatFanState.REPORT] = ThermostatFanState.ReportV1
  }
}
--- @class st.zwave.CommandClass.ThermostatFanState.fan_operating_state
--- @alias fan_operating_state st.zwave.CommandClass.ThermostatFanState.fan_operating_state
--- @field public IDLE number 0x00
--- @field public RUNNING number 0x01
--- @field public RUNNING_HIGH number 0x02
--- @field public RUNNING_MEDIUM number 0x03
--- @field public CIRCULATION number 0x04
--- @field public HUMIDITY_CIRCULATION number 0x05
--- @field public RIGHT_LEFT_CIRCULATION number 0x06
--- @field public UP_DOWN_CIRCULATION number 0x07
--- @field public QUIET_CIRCULATION number 0x08
local fan_operating_state = {
  IDLE = 0x00,
  RUNNING = 0x01,
  RUNNING_HIGH = 0x02,
  RUNNING_MEDIUM = 0x03,
  CIRCULATION = 0x04,
  HUMIDITY_CIRCULATION = 0x05,
  RIGHT_LEFT_CIRCULATION = 0x06,
  UP_DOWN_CIRCULATION = 0x07,
  QUIET_CIRCULATION = 0x08
}
ThermostatFanState.fan_operating_state = fan_operating_state
ThermostatFanState._reflect_fan_operating_state = zw._reflection_builder(ThermostatFanState.fan_operating_state)


return ThermostatFanState
