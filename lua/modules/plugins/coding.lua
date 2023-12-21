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

coding_plugins["folke/neodev.nvim"] = {
  version = false,
  event = "VeryLazy",
  dependencies = { "hrsh7th/nvim-cmp" },
  opts = {},
  config = function()
    require("neodev").setup({
      library = { plugins = { "nvim-dap-ui" }, types = true },
      override = function(root_dir, library)
        local util = require("neodev.util")
        if util.has_file(root_dir, "/etc/nixos") or util.has_file(root_dir, "nvim-config") then
          library.enabled = true
          library.plugins = true
        end
      end,
    })
  end,
}

return coding_plugins
