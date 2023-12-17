Andromeda.configs.dashboard = function()
  local get_icon = function(icon) return Andromeda.icons.get(icon, 1, true) end
  local function wrap_text(text, icon) return icon .. " " .. text .. " " .. icon end

  local opts = {
    theme = "doom",
    hide = { statusline = true },

    config = {
      week_header = {
        enable = true,
        append = { "", wrap_text("AndromedaVim: Explore the Universe!", get_icon("LazyInit")) },
      },

      -- stylua: ignore
      center = {
        { action = "ene | startinsert",                                             desc = " New file",     icon = get_icon ("File"),      key = "n" },
        { action = "Telescope find_files",                                          desc = " Find file",    icon = get_icon ("Search"),    key = "f" },
        { action = "Telescope oldfiles",                                            desc = " Recent files", icon = get_icon ("Files"),     key = "r" },
        { action = "Telescope live_grep",                                           desc = " Find text",    icon = get_icon ("Keyboard"),  key = "g" },
        { action = function() Andromeda.lib.telescope.config_files()() end,         desc = " Config",       icon = get_icon ("Gear"),      key = "c" },
        { action = "Lazy",                                                          desc = " Lazy",         icon = get_icon ("Lazy"),      key = "l" },
        { action = "qa",                                                            desc = " Quit",         icon = get_icon ("Power"),     key = "q" },
      },

      footer = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        return {
          wrap_text("Happiness is a state of mind.", get_icon("LazyInit")),
          "",
          wrap_text("Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms", "⚡"),
        }
      end,
    },
  }

  for _, button in ipairs(opts.config.center) do
    button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
    button.key_format = "  %s"
  end

  -- close Lazy and re-open when the dashboard is ready
  if vim.o.filetype == "lazy" then
    vim.cmd.close()
    vim.api.nvim_create_autocmd("User", {
      pattern = "DashboardLoaded",
      callback = function() require("lazy").show() end,
    })
  end

  return opts
end
