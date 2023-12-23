---@class Andromeda
Andromeda = {

  icons = require("core.icons"),
  ---@class AndromedaSettings
  settings = require("config"),
}

---@class AndromedaLibConfig
Andromeda.lib = {}

--! Load all kits
require("utilities.path").load_dir("utilities")
require("utilities.path").load_dir("utilities.ui")

Andromeda.lib.root.setup()
Andromeda.lib.format.setup()
