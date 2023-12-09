local get_icon = require("astroui").get_icon

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    deactivate = function() vim.cmd([[Neotree close]]) end,
    opts = {
      default_component_configs = {
        indent = { padding = 0 },
        icon = {
          default = get_icon("DefaultFile"),
          folder_closed = get_icon("FolderClosed"),
          folder_empty = get_icon("FolderEmpty"),
          folder_empty_open = get_icon("FolderEmpty"),
          folder_open = get_icon("FolderOpen"),
        },
        modified = { symbol = get_icon("FileModified") },
        git_status = {
          symbols = {
            added = get_icon("GitAdd"),
            conflict = get_icon("GitConflict"),
            deleted = get_icon("GitDelete"),
            ignored = get_icon("GitIgnored"),
            modified = get_icon("GitChange"),
            renamed = get_icon("GitRenamed"),
            staged = get_icon("GitStaged"),
            unstaged = get_icon("GitUnstaged"),
            untracked = get_icon("GitUntracked"),
          },
        },
      },
    },
  },
}
