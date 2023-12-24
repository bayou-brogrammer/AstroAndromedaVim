local lsp_plugins = {}
local mason_cfg = require("completion.mason")

lsp_plugins["AstroNvim/astrolsp"] = {
  "AstroNvim/astrolsp",
  merge = require("lsp.lsp"),
  dependencies = {
    { "hrsh7th/cmp-nvim-lsp" },
    { "williamboman/mason.nvim", opts = mason_cfg["mason"] },
    { "jay-babu/mason-null-ls.nvim", opts = mason_cfg["mason-null-ls"] },
    { "jay-babu/mason-nvim-dap.nvim", opts = mason_cfg["mason-nvim-dap"] },
    { "williamboman/mason-lspconfig.nvim", opts = mason_cfg["mason-lspconfig"] },
  },
}

lsp_plugins["folke/neodev.nvim"] = {
  version = false,
  event = "VeryLazy",
  dependencies = { "hrsh7th/nvim-cmp" },
  opts = {},
  config = function()
    require("neodev").setup({
      library = { plugins = { "nvim-dap-ui" }, types = true },
      override = function(root_dir, library)
        local util = require("neodev.util")
        if util.has_file(root_dir, "/etc/nixos") or util.has_file(root_dir, "nvim-config") then
          library.enabled = true
          library.plugins = true
        end
      end,
    })
  end,
}

return lsp_plugins
