---@type AndromedaPathLib
Andromeda.lib.path = {}

---@class AndromedaPathLib
local M = Andromeda.lib.path

M.INIT_EXT = "init.lua"
M.CONFIG_PATH = Globals.vim_path .. "/lua/"

M.filters = {}

-- >>>>>>>>>>>>>>>>>> Filters <<<<<<<<<<<<<<<<<<<< --

M.filters.lua = function(v, k, t) return M.get_filename(v, true) == M.INIT_EXT and false or true end

M.filters.utils = function(v, k, t)
  local is_lua = M.filters.lua(v, k, t)
  local is_path = M.get_filename(v, true) == "path.lua" and false or true
  return not is_lua and not is_path
end

-- >>>>>>>>>>>>>>>>>> Helpers <<<<<<<<<<<<<<<<<<<< --

---@param path string
---@return string
function M.get_filename(path, with_extension)
  with_extension = with_extension or false
  if type(path) ~= "string" then return "" end
  local filename = path:match("^.+/(.+)$")
  return with_extension and filename or filename:gsub(".lua", ""):gsub(".nvim", "")
end

---@param path string
---@param filter? function
---@return string[]
function M.get_files(path, filter)
  local files = vim.split(vim.fn.glob(path), "\n", { trimempty = true })
  if filter then files = table.filter(files, filter) end
  return files
end

---@param dir string
---@return string[]
function M.get_lua_files(dir) return M.get_files(M.CONFIG_PATH .. dir .. "/*.lua") end

---@param dir string
---@param filter? function
function M.load_dir(dir, filter)
  filter = filter or M.filters.lua
  for _, file in ipairs(M.get_files(M.CONFIG_PATH .. dir .. "/*", filter)) do
    require(file:gsub(M.CONFIG_PATH, ""):gsub(".lua", ""))
  end
end
