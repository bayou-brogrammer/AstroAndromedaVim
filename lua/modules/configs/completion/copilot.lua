return {
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
            Andromeda.kit.lsp.on_attach(function(client)
              if client.name == "copilot" then copilot_cmp._on_insert_enter({}) end
            end)
          end,
        },
      },
      --stylua: ignore
      ---@param opts cmp.ConfigSchema
      opts = function(_, opts)
        local cmp, copilot = require("cmp"), require("copilot.suggestion")
        local snip_status_ok, luasnip = pcall(require, "luasnip") --[[@as LuaSnip]]
        if not snip_status_ok then return end

        local function has_words_before()
          local line, col = unpack(vim.api.nvim_win_get_cursor(0))
          return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end

        table.insert(opts.sources, 1, {
          name = "copilot",
          group_index = 1,
          priority = 100,
        })

        if not opts.mapping then opts.mapping = {} end

        

        opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
          if copilot.is_visible() then
            copilot.accept()
          elseif cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" })
    
        opts.mapping["<C-x>"] = cmp.mapping(function() if copilot.is_visible() then copilot.next() end end)
        opts.mapping["<C-z>"] = cmp.mapping(function() if copilot.is_visible() then copilot.prev() end end)
        opts.mapping["<C-c>"] = cmp.mapping(function() if copilot.is_visible() then copilot.dismiss() end end)
        opts.mapping["<C-l>"] = cmp.mapping(function() if copilot.is_visible() then copilot.accept_word() end end)
        opts.mapping["<C-j>"] = cmp.mapping(function() if copilot.is_visible() then copilot.accept_line() end end)
        opts.mapping["<C-down>"] = cmp.mapping(function() if copilot.is_visible() then copilot.accept_line() end end)
        opts.mapping["<C-right>"] = cmp.mapping(function() if copilot.is_visible() then copilot.accept_word() end end)
    
        return opts
      end,
    },
  },
  opts = {
    panel = { enabled = false },
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
}
