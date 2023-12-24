return {
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.typescript" },
  { "AstroNvim/astrolsp", opts = { handlers = { denols = false } } },

  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts) Andromeda.kit.extend_list_opt(opts, { "javascript", "typescript", "tsx" }, "highlight") end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, "denols")
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, "js")
    end,
  },
  {
    "sigmasd/deno-nvim",
    ft = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
    -- HACK: This disables tsserver if denols is attached.
    -- A solution that only enables the required lsp should replace it.
    opts = function(_, opts)
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufnr = args.buf
          local curr_client = vim.lsp.get_client_by_id(args.data.client_id)
          -- if deno attached, stop all typescript servers
          if curr_client.name == "denols" then
            vim.lsp.for_each_buffer_client(bufnr, function(client, client_id)
              if client.name == "tsserver" then vim.lsp.stop_client(client_id, true) end
            end)
            -- if tsserver attached, stop it if there is a denols server attached
          elseif curr_client.name == "tsserver" then
            for _, client in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
              if client.name == "denols" then
                vim.lsp.stop_client(curr_client.id, true)
                break
              end
            end
          end
        end,
      })
      opts.server = require("astrolsp").lsp_opts("denols")
      opts.server.root_dir = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc")
    end,
  },
}
