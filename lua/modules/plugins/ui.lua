local ui = {}

ui["AstroNvim/astroui"] = {
  lazy = true,
  ---@type AstroUIOpts
  opts = {
    icons = Andromeda.icons,
  },
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
  event = { "User AndromedaFile", "VeryLazy" },
  dependencies = {
    { "MunifTanjim/nui.nvim", lazy = true },
    { "nvim-tree/nvim-web-devicons", lazy = true },
    { "AstroNvim/astrocore", opts = require("mappings").noice },
  },
}

ui["folke/trouble.nvim"] = {
  cmd = { "TroubleToggle", "Trouble" },
  cfg = "ui.trouble",
}

return ui
