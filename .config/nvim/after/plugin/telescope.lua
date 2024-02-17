local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>sr', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>sp', builtin.git_files, {})
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>bi', builtin.buffers, {})
vim.keymap.set('n', '<leader>sB', builtin.buffers, {})
vim.keymap.set('n', '<leader>sG', function()
				builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
