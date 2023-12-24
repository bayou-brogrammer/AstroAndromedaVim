local editor = { "tpope/vim-fugitive", "tpope/vim-rhubarb", "tpope/vim-sleuth" }

editor["nvim-neo-tree/neo-tree.nvim"] = { cmd = "Neotree", merge = require("editor.neotree") }
editor["LunarVim/bigfile.nvim"] = { event = "LspAttach", opts = require("editor.bigfile") }

editor["stevearc/aerial.nvim"] = {
  event = "User AstroFile",
  merge = require("completion.aerial"),
}

editor["echasnovski/mini.animate"] = {
  event = "VeryLazy",
  opts = require("editor.mini-animate"),
}

-- Flash enhances the built-in search functionality by showing labels
-- at the end of each match, letting you quickly jump to a specific
-- location.
editor["folke/flash.nvim"] = {
  event = "VeryLazy",
  vscode = true,
  opts = {},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
  merge = require("editor.flash"),
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
