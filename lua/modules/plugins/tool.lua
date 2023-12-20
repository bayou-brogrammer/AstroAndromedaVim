local tools = {}

tools["kevinhwang91/nvim-bqf"] = {
  ft = "qf",
  lazy = true,
  dependencies = { { "junegunn/fzf", build = ":call fzf#install()" } },
  opts = { preview = { border = "single", wrap = true, winblend = 0 } },
}

tools["nvim-telescope/telescope.nvim"] = {
  lazy = true,
  version = false, -- telescope did only one release, so use HEAD for now
  cmd = "Telescope",
  cfg = "tools.telescope",
}

return tools
