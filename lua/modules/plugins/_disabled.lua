local disabled_plugins = { "alpha-nvim", "better-escape.nvim", "Comment.nvim", "mason-null-ls.nvim", "none-ls.nvim" }

local plugins = {}
for _, plugin in ipairs(disabled_plugins) do
  table.insert(plugins, { plugin, enabled = false })
end

return plugins
