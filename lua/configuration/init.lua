---@class AndromedaSettings
local conf = Andromeda.settings
conf.utils = require("configuration.utils")

-- THEME CONFIGURATION
-- Available themes:
--   nightfox, tokyonight, dracula, kanagawa, catppuccin,
--   tundra, onedarkpro, everforest, monokai-pro, onedark, fluoromachine
-- A configuration file for each theme is in lua/themes/
-- Use <F8> to step through themes
conf.enabled_themes = {
  "astrodark",
  "tokyonight",
  "catppuccin",
  "fluoromachine",
  "solarized-osaka",
}
conf.theme = "tokyonight"
-- Available styles are:
--   kanagawa:    wave, dragon, lotus
--   tokyonight:  night, storm, day, moon
--   dracula:     blood, magic, soft, default
--   fluoromachine: delta, retrowave, default
--   catppuccin:  latte, frappe, macchiato, mocha, custom
--   onedarkpro:  onedark, onelight, onedark_vivid, onedark_dark
--   monokai-pro: classic, octagon, pro, machine, ristretto, spectrum
--   nightfox:    carbonfox, dawnfox, dayfox, duskfox, nightfox, nordfox, terafox
conf.theme_style = "moon"
-- enable transparency if the theme supports it
conf.enable_transparent = true

-- GLOBAL OPTIONS CONFIGURATION
-- Some prefer space as the map leader, but why
conf.mapleader = " "
conf.maplocalleader = ","
-- set numbered lines
conf.number = true
-- set relative numbered lines
conf.relative_number = true
-- always show tabs; 0 never, 1 only if at least two tab pages, 2 always
conf.showtabline = 2
-- use rg instead of grep
conf.grepprg = "rg --hidden --vimgrep --smart-case --"

-- ENABLE/DISABLE/SELECT PLUGINS
--
-- AI coding assistants - ChatGPT, Code Explain, Codeium, Copilot, NeoAI
-- Enable Github Copilot if you have an account, it is superior
--
-- Enable the telescope theme switcher plugin
conf.enable_telescope_themes = true

return conf
