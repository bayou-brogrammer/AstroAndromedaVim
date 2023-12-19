---@param t table
---@param filterIter fun(value: any, key: any, table: table): boolean
table.filter = function(t, filterIter)
  local out = {}

  for k, v in pairs(t) do
    if filterIter(v, k, t) then table.insert(out, v) end
  end

  return out
end

---@param t table
---@param mapIter fun(value: any, key: any, table: table): any
table.map = function(t, mapIter)
  local out = {}

  for k, v in vim.iter(pairs(t)) do
    out[k] = mapIter(v, k, t)
  end

  return out
end

---@param table table
---@param value any
table.find = function(table, value)
  for key, _value in pairs(table) do
    if type(_value) == "table" then
      local f = { table.find(_value, value) }
      if #f ~= 0 then
        table.insert(f, 2, key)
        return unpack(f)
      end
    elseif _value == value or key == value then
      return _value
      -- return key, _value
    end
  end
end
