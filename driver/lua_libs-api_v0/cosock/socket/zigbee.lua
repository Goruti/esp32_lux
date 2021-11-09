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
local lsocket = require "socket"
local internals = require "cosock.socket.internals"

local m = {}

local recvmethods = {
  receive = "timeout",
}

local sendmethods = {
  send = "timout",
}

setmetatable(m, {__call = function()
  local inner_sock, err = lsocket.zigbee()
  if not inner_sock then return inner_sock, err end
  inner_sock:settimeout(0)
  return setmetatable({inner_sock = inner_sock, class = "zigbee"}, { __index = m})
end})

local passthrough = internals.passthroughbuilder(recvmethods, sendmethods)

m.receive = passthrough("receive")

m.send = passthrough("send")

m.add_hub_to_group = passthrough("add_hub_to_group")

function m:settimeout(timeout)
  self.timeout = timeout
end

internals.setuprealsocketwaker(m)

return m
