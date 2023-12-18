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
        path_display = { "truncate" },
        sorting_strategy = "ascending",

        prompt_prefix = Andromeda.icons.get("Telescope", 2),
        selection_caret = Andromeda.icons.get("Selected", 1),

        file_sorter = require("telescope.sorters").get_fuzzy_file,
        git_worktrees = require("astrocore").config.git_worktrees,
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,

        layout_config = {
          width = 0.85,
          height = 0.92,
          preview_cutoff = 120,
          vertical = { mirror = false },
          horizontal = { prompt_position = "top", preview_width = 0.55, results_width = 0.8 },
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

        vimgrep_arguments = {
          "rg",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
      },

      extensions = {
        aerial = {
          show_lines = false,
          show_nesting = {
            ["_"] = false, -- This key will be the default
            lua = true, -- You can set the option for specific filetypes
          },
        },

        fzf = {
          fuzzy = false,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },

        frecency = {
          use_sqlite = false,
          show_scores = true,
          show_unindexed = true,
          ignore_patterns = { "*.git/*", "*/tmp/*" },
        },

        -- live_grep_args = {
        --   auto_quoting = true, -- enable/disable auto-quoting
        --   -- define mappings, e.g.
        --   mappings = { -- extend mappings
        --     i = {
        --       ["<C-k>"] = lga_actions.quote_prompt(),
        --       ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
        --     },
        --   },
        -- },

        undo = {
          side_by_side = true,
          mappings = { -- this whole table is the default
            i = {
              -- IMPORTANT: Note that telescope-undo must be available when telescope is configured if
              -- you want to use the following actions. This means installing as a dependency of
              -- telescope in it's `requirements` and loading this extension from there instead of
              -- having the separate plugin definition as outlined above. See issue #6.
              ["<C-cr>"] = require("telescope-undo.actions").restore,
              ["<cr>"] = require("telescope-undo.actions").yank_additions,
              ["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
            },
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
