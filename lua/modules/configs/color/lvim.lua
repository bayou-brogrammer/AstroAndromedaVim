local settings = require("configuration")

return {
  style = settings.theme_style, -- dark, darksoft, light

  styles = {
    variables = {},
    comments = { italic = true, bold = true },
    keywords = { italic = true, bold = true },
    functions = { italic = true, bold = true },
  },

  colors = {
    dark = {},
    light = {},
    darksoft = {},
  },

  sidebars = {
    "qf",
    "pqf",
    "dbui",
    "packer",
    "Outline",
    "terminal",
    "calendar",
    "neo-tree",
    "ctrlspace",
    "spectre_panel",
  },

  config = function(_, opts)
    settings.utils.activate_colorscheme("lvim", function() require("lvim").setup(opts) end, true)
  end,
}
