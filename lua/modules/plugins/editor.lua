local editor = { "tpope/vim-fugitive", "tpope/vim-rhubarb", "tpope/vim-sleuth" }

editor["nvim-neo-tree/neo-tree.nvim"] = { cmd = "Neotree", merge = "editor.neotree" }
editor["LunarVim/bigfile.nvim"] = { event = "LspAttach", opts = require("editor.bigfile") }

editor["stevearc/aerial.nvim"] = {
  event = "User AstroFile",
  merge = "completion.aerial",
}

-- Automatically highlights other instances of the word under your cursor.
-- This works with LSP, Treesitter, and regexp matching to find the other
-- instances.
editor["RRethy/vim-illuminate"] = {
  "RRethy/vim-illuminate",
  event = "User AstroFile",
  keys = {
    { "]]", desc = "Next Reference" },
    { "[[", desc = "Prev Reference" },
  },
}

return editor
