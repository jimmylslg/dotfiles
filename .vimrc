" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Plugins
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
if has('nvim') 
    Plug 'Shougo/deoplete.nvim', { 
                \'do': ':UpdateRemotePlugins',
                \} 
    Plug 'zchee/deoplete-jedi', { 'for': 'python' }
endif
Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'w0rp/ale', { 'for': 'python' }
Plug 'mhinz/vim-signify'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'skywind3000/asyncrun.vim'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'ludovicchabant/vim-gutentags'
Plug 'qpkorr/vim-bufkill'
Plug 'christoomey/vim-tmux-navigator'

" Themes
" Plug 'jdkanani/vim-material-theme'
" Plug 'kaicataldo/material.vim'
" Plug 'kristijanhusak/vim-hybrid-material'
Plug 'liuchengxu/space-vim-dark' 

" Initialize plugin system
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Enable filetype plugins
filetype plugin on
filetype indent on

" Sets how many lines of history VIM has to remember
set history=5000

if has('persistent_undo')
    " Maintain undo history between sessions
    set undofile
    set undodir=~/.vim/undodir
endif

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

"Color related
if exists('+termguicolors')
    " let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
    " let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

" Enable syntax
syntax on

let g:material_theme_style = 'dark'
set background=dark
" colorscheme material
colorscheme space-vim-dark
hi Comment cterm=italic

" Spell Color related
hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! SpellBad gui=undercurl guisp=red
hi! SpellCap gui=undercurl guisp=blue
hi! SpellRare gui=undercurl guisp=magenta

" highlight current line
set cursorline

" Git diff shows vertical split
set diffopt+=vertical

" enable mouse click
set mouse=a

" Set to auto read when a file is changed from the outside
set autoread

" Set split orientation
set splitbelow
set splitright

" Set side column to be on all the time
set signcolumn=yes

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

" Quick escaping
inoremap jk <Esc>
inoremap kj <Esc>
cnoremap jk <Esc>
cnoremap kj <Esc>

" Tags/buffers Mgmt/Navigation
nnoremap <M-h> :tabp<cr>
nnoremap <M-l> :tabn<cr>
nnoremap <M-n> :tabe<cr>
nnoremap <M-w> :bd<cr>

" Quickly switch back to normal mode in terminal mode
tnoremap <Esc> <C-\><C-n>

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

" Cmd line height
set cmdheight=1

" Remember cursor position between vim sessions
autocmd BufReadPost *
     \ if line("'\"") > 0 && line ("'\"") <= line("$") |
     \   exe "normal! g'\"" |
     \ endif
" center buffer around cursor when opening files
autocmd BufRead * normal zz

" Close quickfix when quit
autocmd bufwinenter quickfix nnoremap <silent> <buffer>
                \   q :cclose<cr>:lclose<cr>
autocmd bufenter * if (winnr('$') == 1 && &buftype ==# 'quickfix' ) |
                \   bd|
                \   q | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => plugins settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ====> NerdTree Settings
map <C-t> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$', '__pycache__'] "ignore files in NERDTree
let g:NERDTreeWinSize=25
let NERDTreeMinimalUI=1

" ====> Ctrlp Settings
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|env|\.hg|CVS|\.svn|__pycache__)$',
  \ 'file': '\v\.(a|class|db|dll|DS_Store|dylib|exe|idb|lib|ncb|o|obj|pdb|psd|pyc|pyo|sdf|so|sublime-workspace|suo|swp|zip)$',
  \ }

" ====> Jedi-vim Settings
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

" ====> Python-mode Settings
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


" ====> Ale Settings
" let g:ale_python_flake8_executable = 'flake8'
let g:ale_completion_enabled = 0
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = {'python': ['autopep8']}
let g:ale_lint_on_enter = 0
let g:ale_linters = {'python': ['flake8', 'pylint']}
let g:ale_python_flake8_options='--ignore=E501 --max-line-length=120'
let g:ale_python_pylint_options='--max-line-length=120'
let g:ale_python_autopep8_options='--max-line-length=120'
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'
let g:ale_sign_column_always = 1
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_text_changed = 'normal'

" ====> Airline Settings
let g:airline_theme='luna'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tmuxline#enabled = 1
let airline#extensions#tmuxline#snapshot_file = "~/.tmux-status.conf"
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'c'    : ['#(whoami)', '#(hostname)', '#(uptime | cut -d " " -f 1,2,3)'],
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W', '#F'],
      \'y'    : ['%R', '%a','%m/%d/%Y'],
      \'z'    : '#H'}

" ====> Gitgutter Settings
let g:gitgutter_map_keys = 0  " To disable all key mappings:

" ====> vim-multiple-cursors Settings
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_key      = 'g<C-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

 " ====> Signify Settings
let g:signify_realtime = 1
let g:signify_vcs_list = [ 'git' ]

" ====> AsyncRun Settings
let g:asyncrun_open = 8
let g:asyncrun_bell = 1
noremap <F9> :call asyncrun#quickfix_toggle(8)<cr> 

" ====> LeaderF Settings
let g:Lf_ShortcutF = '<C-P>'
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_CacheDirectory = expand('~/.vim/cache')
noremap <a-r> :LeaderfMru<cr>
noremap <a-f> :LeaderfFunction!<cr>
noremap <a-b> :LeaderfBuffer<cr>
noremap <a-t> :LeaderfTag<cr>
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git','.hg', 'env'],
            \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
            \}
let g:Lf_HideHelp = 1
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}
let g:Lf_UseVersionControlTool = 0  "  if uses gitignore file to ignore index

" ====> Vim-Gutentags Settings
set tags=./.tags;
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_ctags_tagfile = '.tags'
let s:vim_tags = expand('~/.vim/cache/tags')  " Define where the tag files being saved
let g:gutentags_cache_dir = s:vim_tags
" Create tag cache dir if not exists
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif


" ====> AutoPairs Settings
let g:AutoPairsShortcutToggle = ''
let g:AutoPairsShortcutFastWrap = ''
let g:AutoPairsShortcutJump = ''
let g:AutoPairsShortcutBackInsert = ''


" deoplete Settings
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option({
            \'ignore_sources': {
		\ '_': ['tag', 'buffer']
		\},
            \'ignore_case': v:true,
            \'smart_case': v:true,
            \'auto_complete_delay': 0,
        \})
function g:Multiple_cursors_before()
    call deoplete#custom#buffer_option('auto_complete', v:false)
endfunction
function g:Multiple_cursors_after()
    call deoplete#custom#buffer_option('auto_complete', v:true)
endfunction

" deoplete-jedi Settings
let g:deoplete#sources#jedi#show_docstring = 1
let g:deoplete#sources#jedi#enable_typeinfo = 1
