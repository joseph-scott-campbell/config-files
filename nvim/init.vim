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
    Plug 'christoomey/vim-tmux-navigator' " read code
    Plug 'ghifarit53/tokyonight-vim' " read code
    Plug 'scrooloose/nerdtree' " need to read
    Plug 'dense-analysis/ale' " need to read
call plug#end()

nnoremap <leader>] <cmd>bn<CR>
nnoremap <leader>[ <cmd>bp<CR>
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

let g:onedark_color_overrides = {
\ "background": {"gui": "#1e2127", "cterm": "235", "cterm16": "0" },
\}

colorscheme tokyonight

let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme='tokyonight'
let g:ale_linters = {'python': ['flake8'], 'c': ['cc', 'clangtidy'], 'typescript': ['eslint']}
let b:ale_fixers = {'*': [], 'python': ['autopep8'], 'c': ['clang-format']}
let g:ale_c_clangtidy_checks = ['-*', 'modernize*']
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_save = 1
let g:ale_c_clangformat_style_option = '{BasedOnStyle: llvm, IndentWidth: 4}'
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" binary file editing
augroup Binary
  " MFD = MiFare Dump
  au!
  au BufReadPre  *.mfd let &bin=1
  au BufReadPost *.mfd if &bin | %!xxd
  au BufReadPost *.mfd set ft=xxd | endif
  au BufWritePre *.mfd if &bin | %!xxd -r
  au BufWritePre *.mfd endif
  au BufWritePost *.mfd if &bin | %!xxd
  au BufWritePost *.mfd set nomod | endif
augroup END
