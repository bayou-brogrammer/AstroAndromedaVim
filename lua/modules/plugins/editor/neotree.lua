return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    deactivate = function() vim.cmd([[Neotree close]]) end,
    opts = function()
      local get_icon = Andromeda.icons.get

      return {
        default_component_configs = {
          indent = { padding = 0 },
          modified = { symbol = get_icon("FileModified") },

          icon = {
            default = get_icon("DefaultFile"),
            folder_open = get_icon("FolderOpen"),
            folder_empty = get_icon("FolderEmpty"),
            folder_closed = get_icon("FolderClosed"),
            folder_empty_open = get_icon("FolderEmpty"),
          },

          git_status = {
            symbols = {
              added = get_icon("GitAdd"),
              staged = get_icon("GitStaged"),
              deleted = get_icon("GitDelete"),
              ignored = get_icon("GitIgnored"),
              modified = get_icon("GitChange"),
              renamed = get_icon("GitRenamed"),
              conflict = get_icon("GitConflict"),
              unstaged = get_icon("GitUnstaged"),
              untracked = get_icon("GitUntracked"),
            },
          },
        },
      }
    end,
  },
}
