---@class AndromedaLibConfig
---@field path AndromedaPathLib
Andromeda.lib = {}

local utils = { "extensions", "path" }
for _, util in ipairs(utils) do
  require("utilities." .. util)
end
