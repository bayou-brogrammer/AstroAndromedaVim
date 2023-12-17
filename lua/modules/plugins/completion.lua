local mason_cfg = require("completion.mason")

local cmp_plugins = {}

cmp_plugins["hrsh7th/nvim-cmp"] = {
  event = "InsertEnter",
  dependencies = { "hrsh7th/cmp-emoji" },
  opts = require("completion.cmp"),
}

cmp_plugins["AstroNvim/astrolsp"] = {
  "AstroNvim/astrolsp",
  opts = require("completion.lsp"),
}

cmp_plugins["AstroNvim/astrolsp"] = {
  "AstroNvim/astrolsp",
  opts = require("completion.lsp"),
  dependencies = {
    { "williamboman/mason.nvim", opts = mason_cfg.mason },
    { "jay-babu/mason-null-ls.nvim", opts = mason_cfg["mason-null-ls"] },
    { "jay-babu/mason-nvim-dap.nvim", opts = mason_cfg["mason-nvim-dap"] },
    { "williamboman/mason-lspconfig.nvim", opts = mason_cfg["mason-lspconfig"] },
  },
}

cmp_plugins["stevearc/aerial.nvim"] = {
  event = "User AndromedaFile",
  cfg = "completion.aerial",
}

return cmp_plugins
