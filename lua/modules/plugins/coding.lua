local coding_plugins = {}

coding_plugins["stevearc/conform.nvim"] = {
  lazy = true,
  cmd = "ConformInfo",
  cfg = "coding.conform",
  event = { "BufReadPre", "BufNewFile" },
}

coding_plugins["mfussenegger/nvim-lint"] = {
  event = "User AstroFile",
  cfg = "coding.nvim-lint",
}

coding_plugins["echasnovski/mini.ai"] = {
  cfg = "coding.mini_ai",
}
coding_plugins["echasnovski/mini.comment"] = {
  event = "User AstroFile",
  dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
  cfg = "coding.comment",
}

return coding_plugins
