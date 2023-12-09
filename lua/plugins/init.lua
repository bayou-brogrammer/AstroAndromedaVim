local modules = { "core", "editor", "lang", "ui" }

local plugins = {}
for _, module in ipairs(modules) do
  table.insert(plugins, { import = "plugins." .. module })
end

return plugins
