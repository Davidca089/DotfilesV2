---@type ChadrcConfig
local M = {}

M.ui = { theme = 'ayu_dark', statusline = {enabled = false} , tabufline = {enabled = false} }
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
