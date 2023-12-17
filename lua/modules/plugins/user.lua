local user = {}

user["giusgad/pets.nvim"] = {
  opts = {},
  cmd = { "PetsNew", "PetsNewCustom" },
  dependencies = { "MunifTanjim/nui.nvim", "edluffy/hologram.nvim" },
}

user["andweeb/presence.nvim"] = { event = "VeryLazy", opts = { client_id = "1009122352916857003" } }

return user