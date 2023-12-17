local editor = {}

editor["nvim-neo-tree/neo-tree.nvim"] = {
  cmd = "Neotree",
  cfg = "editor.neotree",
}

editor["https://git.sr.ht/~whynothugo/lsp_lines.nvim"] = {
  event = "LspAttach",
  cfg = "editor.lsp_lines",
}

return editor
