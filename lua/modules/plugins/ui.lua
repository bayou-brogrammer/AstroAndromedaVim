local ui = {
  "nvim-lua/plenary.nvim",
}

ui["nvimdev/dashboard-nvim"] = {
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = require("ui.dashboard"),
}

ui["echasnovski/mini.indentscope"] = {
  event = { "BufReadPre", "BufNewFile" },
  merge = require("ui.indentscope"),
}

ui["folke/noice.nvim"] = {
  merge = require("ui.noice"),
  event = { "User AstroFile", "VeryLazy" },
  dependencies = {
    { "MunifTanjim/nui.nvim", lazy = true },
    { "nvim-tree/nvim-web-devicons", lazy = true },
    { "AstroNvim/astrocore", opts = require("modules.mappings").noice },
  },
}

ui["folke/trouble.nvim"] = {
  merge = require("ui.trouble"),
  cmd = { "TroubleToggle", "Trouble" },
}

ui["rebelot/heirline.nvim"] = {
  merge = require("ui.heirline"),
}

return ui
