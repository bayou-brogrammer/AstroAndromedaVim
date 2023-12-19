return {
  ---@type AstroCoreOpts
  opts = {
    mappings = require("modules.mappings").astrocore,

    -- modify core features of AstroNvim
    features = {
      cmp = true, -- enable completion at start
      autopairs = true, -- enable autopairs at start
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
      max_file = { size = 1024 * 100, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
    },
  },
}
