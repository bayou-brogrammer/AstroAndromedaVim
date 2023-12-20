local settings = Andromeda.settings

local colorschemes = {}
local active_theme = settings.theme
local enabled_themes = settings.enabled_themes

colorschemes["lvim-tech/lvim-colorscheme"] = { cfg = "themes.lvim" }
colorschemes["olimorris/onedarkpro.nvim"] = { cfg = "themes.onedark" }
colorschemes["maxmx03/fluoromachine.nvim"] = { cfg = "themes.fluoromachine" }
colorschemes["craftzdog/solarized-osaka.nvim"] = { cfg = "themes.solarized_osaka" }
colorschemes["catppuccin/nvim"] = { name = "catppuccin", cfg = "themes.catppuccin" }
colorschemes["folke/tokyonight.nvim"] = { branch = "main", cfg = "themes.tokyonight" }

colorschemes = table.map(colorschemes, function(theme, theme_name)
  local theme_key = theme.name or Andromeda.lib.path.get_filename(theme_name)

  if table.find(enabled_themes, theme_key) == nil then theme.enabled = false end
  theme.priority = 1000
  theme.lazy = false

  return theme
end)

return Andromeda.lib.extend_tbl({
  ["NvChad/nvim-colorizer.lua"] = {
    event = "User AstroFile",
    opts = { user_default_options = { names = false } },
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
  },

  ["zaldih/themery.nvim"] = {
    lazy = false,
    config = function(_, opts)
      require("themery").setup({
        themeConfigFile = "/home/n16hth4wk/.config/nvim/settings/theme.lua",
        themes = { "astrodark", "catppuccin", "lvim", "onedarkpro", "fluoromachine", "solarized-osaka" },
      })
    end,
  },
}, colorschemes)
