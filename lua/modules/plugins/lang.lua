---@diagnostic disable: inject-field

local function add_pack(pack) Andromeda.community_plugins[#Andromeda.community_plugins + 1] = { import = pack } end

--! >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Main Lang Plugins <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
local language_plugins = {}

language_plugins["nvim-treesitter/nvim-treesitter"] = {
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
      "bash",
      "html",
      "lua",
      "nix",
      "python",
      "query",
      "regex",
      "vim",
    })
  end,
}

add_pack("modules.configs.lang.deno")

--! >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Languages <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

local lsp_utils = Andromeda.lib.lsp
local add_server = lsp_utils.add_server
local add_lsp_deps = lsp_utils.add_lsp_deps
local extend_tbl = Andromeda.lib.extend_tbl

---@type table<string, AndromedaLanguageCfg>
local langs = {}

---@param servers string[]
---@param cfg AndromedaLanguageCfg
local function add_lang(servers, cfg)
  if cfg.server_cfg ~= nil then
    local server_cfg = require(cfg.server_cfg)
    cfg.config = server_cfg.config or cfg.config
    cfg.handlers = server_cfg.handlers or cfg.handlers
  end

  local opts = add_server(servers, cfg.config, cfg.handler)
  local deps = extend_tbl(cfg.dependencies or {}, add_lsp_deps(servers, cfg.treesitter, cfg.none_ls, cfg.formatter))
  language_plugins[#language_plugins + 1] = { "AstroNvim/astrolsp", dependencies = deps, opts = opts }
end

langs["ocamllsp"] = {
  treesitter = { "ocaml" },
  config = { ocamllsp = { codelens = { enable = true } } },
  formatter = { formatters_by_ft = { ["ocaml"] = { "ocamlformat" } } },
  none_ls = function(_, opts)
    Andromeda.lib.extend_list_opt(opts, { require("null-ls").builtins.formatting.ocamlformat }, "sources")
  end,
}

langs["nil_ls"] = {
  treesitter = { "nix" },
  formatter = { formatters_by_ft = { ["ocaml"] = { "ocamlformat" } } },
  none_ls = function(_, opts)
    local nls = require("null-ls")
    Andromeda.lib.extend_list_opt(opts, {
      nls.builtins.code_actions.statix,
      nls.builtins.formatting.alejandra,
      nls.builtins.diagnostics.deadnix,
    }, "sources")
  end,
}

-- langs["tsserver"] = {
--   server_cfg = "lang.tsserver",
--   treesitter = { "javascript", "typescript", "tsx" },
--   none_ls = function(_, opts)
--     Andromeda.lib.extend_list_opt(opts, { require("null-ls").builtins.formatting.eslint_d }, "sources")
--   end,
--   formatter = {
--     formatters_by_ft = {
--       ["vue"] = { "prettier" },
--       ["css"] = { "prettier" },
--       ["scss"] = { "prettier" },
--       ["less"] = { "prettier" },
--       ["html"] = { "prettier" },
--       ["json"] = { "prettier" },
--       ["yaml"] = { "prettier" },
--       ["jsonc"] = { "prettier" },
--       ["graphql"] = { "prettier" },
--       ["markdown"] = { "prettier" },
--       ["javascript"] = { "prettier" },
--       ["typescript"] = { "prettier" },
--       ["handlebars"] = { "prettier" },
--       ["markdown.mdx"] = { "prettier" },
--       ["javascriptreact"] = { "prettier" },
--       ["typescriptreact"] = { "prettier" },
--     },
--   },
-- }

--! >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> MERGE <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

for server, language_cfg in pairs(langs) do
  add_lang(language_cfg.servers or { server }, language_cfg)
end

return language_plugins
