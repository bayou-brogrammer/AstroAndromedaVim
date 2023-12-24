local lint_and_format_plugins = {}

lint_and_format_plugins["stevearc/conform.nvim"] = {
  lazy = true,
  cmd = "ConformInfo",
  merge = require("lsp.conform"),
  event = { "BufReadPre", "BufNewFile" },
}

lint_and_format_plugins["mfussenegger/nvim-lint"] = {
  event = "User AstroFile",
  merge = require("lsp.nvim-lint"),
}

return lint_and_format_plugins
