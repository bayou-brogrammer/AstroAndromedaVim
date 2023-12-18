local Lazy = {}

local USE_STABLE = false
local icons = Andromeda.icons

local vim_path = Globals.vim_path
local data_dir = Globals.data_dir
local modules_dir = vim_path .. "/lua/modules"
local lazy_path = data_dir .. "lazy/lazy.nvim"
local plugin_dir = modules_dir .. "/plugins/*.lua"

function Lazy:init_lazy()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.g.astronvim_first_install = true -- lets AstroNvim know that this is an initial installation
    -- stylua: ignore
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
  end
  vim.opt.rtp:prepend(vim.env.LAZY or lazypath)
end

function Lazy:load_plugins()
  self.modules = {
    { import = "astronvim.lazy_snapshot", cond = USE_STABLE },
    { "AstroNvim/AstroNvim", branch = "v4", version = USE_STABLE and "^4" or nil, import = "astronvim.plugins" },
    { "AstroNvim/astrocommunity", branch = "v4" },
  }

  local append_nativertp = function()
    package.path = package.path
      .. string.format(
        ";%s;%s;%s;",
        modules_dir .. "/?.lua",
        modules_dir .. "/?/init.lua",
        modules_dir .. "/configs/?.lua",
        modules_dir .. "/configs/?/init.lua"
      )
  end

  local get_plugins_list = function()
    local list = {}
    local plugins_list = vim.split(vim.fn.glob(plugin_dir), "\n")
    for _, f in ipairs(plugins_list) do
      -- aggregate the plugins from `/plugins/*.lua` and `/user/plugins/*.lua` to a plugin list of a certain field for later `require` action.
      -- current fields contains: completion, editor, lang, tool, ui
      list[#list + 1] = f:find(modules_dir) and f:sub(#modules_dir - 6, -1)
    end

    return list
  end

  append_nativertp()

  for _, m in ipairs(get_plugins_list()) do
    -- require modules returned from `get_plugins_list()` function.
    local modules = require(m:sub(0, #m - 4))

    if type(modules) == "table" then
      for name, conf in pairs(modules) do
        if conf.cfg ~= nil then conf = vim.tbl_extend("force", conf, require(conf.cfg)) end

        if conf.import ~= nil then
          self.modules[#self.modules + 1] = conf
        else
          self.modules[#self.modules + 1] = vim.tbl_extend("force", { name }, conf)
        end
      end
    end
  end
end
function Lazy:load_lazy()
  self:init_lazy()
  self:load_plugins()

  ---@class LazyConfig
  local lazy_opts = {
    checker = { enabled = true },
    change_detection = { enabled = true },
    defaults = { lazy = true, version = false },
    install = { missing = true, colorscheme = { "onedark", "astrodark", "catppuccin-mocha", "solarized-osaka" } },

    dev = {
      path = "",
      fallback = false,
      patterns = { "AndromedaVim" },
    },

    ui = {
      -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
      border = "double",

      icons = {
        ft = icons.File,
        lazy = icons.Lazy,
        task = icons.Check,
        config = icons.Gear,
        event = icons.Event,
        cmd = icons.Terminal,
        init = icons.LazyInit,
        keys = icons.Keyboard,
        plugin = icons.Package,
        runtime = icons.NeoVim,
        start = icons.LazyStart,
        import = icons.FileImport,
        source = icons.SourceCode,
        require = icons.LazyRequire,
        loaded = icons.PackageLoaded,
        not_loaded = icons.PackageUninstalled,
        list = { "●", "➜", "★", "‒" },
      },
    },

    performance = {
      rtp = {
        -- disable some rtp plugins, add more to your liking
        disabled_plugins = {
          "gzip",
          "netrwPlugin",
          "tarPlugin",
          "tohtml",
          "zipPlugin",
        },
      },
    },
  }

  if Globals.is_mac then lazy_opts.concurrency = 20 end

  require("lazy")--[[@as Lazy]]
    .setup(self.modules, lazy_opts)
end

Lazy:load_lazy()
