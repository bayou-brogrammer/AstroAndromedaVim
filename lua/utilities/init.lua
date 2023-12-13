---@class AndromedaLibConfig: LazyUtilCore
---@field path AndromedaPathLib
local M = setmetatable(Andromeda.lib, {
  __index = function(t, k)
    if require("lazy.core.util")[k] then return require("lazy.core.util")[k] end
    return Andromeda.lib[k]
  end,
})

-- >>>>>>>>>>>>>> Load Utilities <<<<<<<<<<<<<< --
local utils = {
  "extensions",
  "format",
  "path",
  "root",
  "telescope",
}
for _, util in ipairs(utils) do
  require("utilities." .. util)
end
-- >>>>>>>>>>>>>>>>>>>>>>>>> <<<<<<<<<<<<<<<<<<<<<< --

function M.is_win() return vim.loop.os_uname().sysname:find("Windows") ~= nil end

---@param plugin string
function M.has(plugin) return require("lazy.core.config").spec.plugins[plugin] ~= nil end

---@param fn fun()
function M.on_very_lazy(fn)
  vim.api.nvim_create_autocmd("User", { pattern = "VeryLazy", callback = function() fn() end })
end
