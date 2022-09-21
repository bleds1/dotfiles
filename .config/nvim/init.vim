"NEOVIM CONIG
"
"General
            
set nocompatible    "redundant?
set undolevels=500
set showmatch
set ignorecase  "case insensitive matching (only works with smartcase)
set smartcase   "if capital is included in search make it case-sensitive
set nohlsearch    "highlight search results
set nobackup    "no auto backups
set hidden      "hide buffers in background when abandoned
set mouse=a     "enable mouse usage (all modes)
set noswapfile  "no swap      
set number      "line nos
set relativenumber  "relative line nos
set laststatus=0    "show bottom bar
set wrap        "wrap text
set noshowmode  "do not show insert msgs etc. whwen using statusline
set noerrorbells    "no error noises/visual bells
set wildmode=longest,list,full  
set tabstop=4 softtabstop=4  "number columns occupied by tab character
set shiftwidth=4    "width for autoindents
set softtabstop=4   "see multiple spaces as tabstops so <BS>
set expandtab   "converts tabs to white space
set smartindent
set scrolloff=8 "scrolls screen 8 lines before end of screen
set splitright splitbelow
set signcolumn=yes     "toggle with leader 1/2"
filetype plugin indent on   "is this redundant now? allows auto-indenting depending on file type
set t_Co=256    "set 256 colour terminal

"Plugins

call plug#begin('/home/bledley/.config/nvim/plugged')

" Appearance
Plug 'gruvbox-community/gruvbox'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'vim-python/python-syntax'
Plug 'ap/vim-css-color'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'mhinz/vim-startify'
Plug 'vimwiki/vimwiki'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
" Find files
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
" LSP Support
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
" Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'
" Formatters & linting chris@machine 
Plug 'jose-elias-alvarez/null-ls.nvim' " 
" LSP-zero
Plug 'VonHeikemen/lsp-zero.nvim'

call plug#end()

lua <<EOF
local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup()
EOF

" Null-ls settings
lua  <<EOF
require("null-ls").setup({
    sources = {
        require("null-ls").builtins.formatting.stylua,
        require("null-ls").builtins.diagnostics.eslint,
        require("null-ls").builtins.completion.spell,
    },
})

EOF

lua <<EOF
require('nvim-treesitter.configs').setup {
  ensure_installed = "all",
  highlight = { enable = true },
  indent = { enable = true }
}
EOF

"Colorscheme
colorscheme gruvbox
"Cursorline
set cursorline
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

lua << END
require('lualine').setup{
  options = {
    theme = 'dracula'
  }
}
END

"Cursor
autocmd InsertEnter,InsertLeave * set cul!
autocmd InsertEnter * set nocul
autocmd InsertLEave * set cul

"Blinking block/line
let &t_SI.="\e[5 q"
let &t_EI.="\e[0 q"
let &t_SR.="\e[4 q"

"Netrw
let g:netrw_banner=0
let g:netrw_winsize=20

"Ranger replace netrw?
"let g:ranger_replace_netrw = 1

"FZF settings
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
"let $FZF_DEFAULT_COMMAND = "find -L"

"Startify settings"
let g:startify_custom_header =      [            "NEOVIM v0.7.2"            ]
"
let g:startify_lists = [
         \ {'header': ['   Recent '],            'type': 'files' },
	 \ {'header': ['   Bookmarks'], 'type': 'bookmarks' },
	  \ {'header': ['   '. getcwd()], 'type': 'dir' },
         \ {'header': ['   Sessions '],            'type': 'sessions' },
         \ ]
"
let g:startify_bookmarks = [
            \ { '.': '~/dotfiles/' },
			\ { 'b': '~/.config/polybar/config' },
			\ { 'c': '~/.config/' },
			\ { 'd': '~/Documents/vimwiki/diary/diary.md'},
			\ { 'D': '~/Documents/' },
			\ { 'i': '~/.config/i3/config' },
            \ { 'n': '~/.config/nvim/init.vim' },
			\ { 'p': '~/.config/picom/picom.conf' },
 			\ { 's': '~/.local/bin/' },
 			\ { 't': '~/.tmux.conf/' },
			\ { 'w': '~/Documents/vimwiki/index.md' },
            \ { 'x': '~/.Xresources' },
			\ ]
"Vimwiki
".md files outside the wiki are not seen as .vimwiki
let g:vimwiki_global_ext = 0
"
let g:vimwiki_list = [{'path': '~/Documents/vimwiki/',
                     \ 'syntax': 'markdown', 'ext': '.md'}]
"Leader Key binds
let mapleader = "\<Space>"
"Buffer next and prev
map <leader>n :bn<CR>
map <leader>p :bp<CR>
"Buffer close
map <leader>bk :bd<CR>
"new buffer (space, e)
map <leader>e :enew<CR>
"Netrw explorer left
map <leader>z :Lex<CR>  
"FZF 
map <leader>, :FZF<CR>
map <leader>bi :Buffers<CR>
map <leader>. :BLines!<CR>
map <leader>f :Files!<CR>
let g:ranger_map_keys = 0
map <leader>r :Ranger<CR>
"Goyo
map <leader>g :Goyo<CR>
" Startify splash page
map <leader>/ :Startify<CR>
" Limelight
map <leader>l :Limelight!!<CR>
" Panel Switching/Splits
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
"Vertical split
map <leader>v <C-w>v
"Horizontal split
map <leader>s <C-w>s
nnoremap <leader>+ :vertical resize =5<CR>
nnoremap <leader>- :vertical resize -5<CR>
"Open terminal
map <leader>t :vertical topleft :terminal fish<CR>
"Yank to clipboard Ctrl+c
vnoremap <C-c> "+y
vnoremap <C-y> "+y
"Switch on transparency, source vimrc to turn off
map <leader>x :hi Normal guibg=NONE ctermbg=NONE<CR>
"Source init.vim    
map <leader>sv :source ~/.config/nvim/init.vim<CR>
"Url view
:noremap <leader>u :w<Home>silent <End> !urlview<CR> 
" Toggle signcolumn
nnoremap <leader>1 :set signcolumn=yes<CR>
nnoremap <Leader>2 :call ToggleSignColumn()<CR>
" Toggle signcolumn function
function! ToggleSignColumn()
    if !exists("b:signcolumn_on") || b:signcolumn_on
        set signcolumn=no
        let b:signcolumn_on=0
    else
        set signcolumn=number
        let b:signcolumn_on=1
    endif
endfunction
"Transparent signcolumn (works but symbols not transparent)
"highlight! link SignColumn LineNr
"Jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"END
