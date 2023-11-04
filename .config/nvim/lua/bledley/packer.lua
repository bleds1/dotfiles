-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.4',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use ({
		'shaunsingh/nord.nvim',
		as = 'nord',
		config = function()
			vim.cmd('colorscheme nord')
		end
	})
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('junegunn/fzf')
    use('junegunn/fzf.vim')
	use('nvim-treesitter/playground')
	use('theprimeagen/harpoon')
    use('ThePrimeagen/vim-be-good')
    use("nvim-tree/nvim-tree.lua")
    use("szw/vim-maximizer")
	use('mbbill/undotree')
	use('tpope/vim-fugitive')
    use('airblade/vim-gitgutter')
    use ('windwp/nvim-autopairs')
    use ('norcalli/nvim-colorizer.lua')
    use("folke/zen-mode.nvim")
    use('vimwiki/vimwiki')
    use ('nvim-tree/nvim-web-devicons')
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
}
    use({
    "epwalsh/obsidian.nvim",
    requires = {
        -- Required.
        "nvim-lua/plenary.nvim",
    },
})
end)

