---@class AndromedaLib: LazyUtilCore
---@field path AndromedaPathLib
local M = setmetatable(Andromeda.lib, {
  __index = function(t, k)
    if require("lazy.core.util")[k] then return require("lazy.core.util")[k] end
    t[k] = require("utilities." .. k)
    return t[k]
  end,
})

--! Boolean Methods

function M.is_win() return vim.loop.os_uname().sysname:find("Windows") ~= nil end

---@param plugin string
function M.has(plugin) return require("lazy.core.config").spec.plugins[plugin] ~= nil end

--! Loading Methods

---@param fn fun()
function M.on_very_lazy(fn)
  vim.api.nvim_create_autocmd("User", { pattern = "VeryLazy", callback = function() fn() end })
end

--! Keymap Methods

-- M.map = function(mode, lhs, rhs, opts)
--   local keys = require("lazy.core.handler").handlers.keys --[[@as LazyKeysHandler]]

--   -- do not create the keymap if a lazy keys handler exists
--   if keys ~= nil then
--     if not keys.active[keys.parse({ lhs, mode = mode }).id] then
--       opts = opts or {}
--       opts.silent = opts.silent ~= false
--       vim.keymap.set(mode, lhs, rhs, opts)
--     end
--   end
-- end

--! Table Methods

---@param opts table
---@param key? string
---@param extension table
function M.extend_list_opt(opts, extension, key)
  opts = opts or {}
  key = key or "ensure_installed"
  opts[key] = opts[key] or {}
  return vim.list_extend(opts[key] or {}, extension)
end

---@param opts table
---@param extension table
function M.extend_opts(opts, extension) return table.extend(opts, extension) end
