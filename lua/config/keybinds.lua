local M = {}

function M.setup()
    local map = vim.api.nvim_set_keymap
    local opts = {noremap = true, silent = true}
    map('n', '<Space>', '<Nop>', {silent = true})
    vim.g.mapleader = 'ö'
    local kb = require('functions.kb')
    kb.map('ze', 'TZAtaraxis')
    kb.map('zf', 'TZFocus')
    kb.map('zm', 'TZMinimalist')
    kb.map('d', 'Trouble')
    -- package-info
    kb.map('ns', 'lua require("package-info").show()')
    kb.map('nd', 'lua require("package-info").delete()')
    kb.map('np', 'lua require("package-info").change_version()')
    kb.map('ni', 'lua require("package-info").install()')
    kb.map('nr', 'lua require("package-info").reinstall()')
    kb.map('v', 'CHADopen')
    kb.map('gg', 'Neogit')
    kb.map('gc', 'lua require("neogit").open({ "commit" })')

    -- Move to previous/next
    map('n', '<A-,>', ':BufferPrevious<CR>', opts)
    map('n', '<A-.>', ':BufferNext<CR>', opts)
    -- Re-order to previous/next
    map('n', '<A-<>', ':BufferMovePrevious<CR>', opts)
    map('n', '<A->>', ' :BufferMoveNext<CR>', opts)
    -- Goto buffer in position...
    map('n', '<A-1>', ':BufferGoto 1<CR>', opts)
    map('n', '<A-2>', ':BufferGoto 2<CR>', opts)
    map('n', '<A-3>', ':BufferGoto 3<CR>', opts)
    map('n', '<A-4>', ':BufferGoto 4<CR>', opts)
    map('n', '<A-5>', ':BufferGoto 5<CR>', opts)
    map('n', '<A-6>', ':BufferGoto 6<CR>', opts)
    map('n', '<A-7>', ':BufferGoto 7<CR>', opts)
    map('n', '<A-8>', ':BufferGoto 8<CR>', opts)
    map('n', '<A-9>', ':BufferGoto 9<CR>', opts)
    map('n', '<A-0>', ':BufferLast<CR>', opts)
    -- Close buffer
    map('n', '<A-c>', ':BufferClose<CR>', opts)
    map('n', '<C-p>', ':BufferPick<CR>', opts)
end

return M
