---@diagnostic disable: missing-return

--! >>>>>>>>>>>>>>>>>>>>>> VIM TYPES <<<<<<<<<<<<<<<<<<<<<<<< --

--! Diagnostic severity
vim.diagnostic.severity = {
  ERROR = 1,
  WARN = 2,
  INFO = 3,
  HINT = 4,
}

--! Log levels
vim.log = {
  levels = {
    TRACE = 0,
    DEBUG = 1,
    INFO = 2,
    WARN = 3,
    ERROR = 4,
  },
}

---@param default table
---@param extension table
---@return table
function vim.list_extend(default, extension) end

---@param t table
---@param ... string
---@return any
function vim.tbl_get(t, ...) end

--! >>>>>>>>>>>>>>>>>>>>>> PLUGIN TYPES <<<<<<<<<<<<<<<<<<<<<<<< --

---@class NeovimPlugin table<string, any>
---@field setup fun(opts: table<string, any>)

---@class LspKind
---@field cmp_format fun(opts: table<string, any>)

---@class LuaSnip
---@field lsp_expand fun(body: string)
---@field expand_or_jumpable fun()
---@field jumpable fun(by: number)
---@field expand_or_jump fun()
---@field jump fun(by: number)
