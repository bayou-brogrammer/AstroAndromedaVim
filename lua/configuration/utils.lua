---@type AndromedaSettingsUtils
Andromeda.settings.utils = {}

---@class AndromedaSettingsUtils
local conf = Andromeda.settings.utils

--! >>>>>>>>>>>>>>>>>>>>>>>>>>> CONF SETTINGS <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< --
---@param theme string
conf.is_theme_active = function(theme)
  return Andromeda.settings.enabled_themes[theme] ~= nil and theme == Andromeda.settings.theme
end

---@param theme string
conf.set_colorscheme = function(theme)
  Andromeda.lib.try(function() vim.cmd.colorscheme(theme) end, {
    on_error = function()
      vim.notify(("Error setting up colorscheme: `%s`"):format(theme), vim.log.levels.ERROR, { title = "AstroUI" })
    end,
  })
end

---@param scheme string
---@param setup_fn function
---@param activate_theme? boolean
conf.activate_colorscheme = function(scheme, setup_fn, activate_theme)
  if Andromeda.settings.theme == scheme then
    local colorscheme = scheme or Andromeda.settings.theme
    activate_theme = activate_theme or conf.is_theme_active(colorscheme) or false

    Andromeda.lib.try(function()
      setup_fn()
      if activate_theme then conf.set_colorscheme(scheme) end
    end, {
      on_error = function()
        vim.notify(
          ("Error setting up colorscheme: `%s`"):format(colorscheme),
          vim.log.levels.ERROR,
          { title = "AstroUI" }
        )
      end,
    })
  end
end

return conf
