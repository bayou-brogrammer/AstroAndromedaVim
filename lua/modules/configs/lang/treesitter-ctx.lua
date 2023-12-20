return {
  opts = {
    max_lines = 3,
    mode = "cursor",
  },

  keys = {
    {
      "<leader>ut",
      function()
        local tsc = require("treesitter-context")

        tsc.toggle()

        if Andromeda.lib.inject.get_upvalue(tsc.toggle, "enabled") then
          Andromeda.lib.info("Enabled Treesitter Context", { title = "Option" })
        else
          Andromeda.lib.warn("Disabled Treesitter Context", { title = "Option" })
        end
      end,
      desc = "Toggle Treesitter Context",
    },
  },
}
