return {
  --! Completion
  { import = "astrocommunity.completion.cmp-cmdline" },
  { import = "astrocommunity.editing-support.neogen" },
  { import = "astrocommunity.lsp.lsp-inlayhints-nvim" },
  { import = "astrocommunity.completion.copilot-lua-cmp" },
  { import = "astrocommunity.editing-support.chatgpt-nvim" },

  -- --! Editing Support

  { import = "astrocommunity.editing-support.suda-vim" },
  { import = "astrocommunity.editing-support.vim-move" },
  -- { import = "astrocommunity.editing-support.yanky-nvim" },
  { import = "astrocommunity.editing-support.todo-comments-nvim" },
  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },

  -- --! Git
  { import = "astrocommunity.git.neogit" },
  { import = "astrocommunity.git.octo-nvim" },

  -- --! Motion
  { import = "astrocommunity.motion.nvim-spider" },

  -- --! Programming Language Support
  { import = "astrocommunity.programming-language-support.nvim-jqx" },

  --! Recipes
  { import = "astrocommunity.recipes.telescope-nvchad-theme" },
  { import = "astrocommunity.recipes.heirline-vscode-winbar" },
  { import = "astrocommunity.recipes.heirline-nvchad-statusline" },
}
