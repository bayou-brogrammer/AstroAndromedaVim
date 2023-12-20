---@type AndromedaInjectLib
Andromeda.lib.inject = {}

---@class AndromedaInjectLib
local M = Andromeda.lib.inject

function M.get_upvalue(func, name)
  local i = 1
  while true do
    local n, v = debug.getupvalue(func, i)
    if not n then break end
    if n == name then return v end
    i = i + 1
  end
end

return M
