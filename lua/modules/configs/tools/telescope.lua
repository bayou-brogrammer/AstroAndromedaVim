---@diagnostic disable: undefined-field

---@param ext string
local function load_telescope_plugin(ext)
  return function()
    ---@diagnostic disable-next-line: unused-function, unused-function, redundant-parameter
    require("astrocore").on_load("telescope.nvim", function() require("telescope").load_extension(ext) end)
  end
end

local telescope_deps = {
  { "nvim-lua/plenary.nvim" },
  { "nvim-tree/nvim-web-devicons" },
  { "debugloop/telescope-undo.nvim", config = load_telescope_plugin("undo") },
  { "jvgrootveld/telescope-zoxide", config = load_telescope_plugin("zoxide") },
  { "nvim-telescope/telescope-frecency.nvim", config = load_telescope_plugin("frecency") },
  { "nvim-telescope/telescope-live-grep-args.nvim", config = load_telescope_plugin("live_grep_args") },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = load_telescope_plugin("fzf"),
    enabled = vim.fn.executable("make") == 1,
  },
}

return {
  dependencies = {
    telescope_deps,
    { "AstroNvim/astrocore", opts = require("mappings.telescope") },
  },

  opts = function()
    local actions = require("telescope.actions")

    return {
      defaults = {
        git_worktrees = require("astrocore").config.git_worktrees,

        prompt_prefix = Andromeda.icons.get("Selected", 1),
        selection_caret = Andromeda.icons.get("Selected", 1),

        path_display = { "truncate" },
        sorting_strategy = "ascending",

        layout_config = {
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
          vertical = { mirror = false },
          horizontal = { prompt_position = "top", preview_width = 0.55 },
        },

        mappings = {
          n = { q = actions.close },
          i = {
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
        },
      },
    }
  end,
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("notify")
    require("telescope").load_extension("aerial")
    -- require("telescope").load_extension("projects")
    -- require("telescope").load_extension("persisted")
  end,
}
