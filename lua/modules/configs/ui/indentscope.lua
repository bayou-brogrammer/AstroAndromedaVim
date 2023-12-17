local cfg = require("ui.indentscope_astrocore")

local char = "╎"
local ignore_buftypes = cfg.ignore_buftypes
local ignore_filetypes = cfg.ignore_filetypes

return {
  dependencies = {
    { "AstroNvim/astrocore", opts = cfg.config },

    {
      "lukas-reineke/indent-blankline.nvim",
      main = "ibl",
      opts = {
        indent = { char = char },
        scope = { enabled = true },
        exclude = { buftypes = ignore_buftypes, filetypes = ignore_filetypes },
      },
    },
  },

  opts = function()
    return {
      draw = { delay = 0, animation = function() return 0 end },
      options = { try_as_border = true },
      symbol = require("astrocore").plugin_opts("indent-blankline.nvim").context_char or char,
    }
  end,
}
