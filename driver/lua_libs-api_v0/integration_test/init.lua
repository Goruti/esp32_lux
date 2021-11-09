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
local socket = require "integration_test.mock_socket"
local mock_zigbee_channel = require "integration_test.mock_zigbee_channel"
local mock_capability_channel = require "integration_test.mock_capability_channel"
local mock_zwave_channel = require "integration_test.mock_zwave_channel"
local mock_timer_api = require "integration_test.mock_timer_channel"
local mock_devices_api = require "integration_test.mock_devices_api"

local VALID_CHANNELS = {
  tcp = true,
  udp = true,
  timer = true,
  zigbee = true,
  zwave = true,
  capability = true,
  device_lifecycle = true,
  discovery = true,
  driver_lifecycle = true,
  environment_update = true,
  devices = true,
}
socket:__set_valid_channels(VALID_CHANNELS)
socket:add_mock_socket("zigbee", mock_zigbee_channel)
socket:add_mock_socket("zwave", mock_zwave_channel)
socket:add_mock_socket("capability", mock_capability_channel)

timer = mock_timer_api

local function get_log_wrapper(level_str)
  return function(str)
    print(string.format("%-5s || %s", level_str, str))
  end
end

local log = {
  trace = get_log_wrapper("TRACE"),
  debug = get_log_wrapper("DEBUG"),
  info = get_log_wrapper("INFO"),
  warn = get_log_wrapper("WARN"),
  error = get_log_wrapper("ERROR")
}

local envlibs = {
  datastore = datastore,
  devices = mock_devices_api,
  log = log,
  socket = socket,
  --ssl = socket.ssl, -- unused
  timer = timer,
  --util.call_rpc_method = call_rpc_method.lua, -- unused
  --util.stringify_and_join = stringify_and_join, -- unused

}

function _envlibrequire(module)
  return envlibs[module]
end

local it_utils = require "integration_test.utils"
local utils = require "st.utils"
local mock_os_time = require "integration_test.mock_os_time"
os.__set_time(0)
-- Get libs for device manipulation
local datastore = require "integration_test.mock_env_datastore"
envlibs.datastore = datastore
local datastore_wrapper = require "integration_test.datastore_wrapper"
datastore.__setup_with_wrapped_ds(datastore_wrapper)

local mock_device = require "integration_test.mock_device"
local device_wrapper = require "integration_test.device_wrapper"
local cosock = require "cosock"

local driver_wrapper = require "integration_test.driver_wrapper"

local raw_pcall = pcall

pcall = function(...)
  local status, val = raw_pcall(...)
  if not status then
    if type(val) == "table" and val.fatal == true then
      error(val, 1)
    end
  end
  return status, val
end

local integration_test = {}
integration_test.mock_devices_api = mock_devices_api
integration_test.socket = socket
integration_test.timer = timer
integration_test.mock_time = {
  advance_time = os.__advance_time,
  set_time = os.__set_time,
}
integration_test.mock_device = mock_device
integration_test.test_init_func = function() end
integration_test.driver_wrapper = driver_wrapper

function integration_test.wait_for_events()
  coroutine.yield()
end

function integration_test.set_test_init_function(func)
  integration_test.test_init_func = func
end

integration_test.test_env_setup_funcs = {}
function integration_test.add_test_env_setup_func(func)
  table.insert(integration_test.test_env_setup_funcs, func)
  local function env_init(driver)
    for _, f in ipairs(integration_test.test_env_setup_funcs) do
      f(driver)
    end
  end
  driver_wrapper.set_test_env_init(env_init)
end

local registered_tests = {}

integration_test.reset_tests = function()
  -- Reset all socket data
  for sock_name, sock in pairs(integration_test.socket.__sock_cache) do
    sock:reset()
  end
  integration_test.socket:__reset()
  integration_test.timer:reset()
  datastore.__reset()
  integration_test.mock_time.set_time(0)
  integration_test.socket:set_time_advance_per_select(0)
  cosock.reset()
  mock_devices_api.reset()
  driver_wrapper.reset()
  datastore_wrapper.reset()
  device_wrapper.reset()
end

local run_configured_test = function(test_func)
  os.__set_time(0)

  local tracebackhandler = debug and debug.traceback
  local status, val = xpcall(test_func, tracebackhandler)
  if status then
    status, val = xpcall(require, tracebackhandler, "init")
  end
  if type(val) == "table" then
    if val.code == it_utils.UNIT_TEST_FAILURE then
      print("Failed with message:\n" .. val.msg .. "\n")
      integration_test.reset_tests()
      return false
    elseif val.code == it_utils.END_OF_TESTS then
      local all_sent = true
      for sock_name, sock in pairs(socket.__sock_cache) do
        if sock:__expecting_additional_send() then
          sock:__print_unsent_messages()
          all_sent = false
        end
      end
      all_sent = all_sent and not mock_devices_api.__check_for_unsent_command()
      return all_sent
    else
      print("Received unexpected error: " .. utils.stringify_table(val))
    end
  else
    print("Received unexpected error: " .. val)
  end
  integration_test.reset_tests()
end

integration_test.register_test = function(test_name, test_func, test_init)
  registered_tests[#registered_tests + 1] = {test_func = test_func, test_name=test_name, test_init = test_init}
end

integration_test.register_coroutine_test = function(test_name, co_func, opts)
  opts = opts or {}
  local test_func = function()
    local co = coroutine.create(co_func)
    integration_test.socket:__prepare_coroutine_test(co)
  end
  integration_test.register_test(test_name, test_func, opts.test_init)
end

integration_test.register_message_test = function (test_name, manifest, opts)
  opts = opts or {}
  -- Split into "blocks" where each block has a single receive followed by
  -- any number of expected sends
  local block_list = {}
  local next_block = {}
  local index = 1
  while index <= #manifest do
    if manifest[index].direction == "receive" then
      table.insert(next_block, manifest[index])
      index = index + 1
      while (manifest[index] or {}).direction == "send" do
        table.insert(next_block, manifest[index])
        index = index + 1
      end
      table.insert(block_list, next_block)
      next_block = {}
    else
      -- TODO: handle starting with expected sends
      error("shouldn't be here " .. index)
    end
  end

  local test_func = function()
    if opts ~= nil and opts.inner_block_ordering == "relaxed" then
      for _, message in ipairs(manifest) do
        integration_test.socket[message.channel]:__set_channel_ordering("relaxed")
      end
    end
    for _, block in ipairs(block_list) do
      for _, message in ipairs(block) do
        if message.direction == "receive" then
          integration_test.socket[message.channel]:__queue_receive(message.message)
        else
          integration_test.socket[message.channel]:__expect_send(message.message)
        end
      end
      integration_test.wait_for_events()
    end
  end

  -- Use the last function created (first in the orignally presented order) as the
  -- test function to register.
  integration_test.register_coroutine_test(test_name, test_func, opts)
end

integration_test.run_registered_tests = function()
  local passed_tests = 0
  for i, test_config in ipairs(registered_tests) do
    local test_run_line = string.format("Running test \"%s\" (%d of %d)", test_config.test_name, i, #registered_tests)
    print(test_run_line)
    print(string.rep("-", #test_run_line))
    if test_config.test_init ~= nil then
      test_config.test_init()
    elseif integration_test.test_init_func ~= nil then
      integration_test.test_init_func()
    end
    if run_configured_test(test_config.test_func) then
      passed_tests = passed_tests + 1
      print("PASSED")
    else
      print("FAILED")
    end
    integration_test.reset_tests()
    print("\n")
  end
  print("Passed " .. passed_tests .. " of " .. #registered_tests .. " tests")
end

return integration_test
