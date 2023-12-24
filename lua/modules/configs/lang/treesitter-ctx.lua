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

        if Andromeda.kit.inject.get_upvalue(tsc.toggle, "enabled") then
          Andromeda.kit.info("Enabled Treesitter Context", { title = "Option" })
        else
          Andromeda.kit.warn("Disabled Treesitter Context", { title = "Option" })
        end
      end,
      desc = "Toggle Treesitter Context",
    },
  },
}
