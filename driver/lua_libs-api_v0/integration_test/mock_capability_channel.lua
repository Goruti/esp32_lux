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
local it_utils = require "integration_test.utils"
local json = require "dkjson"
local mock_generic_channel = require "integration_test.mock_generic_channel"

local MockCapabilityChannel = {}

function MockCapabilityChannel:__check_message_equality(expected, received)
  local decoded = json.decode(received[2])
  local parsed_received = {received[1], decoded}
  return st_utils.stringify_table(expected) == st_utils.stringify_table(parsed_received)
end

function MockCapabilityChannel:__error_messages_not_equal(expected, received)
  local decoded = json.decode(received[2])
  local parsed_received = {received[1], decoded}
  local error_message = string.format(
      "capability message channel send was expecting:\n%s\nbut received:\n%s",
      st_utils.stringify_table(expected),
      st_utils.stringify_table(parsed_received)
  )
  error({ code = it_utils.UNIT_TEST_FAILURE, msg = error_message, fatal = true })
end

function MockCapabilityChannel:__error_unexpected_message(received)
  local decoded = json.decode(received[2])
  local parsed_received = {received[1], decoded}
  local error_message = string.format(
      "capability message channel send was given unexpected message:\n%s",
      st_utils.stringify_table(parsed_received)
  )
  error({ code = it_utils.UNIT_TEST_FAILURE, msg = error_message, fatal = true })
end

function MockCapabilityChannel:__convert_to_receive_return(return_msg)
  return { return_msg[1], json.encode(return_msg[2]) }
end

setmetatable(MockCapabilityChannel, {
  __index = mock_generic_channel,
})

local my_mock = mock_generic_channel.init(MockCapabilityChannel, "capability")

return my_mock
