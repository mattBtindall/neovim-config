local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' }) -- find all files including node_modules
vim.keymap.set('n', '<C-p>', builtin.git_files, {}) -- find only files that are tracked by git
vim.keymap.set('n', '<leader>ps', function ()
	builtin.grep_string({ string = vim.fn.input("Grep > ") });
end)
