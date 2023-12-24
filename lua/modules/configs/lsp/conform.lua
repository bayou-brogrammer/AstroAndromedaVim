return {
  dependencies = {
    { "AstroNvim/astrocore", opts = require("modules.mappings").conform_nvim },
  },
  init = function()
    -- Install the conform formatter on VeryLazy
    -- Andromeda.kit.on_very_lazy(function()
    --   Andromeda.kit.format.register({
    --     priority = 100,
    --     primary = true,
    --     name = "conform.nvim",

    --     format = function(buf)
    --       local plugin = require("lazy.core.config").plugins["conform.nvim"]
    --       local Plugin = require("lazy.core.plugin")
    --       local opts = Plugin.values(plugin, "opts", false)
    --       require("conform").format(Andromeda.kit.merge(opts.format, { bufnr = buf }))
    --     end,

    --     sources = function(buf)
    --       local ret = require("conform").list_formatters(buf)
    --       ---@param v conform.FormatterInfo
    --       return vim.tbl_map(function(v) return v.name end, ret)
    --     end,
    --   })
    -- end)
  end,

  opts = function()
    ---@class ConformOpts
    local opts = {
      format = {
        timeout_ms = 3000,
        async = false, -- not recommended to change
        quiet = false, -- not recommended to change
      },

      ---@type table<string, conform.FormatterUnit[]>
      formatters_by_ft = {
        sh = { "shfmt" },
        lua = { "stylua" },
        nix = { "alejandra" },
        fish = { "fish_indent" },
        python = { "isort", "black" },
      },

      formatters = {
        injected = { options = { ignore_errors = true } },
        -- # Example of using dprint only when a dprint.json file is present
        -- dprint = {
        --   condition = function(ctx)
        --     return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
        --   end,
        -- },
        --
        -- # Example of using shfmt with extra args
        -- shfmt = {
        --   prepend_args = { "-i", "2", "-ci" },
        -- },
      },
    }

    return opts
  end,

  config = function(_, opts) require("conform").setup(opts) end,
}
