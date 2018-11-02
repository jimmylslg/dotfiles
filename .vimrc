"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype on                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Vundle itself
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'davidhalter/jedi-vim'
if has('nvim')
    Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } 
    Plugin 'zchee/deoplete-jedi'
endif
" Plugin 'python-mode/python-mode'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-surround'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'w0rp/ale'
Plugin 'airblade/vim-gitgutter'
Plugin 'jiangmiao/auto-pairs'
Plugin 'Yggdroot/indentLine'
" Plugin 'junegunn/fzf.vim'

" Themes
Plugin 'jdkanani/vim-material-theme'
Plugin 'kaicataldo/material.vim'
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'liuchengxu/space-vim-dark' 

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Sets how many lines of history VIM has to remember
set history=5000

if has('persistent_undo')
    " Maintain undo history between sessions
    set undofile
    set undodir=~/.vim/undodir
endif

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" "Code folding
"set foldmethod=indent
"set foldlevel=99
"nnoremap <space> za

"Color related
if exists('+termguicolors')
    let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

" Enable syntax
syntax on

let g:material_theme_style = 'dark'
set background=dark
" colorscheme material
colorscheme space-vim-dark
hi Comment cterm=italic

" Git diff shows vertical split
set diffopt+=vertical

" enable mouse click
set mouse=a

" Set to auto read when a file is changed from the outside
set autoread

" Set split orientation
set splitbelow
set splitright

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

"set shiftwidth=4 tabstop=4 expandtab softtabstop=4
set sw=4 et sts=4

"set autoindent ignorecase incsearch showmatch smartindent
set ai ic incsearch sm si

" Highlight search results
set hlsearch

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" display line number
set number relativenumber

" Add a bit extra margin to the left
set foldcolumn=1

" Set colorcolumn
set colorcolumn=120 

" For regular expressions turn magic on
set magic

" Use system clipboard
set clipboard=unnamed

" Set encoding
set encoding=utf-8

"some mappings for split window in vi editor
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" highlight all occurances
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>

"to indent selected text by pressing tab key
vmap <tab> >gv
"to un-indent selected text by pressing shift + tab key
vmap <s-tab> <gv
" esc to remove highlight
nnoremap <silent> <esc> :noh<cr>

"restore backspace for deletion
set backspace=indent,eol,start

" Always show the status line
set laststatus=2

" Remember cursor position between vim sessions
autocmd BufReadPost *
     \ if line("'\"") > 0 && line ("'\"") <= line("$") |
     \   exe "normal! g'\"" |
     \ endif
" center buffer around cursor when opening files
autocmd BufRead * normal zz


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NerdTree Settings
map <C-t> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Ctrlp Settings
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|env|\.hg|CVS|\.svn)$',
  \ 'file': '\v\.(a|class|db|dll|DS_Store|dylib|exe|idb|lib|ncb|o|obj|pdb|psd|pyc|pyo|sdf|so|sublime-workspace|suo|swp|zip)$',
  \ }

" Jedi-vim Settings
" let g:jedi#force_py_version=3
let g:jedi#auto_initialization = 1
let g:jedi#auto_vim_configuration = 0

" Using deoplete-jedi instead
let g:jedi#completions_command = ""
let g:jedi#completions_enabled = 0 
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = "0"

let g:jedi#documentation_command = "K"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_command = "<leader>d"
let g:jedi#rename_command = "<leader>r"
let g:jedi#usages_command = "<leader>n"
let g:jedi#use_tabs_not_buffers = 1  " Open in newtab instead
let g:jedi#force_py_version=3

" Python-mode Settings
" let g:pymode = 1
" let g:pymode_breakpoint = 0
" let g:pymode_virtualenv = 1
" let g:pymode_lint = 1 " Code checking
" let g:pymode_lint_cwindow = 1
" let g:pymode_lint_ignore = ["E501",]
" let g:pymode_lint_on_fly = 0 " on the fly code checking
" let g:pymode_lint_on_write = 1
" let g:pymode_lint_unmodified = 0
" let g:pymode_options_max_line_length = 120
" let g:pymode_python = 'python3'
" let g:pymode_rope = 0
" let g:pymode_rope_complete_on_dot = 0
" let g:pymode_rope_completion = 0
" let g:pymode_rope_lookup_project = 0
" let g:pymode_syntax = 1
" let g:pymode_syntax_all = 1
" let g:pymode_trim_whitespaces = 1 "Trim unused white spaces on save


" Ale Settings
" let g:ale_python_flake8_executable = 'flake8'
let g:ale_completion_enabled = 0
let g:ale_fix_on_save = 1
let g:ale_fixers = {'python': ['autopep8']}
let g:ale_lint_on_enter = 0
let g:ale_linters = {'python': ['flake8', 'pylint']}
let g:ale_python_flake8_options='--ignore=E501 --max-line-length=120'
let g:ale_python_pylint_options='--max-line-length=120'
let g:ale_sign_error = 'EE'
let g:ale_sign_warning = 'WW'
let g:ale_sign_column_always = 1

" Gitgutter Settings
let g:gitgutter_map_keys = 0  " To disable all key mappings:

"  vim-multiple-cursors Settings
"let g:multi_cursor_use_default_mapping=0
"
"" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
"let g:multi_cursor_select_all_word_key = '<A-n>'
"let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<C-n>'
"let g:multi_cursor_next_key            = '<C-n>'
"let g:multi_cursor_prev_key            = '<C-p>'
"let g:multi_cursor_skip_key            = '<C-x>'
"let g:multi_cursor_quit_key            = '<Esc>'
let g:multi_cursor_exit_from_insert_mode=0

