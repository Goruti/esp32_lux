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
--- @class st.zwave.constants
--- @alias constants st.zwave.constants
--- @field public TEMPERATURE_SCALE string
--- @field public DEFAULT_DIMMING_DURATION number
--- @field public DEFAULT_POST_DIMMING_DELAY number
--- @field public MIN_DIMMING_GET_STATUS_DELAY number
--- @field public DEFAULT_GET_STATUS_DELAY number
local constants = {}

constants.TEMPERATURE_SCALE = "_temperature_scale"
constants.DEFAULT_DIMMING_DURATION = 1 --seconds
constants.DEFAULT_POST_DIMMING_DELAY = 2 --seconds
constants.MIN_DIMMING_GET_STATUS_DELAY = 5 --seconds
constants.DEFAULT_GET_STATUS_DELAY = 1 --seconds

--- LOCK CODE CONSTANTS
constants.MAX_CODES = "_max_codes"
constants.CHECKING_CODE = "_checking_code"
constants.LOCK_CODES = "_lock_codes"
constants.CODE_STATE = "_code_state"
constants.ABSOLUTE_MAX_CODES = 8

constants.UPDATE_PREFERENCES_FUNC = "__update_pref_fn" --for sleepy device preference updates

return constants
