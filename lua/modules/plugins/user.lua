local user = {}

user["giusgad/pets.nvim"] = {
  opts = {},
  cmd = { "PetsNew", "PetsNewCustom" },
  dependencies = { "MunifTanjim/nui.nvim", "edluffy/hologram.nvim" },
}

user["andweeb/presence.nvim"] = {
  event = "VeryLazy",
  opts = { client_id = "1009122352916857003" },
}

user["edluffy/specs.nvim"] = {
  lazy = true,
  event = "CursorMoved",
  opts = require("user.specs"),
}

user["doctorfree/cheatsheet.nvim"] = {
  event = "VeryLazy",
  merge = "user.cheatsheet",
  dependencies = {
    { "nvim-telescope/telescope.nvim" },
    { "nvim-lua/popup.nvim" },
    { "nvim-lua/plenary.nvim" },
  },
}

return user
