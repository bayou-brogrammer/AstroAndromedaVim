return {
  config = {
    tsserver = {
      single_file_support = false,
      settings = {
        typescript = {
          inlayHints = {
            includeInlayVariableTypeHints = false,
            includeInlayEnumMemberValueHints = true,
            includeInlayParameterNameHints = "literal",
            includeInlayFunctionParameterTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          },
        },

        javascript = {
          inlayHints = {
            includeInlayVariableTypeHints = true,
            includeInlayParameterNameHints = "all",
            includeInlayEnumMemberValueHints = true,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          },
        },
      },
    },
  },
}
