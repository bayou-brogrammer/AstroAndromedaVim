local coding_plugins = {}

coding_plugins["echasnovski/mini.ai"] = {
  merge = "coding.mini_ai",
}
coding_plugins["echasnovski/mini.comment"] = {
  event = "User AstroFile",
  dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
  merge = "coding.comment",
}

return coding_plugins
