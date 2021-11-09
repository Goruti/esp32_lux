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
local st_utils = require "st.utils"

--- @class st.zigbee.data_types.StringABC: st.zigbee.data_types.DataType
---
--- Classes being created using the StringABC class represent Zigbee data types whose lua "value" is stored
--- as a string.  In general these are the Zigbee data types CharString, OctetString, LongCharString,
--- and LongOctetString represented by IDs 0x41-0x44.  All of these are length prefixed and there is no difference
--- in the lua storage between Octet and Char strings.
local StringABC = {}

--- This function will create a new metatable with the appropriate functionality for a Zigbee String
--- @param base table the base meta table, this will include the ID and NAME of the type being represented
--- @param length_byte_length number the length in bytes of this String
function StringABC.new_mt(base, length_byte_length)
  local mt = {}
  mt.__index = base or {}
  mt.__index.length_byte_length = length_byte_length
  mt.__index.is_fixed_length = false
  mt.__index.is_discrete = true
  mt.__index._serialize = function(s)
    s:check_if_valid(s.value)
    return st_utils.serialize_int(s.byte_length, s.length_byte_length, false, true) .. s.value
  end
  mt.__index.get_length = function(self)
    return self.byte_length + self.length_byte_length
  end
  mt.__index.deserialize = function(buf, field_name)
    local o = {}
    setmetatable(o, mt)
    o.byte_length = buf:read_int(length_byte_length, false, true)
    o.value = buf:read_bytes(o.byte_length)
    o.field_name = field_name
    if #o.value < o.byte_length then
      error(string.format("Zigbee string reported length %d but was actually only %d bytes long", o.byte_length, #o.value))
      return nil
    end
    return o
  end
  mt.__index.pretty_print = function(self)
    return string.format("%s: \"%s\"", self.field_name or self.NAME, st_utils.get_print_safe_string(self.value))
  end
  mt.__index.check_if_valid = function(self, value)
    if type(value) ~= "string" then
      error(string.format("%s value must be a string", self.NAME), 2)
    end
  end
  mt.__newindex = function(self, k, v)
    if k == "value" then
      self:check_if_valid(v)
      rawset(self, k, v)
    else
      rawset(self, k, v)
    end
  end
  mt.__call = function(orig, value)
    local o = {}
    setmetatable(o, mt)
    o.byte_length = #value
    o.value = value
    return o
  end
  mt.__tostring = function(self)
    return self:pretty_print()
  end
  return mt
end

return StringABC
