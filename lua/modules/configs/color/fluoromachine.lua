local settings = require("configuration")
local themes = { "delta", "retrowave", "default" } -- delta, retrowave, default
local theme = table.find(themes, settings.theme_style) or "retrowave"

local function overrides(c)
  return {
    TelescopePreviewNormal = { bg = c.bg },
    TelescopePromptPrefix = { fg = c.purple },
    TelescopeResultsNormal = { bg = c.alt_bg },
    TelescopeTitle = { fg = c.fg, bg = c.comment },
    TelescopePromptBorder = { fg = c.alt_bg, bg = c.alt_bg },
    TelescopeResultsBorder = { fg = c.alt_bg, bg = c.alt_bg },
  }
end

return {
  config = function()
    settings.utils.activate_colorscheme(
      "fluoromachine",
      require("fluoromachine").setup({
        glow = true,
        theme = theme,
        overrides = overrides,
        transparent = settings.enable_transparent,
      })
    )
  end,
}
