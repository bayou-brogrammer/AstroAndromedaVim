Andromeda.lib.lsp = {}

---@diagnostic disable: inject-field
---@class AndromedaLanguageCfg
---@field config? table
---@field handler? table
---@field servers? string[]
---@field server_cfg? string
---@field treesitter string[]
---@field formatter? table
---@field dependencies? table
---@field none_ls? function

local M = Andromeda.lib.lsp

function M.add_lsp_deps(lsp_servers, treesitter_extension, none_ls_fn, formatter)
  local deps = {
    {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts) Andromeda.lib.extend_list_opt(opts, treesitter_extension) end,
    },

    {
      "williamboman/mason-lspconfig.nvim",
      optional = true,
      opts = function(_, opts)
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, lsp_servers)
      end,
    },
  }

  if formatter ~= nil then
    deps[#deps + 1] = {
      "stevearc/conform.nvim",
      optional = true,
      opts = formatter,
    }
  end

  if none_ls_fn ~= nil then deps[#deps + 1] = { "nvimtools/none-ls.nvim", optional = true, opts = none_ls_fn } end

  return deps
end

function M.add_server(servers, config, handler)
  return function(_, opts)
    Andromeda.lib.extend_list_opt(opts, servers, "servers")
    opts.config = Andromeda.lib.extend_tbl(opts.config or {}, config or {})
    opts.handlers = Andromeda.lib.extend_tbl(opts.handlers or {}, handler or {})
  end
end
