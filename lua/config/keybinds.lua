local M = {}

function M.setup()
     vim.api.nvim_set_keymap('n', '<Space>', '<Nop>', { silent = true})
    vim.g.mapleader = 'ö'
    local kb = require('functions.kb')
    kb.map('ze', 'TZAtaraxis')
    kb.map('zf', 'TZFocus')
    kb.map('zm', 'TZMinimalist')
end

return M
