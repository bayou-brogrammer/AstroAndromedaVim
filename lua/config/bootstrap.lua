---@class Andromeda
_G.Andromeda = {
  default_colorscheme = "",
  default_dashboard = "doom",
}

---@class AndromedaLibConfig
Andromeda.lib = {}

---@class AndromedaConfigs
Andromeda.configs = {}

---@class AndromedaMappings
Andromeda.mappings = {}

Andromeda.debug = function(...)
  local args = { ... }
  local str = ""

  for i, v in ipairs(args) do
    str = str .. vim.inspect(v)
    if i ~= #args then str = str .. ", " end
  end

  vim.api.nvim_echo({ { str } }, true, {})
  vim.fn.getchar()
end

---@param str string
---@param key_return? boolean
Andromeda.echo = function(str, key_return)
  vim.cmd("redraw")
  vim.api.nvim_echo({ { str, "Bold" } }, true, {})
  if key_return then vim.fn.getchar() end
end

require("utilities")
Andromeda.lib.root.setup()
Andromeda.lib.format.setup()
