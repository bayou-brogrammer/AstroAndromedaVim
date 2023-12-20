---@diagnostic disable: undefined-field

---@class AndromedaMappings
local M = {}

M.astrocore = {
  -- first key is the mode
  n = {
    L = {
      function() require("astrocore.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    H = {
      function() require("atsrocore.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },

    ["<C-q>"] = { ":q!<cr>", desc = "Quit" },
    ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- quick save

    -- tables with just a `desc` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { desc = "Buffers" },
    ["<leader>bD"] = {
      function()
        require("astroui.status.heirline").buffer_picker(function(bufnr) require("astrocore.buffer").close(bufnr) end)
      end,
      desc = "Pick to close",
    },
  },
}

M.conform_nvim = function(_, opts)
  local maps = opts.mappings
  maps.n["<leader>cF"] = {
    function() require("conform").format({ formatters = { "injected" } }) end,
    desc = "Format Injected Langs",
  }
end

M.cmp = function()
  local cmp = require("cmp")
  local snip_status_ok, luasnip = pcall(require, "luasnip")
  if not snip_status_ok then return end

  local function has_words_before()
    local line, col = (table.unpack)(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  return {
    ["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-y>"] = cmp.config.disable,
    ["<C-e>"] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close() }),
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }
end

M.noice = function(_, opts)
  local maps = opts.mappings
  local noice = require("noice")

  maps.n["<leader>na"] = { function() noice.cmd("all") end, desc = "Noice All" }
  maps.n["<leader>n"] = { desc = Andromeda.icons.get_wrapped("Sparkle", 1) .. "Noice" }
  maps.n["<leader>nd"] = { function() noice.cmd("dismiss") end, desc = "Dismiss All" }
  maps.n["<leader>nh"] = { function() noice.cmd("history") end, desc = "Noice History" }
  maps.n["<leader>nl"] = { function() noice.cmd("last") end, desc = "Noice Last Message" }
  maps.c["<S-Enter>"] = {
    function()
      noice.redirect(vim.fn.getcmdline() --[[@as string]])
    end,
    desc = "Redirect Cmdline",
  }
end

return M
