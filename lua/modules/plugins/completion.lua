local cmp_plugins = {}

cmp_plugins["hrsh7th/nvim-cmp"] = {
  event = "InsertEnter",
  opts = require("completion.cmp"),
  dependencies = { "hrsh7th/cmp-emoji" },
}

cmp_plugins["zbirenbaum/copilot.lua"] = {
  cmd = "Copilot",
  event = "InsertEnter",
  build = ":Copilot auth",
  cfg = "completion.copilot",
}

return cmp_plugins
