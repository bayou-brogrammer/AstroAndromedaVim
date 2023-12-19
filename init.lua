local function req(module)
  local status_ok, fault = pcall(require, module)
  if not status_ok then vim.api.nvim_err_writeln("Failed to load " .. module .. "\n\n" .. fault) end
end

for _, module in ipairs({ "global", "Andromeda", "lazy", "polish" }) do
  req("config." .. module)
end

Andromeda.lib.root.setup()
Andromeda.lib.format.setup()
