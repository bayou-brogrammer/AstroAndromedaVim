local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.g.astronvim_first_install = true -- lets AstroNvim know that this is an initial installation
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

local USE_STABLE = false

---@type LazyConfig
local lazy_opts = {
  spec = {
    { import = "astronvim.lazy_snapshot", cond = USE_STABLE },
    { "AstroNvim/AstroNvim", branch = "v4", version = USE_STABLE and "^4" or nil, import = "astronvim.plugins" },
    { "AstroNvim/astrocommunity", branch = "v4" },
    { import = "plugins" },
  },

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

    -- icons = {
    --   ft = icons.File,
    --   lazy = icons.Lazy,
    --   task = icons.Check,
    --   config = icons.Gear,
    --   event = icons.Event,
    --   cmd = icons.Terminal,
    --   init = icons.LazyInit,
    --   keys = icons.Keyboard,
    --   plugin = icons.Package,
    --   runtime = icons.NeoVim,
    --   start = icons.LazyStart,
    --   import = icons.FileImport,
    --   source = icons.SourceCode,
    --   require = icons.LazyRequire,
    --   loaded = icons.PackageLoaded,
    --   not_loaded = icons.PackageUninstalled,
    --   list = { "●", "➜", "★", "‒" },
    -- },
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

require("lazy")--[[@as Lazy]]
  .setup(lazy_opts)
