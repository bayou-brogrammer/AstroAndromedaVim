return {
  dependencies = {
    {
      "AstroNvim/astroui",
      opts = {
        colorscheme = "fluoromachine",
      },
    },
  },

  config = function()
    local fm = require("fluoromachine")

    fm.setup({
      glow = true,
      transparent = true,
      theme = "retrowave", -- delta, retrowave, default
    })
  end,
}
