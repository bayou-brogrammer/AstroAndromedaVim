return {
  --! Completion
  { import = "astrocommunity.completion.copilot-lua" },
  { import = "astrocommunity.editing-support.neogen" },
  { import = "astrocommunity.lsp.lsp-inlayhints-nvim" },
  { import = "astrocommunity.editing-support.chatgpt-nvim" },
  { "hrsh7th/cmp-cmdline", import = "astrocommunity.completion.cmp-cmdline" },

  --! Editing Support

  { import = "astrocommunity.editing-support.suda-vim" },
  { import = "astrocommunity.editing-support.vim-move" },
  { import = "astrocommunity.editing-support.yanky-nvim" },
  { import = "astrocommunity.editing-support.todo-comments-nvim" },
  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },

  --! Git
  { import = "astrocommunity.git.neogit" },
  { import = "astrocommunity.git.octo-nvim" },

  --! Motion
  { import = "astrocommunity.motion.flash-nvim" },
  { import = "astrocommunity.motion.nvim-spider" },
  { import = "astrocommunity.motion.mini-surround" },
  { import = "astrocommunity.motion.mini-bracketed" },

  --! Programming Language Support
  { import = "astrocommunity.programming-language-support.nvim-jqx" },

  --! Recipes
  { import = "astrocommunity.recipes.telescope-nvchad-theme" },
  { import = "astrocommunity.recipes.heirline-nvchad-statusline" },
  { import = "astrocommunity.recipes.heirline-mode-text-statusline" },
  { import = "astrocommunity.recipes.heirline-vscode-winbar" },

  --! Scrolling
  { import = "astrocommunity.scrolling.mini-animate" },
}
