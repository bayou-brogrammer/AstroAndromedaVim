return function(opts)
  require("mini.ai").setup(opts)

  ---@diagnostic disable-next-line: redundant-parameter
  require("astrocore").on_load("which-key.nvim", function()
    ---@type table<string, string|table>
    local i = {
      [" "] = "Whitespace",
      ['"'] = 'Balanced "',
      ["'"] = "Balanced '",
      ["`"] = "Balanced `",
      ["("] = "Balanced (",
      [")"] = "Balanced ) including white-space",
      [">"] = "Balanced > including white-space",
      ["<lt>"] = "Balanced <",
      ["]"] = "Balanced ] including white-space",
      ["["] = "Balanced [",
      ["}"] = "Balanced } including white-space",
      ["{"] = "Balanced {",
      ["?"] = "User Prompt",
      _ = "Underscore",
      a = "Argument",
      b = "Balanced ), ], }",
      c = "Class",
      f = "Function",
      o = "Block, conditional, loop",
      q = "Quote `, \", '",
      t = "Tag",
    }
    local a = vim.deepcopy(i)
    for k, v in pairs(a) do
      a[k] = v:gsub(" including.*", "")
    end

    local ic = vim.deepcopy(i)
    local ac = vim.deepcopy(a)
    for key, name in pairs({ n = "Next", l = "Last" }) do
      i[key] = vim.tbl_extend("force", { name = "Inside " .. name .. " textobject" }, ic)
      a[key] = vim.tbl_extend("force", { name = "Around " .. name .. " textobject" }, ac)
    end

    ---@diagnostic disable-next-line: undefined-field
    require("which-key").register({
      mode = { "o", "x" },
      i = i,
      a = a,
    })
  end)
end
