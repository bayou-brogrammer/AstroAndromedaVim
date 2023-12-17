return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = { "hrsh7th/cmp-emoji" },
    opts = function()
      local cmp = require("cmp")

      return {
        sources = cmp.config.sources({
          { name = "nvim_lsp", priority = 1000 },
          { name = "luasnip", priority = 750 },
          { name = "buffer", priority = 500 },
          { name = "path", priority = 250 },
          { name = "emoji" },
        }),

        mapping = cmp.mapping.preset.insert(Andromeda.mappings.cmp()),
      }
    end,
  },
}
