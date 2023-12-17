local langs = {}
local language_plugins = {}

local function add_lsp_deps(treesitter_extension)
  return {
    {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts) Andromeda.lib.extend_list_opt(opts, treesitter_extension) end,
    },
  }
end

local function add_server(servers, config, handler)
  return function(_, opts)
    Andromeda.lib.extend_list_opt(opts, servers, "servers")
    opts.config = Andromeda.lib.extend_tbl(opts.config or {}, config or {})
    opts.handlers = Andromeda.lib.extend_tbl(opts.handlers or {}, handler or {})
  end
end

local function add_lang(servers, cfg)
  if cfg.server_cfg ~= nil then
    local server_cfg = require(cfg.server_cfg)
    cfg.config = server_cfg.config or cfg.config
    cfg.handlers = server_cfg.handlers or cfg.handlers
  end

  language_plugins[#language_plugins + 1] = {
    "AstroNvim/astrolsp",
    opts = add_server(servers, cfg.config, cfg.handler),
    dependencies = add_lsp_deps(cfg.treesitter),
  }
end

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

langs["ocamllsp"] = {
  treesitter = { "ocaml" },
  config = { ocamllsp = { codelens = { enable = true } } },
}

langs["tsserver"] = {
  treesitter = { "javascript", "typescript", "tsx" },
  server_cfg = "lang.tsserver",
}

for server, language_cfg in pairs(langs) do
  add_lang({ server }, language_cfg)
end

return language_plugins
