require('telescope').setup({
    pickers  = {
        current_buffer_fuzzy_find = {
            previewer = false,
        },
    },
})
-- FIX: Disable preview in telescope

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', ":Telescope find_files find_command=rg,--ignore,--hidden,--files,--glob,!.git<CR>") --testing alternate find command
-- vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>sr', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>sp', builtin.git_files, {})
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>bi', builtin.buffers, {})
vim.keymap.set('n', '<leader><leader>', builtin.buffers, {})
vim.keymap.set('n', '<leader>sB', builtin.buffers, {}) -- probably not going to use this one
vim.keymap.set('n', '<leader>sG', function()
				builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
