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
  merge = require("user.cheatsheet"),
  dependencies = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
}

return user
