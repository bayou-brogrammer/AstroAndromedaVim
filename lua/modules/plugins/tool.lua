local tools = {}

tools["nvim-telescope/telescope.nvim"] = {
  lazy = true,
  version = false, -- telescope did only one release, so use HEAD for now
  cmd = "Telescope",
  cfg = "tools.telescope",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-tree/nvim-web-devicons" },
    { "jvgrootveld/telescope-zoxide" },
    { "debugloop/telescope-undo.nvim" },
    { "nvim-telescope/telescope-frecency.nvim" },
    { "nvim-telescope/telescope-live-grep-args.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
}

tools["kevinhwang91/nvim-bqf"] = {
  ft = "qf",
  lazy = true,
  dependencies = { { "junegunn/fzf", build = ":call fzf#install()" } },
  opts = { preview = { border = "single", wrap = true, winblend = 0 } },
}

return tools
