local coding_plugins = {}

coding_plugins["AstroNvim/astrocore"] = {
  ---@type AstroCoreOpts
  opts = {
    mappings = require("mappings").astrocore,

    -- modify core features of AstroNvim
    features = {
      cmp = true, -- enable completion at start
      autopairs = true, -- enable autopairs at start
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
      max_file = { size = 1024 * 100, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
    },
  },
}

coding_plugins["stevearc/conform.nvim"] = {
  lazy = true,
  cmd = "ConformInfo",
  event = { "BufReadPre", "BufNewFile" },
  cfg = "coding.conform",
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
