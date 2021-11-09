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
local json = require "dkjson"
local utils = require "st.utils"

local datastore = {}
datastore.__data = {}

local mock_device_datastore = {}

local function mock_device_datastore_index(self, key)
    if datastore.__wrapped_ds.ds_under_test ~= nil then
        return datastore.__wrapped_ds.ds_under_test[key]
    end
    error("Test datastore has not been initted")
end

local function mock_device_datastore_newindex(self, key, value)
    if datastore.__wrapped_ds.ds_under_test ~= nil then
        datastore.__wrapped_ds.ds_under_test[key] = value
        return
    end
    error("Test datastore has not been initted")
end

local function mock_device_datastore_pairs(self)
    if datastore.__wrapped_ds.ds_under_test ~= nil then
        return pairs(datastore.__wrapped_ds.ds_under_test)
    end
    error("Test datastore has not been initted")
end

setmetatable(mock_device_datastore, {
    __index = mock_device_datastore_index,
    __newindex = mock_device_datastore_newindex,
    __pairs = mock_device_datastore_pairs,
})

function datastore.__get_mock_device_datastore()
    return mock_device_datastore
end

function datastore.get()
    return json.encode(datastore.__data)
end

function datastore.set(data)
    datastore.__data = json.decode(data)
end

function datastore.__reset()
    for k, _ in pairs(datastore.__data) do
        datastore.__data[k] = nil
    end
end

function datastore.__setup_with_wrapped_ds(wrapped_ds)
    datastore.__wrapped_ds = wrapped_ds
end

function datastore.__assert_equal(tab)
    return utils.stringify_table(datastore.__data) == utils.stringify_table(tab)
end

function datastore.__assert_device_store_contains(device_id, key, value)
    local storedval
    if datastore.__wrapped_ds.ds_under_test ~= nil then
        storedval = ((datastore.__wrapped_ds.ds_under_test["__devices_store"] or {})[device_id] or {})[key]
    else
        storedval = ((datastore.__data["__devices_store"] or {})[device_id] or {})[key]
    end
    assert(storedval == value, string.format("Expected persisted device value %s: %s, but it was %s", tostring(key), tostring(value), tostring(storedval)))
end

return datastore
