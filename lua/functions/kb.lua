local opts = {noremap = true, silent = true}
local M = {}

function M.map(key, cmd)
	vim.api.nvim_set_keymap('n', '<leader>' .. key, '<cmd>' .. cmd .. '<CR>', opts)
end

return M
