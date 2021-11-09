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

--- @class st.zwave.CommandClass.DoorLockLogging
--- @alias DoorLockLogging st.zwave.CommandClass.DoorLockLogging
---
--- Supported versions: 1
---
--- @field public RECORDS_SUPPORTED_GET number 0x01 - DOOR_LOCK_LOGGING_RECORDS_SUPPORTED_GET command id
--- @field public RECORDS_SUPPORTED_REPORT number 0x02 - DOOR_LOCK_LOGGING_RECORDS_SUPPORTED_REPORT command id
--- @field public RECORD_GET number 0x03 - RECORD_GET command id
--- @field public RECORD_REPORT number 0x04 - RECORD_REPORT command id
local DoorLockLogging = {}
DoorLockLogging.RECORDS_SUPPORTED_GET = 0x01
DoorLockLogging.RECORDS_SUPPORTED_REPORT = 0x02
DoorLockLogging.RECORD_GET = 0x03
DoorLockLogging.RECORD_REPORT = 0x04

DoorLockLogging._commands = {
  [DoorLockLogging.RECORDS_SUPPORTED_GET] = "RECORDS_SUPPORTED_GET",
  [DoorLockLogging.RECORDS_SUPPORTED_REPORT] = "RECORDS_SUPPORTED_REPORT",
  [DoorLockLogging.RECORD_GET] = "RECORD_GET",
  [DoorLockLogging.RECORD_REPORT] = "RECORD_REPORT"
}

--- Instantiate a versioned instance of the DoorLockLogging Command Class module, optionally setting strict to require explicit passing of all parameters to constructors.
---
--- @param params st.zwave.CommandClass.Params command class instance parameters
--- @return st.zwave.CommandClass.DoorLockLogging versioned command class instance
function DoorLockLogging:init(params)
  local version = params and params.version or nil
  if (params or {}).strict ~= nil then
  local strict = params.strict
  else
  local strict = true -- default
  end
  local strict = params and params.strict or nil
  assert(version == nil or zw._versions[zw.DOOR_LOCK_LOGGING][version] ~= nil, "unsupported version")
  assert(strict == nil or type(strict) == "boolean", "strict must be a boolean")
  local mt = {
    __index = self
  }
  local instance = setmetatable({}, mt)
  instance._serialization_version = version
  instance._strict = strict
  return instance
end

setmetatable(DoorLockLogging, {
  __call = DoorLockLogging.init
})

DoorLockLogging._serialization_version = nil
DoorLockLogging._strict = false
zw._deserialization_versions = zw.deserialization_versions or {}
zw._versions = zw._versions or {}
setmetatable(zw._deserialization_versions, { __index = zw._versions })
zw._versions[zw.DOOR_LOCK_LOGGING] = {
  [1] = true
}

--- @class st.zwave.CommandClass.DoorLockLogging.RecordsSupportedGetV1Args
--- @alias RecordsSupportedGetV1Args st.zwave.CommandClass.DoorLockLogging.RecordsSupportedGetV1Args
local RecordsSupportedGetV1Args = {}

