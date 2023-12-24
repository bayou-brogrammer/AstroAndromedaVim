local cmp_plugins = {}

cmp_plugins["hrsh7th/nvim-cmp"] = {
  event = "InsertEnter",
  dependencies = { "hrsh7th/cmp-emoji" },
  opts = require("completion.nvim-cmp"),
}

cmp_plugins["zbirenbaum/copilot.lua"] = {
  cmd = "Copilot",
  event = "InsertEnter",
  build = ":Copilot auth",
  merge = require("completion.copilot"),
}

return cmp_plugins
