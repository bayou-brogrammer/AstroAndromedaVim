---@class AndromedaKit
local M = Andromeda.kit

function M.event(event)
  vim.schedule(function() vim.api.nvim_exec_autocmds("User", { pattern = "Andromeda" .. event, modeline = false }) end)
end

--- Check if a plugin is defined in lazy. Useful with lazy loading when a plugin is not necessarily loaded yet
---@param plugin string The plugin to search for
function M.is_available(plugin) return M.get_plugin(plugin) ~= nil end

--- Get a plugin spec from lazy
---@param plugin string The plugin to search for
---@return LazyPlugin? available # The found plugin spec from Lazy
function M.get_plugin(plugin)
  local lazy_config_avail, lazy_config = pcall(require, "lazy.core.config")
  return lazy_config_avail and lazy_config.spec.plugins[plugin] or nil
end

--- Resolve the options table for a given plugin with lazy
---@param plugin string The plugin to search for
---@return table opts # The plugin options
function M.plugin_opts(plugin)
  local spec = M.get_plugin(plugin)
  return spec and require("lazy.core.plugin").values(spec, "opts") or {}
end

---@param fn fun()
function M.on_very_lazy(fn)
  vim.api.nvim_create_autocmd("User", { pattern = "VeryLazy", callback = function() fn() end })
end

---@param mappingsOrFunc string | table | function
function M.add_mappings(mappingsOrFunc)
  local opts = nil

  local mappings = mappingsOrFunc
  if type(mappingsOrFunc) == "function" then mappings = mappingsOrFunc() end
  if type(mappingsOrFunc) == "string" then opts = require("mappings." .. mappingsOrFunc) end

  ---@cast mappings table

  return {
    "AstroNvim/astrocore",
    opts = opts or function(_, opts)
      local maps = opts.mappings

      for key, value in pairs(mappings) do
        maps.n[key] = value
      end
    end,
  }
end

return M
