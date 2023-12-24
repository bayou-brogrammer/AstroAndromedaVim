local mason_cfg = require("completion.mason")

local lsp_plugins = {}

lsp_plugins["AstroNvim/astrolsp"] = {
  "AstroNvim/astrolsp",
  cfg = "lsp.lsp",
  dependencies = {
    { "hrsh7th/cmp-nvim-lsp" },
    { "williamboman/mason.nvim", opts = mason_cfg["mason"] },
    { "jay-babu/mason-null-ls.nvim", opts = mason_cfg["mason-null-ls"] },
    { "jay-babu/mason-nvim-dap.nvim", opts = mason_cfg["mason-nvim-dap"] },
    { "williamboman/mason-lspconfig.nvim", opts = mason_cfg["mason-lspconfig"] },
  },
}

return lsp_plugins
