local cfg = Andromeda.configs.dashboard

return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = Andromeda.default_dashboard == "hyper" and cfg.hypr or cfg.doom,
  },
}
