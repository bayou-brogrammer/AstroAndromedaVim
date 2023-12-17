local function toggle_lines()
  local lines_enabled = not vim.diagnostic.config().virtual_lines
  vim.diagnostic.config({ virtual_lines = lines_enabled, virtual_text = not lines_enabled })
end

return {
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>uD"] = { toggle_lines, desc = "Toggle virtual diagnostic lines" },
          },
        },
      },
    },
  },
  opts = {},
  config = function()
    -- disable diagnostic virtual text
    local lsp_utils = require("astrolsp")

    lsp_utils.diagnostics[3].virtual_text = false
    vim.diagnostic.config(lsp_utils.diagnostics[vim.g.diagnostics_mode])
    vim.keymap.set("n", "g?", toggle_lines, { noremap = true, silent = true })

    require("lsp_lines").setup()
  end,
}
