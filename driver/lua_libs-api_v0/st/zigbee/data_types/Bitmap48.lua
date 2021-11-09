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
local BitmapABC = require "st.zigbee.data_types.base_defs.BitmapABC"

--- @class st.zigbee.data_types.Bitmap48: st.zigbee.data_types.BitmapABC
--- @field public ID number 0x1D
--- @field public NAME string "Bitmap48"
--- @field public byte_length number 6
--- @field public value number This is the actual value of the instance of the data type
local Bitmap48 = {}
setmetatable(Bitmap48, BitmapABC.new_mt({ NAME = "Bitmap48", ID = 0x1D }, 6))

return Bitmap48