--- @class st.zwave.CommandClass.DoorLockLogging.RecordsSupportedGetV1:st.zwave.Command
--- @alias RecordsSupportedGetV1 st.zwave.CommandClass.DoorLockLogging.RecordsSupportedGetV1
---
--- v1 DOOR_LOCK_LOGGING_RECORDS_SUPPORTED_GET
---
--- @field public cmd_class number 0x4C
--- @field public cmd_id number 0x01
--- @field public version number 1
--- @field public args st.zwave.CommandClass.DoorLockLogging.RecordsSupportedGetV1Args command-specific arguments
local RecordsSupportedGetV1 = {}
setmetatable(RecordsSupportedGetV1, {
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

--- Initialize a v1 DOOR_LOCK_LOGGING_RECORDS_SUPPORTED_GET object.
---
--- @param module st.zwave.CommandClass.DoorLockLogging command class module instance
--- @param args st.zwave.CommandClass.DoorLockLogging.RecordsSupportedGetV1Args command-specific arguments
function RecordsSupportedGetV1:init(module, args, ...)
  zw.Command._parse(self, module, zw.DOOR_LOCK_LOGGING, DoorLockLogging.RECORDS_SUPPORTED_GET, 1, args, ...)
end

--- Serialize v1 DOOR_LOCK_LOGGING_RECORDS_SUPPORTED_GET arguments.
---
--- @return string serialized payload
function RecordsSupportedGetV1:serialize()
  local writer = buf.Writer()
  return writer.buf
end

--- Deserialize a v1 DOOR_LOCK_LOGGING_RECORDS_SUPPORTED_GET payload.
---
--- @return st.zwave.CommandClass.DoorLockLogging.RecordsSupportedGetV1Args deserialized arguments
function RecordsSupportedGetV1:deserialize()
  local reader = buf.Reader(self.payload)
  return reader.parsed
end

--- Return a deep copy of self.args, merging defaults for unset, but required parameters.
---
--- @param self st.zwave.CommandClass.DoorLockLogging.RecordsSupportedGetV1
--- @return st.zwave.CommandClass.DoorLockLogging.RecordsSupportedGetV1Args
function RecordsSupportedGetV1._defaults(self)
  return {}
end

--- Return a deep copy of self.args, merging defaults for all unset parameters.
---
--- @param self st.zwave.CommandClass.DoorLockLogging.RecordsSupportedGetV1
--- @return st.zwave.CommandClass.DoorLockLogging.RecordsSupportedGetV1Args
function RecordsSupportedGetV1._template(self)
  return {}
end

--- Set defaults for any required, but unset arguments.
---
--- @param self st.zwave.CommandClass.DoorLockLogging.RecordsSupportedGetV1
function RecordsSupportedGetV1._set_defaults(self)
  local defaults = self:_defaults()
  utils.merge(self.args, defaults)
end

--- Set const reflectors to allow enum stringification.
---
--- @param self st.zwave.CommandClass.DoorLockLogging.RecordsSupportedGetV1
function RecordsSupportedGetV1._set_reflectors(self)
end

--- @class st.zwave.CommandClass.DoorLockLogging.RecordsSupportedReportV1Args
--- @alias RecordsSupportedReportV1Args st.zwave.CommandClass.DoorLockLogging.RecordsSupportedReportV1Args
--- @field public max_records_stored integer [0,255]
local RecordsSupportedReportV1Args = {}

--- @class st.zwave.CommandClass.DoorLockLogging.RecordsSupportedReportV1:st.zwave.Command
--- @alias RecordsSupportedReportV1 st.zwave.CommandClass.DoorLockLogging.RecordsSupportedReportV1
---
--- v1 DOOR_LOCK_LOGGING_RECORDS_SUPPORTED_REPORT
---
--- @field public cmd_class number 0x4C
--- @field public cmd_id number 0x02
--- @field public version number 1
--- @field public args st.zwave.CommandClass.DoorLockLogging.RecordsSupportedReportV1Args command-specific arguments
local RecordsSupportedReportV1 = {}
setmetatable(RecordsSupportedReportV1, {
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

--- Initialize a v1 DOOR_LOCK_LOGGING_RECORDS_SUPPORTED_REPORT object.
---
--- @param module st.zwave.CommandClass.DoorLockLogging command class module instance
--- @param args st.zwave.CommandClass.DoorLockLogging.RecordsSupportedReportV1Args command-specific arguments
function RecordsSupportedReportV1:init(module, args, ...)
  zw.Command._parse(self, module, zw.DOOR_LOCK_LOGGING, DoorLockLogging.RECORDS_SUPPORTED_REPORT, 1, args, ...)
end

--- Serialize v1 DOOR_LOCK_LOGGING_RECORDS_SUPPORTED_REPORT arguments.
---
--- @return string serialized payload
function RecordsSupportedReportV1:serialize()
  local writer = buf.Writer()
  local args = self.args
  writer:write_u8(args.max_records_stored)
  return writer.buf
end

--- Deserialize a v1 DOOR_LOCK_LOGGING_RECORDS_SUPPORTED_REPORT payload.
---
--- @return st.zwave.CommandClass.DoorLockLogging.RecordsSupportedReportV1Args deserialized arguments
function RecordsSupportedReportV1:deserialize()
  local reader = buf.Reader(self.payload)
  reader:read_u8("max_records_stored")
  return reader.parsed
end

--- Return a deep copy of self.args, merging defaults for unset, but required parameters.
---
--- @param self st.zwave.CommandClass.DoorLockLogging.RecordsSupportedReportV1
--- @return st.zwave.CommandClass.DoorLockLogging.RecordsSupportedReportV1Args
function RecordsSupportedReportV1._defaults(self)
  local args = {}
  args.max_records_stored = self.args.max_records_stored or 0
  return args
end

--- Return a deep copy of self.args, merging defaults for all unset parameters.
---
--- @param self st.zwave.CommandClass.DoorLockLogging.RecordsSupportedReportV1
--- @return st.zwave.CommandClass.DoorLockLogging.RecordsSupportedReportV1Args
function RecordsSupportedReportV1._template(self)
  local args = self:_defaults()
  return args
end

--- Set defaults for any required, but unset arguments.
---
--- @param self st.zwave.CommandClass.DoorLockLogging.RecordsSupportedReportV1
function RecordsSupportedReportV1._set_defaults(self)
  local defaults = self:_defaults()
  utils.merge(self.args, defaults)
end

--- Set const reflectors to allow enum stringification.
---
--- @param self st.zwave.CommandClass.DoorLockLogging.RecordsSupportedReportV1
function RecordsSupportedReportV1._set_reflectors(self)
end

--- @class st.zwave.CommandClass.DoorLockLogging.RecordGetV1Args
--- @alias RecordGetV1Args st.zwave.CommandClass.DoorLockLogging.RecordGetV1Args
--- @field public record_number integer [0,255]
local RecordGetV1Args = {}

--- @class st.zwave.CommandClass.DoorLockLogging.RecordGetV1:st.zwave.Command
--- @alias RecordGetV1 st.zwave.CommandClass.DoorLockLogging.RecordGetV1
---
--- v1 RECORD_GET
---
--- @field public cmd_class number 0x4C
--- @field public cmd_id number 0x03
--- @field public version number 1
--- @field public args st.zwave.CommandClass.DoorLockLogging.RecordGetV1Args command-specific arguments
local RecordGetV1 = {}
setmetatable(RecordGetV1, {
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

--- Initialize a v1 RECORD_GET object.
---
--- @param module st.zwave.CommandClass.DoorLockLogging command class module instance
--- @param args st.zwave.CommandClass.DoorLockLogging.RecordGetV1Args command-specific arguments
function RecordGetV1:init(module, args, ...)
  zw.Command._parse(self, module, zw.DOOR_LOCK_LOGGING, DoorLockLogging.RECORD_GET, 1, args, ...)
end

--- Serialize v1 RECORD_GET arguments.
---
--- @return string serialized payload
function RecordGetV1:serialize()
  local writer = buf.Writer()
  local args = self.args
  writer:write_u8(args.record_number)
  return writer.buf
end

--- Deserialize a v1 RECORD_GET payload.
---
--- @return st.zwave.CommandClass.DoorLockLogging.RecordGetV1Args deserialized arguments
function RecordGetV1:deserialize()
  local reader = buf.Reader(self.payload)
  reader:read_u8("record_number")
  return reader.parsed
end

--- Return a deep copy of self.args, merging defaults for unset, but required parameters.
---
--- @param self st.zwave.CommandClass.DoorLockLogging.RecordGetV1
--- @return st.zwave.CommandClass.DoorLockLogging.RecordGetV1Args
function RecordGetV1._defaults(self)
  local args = {}
  args.record_number = self.args.record_number or 0
  return args
end

--- Return a deep copy of self.args, merging defaults for all unset parameters.
---
--- @param self st.zwave.CommandClass.DoorLockLogging.RecordGetV1
--- @return st.zwave.CommandClass.DoorLockLogging.RecordGetV1Args
function RecordGetV1._template(self)
  local args = self:_defaults()
  return args
end

--- Set defaults for any required, but unset arguments.
---
--- @param self st.zwave.CommandClass.DoorLockLogging.RecordGetV1
function RecordGetV1._set_defaults(self)
  local defaults = self:_defaults()
  utils.merge(self.args, defaults)
end

--- Set const reflectors to allow enum stringification.
---
--- @param self st.zwave.CommandClass.DoorLockLogging.RecordGetV1
function RecordGetV1._set_reflectors(self)
end

--- @class st.zwave.CommandClass.DoorLockLogging.RecordReportV1Args
--- @alias RecordReportV1Args st.zwave.CommandClass.DoorLockLogging.RecordReportV1Args
--- @field public record_number integer [0,255]
--- @field public year integer [0,65535]
--- @field public month integer [0,255]
--- @field public day integer [0,255]
--- @field public hour_local_time integer [0,31]
--- @field public record_status integer [0,7]
--- @field public minute_local_time integer [0,255]
--- @field public second_local_time integer [0,255]
--- @field public event_type integer [0,255]
--- @field public user_identifier integer [0,255]
--- @field public user_code_length integer [0,255]
--- @field public user_code string
local RecordReportV1Args = {}

--- @class st.zwave.CommandClass.DoorLockLogging.RecordReportV1:st.zwave.Command
--- @alias RecordReportV1 st.zwave.CommandClass.DoorLockLogging.RecordReportV1
---
--- v1 RECORD_REPORT
---
--- @field public cmd_class number 0x4C
--- @field public cmd_id number 0x04
--- @field public version number 1
--- @field public args st.zwave.CommandClass.DoorLockLogging.RecordReportV1Args command-specific arguments
local RecordReportV1 = {}
setmetatable(RecordReportV1, {
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

--- Initialize a v1 RECORD_REPORT object.
---
--- @param module st.zwave.CommandClass.DoorLockLogging command class module instance
--- @param args st.zwave.CommandClass.DoorLockLogging.RecordReportV1Args command-specific arguments
function RecordReportV1:init(module, args, ...)
  zw.Command._parse(self, module, zw.DOOR_LOCK_LOGGING, DoorLockLogging.RECORD_REPORT, 1, args, ...)
end

--- Serialize v1 RECORD_REPORT arguments.
---
--- @return string serialized payload
function RecordReportV1:serialize()
  local writer = buf.Writer()
  local args = self.args
  writer:write_u8(args.record_number)
  writer:write_be_u16(args.year)
  writer:write_u8(args.month)
  writer:write_u8(args.day)
  writer:write_bits(5, args.hour_local_time)
  writer:write_bits(3, args.record_status)
  writer:write_u8(args.minute_local_time)
  writer:write_u8(args.second_local_time)
  writer:write_u8(args.event_type)
  writer:write_u8(args.user_identifier)
  writer:write_u8(args.user_code_length)
  writer:write_bytes(args.user_code)
  return writer.buf
end

--- Deserialize a v1 RECORD_REPORT payload.
---
--- @return st.zwave.CommandClass.DoorLockLogging.RecordReportV1Args deserialized arguments
function RecordReportV1:deserialize()
  local reader = buf.Reader(self.payload)
  reader:read_u8("record_number")
  reader:read_be_u16("year")
  reader:read_u8("month")
  reader:read_u8("day")
  reader:read_bits(5, "hour_local_time")
  reader:read_bits(3, "record_status")
  reader:read_u8("minute_local_time")
  reader:read_u8("second_local_time")
  reader:read_u8("event_type")
  reader:read_u8("user_identifier")
  reader:read_u8("user_code_length")
  reader:read_bytes(reader:remain(), "user_code")
  return reader.parsed
end

--- Return a deep copy of self.args, merging defaults for unset, but required parameters.
---
--- @param self st.zwave.CommandClass.DoorLockLogging.RecordReportV1
--- @return st.zwave.CommandClass.DoorLockLogging.RecordReportV1Args
function RecordReportV1._defaults(self)
  local args = {}
  args.record_number = self.args.record_number or 0
  args.year = self.args.year or 0
  args.month = self.args.month or 0
  args.day = self.args.day or 0
  args.hour_local_time = self.args.hour_local_time or 0
  args.record_status = self.args.record_status or 0
  args.minute_local_time = self.args.minute_local_time or 0
  args.second_local_time = self.args.second_local_time or 0
  args.event_type = self.args.event_type or 0
  args.user_identifier = self.args.user_identifier or 0
  args.user_code_length = self.args.user_code_length or 0
  args.user_code = self.args.user_code or ""
  return args
end

--- Return a deep copy of self.args, merging defaults for all unset parameters.
---
--- @param self st.zwave.CommandClass.DoorLockLogging.RecordReportV1
--- @return st.zwave.CommandClass.DoorLockLogging.RecordReportV1Args
function RecordReportV1._template(self)
  local args = self:_defaults()
  return args
end

--- Set defaults for any required, but unset arguments.
---
--- @param self st.zwave.CommandClass.DoorLockLogging.RecordReportV1
function RecordReportV1._set_defaults(self)
  local defaults = self:_defaults()
  utils.merge(self.args, defaults)
end

--- Set const reflectors to allow enum stringification.
---
--- @param self st.zwave.CommandClass.DoorLockLogging.RecordReportV1
function RecordReportV1._set_reflectors(self)
end

--- @class st.zwave.CommandClass.DoorLockLogging.RecordsSupportedGet
--- @alias _RecordsSupportedGet st.zwave.CommandClass.DoorLockLogging.RecordsSupportedGet
---
--- Dynamically versioned DOOR_LOCK_LOGGING_RECORDS_SUPPORTED_GET
---
--- Supported versions: 1; unique base versions: 1
---
--- @field public cmd_class number 0x4C
--- @field public cmd_id number 0x01
--- @field public version number 1
--- @field public args st.zwave.CommandClass.DoorLockLogging.RecordsSupportedGetV1Args
local _RecordsSupportedGet = {}
setmetatable(_RecordsSupportedGet, {
  __call = function(cls, self, ...)
    return cls:construct(self, ...)
  end,
})

--- Construct a DOOR_LOCK_LOGGING_RECORDS_SUPPORTED_GET object at the module instance serialization version.
---
--- @param module st.zwave.CommandClass.DoorLockLogging command class module instance
--- @param args st.zwave.CommandClass.DoorLockLogging.RecordsSupportedGetV1Args command-specific arguments
--- @return st.zwave.CommandClass.DoorLockLogging.RecordsSupportedGet
function _RecordsSupportedGet:construct(module, args, ...)
  return zw.Command._construct(module, DoorLockLogging.RECORDS_SUPPORTED_GET, module._serialization_version, args, ...)
end

--- @class st.zwave.CommandClass.DoorLockLogging.RecordsSupportedReport
--- @alias _RecordsSupportedReport st.zwave.CommandClass.DoorLockLogging.RecordsSupportedReport
---
--- Dynamically versioned DOOR_LOCK_LOGGING_RECORDS_SUPPORTED_REPORT
---
--- Supported versions: 1; unique base versions: 1
---
--- @field public cmd_class number 0x4C
--- @field public cmd_id number 0x02
--- @field public version number 1
--- @field public args st.zwave.CommandClass.DoorLockLogging.RecordsSupportedReportV1Args
local _RecordsSupportedReport = {}
setmetatable(_RecordsSupportedReport, {
  __call = function(cls, self, ...)
    return cls:construct(self, ...)
  end,
})

--- Construct a DOOR_LOCK_LOGGING_RECORDS_SUPPORTED_REPORT object at the module instance serialization version.
---
--- @param module st.zwave.CommandClass.DoorLockLogging command class module instance
--- @param args st.zwave.CommandClass.DoorLockLogging.RecordsSupportedReportV1Args command-specific arguments
--- @return st.zwave.CommandClass.DoorLockLogging.RecordsSupportedReport
function _RecordsSupportedReport:construct(module, args, ...)
  return zw.Command._construct(module, DoorLockLogging.RECORDS_SUPPORTED_REPORT, module._serialization_version, args, ...)
end

--- @class st.zwave.CommandClass.DoorLockLogging.RecordGet
--- @alias _RecordGet st.zwave.CommandClass.DoorLockLogging.RecordGet
---
--- Dynamically versioned RECORD_GET
---
--- Supported versions: 1; unique base versions: 1
---
--- @field public cmd_class number 0x4C
--- @field public cmd_id number 0x03
--- @field public version number 1
--- @field public args st.zwave.CommandClass.DoorLockLogging.RecordGetV1Args
local _RecordGet = {}
setmetatable(_RecordGet, {
  __call = function(cls, self, ...)
    return cls:construct(self, ...)
  end,
})

--- Construct a RECORD_GET object at the module instance serialization version.
---
--- @param module st.zwave.CommandClass.DoorLockLogging command class module instance
--- @param args st.zwave.CommandClass.DoorLockLogging.RecordGetV1Args command-specific arguments
--- @return st.zwave.CommandClass.DoorLockLogging.RecordGet
function _RecordGet:construct(module, args, ...)
  return zw.Command._construct(module, DoorLockLogging.RECORD_GET, module._serialization_version, args, ...)
end

--- @class st.zwave.CommandClass.DoorLockLogging.RecordReport
--- @alias _RecordReport st.zwave.CommandClass.DoorLockLogging.RecordReport
---
--- Dynamically versioned RECORD_REPORT
---
--- Supported versions: 1; unique base versions: 1
---
--- @field public cmd_class number 0x4C
--- @field public cmd_id number 0x04
--- @field public version number 1
--- @field public args st.zwave.CommandClass.DoorLockLogging.RecordReportV1Args
local _RecordReport = {}
setmetatable(_RecordReport, {
  __call = function(cls, self, ...)
    return cls:construct(self, ...)
  end,
})

--- Construct a RECORD_REPORT object at the module instance serialization version.
---
--- @param module st.zwave.CommandClass.DoorLockLogging command class module instance
--- @param args st.zwave.CommandClass.DoorLockLogging.RecordReportV1Args command-specific arguments
--- @return st.zwave.CommandClass.DoorLockLogging.RecordReport
function _RecordReport:construct(module, args, ...)
  return zw.Command._construct(module, DoorLockLogging.RECORD_REPORT, module._serialization_version, args, ...)
end

DoorLockLogging.RecordsSupportedGetV1 = RecordsSupportedGetV1
DoorLockLogging.RecordsSupportedReportV1 = RecordsSupportedReportV1
DoorLockLogging.RecordGetV1 = RecordGetV1
DoorLockLogging.RecordReportV1 = RecordReportV1
DoorLockLogging.RecordsSupportedGet = _RecordsSupportedGet
DoorLockLogging.RecordsSupportedReport = _RecordsSupportedReport
DoorLockLogging.RecordGet = _RecordGet
DoorLockLogging.RecordReport = _RecordReport

DoorLockLogging._lut = {
  [0] = { -- dynamically versioned constructors
    [DoorLockLogging.RECORDS_SUPPORTED_GET] = DoorLockLogging.RecordsSupportedGet,
    [DoorLockLogging.RECORDS_SUPPORTED_REPORT] = DoorLockLogging.RecordsSupportedReport,
    [DoorLockLogging.RECORD_GET] = DoorLockLogging.RecordGet,
    [DoorLockLogging.RECORD_REPORT] = DoorLockLogging.RecordReport
  },
  [1] = { -- version 1
    [DoorLockLogging.RECORDS_SUPPORTED_GET] = DoorLockLogging.RecordsSupportedGetV1,
    [DoorLockLogging.RECORDS_SUPPORTED_REPORT] = DoorLockLogging.RecordsSupportedReportV1,
    [DoorLockLogging.RECORD_GET] = DoorLockLogging.RecordGetV1,
    [DoorLockLogging.RECORD_REPORT] = DoorLockLogging.RecordReportV1
  }
}

return DoorLockLogging
