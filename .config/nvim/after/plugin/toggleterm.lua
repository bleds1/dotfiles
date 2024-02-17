require("toggleterm").setup({
    size = 10,
    hide_numbers = true,
    start_in_insert = true,
    open_mapping = [[<leader>v]],
    insert_mappings = false,
    close_on_exit = true,
    autochdir = true,
    shade_terminals = false,
    highlights = {
    -- highlights which map to a highlight group name and a table of it's values
    -- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
    Normal = {
      guibg = "#22262f",
    },
    NormalFloat = {
      link = 'Normal'
    },
    FloatBorder = {
      guibg = "#22262f",
    },
    winbar = {
    enabled = false,
    name_formatter = function(term) --  term: Terminal
      return term.name
    end
  },
  },

})

-- function _G.set_terminal_keymaps()
--   local opts = {noremap = true}
--   vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-/><C-n>]], opts)
--   vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-/><C-n>]], opts)
--   vim.api.nvim_buf_set_keymap(0, 't', '<leader>h', [[<C-/><C-n><C-W>h]], opts)
--   vim.api.nvim_buf_set_keymap(0, 't', '<leader>j', [[<C-/><C-n><C-W>j]], opts)
--   vim.api.nvim_buf_set_keymap(0, 't', '<leader>k', [[<C-/><C-n><C-W>k]], opts)
--   vim.api.nvim_buf_set_keymap(0, 't', '<leader>l', [[<C-/><C-n><C-W>l]], opts)
-- end
--
-- vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
