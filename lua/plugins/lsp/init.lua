return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    features = {
      codelens = true,
      autoformat = true,
      inlay_hints = true,
      lsp_handlers = true,
      diagnostics_mode = 3,
      semantic_tokens = true,
    },

    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = { virtual_text = true, underline = true },

    formatting = {
      disabled = {},
      timeout_ms = 1000, -- default format timeout
      format_on_save = { enabled = true, allow_filetypes = {}, ignore_filetypes = {} },
    },

    -- enable servers that you already have installed without mason
    servers = {},

    -- customize language server configuration options passed to `lspconfig`
    ---@diagnostic disable: missing-fields
    config = {},

    -- customize how language servers are attached
    setup_handlers = {},

    -- mappings to be set up on attaching of a language server
    mappings = {
      n = {
        gl = { function() vim.diagnostic.open_float() end, desc = "Hover diagnostics" },

        gD = {
          function() vim.lsp.buf.declaration() end,
          desc = "Declaration of current symbol",
          cond = "textDocument/declaration",
        },
        -- ["<leader>uY"] = {
        --   function() require("astrolsp.toggles").buffer_semantic_tokens() end,
        --   desc = "Toggle LSP semantic highlight (buffer)",
        --   cond = function(client) return client.server_capabilities.semanticTokensProvider and vim.lsp.semantic_tokens end,
        -- },
      },
    },
  },
}
