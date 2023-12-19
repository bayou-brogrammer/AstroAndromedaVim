local coding_plugins = {}

coding_plugins["stevearc/conform.nvim"] = {
  lazy = true,
  cmd = "ConformInfo",
  cfg = "coding.conform",
  event = { "BufReadPre", "BufNewFile" },
}

coding_plugins["echasnovski/mini.ai"] = { cfg = "coding.mini_ai" }
coding_plugins["echasnovski/mini.comment"] = {
  event = "User AstroFile",
  dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
  cfg = "coding.comment",
}

coding_plugins["mfussenegger/nvim-lint"] = {
  event = "User AndromedaFile",
  cfg = "coding.nvim-lint",
}

return coding_plugins
