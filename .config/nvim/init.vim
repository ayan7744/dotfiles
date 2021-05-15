""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug core
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')

" Make sure you use single quotes

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'''''''''''
"" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

Plug 'itchyny/lightline.vim'	" Lightline statusbar
Plug 'vim-python/python-syntax'	" Python syntax highlighting
Plug 'lervag/vimtex'		" vimtex plugin
Plug 'brennier/quicktex'    " dynamic latex abbreviations
Plug 'vimwiki/vimwiki'
Plug 'lambdalisue/suda.vim' " workaround for `:w !sudo tee %`
Plug 'dag/vim-fish'         " fish support

" Initialize plugin system
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" needed for vimwiki
set nocompatible
syntax on
filetype plugin on
filetype plugin indent on

" Copy/paste. 
" There are reasons why I am not doing set clipboard=unnamedplus, using the
" system clipboard makes d and x send data to + register which messes up stuff
" you actually copied originally.
" Use `"+y`, `"+d`, `"+p` instead or use the mappings defined below.
" By default y,d,x and p use their own (vim?) clipboard. They don't use any of
" primary, secondary or clipboard.

set mouse=a	"enable mouse, because why not?"
set number	"display line numbers

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overridden by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" leader key
let mapleader='\'

"" Enable hidden buffers
set hidden

"" Searching
" highlight search results:
set hlsearch
set incsearch
set ignorecase
set smartcase

set fileformats=unix,dos,mac
set shell=$SHELL

"" backups,swaps etc
set undodir=$HOME/.cache/nvim/undo//
set backupdir=$HOME/.cache/nvim/backup//
set directory=$HOME/.cache/nvim/swap//

" highlights the line number
set cursorline
highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE

" used (?)  for setting filetypes for specific files by prepending
" # vim: ft=<filetype>
set modeline

" don't warn when editing a read-only file 
au BufEnter * set noro

" syntax highlighting for specific filetypes
au BufRead,BufNewFile *.rules set ft=sh
au BufRead,BufNewFile *.fish set ft=sh
"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" Suda.vim
cnoreabbrev w!! SudaWrite
cnoreabbre r!! SudaRead

" Insert timestamp
iab <expr> ddt strftime("[%e-%b-%Y %I:%M:%S %p]")
"*****************************************************************************
"" Commands
"*****************************************************************************
" remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

"*****************************************************************************
"" Mappings
"*****************************************************************************
"" Copy. cut and paste to system clipboard
vnoremap <C-c> "+y
vnoremap <C-x> "+d
inoremap <C-v> <ESC>"+p

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Close buffer
noremap <leader>c :bd<CR>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status Line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The lightline.vim theme
let g:lightline = {
      \ 'colorscheme': 'darcula',
      \ }

" Always show statusline
set laststatus=2

" Uncomment to prevent non-normal modes showing in powerline and below powerline.
set noshowmode

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Uncomment to autostart the NERDTree
" autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize=38

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Theming
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight LineNr           ctermfg=8    ctermbg=none    cterm=none
highlight CursorLineNr     ctermfg=7    ctermbg=8       cterm=none
highlight VertSplit        ctermfg=0    ctermbg=8       cterm=none
highlight Statement        ctermfg=2    ctermbg=none    cterm=none
highlight Directory        ctermfg=4    ctermbg=none    cterm=none
highlight StatusLine       ctermfg=7    ctermbg=8       cterm=none
highlight StatusLineNC     ctermfg=7    ctermbg=8       cterm=none
highlight NERDTreeClosable ctermfg=2
highlight NERDTreeOpenable ctermfg=8
highlight Comment          ctermfg=244    ctermbg=none    cterm=italic
" highlight Constant         ctermfg=12   ctermbg=none    cterm=none
" highlight Special          ctermfg=4    ctermbg=none    cterm=none
" highlight Identifier       ctermfg=6    ctermbg=none    cterm=none
" highlight PreProc          ctermfg=5    ctermbg=none    cterm=none
" highlight String           ctermfg=14   ctermbg=none    cterm=none
" highlight Number           ctermfg=1    ctermbg=none    cterm=none
" highlight Function         ctermfg=1    ctermbg=none    cterm=none

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimtex
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimtex_view_method='zathura'

" synctex
let g:vimtex_syntax_enabled=1
let g:vimtex_compiler_progname='nvr'

" typesetting engine
" let g:vimtex_compiler_latexmk = { 
"         \ 'executable' : 'latexmk',
"         \ 'options' : [ 
"         \   '-xelatex',
"         \   '-file-line-error',
"         \   '-synctex=1',
"         \   '-interaction=nonstopmode',
"         \ ],
"         \}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"colorizer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:colorizer_auto_color=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" quicktex
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" $XDG_CONFIG_HOME/nvim/quicktex.vim is begin sourced from tex.vim in ftplugin
" dir of quicktex
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimwiki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimwiki_list = [{'path':'$HOME/Dropbox/vimwiki', 'path_html':'$HOME/Dropbox/vimwiki/html/', 'template_path': '$HOME/Dropbox/vimwiki/templates', 'template_default': 'default', 'template_ext': '.html'}]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-fish
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufRead *.fish set ft=fish

" Set up :make to use fish for syntax checking.
autocmd FileType fish compiler fish

" Set this to have long lines wrap inside comments.
" autocmd FileType fish setlocal textwidth=79

" Enable folding of block structures in fish.
" autocmd FileType fish setlocal foldmethod=expr
