---@diagnostic disable: inject-field

--! >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Main Lang Plugins <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
local language_plugins = {}

language_plugins["nvim-treesitter/nvim-treesitter"] = {
  version = false, -- last release is way too old and doesn't work on Windows
  merge = "lang.treesitter",
  build = ":TSUpdate",
  event = { "User AstroFile", "VeryLazy" },
  cmd = {
    "TSBufDisable",
    "TSBufEnable",
    "TSBufToggle",
    "TSDisable",
    "TSEnable",
    "TSToggle",
    "TSInstall",
    "TSInstallInfo",
    "TSInstallSync",
    "TSModuleInfo",
    "TSUninstall",
    "TSUpdate",
    "TSUpdateSync",
  },
}

-- Show context of the current function
language_plugins["nvim-treesitter/nvim-treesitter-context"] = {
  enabled = true,
  merge = "lang.treesitter-ctx",
  event = "User AstroFile",
}

language_plugins[#language_plugins + 1] = { import = "modules.configs.lang.ts_deno" }

--! >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Languages <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

---@type table<string, AndromedaLanguageCfg>
local langs = {}

langs["lua_ls"] = {
  treesitter = { "lua" },
  config = {
    lua_ls = {
      -- before_init = require("neodev.lsp").before_init,
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
          },
          diagnostics = {
            globals = {
              "vim",
              "describe",
              "it",
              "before_each",
              "after_each",
              "pending",
              "nnoremap",
              "vnoremap",
              "inoremap",
              "tnoremap",
            },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          telemetry = {
            enable = false,
          },
        },
      },
    },
  },
  formatter = { formatters_by_ft = { lua = { "stylua" } } },
  none_ls = function(_, opts)
    Andromeda.kit.extend_list_opt(opts, { require("null-ls").builtins.formatting.stylua }, "sources")
  end,
}

langs["ocamllsp"] = {
  treesitter = { "ocaml" },
  config = { ocamllsp = { codelens = { enable = true } } },
  formatter = { formatters_by_ft = { ["ocaml"] = { "ocamlformat" } } },
  none_ls = function(_, opts)
    Andromeda.kit.extend_list_opt(opts, { require("null-ls").builtins.formatting.ocamlformat }, "sources")
  end,
}

langs["nil_ls"] = {
  treesitter = { "nix" },
  formatter = { formatters_by_ft = { ["ocaml"] = { "ocamlformat" } } },
  none_ls = function(_, opts)
    local nls = require("null-ls")
    Andromeda.kit.extend_list_opt(opts, {
      nls.builtins.code_actions.statix,
      nls.builtins.formatting.alejandra,
      nls.builtins.diagnostics.deadnix,
    }, "sources")
  end,
}

--! >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> MERGE <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

local lsp_utils = Andromeda.kit.lsp
local add_server = lsp_utils.add_server
local add_lsp_deps = lsp_utils.add_lsp_deps

---@param server string
---@param cfg AndromedaLanguageCfg
for server, cfg in pairs(langs) do
  local servers = cfg.servers or { server }
  if cfg.server_cfg ~= nil then
    local server_cfg = require(cfg.server_cfg)
    cfg.config = server_cfg.config or cfg.config
    cfg.handlers = server_cfg.handlers or cfg.handlers
  end

  local opts = add_server(servers, cfg.config, cfg.handler)
  local deps = table.extend(cfg.dependencies or {}, add_lsp_deps(servers, cfg.treesitter, cfg.none_ls, cfg.formatter))
  language_plugins[#language_plugins + 1] = { "AstroNvim/astrolsp", dependencies = deps, opts = opts }
end

return language_plugins
