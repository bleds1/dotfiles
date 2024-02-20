require('telescope').setup({
    pickers  = {
        oldfiles = {
            previewer = false,
            hidden = true,
        },
        find_files = {
            previewer = false,
            hidden = true,
        },
        live_grep = {
            previewer = true,
            hidden = true,
        },
        buffers = {
            previewer = false,
        },
    },
})

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>sr', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>sp', builtin.git_files, {})
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>bi', builtin.buffers, {})
vim.keymap.set('n', '<leader>bb', builtin.buffers, {})
vim.keymap.set('n', '<leader><leader>', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>fg', function() --  FIX: swapped this with git status - update whichkey
				builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
