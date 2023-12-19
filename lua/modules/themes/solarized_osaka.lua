local settings = Andromeda.settings

return {
  opts = { transparent = settings.enable_transparent },
  config = function(_, opts)
    settings.utils.activate_colorscheme("solarized-osaka", function() require("solarized-osaka").setup(opts) end, true)
  end,
}
