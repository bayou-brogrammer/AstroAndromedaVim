Andromeda.lib.path.load_dir("plugins._configs")
Andromeda.lib.path.load_dir("plugins._mappings")

local plugins = {}
for _, module in ipairs({ "core", "lsp", "lang", "editor", "ui" }) do
  table.insert(plugins, { import = "plugins." .. module })
end

return plugins
