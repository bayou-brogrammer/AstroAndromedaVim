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
  cfg = "ui.indentscope",
}

ui["folke/noice.nvim"] = {
  cfg = "ui.noice",
  event = { "User AstroFile", "VeryLazy" },
  dependencies = {
    { "MunifTanjim/nui.nvim", lazy = true },
    { "nvim-tree/nvim-web-devicons", lazy = true },
    { "AstroNvim/astrocore", opts = require("modules.mappings").noice },
  },
}

ui["folke/trouble.nvim"] = {
  cfg = "ui.trouble",
  cmd = { "TroubleToggle", "Trouble" },
}

ui["rebelot/heirline.nvim"] = {
  cfg = "ui.heirline",
}

return ui
