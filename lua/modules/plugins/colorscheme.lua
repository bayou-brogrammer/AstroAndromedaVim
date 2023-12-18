local colorschemes = {}

colorschemes["zaldih/themery.nvim"] = {
  lazy = false,
  config = function(_, opts)
    require("themery").setup({
      themeConfigFile = "/home/n16hth4wk/.config/astro/settings/theme.lua",
      themes = { "astrodark", "catppuccin", "lvim", "onedark", "fluoromachine", "solarized-osaka" },
    })
  end,
}

colorschemes["NvChad/nvim-colorizer.lua"] = {
  event = "User AndromedaFile",
  cmd = { "ColorizerToggle", "ColorizerAttachToBuffer", "ColorizerDetachFromBuffer", "ColorizerReloadAllBuffers" },
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        maps.n["<Leader>uz"] = { "<Cmd>ColorizerToggle<CR>", desc = "Toggle color highlight" }
      end,
    },
  },
  opts = { user_default_options = { names = false } },
}

colorschemes["navarasu/onedark.nvim"] = {
  priority = 1000,
  opts = {
    style = "dark", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    term_colors = true, -- Change terminal color as per the selected theme style
    transparent = true, -- Show/hide background
    ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
    cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu
  },
}

colorschemes["craftzdog/solarized-osaka.nvim"] = {
  priority = 1000,
  opts = { transparent = true },
}

colorschemes["catppuccin/nvim"] = {
  name = "catppuccin",
  opts = {
    integrations = {
      cmp = true,
      mini = true,
      leap = true,
      noice = true,
      neotest = true,
      markdown = true,
      overseer = true,
      sandwich = false,
      lsp_trouble = true,
      rainbow_delimiters = true,
    },
    dependencies = { { "AstroNvim/astroui", opts = { colorscheme = "fluoromachine" } } },
  },
}

colorschemes["maxmx03/fluoromachine.nvim"] = { priority = 1000, cfg = "color.fluoromachine" }
colorschemes["lvim-tech/lvim-colorscheme"] = { priority = 100, opts = require("color.lvim") }

return colorschemes
