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
   use ("szw/vim-maximizer")
   use ('tpope/vim-fugitive')
   use ('airblade/vim-gitgutter')
   -- use ('windwp/nvim-autopairs')
   use ('norcalli/nvim-colorizer.lua')
   use ("folke/zen-mode.nvim")
   use ('nvim-tree/nvim-web-devicons')
   use ({
       'projekt0n/github-nvim-theme',
    require('github-theme').setup({
    options = {
    styles = {
      comments = 'italic',
      keywords = 'bold',
      types = 'italic,bold',
    }
  }
})
   })
   use ("nvim-lua/popup.nvim")
   use ("lifer0se/ezbookmarks.nvim")
   use ("SmiteshP/nvim-navic")
   use ("hrsh7th/cmp-cmdline")
   -- use ("folke/which-key.nvim")
   use {"folke/twilight.nvim"}
   use {
       'goolord/alpha-nvim',
       requires = {
           'nvim-tree/nvim-web-devicons',
           'nvim-lua/plenary.nvim'
           },
           config = function ()
           require'alpha'.setup(require'alpha.themes.dashboard'.config)
           end
           }
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
   use {
     'smoka7/hop.nvim',
     tag = '*', -- optional but strongly recommended
 }

end)
