---@diagnostic disable: undefined-field

Andromeda.configs.cmp = function()
  local cmp = require("cmp")
  local luasnip = require("luasnip")
  local astro = require("astrocore")
  local defaults = require("cmp.config.default")()
  local lspkind_status_ok, lspkind = pcall(require, "lspkind")

  local border_opts = {
    border = "rounded",
    winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
  }

  return {
    enabled = function()
      -- add interoperability with cmp-dap
      local dap_prompt = astro.is_available("cmp-dap")
        and vim.tbl_contains({ "dap-repl", "dapui_watches", "dapui_hover" }, vim.bo[0].filetype)
      if vim.bo[0].buftype == "prompt" and not dap_prompt then return false end

      ---@diagnostic disable-next-line: undefined-field
      if vim.b.cmp_enabled == nil then
        return require("astrocore").config.features.cmp
      else
        ---@diagnostic disable-next-line: undefined-field
        return vim.b.cmp_enabled
      end
    end,

    sorting = defaults.sorting,
    preselect = cmp.PreselectMode.Item,
    completion = { completeopt = "menu,menuone,noinsert" },
    experimental = { ghost_text = { hl_group = "CmpGhostText" } },
    snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },

    confirm_opts = {
      select = false,
      behavior = cmp.ConfirmBehavior.Replace,
    },

    duplicates = {
      path = 1,
      buffer = 1,
      luasnip = 1,
      nvim_lsp = 1,
      cmp_tabnine = 1,
    },

    formatting = {
      fields = { "kind", "abbr", "menu" },
      format = lspkind_status_ok and lspkind.cmp_format(astro.plugin_opts("lspkind.nvim")) or nil,
    },

    window = {
      completion = cmp.config.window.bordered(border_opts),
      documentation = cmp.config.window.bordered(border_opts),
    },

    sources = cmp.config.sources({
      { name = "nvim_lsp", priority = 1000 },
      { name = "luasnip", priority = 750 },
      { name = "buffer", priority = 500 },
      { name = "path", priority = 250 },
      { name = "emoji" },
    }),

    mapping = cmp.mapping.preset.insert(Andromeda.mappings.cmp()),
  }
end
