local set_fluoromachine_colors = function(_, opts)
  local fluoromachine = require("fluoromachine")
  local colors = fluoromachine.colors
  opts.opts.colors.replace = colors.red
  opts.opts.colors.normal = colors.cyan
  opts.opts.colors.insert = colors.green
  opts.opts.colors.visual = colors.purple
  opts.opts.colors.command = colors.orange
end

return {
  opts = function(_, opts)
    local status = require("astroui.status")

    if vim.g.colors_name == "fluoromachine" then set_fluoromachine_colors(_, opts) end

    --! Add text mode
    opts.statusline[1] = status.component.mode({
      mode_text = { padding = { left = 1, right = 1 } },
      surround = { separator = "left", color = require("astroui.status.hl").mode_bg },
    })
  end,
}
