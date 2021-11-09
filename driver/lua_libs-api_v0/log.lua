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

local function get_log_wrapper(level_str)
  return function(str)
    print(string.format("%-5s || %s", level_str, str))
  end
end

if _envlibrequire ~= nil then
  return _envlibrequire("log")
else
  return {
    trace = get_log_wrapper("TRACE"),
    debug = get_log_wrapper("DEBUG"),
    info = get_log_wrapper("INFO"),
    warn = get_log_wrapper("WARN"),
    error = get_log_wrapper("ERROR")
  }
end