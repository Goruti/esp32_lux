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
local capabilities = require "st.capabilities"
--- @type st.zwave.CommandClass
local cc = require "st.zwave.CommandClass"
--- @type st.zwave.CommandClass.Notification
local Notification = (require "st.zwave.CommandClass.Notification")({version=3})
local access_control_event = Notification.event.access_control
--- @type st.zwave.CommandClass.UserCode
local UserCode = (require "st.zwave.CommandClass.UserCode")({version=1})
--- @type st.zwave.constants
local constants = require "st.zwave.constants"
local json = require "dkjson"

local lock_code_defaults = {}

local CHANGE_TYPE = {
  SET = " set",
  UNSET = " unset",
  DELETED = " deleted",
  FAILED = " failed",
  RENAMED = " renamed",
  CHANGED = " changed"
}
lock_code_defaults.CHANGE_TYPE = CHANGE_TYPE

local MASTER_CODE_INDEX = 0

local function get_code_id_from_notification_event(event_params)
  event_params = {event_params:byte(1,-1)}
  local code_id = (#event_params == 1) and event_params[1] or event_params[3]
  return string.char(code_id)
end
lock_code_defaults.get_code_id_from_notification_event = get_code_id_from_notification_event

local function get_lock_codes(device)
  local lock_codes = device:get_field(constants.LOCK_CODES)
  if (lock_codes == nil) then
    return {}
  end
  return lock_codes
end
lock_code_defaults.get_lock_codes = get_lock_codes

local function clear_code_state(device, code_id)
  local code_state = device:get_field(constants.CODE_STATE) or {}
  code_state["setName"..code_id] = nil
  device:set_field(constants.CODE_STATE, code_state)
end
lock_code_defaults.clear_code_state = clear_code_state

local function get_code_name(device, code_id)
  if (device:get_field(constants.CODE_STATE) ~= nil and device:get_field(constants.CODE_STATE)["setName"..code_id] ~= nil) then
    -- this means a code set operation succeeded
    return device:get_field(constants.CODE_STATE)["setName"..code_id]
  elseif code_id == MASTER_CODE_INDEX then
    return "Master Code"
  elseif (get_lock_codes(device)[code_id] ~= nil) then
    return get_lock_codes(device)[code_id]
  else
    return "Code " .. code_id
  end
end
lock_code_defaults.get_code_name = get_code_name

local function get_change_type(device, code_id)
  if (get_lock_codes(device)[code_id] == nil) then
    return CHANGE_TYPE.SET
  else
    return CHANGE_TYPE.CHANGED
  end
end
lock_code_defaults.get_change_type = get_change_type

local function code_deleted(device, code_id)
  local lock_codes = get_lock_codes(device)
  event = capabilities.lockCodes.codeChanged(code_id.." deleted")
  event.data = {codeName = get_code_name(device, code_id)}
  lock_codes[tostring(code_id)] = nil
  device:set_field(constants.LOCK_CODES, lock_codes, {perist = true})
  device:emit_event(event)
end
lock_code_defaults.code_deleted = code_deleted

local function code_set_event(device, code_id, code_name)
  local lock_codes = get_lock_codes(device)
  lock_codes[tostring(code_id)] = code_name
  device:set_field(constants.LOCK_CODES, lock_codes, {persist = true})
  device:emit_event(capabilities.lockCodes.lockCodes(json.encode(lock_codes)))
end
lock_code_defaults.code_set_event = code_set_event

--- @param driver st.zwave.Driver
--- @param device st.zwave.Device
--- @param cmd st.zwave.CommandClass.Notification.Report
local function notification_report_handler(driver, device, cmd)
  if (cmd.args.notification_type == Notification.notification_type.ACCESS_CONTROL) then
    local event = cmd.args.event
    local lock_codes = get_lock_codes(device)
    if (event == access_control_event.ALL_USER_CODES_DELETED) then
      for code_id, _ in pairs(lock_codes) do
        code_deleted(device, code_id)
      end
      device:emit_event(capabilities.lockCodes.lockCodes(json.encode(get_lock_codes(device))))
    elseif (event == access_control_event.SINGLE_USER_CODE_DELETED) then
      local event_params = cmd.args.event_parameter
      if (event_params ~= nil) then
        local code_id = get_code_id_from_notification_event(event_params)
        clear_code_state(device, code_id)
        if (lock_codes[tostring(code_id)] ~= nil) then
          code_deleted(device, code_id)
          device:emit_event(capabilities.lockCodes.lockCodes(json.encode(get_lock_codes(device))))
        end
      end
    elseif (event == access_control_event.NEW_USER_CODE_ADDED) then
      local event_params = cmd.args.event_parameter
      if (event_params ~= nil) then
        local code_id = get_code_id_from_notification_event(event_params)
        local code_name = get_code_name(device, code_id)
        local change_type = get_change_type(device, code_id)
        local code_changed_event = capabilities.lockCodes.codeChanged(code_id .. change_type)
        code_changed_event["data"] = { codeName = code_name}
        clear_code_state(device, code_id)
        device:emit_event(code_changed_event)
      end
    elseif (event == access_control_event.NEW_USER_CODE_NOT_ADDED_DUE_TO_DUPLICATE_CODE) then
      local event_params = cmd.args.event_parameter
      if (event_params ~= nil) then
        local code_id = get_code_id_from_notification_event(event_params)
        local code_changed_event = capabilities.lockCodes.codeChanged(code_id .. CHANGE_TYPE.FAILED)
        code_changed_event["data"] = { isCodeDuplicate = true}
        clear_code_state(device, code_id)
        device:emit_event(code_changed_event)
      end
    elseif (event == access_control_event.NEW_PROGRAM_CODE_ENTERED_UNIQUE_CODE_FOR_LOCK_CONFIGURATION) then
      --  master code changed
      local code_name = get_code_name(device, 0)
      local code_changed_event = capabilities.lockCodes.codeChanged(0 .. CHANGE_TYPE.SET)
      code_changed_event["data"] = { codeName = code_name}
      device:emit_event(code_changed_event)
    end
  end
end

--- @param driver st.zwave.Driver
--- @param device st.zwave.Device
--- @param cmd st.zwave.CommandClass.UserCode.Report
local function user_code_report_handler(driver, device, cmd)
  local code_id = cmd.args.user_identifier
  local user_id_status = cmd.args.user_id_status
  local code_changed_event = capabilities.lockCodes.codeChanged("")
  local lock_codes = get_lock_codes(device)

  if (user_id_status == UserCode.user_id_status.ENABLED_GRANT_ACCESS) then
    local codeName = get_code_name(device, code_id)
    local changeType = get_change_type(device, code_id)
    if (lock_codes[tostring(code_id)] == nil) then
      code_set_event(device, code_id, codeName)
    end
    code_changed_event.value = code_id .. changeType
    code_changed_event["data"] = { codeName = codeName}
  else
    if (lock_codes[tostring(code_id)] ~= nil) then
      code_changed_event = nil
      code_deleted(device, code_id)
      device:emit_event(capabilities.lockCodes.lockCodes(json.encode(get_lock_codes(device))))
    else
      code_changed_event.value = code_id .. CHANGE_TYPE.UNSET
    end
  end

  clear_code_state(device, code_id)

  if (code_changed_event ~= nil) then device:emit_event(code_changed_event) end

  if (code_id == device:get_field(constants.CHECKING_CODE)) then
    if (code_id >= device:get_field(constants.MAX_CODES) or code_id >= constants.ABSOLUTE_MAX_CODES) then
      device:emit_event(capabilities.lockCodes.scanCodes("Complete"))
      device:set_field(constants.CHECKING_CODE, nil)
    else
      code_id = code_id + 1
      device:set_field(constants.CHECKING_CODE, code_id)
      device:send(UserCode:Get({user_identifier = code_id }))
    end
  end
end

--- @param driver st.zwave.Driver
--- @param device st.zwave.Device
--- @param cmd st.zwave.CommandClass.UserCode.UsersNumberReport
local function users_number_report_handler(driver, device, cmd)
  device:set_field(constants.MAX_CODES, cmd.args.supported_users, {persist = true})
  device:emit_event(capabilities.lockCodes.maxCodes(device:get_field(constants.MAX_CODES)))
end

--- @param driver st.zwave.Driver
--- @param device st.zwave.Device
--- @param command table
local function update_codes(driver, device, command)
  -- args.codes is json
  for name, code in pairs(command.args.codes) do
    -- these seem to come in the format "code[slot#]: code"
    local code_slot = tonumber(string.gsub(name, "code", ""), 10)
    if (code_slot ~= nil) then
      if (code ~= nil and code ~= "0") then
        -- code changed
        device:send(UserCode:Set({
          user_identifier = code_slot,
          user_code = code,
          user_id_status = UserCode.user_id_status.ENABLED_GRANT_ACCESS}))
      else
        -- code deleted
        device:send(UserCode:Set({user_identifier = code_slot, user_id_status = UserCode.user_id_status.AVAILABLE}))
        device.thread:call_with_delay(4.2, function(d) device:send(UserCode:Get({user_identifier = code_slot})) end)
      end
    end
  end
end

--- @param driver st.zwave.Driver
--- @param device st.zwave.Device
--- @param command table
local function reload_all_codes(driver, device, command)
  device:emit_event(capabilities.lockCodes.lockCodes(json.encode(get_lock_codes(device))))
  if (device:get_field(constants.MAX_CODES) == nil) then
    device:send(UserCode:UsersNumberGet({}))
  end
  local checking_code = device:get_field(constants.CHECKING_CODE)
  if (checking_code == nil) then
    checking_code = 1
    device:set_field(constants.CHECKING_CODE, checking_code)
    device:emit_event(capabilities.lockCodes.scanCodes("Scanning"))
    device:send(UserCode:Get({user_identifier = checking_code}))
  end
end

--- @param driver st.zwave.Driver
--- @param device st.zwave.Device
--- @param command table
local function request_code(driver, device, command)
  device:send(UserCode:Get({user_identifier = command.args.codeSlot}))
end

--- @param driver st.zwave.Driver
--- @param device st.zwave.Device
--- @param command table
local function set_code(driver, device, command)
  if (command.args.codeName ~= nil) then
    -- wait for confirmation from the lock to commit this to memory
    if (device:get_field(constants.CODE_STATE) == nil) then device:set_field(constants.CODE_STATE, {}) end
    -- Groovy driver has a lot more info passed here as a description string, may need to be investigated
    local code_state = device:get_field(constants.CODE_STATE)
    code_state["setName"..command.args.codeSlot] = command.args.codeName
    device:set_field(constants.CODE_STATE, code_state)
  end

  device:send(UserCode:Set({
    user_identifier = command.args.codeSlot,
    user_code = command.args.codePIN,
    user_id_status = UserCode.user_id_status.ENABLED_GRANT_ACCESS}))
end

--- @param driver st.zwave.Driver
--- @param device st.zwave.Device
--- @param command table
local function name_slot(driver, device, command)
  if (get_lock_codes(device)[tostring(command.args.codeSlot)] ~= nil) then
    local lock_codes = get_lock_codes(device)
    lock_codes[tostring(command.args.codeSlot)] = command.args.codeName
    device:emit_event(capabilities.lockCodes.lockCodes(json.encode(lock_codes)))
    device:set_field(constants.LOCK_CODES, lock_codes, {persist = true})
    device:emit_event(capabilities.lockCodes.codeChanged(command.args.codeSlot .. CHANGE_TYPE.RENAMED))
  end
end

--- @param driver st.zwave.Driver
--- @param device st.zwave.Device
--- @param command table
local function delete_code(driver, device, command)
  device:send(UserCode:Set({user_identifier = command.args.codeSlot, user_id_status = UserCode.user_id_status.AVAILABLE}))

  device.thread:call_with_delay(4.2, function(d) device:send(UserCode:Get({user_identifier = command.args.codeSlot})) end)
end

--- @param self st.zwave.Driver
--- @param device st.zwave.Device
local function get_refresh_commands(self, device)
  if device:supports_capability_by_id(capabilities.lockCodes.ID) and device:is_cc_supported(cc.USER_CODE) then
    reload_all_codes(self, device, nil)
  end
end

--- @module st.zwave.defaults.lockCodes
--- @alias lock_defaults
--- @field public zwave_handlers table
--- @field public capability_handlers table
lock_code_defaults.zwave_handlers = {
  [cc.NOTIFICATION] = {
    [Notification.REPORT] = notification_report_handler
  },
  [cc.USER_CODE] = {
    [UserCode.REPORT] = user_code_report_handler,
    [UserCode.USERS_NUMBER_REPORT] = users_number_report_handler
  }
}

lock_code_defaults.capability_handlers = {
  [capabilities.lockCodes.commands.updateCodes] = update_codes,
  [capabilities.lockCodes.commands.deleteCode] = delete_code,
  [capabilities.lockCodes.commands.reloadAllCodes] = reload_all_codes,
  [capabilities.lockCodes.commands.requestCode] = request_code,
  [capabilities.lockCodes.commands.setCode] = set_code,
  [capabilities.lockCodes.commands.nameSlot] = name_slot
}
lock_code_defaults.get_refresh_commands = get_refresh_commands

return lock_code_defaults