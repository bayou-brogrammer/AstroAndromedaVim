local lint_and_format_plugins = {}

lint_and_format_plugins["stevearc/conform.nvim"] = {
  lazy = true,
  cmd = "ConformInfo",
  cfg = "coding.conform",
  event = { "BufReadPre", "BufNewFile" },
}

lint_and_format_plugins["mfussenegger/nvim-lint"] = {
  event = "User AstroFile",
  cfg = "coding.nvim-lint",
}

return lint_and_format_plugins
