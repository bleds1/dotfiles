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
    use {
			'nvim-treesitter/nvim-treesitter',
			run = function()
				local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
				ts_update()
			end,}
    use ("nvim-lua/plenary.nvim")
    use ('junegunn/fzf')
    use ('junegunn/fzf.vim')
	use ('nvim-treesitter/playground')
	use ('theprimeagen/harpoon')
    use ("nvim-tree/nvim-tree.lua")
    use ("szw/vim-maximizer")
	use ('mbbill/undotree')
	use ('tpope/vim-fugitive')
    use ('airblade/vim-gitgutter')
    use ('windwp/nvim-autopairs')
    use ('norcalli/nvim-colorizer.lua')
    use ("folke/zen-mode.nvim")
    use ('nvim-tree/nvim-web-devicons')
    use ('projekt0n/github-nvim-theme')
    use ("nvim-lua/popup.nvim")
    use ("lifer0se/ezbookmarks.nvim")
    use ('j-hui/fidget.nvim')
    use ("SmiteshP/nvim-navic")
    use ("LunarVim/breadcrumbs.nvim")
    use ("hrsh7th/cmp-cmdline")
    use ("folke/which-key.nvim")
    use ("lukas-reineke/indent-blankline.nvim")
    use ("akinsho/toggleterm.nvim")
    use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	    }
        }

    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
       })
    use {
        "folke/twilight.nvim",
            opts = {
        }
        }
    use({
        "epwalsh/obsidian.nvim",
        tag = "*",  -- recommended, use latest release instead of latest commit
        requires = {
        "nvim-lua/plenary.nvim",
        },
        })
    use{
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        }
    use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
        }

end)

