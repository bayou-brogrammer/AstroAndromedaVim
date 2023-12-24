local M = {}

M.mason = {
  opts = {
    ensure_installed = {
      "stylua",
      "shellcheck",
      "shfmt",
      "flake8",
    },
  },
}

M["mason-lspconfig"] = function(_, opts)
  opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
    "lua_ls",
  })
end

M["mason-null-ls"] = function(_, opts)
  -- add more things to the ensure_installed table protecting against community packs modifying it
  -- opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
  --   "prettier",
  --   "stylua",
  --   "eslint_d",
  -- })
end

M["mason-nvim-dap"] = function(_, opts)
  -- add more things to the ensure_installed table protecting against community packs modifying it
  -- opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
  --   -- "python",
  -- })
end

return M
