local settings = require("configuration")

local function set_colorscheme(sty)
  local have_current = false
  if settings.enable_telescope_themes then
    local theme_ok, _ = pcall(require, "current-theme")
    if theme_ok then have_current = true end
  end

  if have_current then
    require("current-theme")
  else
    if sty == "onedark_vivid" then
      vim.cmd([[colorscheme onedark_vivid]])
    elseif sty == "onedark_dark" then
      vim.cmd([[colorscheme onedark_dark]])
    elseif sty == "onelight" then
      vim.opt.background = "light"
      vim.cmd([[colorscheme onelight]])
    else
      vim.cmd([[colorscheme onedark]])
    end
  end
end

return {
  opts = {
    colors = {}, -- Override default colors or create your own
    highlights = {}, -- Override default highlight groups or create your own

    options = {
      cursorline = true, -- Use cursorline highlighting?
      terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
      transparency = settings.enable_transparent, -- Use a transparent background?
      highlight_inactive_windows = true, -- When the window is out of focus, change the normal background?
    },

    styles = { -- For example, to apply bold and italic, use "bold,italic"
      types = "NONE", -- Style that is applied to types
      methods = "NONE", -- Style that is applied to methods
      numbers = "NONE", -- Style that is applied to numbers
      strings = "NONE", -- Style that is applied to strings
      comments = "NONE", -- Style that is applied to comments
      keywords = "NONE", -- Style that is applied to keywords
      constants = "NONE", -- Style that is applied to constants
      functions = "NONE", -- Style that is applied to functions
      operators = "NONE", -- Style that is applied to operators
      variables = "NONE", -- Style that is applied to variables
      parameters = "NONE", -- Style that is applied to parameters
      conditionals = "NONE", -- Style that is applied to conditionals
      virtual_text = "NONE", -- Style that is applied to virtual text
    },

    plugins = { -- Override which plugin highlight groups are loaded
      aerial = true,
      barbar = true,
      copilot = true,
      dashboard = true,
      gitsigns = true,
      hop = true,
      indentline = true,
      leap = true,
      lsp_saga = true,
      marks = true,
      neo_tree = true,
      neotest = true,
      nvim_bqf = true,
      nvim_cmp = true,
      nvim_dap = true,
      nvim_dap_ui = true,
      nvim_hlslens = true,
      nvim_lsp = true,
      nvim_navic = true,
      nvim_notify = true,
      nvim_tree = true,
      nvim_ts_rainbow = true,
      op_nvim = true,
      packer = true,
      polygot = true,
      semantic_tokens = false,
      startify = true,
      telescope = true,
      toggleterm = true,
      treesitter = true,
      trouble = true,
      vim_ultest = true,
      which_key = true,
    },

    filetypes = { -- Override which filetype highlight groups are loaded
      lua = true,
      php = true,
      vue = true,
      xml = true,
      html = true,
      java = true,
      ruby = true,
      rust = true,
      toml = true,
      yaml = true,
      python = true,
      markdown = true,
      javascript = true,
      typescript = true,
      typescriptreact = true,
    },
  },

  config = function(_, opts)
    settings.utils.activate_colorscheme("fluoromachine", function()
      require("onedarkpro").setup(opts)

      vim.opt.background = "dark"
      set_colorscheme(settings.theme_style)
    end)
  end,
}
