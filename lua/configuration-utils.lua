local conf = {}

--! >>>>>>>>>>>>>>>>>>>>>>>>>>> CONF SETTINGS <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< --
---@param theme string
conf.is_theme_active = function(theme) return conf.enabled_themes[theme] ~= nil and theme == conf.theme end

---@param theme string
conf.set_colorscheme = function(theme)
  Andromeda.lib.try(vim.cmd.colorscheme(theme), {
    on_error = function()
      vim.notify(("Error setting up colorscheme: `%s`"):format(theme), vim.log.levels.ERROR, { title = "AstroUI" })
    end,
  })
end

---@param scheme string
---@param setup_fn function
---@param activate_theme? boolean
conf.activate_colorscheme = function(scheme, setup_fn, activate_theme)
  if conf.theme == scheme then
    local colorscheme = scheme or conf.theme
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
