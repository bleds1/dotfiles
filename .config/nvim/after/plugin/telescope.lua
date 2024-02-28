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
    extensions = {
        file_browser = {
           hidden = { file_browser = true, folder_browser = true },
           theme = "ivy",
        -- disables netrw and use telescope-file-browser in its place
           hijack_netrw = true,
           mappings = {
                ["i"] = {
           -- your custom insert mode mappings
            },
            ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
})
-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension "file_browser"

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>sr', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>sp', builtin.git_files, {})
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>bi', builtin.buffers, {})
vim.keymap.set('n', '<leader><leader>', builtin.buffers, {})
vim.keymap.set('n', '<leader>fg', function() --  FIX: swapped this with git status - update whichkey
				builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

-- File Browser Keybinds
vim.api.nvim_set_keymap(
  "n",
  "<space>fb",
  ":Telescope file_browser<CR>",
  { noremap = true }
)

-- open file_browser with the path of the current buffer
vim.api.nvim_set_keymap(
  "n",
  "<space>fb",
  ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { noremap = true }
)
