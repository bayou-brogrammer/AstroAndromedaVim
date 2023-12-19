---@class Andromeda
Andromeda = {}

---@class AndromedaIcons
Andromeda.icons = {}

---@class AndromedaLibConfig
Andromeda.lib = {}

Andromeda.debug = function(...)
  local args = { ... }
  local str = ""

  for i, v in ipairs(args) do
    str = str .. vim.inspect(v)
    if i ~= #args then str = str .. ", " end
  end

  Andromeda.echo(str, true)
end

---@param str string
---@param key_return? boolean
Andromeda.echo = function(str, key_return)
  vim.cmd("redraw")
  vim.api.nvim_echo({ { str, "Bold" } }, true, {})
  if key_return then vim.fn.getchar() end
end

for _, module in ipairs({ "utilities", "icons" }) do
  require(module)
end
