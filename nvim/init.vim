set encoding=utf-8
set number number
syntax enable
set clipboard+=unnamedplus
set scrolloff=8
set backspace=indent,eol,start
set cc=80
set tabstop=4
set softtabstop=4
set shiftwidth=4
set wrap
set linebreak
set expandtab
set autoindent
set fileformat=unix
set termguicolors
set guifont=Hack\ Nerd\ Font:15

call plug#begin('~/.local/share/nvim/plugged')
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'rebelot/kanagawa.nvim'
    Plug 'ghifarit53/tokyonight-vim'
    Plug 'vim-airline/vim-airline'
    Plug 'jiangmiao/auto-pairs'
    Plug 'scrooloose/nerdcommenter'
    Plug 'sbdchd/neoformat'
    Plug 'neomake/neomake'
    Plug 'scrooloose/nerdtree'
    Plug 'ryanoasis/vim-devicons'
    Plug 'famiu/bufdelete.nvim'
    Plug 'dense-analysis/ale'
    Plug 'sheerun/vim-polyglot'
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'sainnhe/gruvbox-material'
    Plug 'tpope/vim-fugitive'
    Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-rhubarb'
    Plug 'tpope/vim-surround'
    Plug 'junegunn/gv.vim'
    Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
call plug#end()

lua require('plugins')
lua require('code_runner').setup({})
lua require('bufferline-config')
nnoremap <leader>q <cmd>q<CR>
nnoremap <leader>r <cmd>RunCode<CR>
nnoremap <leader>s <cmd>w<CR>
nnoremap <leader>m <cmd>make<CR>
nnoremap <C-Q> <cmd>q<CR>
nnoremap <leader>] <cmd>bn<CR>
nnoremap <leader>[ <cmd>bp<CR>
nnoremap <leader>bd <cmd>Bdelete<CR>
nnoremap <leader>br i <C-C><C-C>
nnoremap nt <cmd>NERDTreeToggle<CR>
nnoremap nf <cmd>NERDTreeFocus<CR>
nnoremap <leader>nf <cmd>NERDTreeFind<CR>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap + :res +5<CR>
nnoremap - :res -5<CR>

let g:tokyonight_style = "night"
let g:gruvbox_material_background = 'hard'

let g:onedark_color_overrides = {
\ "background": {"gui": "#1e2127", "cterm": "235", "cterm16": "0" },
\}
colorscheme tokyonight

let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme='tokyonight'
let g:neomake_python_enabled_makers = ['flake8']
call neomake#configure#automake('nrwi', 500)
let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_retab = 1
let g:neoformat_basic_format_trim = 1
let g:ale_linters = {'python': ['flake8'], 'c': ['cc', 'clangtidy'], 'typescript': ['eslint']}
let b:ale_fixers = {'*': [], 'python': ['autopep8'], 'c': ['clang-format']}
let g:ale_c_clangtidy_checks = ['-*', 'modernize*']
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_save = 1
let g:ale_c_clangformat_style_option = '{BasedOnStyle: llvm, IndentWidth: 4}'
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
let g:rustfmt_autosave = 1

let g:vim_svelte_plugin_load_full_syntax = 1
let g:vim_svelte_plugin_use_typescript = 1
let g:svelte_preprocessors = ['typescript']

" binary file editing
augroup Binary
  au!
  au BufReadPre  *.mfd let &bin=1
  au BufReadPost *.mfd if &bin | %!xxd
  au BufReadPost *.mfd set ft=xxd | endif
  au BufWritePre *.mfd if &bin | %!xxd -r
  au BufWritePre *.mfd endif
  au BufWritePost *.mfd if &bin | %!xxd
  au BufWritePost *.mfd set nomod | endif
augroup END

au Filetype rust set cc=100```

