return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      integrations = {
        sandwich = false,
        noice = true,
        mini = true,
        leap = true,
        markdown = true,
        neotest = true,
        cmp = true,
        overseer = true,
        lsp_trouble = true,
        rainbow_delimiters = true,
      },
    },
  },

  {
    "lvim-tech/lvim-colorscheme",
    priority = 100,
    opts = {
      style = "dark", -- dark, darksoft, light
      -- default = "lvim-gruvbox-dark",
      -- default = "lvim-catppuccin-dark",

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
        "dbui",
        "qf",
        "pqf",
        "Outline",
        "terminal",
        "packer",
        "calendar",
        "spectre_panel",
        "ctrlspace",
        "neo-tree",
      },
    },
  },

  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = { colorscheme = "lvim" },
  },
}
