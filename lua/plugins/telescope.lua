return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        ---@diagnostic disable-next-line: undefined-field
        require("telescope").load_extension("fzf")
      end,
    },
    keys = {
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
    },
    -- change some options
    -- opts = {
    --   defaults = {
    --     winblend = 0,
    --     layout_strategy = "horizontal",
    --     sorting_strategy = "ascending",
    --     layout_config = { prompt_position = "top" },
    --   },
    -- },
  },
}
