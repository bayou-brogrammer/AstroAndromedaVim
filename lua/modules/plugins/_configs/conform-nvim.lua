Andromeda.configs["conform_nvim"] = {
  init = function()
    -- Install the conform formatter on VeryLazy
    Andromeda.lib.on_very_lazy(function()
      Andromeda.lib.format.register({
        priority = 100,
        primary = true,
        name = "conform.nvim",

        format = function(buf)
          local plugin = require("lazy.core.config").plugins["conform.nvim"]
          local Plugin = require("lazy.core.plugin")
          local opts = Plugin.values(plugin, "opts", false)
          require("conform").format(Andromeda.lib.merge(opts.format, { bufnr = buf }))
        end,

        sources = function(buf)
          local ret = require("conform").list_formatters(buf)
          ---@param v conform.FormatterInfo
          return vim.tbl_map(function(v) return v.name end, ret)
        end,
      })
    end)
  end,
}
