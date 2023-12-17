local utils = require("astrocore")

return {
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      ---@diagnostic disable: missing-fields
      handlers = { denols = false },
    },
  },
  { import = "astrocommunity.pack.json" },
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts) Andromeda.lib.extend_list_opt(opts, { "javascript", "typescript", "tsx" }, "highlight") end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "denols") end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    optional = true,
    opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "js") end,
  },
  {
    "sigmasd/deno-nvim",
    ft = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
    opts = function() return { server = require("astrolsp").lsp_opts("denols") } end,
  },
}
