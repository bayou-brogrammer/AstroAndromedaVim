---@class AndromedaLibConfig: LazyUtilCore
---@field path AndromedaPathLib
setmetatable(Andromeda.lib, {
  __index = function(t, k)
    if require("lazy.core.util")[k] then return require("lazy.core.util")[k] end
    return Andromeda.lib[k]
  end,
})

-- >>>>>>>>>>>>>> Load Utilities <<<<<<<<<<<<<< --
local utils = { "extensions", "path", "root", "telescope" }
for _, util in ipairs(utils) do
  require("utilities." .. util)
end
-- >>>>>>>>>>>>>>>>>>>>>>>>> <<<<<<<<<<<<<<<<<<<<<< --

function Andromeda.lib.is_win() return vim.loop.os_uname().sysname:find("Windows") ~= nil end
