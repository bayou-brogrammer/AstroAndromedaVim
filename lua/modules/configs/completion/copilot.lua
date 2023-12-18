return {
  opts = {
    -- panel = { enabled = false },
    cmp = { enabled = true, method = "getCompletionsCycling" },

    suggestion = {
      debounce = 150,
      auto_trigger = true,

      keymap = {
        next = "<C-.>",
        prev = "<C-,>",
        accept = "<C-l>",
        dismiss = "<C/>",
        accept_word = false,
        accept_line = false,
      },
    },

    filetypes = {
      -- help = true,
      -- markdown = true,
      ["dap-repl"] = false,
      ["big_file_disabled_ft"] = false,
    },
  },
  dependencies = {
    -- copilot cmp source
    {
      "nvim-cmp",
      dependencies = {
        {
          "zbirenbaum/copilot-cmp",
          dependencies = "copilot.lua",
          opts = {},
          config = function(_, opts)
            local copilot_cmp = require("copilot_cmp")
            copilot_cmp.setup(opts)

            -- attach cmp source whenever copilot attaches
            -- fixes lazy-loading issues with the copilot cmp source
            Andromeda.lib.lsp.on_attach(function(client)
              if client.name == "copilot" then copilot_cmp._on_insert_enter({}) end
            end)
          end,
        },
      },
      ---@param opts cmp.ConfigSchema
      opts = function(_, opts)
        table.insert(opts.sources, 1, {
          name = "copilot",
          group_index = 1,
          priority = 100,
        })
      end,
    },
  },
}
