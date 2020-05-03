" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Plugins
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'terryma/vim-multiple-cursors'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine', { 'for': ['python', 'yaml'] }
Plug 'ludovicchabant/vim-gutentags'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'kassio/neoterm'
Plug 'jeetsukumaran/vim-pythonsense', { 'for': 'python' }
Plug 'pearofducks/ansible-vim', { 'do': 'cd ./UltiSnips; ./generate.py', 'for': 'yaml' }
Plug 'easymotion/vim-easymotion'
Plug 'jpalardy/vim-slime'
Plug 'tpope/vim-commentary'
Plug 'janko/vim-test'
Plug 'skywind3000/asyncrun.vim'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'honza/vim-snippets'
Plug 'voldikss/vim-floaterm'
Plug 'ryanoasis/vim-devicons'
" TODO: Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" TODO: https://github.com/wincent/ferret#user-content-ack


Plug 'neoclide/coc.nvim', {'branch': 'release'}

" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run the install script
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  " Both options are optional. You don't have to install fzf in ~/.fzf
  " and you don't have to run the install script if you use fzf only in Vim.
Plug 'junegunn/fzf.vim'

" Themes
" Plug 'bluz71/vim-nightfly-guicolors'
" Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'morhetz/gruvbox'
" Plug 'tomasr/molokai'
Plug 'rakr/vim-one'

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

" Set correct tabspace for yaml type file
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Sets how many lines of history VIM has to remember
set history=5000

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=100

if has('persistent_undo')
    " Maintain undo history between sessions
    set undofile
    set undodir=~/.vim/undodir
endif

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

"Color related
if exists('+termguicolors')
    set termguicolors
endif

" Enable syntax
syntax on

set background=dark
let g:one_allow_italics = 1
colorscheme one

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

set nopaste

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
set cmdheight=1

"set shiftwidth=4 tabstop=4 expandtab softtabstop=4
set sw=4 et sts=4

"set autoindent ignorecase incsearch showmatch smartindent
set ai ic incsearch sm si

" Highlight search results
set hlsearch

" A buffer becomes hidden when it is abandoned
set hid

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" display line number
set number relativenumber
set numberwidth=1

" Add a bit extra margin to the left
set foldcolumn=0

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
noremap H ^
noremap L g_
noremap J 5j
noremap K 5k

" No need for ex mode
nnoremap Q <nop>
" recording macros is not my thing
map q <Nop>

" Tags/buffers Mgmt/Navigation
nnoremap <M-h> :bp<cr>
nnoremap <M-l> :bn<cr>
nnoremap <M-n> :enew<cr>
" nnoremap <M-w> :bd<cr>
nnoremap <M-w> :Sayonara!<cr>

" Nvim terminal -------------------------------------------------------------{{{
" Quickly switch back to normal mode in terminal mode
tnoremap <Esc> <C-\><C-n>
"au BufEnter * if &buftype == 'terminal' | :startinsert | endif
"autocmd BufEnter term://* startinsert
autocmd TermOpen * set bufhidden=hide  " Don't hide terminal when switching buffer

" highlight all occurances
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

"to indent selected text by pressing tab key
vmap <tab> >gv
"to un-indent selected text by pressing shift + tab key
vmap <s-tab> <gv
" esc to remove highlight
nnoremap <silent> <esc> :noh<cr>

" save file
nmap <silent> <C-S> :update<CR>

"restore backspace for deletion
set backspace=indent,eol,start

" Always show the status line
set laststatus=1
" Cmd line height
set cmdheight=1

" Don't redraw while executing macros (good performance config)
set lazyredraw 

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
" => Fast editing and reloading of vimrc configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>e :e! ~/.vimrc<cr>
autocmd! bufwritepost ~/.vimrc source ~/.config/nvim/init.vim | echo "reloaded"

" ====> Airline Settings
let g:airline_theme='one'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_idx_mode = 1
tmap <leader>1  <C-\><C-n><Plug>AirlineSelectTab1
tmap <leader>2  <C-\><C-n><Plug>AirlineSelectTab2
tmap <leader>3  <C-\><C-n><Plug>AirlineSelectTab3
tmap <leader>4  <C-\><C-n><Plug>AirlineSelectTab4
tmap <leader>5  <C-\><C-n><Plug>AirlineSelectTab5
tmap <leader>6  <C-\><C-n><Plug>AirlineSelectTab6
tmap <leader>7  <C-\><C-n><Plug>AirlineSelectTab7
tmap <leader>8  <C-\><C-n><Plug>AirlineSelectTab8
tmap <leader>9  <C-\><C-n><Plug>AirlineSelectTab9
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
let g:airline#extensions#tabline#buffer_idx_format = {
        \ '0': '0 ',
        \ '1': '1 ',
        \ '2': '2 ',
        \ '3': '3 ',
        \ '4': '4 ',
        \ '5': '5 ',
        \ '6': '6 ',
        \ '7': '7 ',
        \ '8': '8 ',
        \ '9': '9 ',
        \}
let g:airline#extensions#tmuxline#enabled = 1
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W', '#F'],
      \'y'    : ['%R', '%a','%m/%d/%Y'],
      \'z'    : '#H'}
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#coc#enabled = 0


" ====> Gitgutter Settings
let g:gitgutter_map_keys = 0  " To disable all key mappings:

" " ====> vim-multiple-cursors Settings
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_key      = 'g<C-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" ====> AsyncRun Settings
let g:asyncrun_open = 8
let g:asyncrun_bell = 1
noremap <F9> :call asyncrun#quickfix_toggle(8)<cr> 
augroup python_file
    autocmd!
    autocmd FileType python nnoremap <F10> :AsyncRun python -u "%"<CR>
augroup END
" setup async runner that runs in floaterm
" https://github.com/voldikss/vim-floaterm#integrate-with-asynctasksvim
function! s:runner_proc(opts)
  let curr_bufnr = floaterm#curr()
  if has_key(a:opts, 'silent') && a:opts.silent == 1
    call floaterm#hide()
  endif
  let cmd = 'cd ' . shellescape(getcwd())
  call floaterm#terminal#send(curr_bufnr, [cmd])
  call floaterm#terminal#send(curr_bufnr, [a:opts.cmd])
  stopinsert
  if &filetype == 'floaterm' && g:floaterm_autoinsert
    call floaterm#util#startinsert()
  endif
endfunction
let g:asyncrun_runner = get(g:, 'asyncrun_runner', {})
let g:asyncrun_runner.floaterm = function('s:runner_proc')

" ====> floaterm Settings
let g:floaterm_keymap_toggle = '<leader>t'


" ====> Vim-Gutentags Settings
set tags=./.tags;
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project',]
let g:gutentags_ctags_tagfile = '.tags'
let s:vim_tags = expand('~/.vim/cache/tags')  " Define where the tag files being saved
let g:gutentags_cache_dir = s:vim_tags
" Create tag cache dir if not exists
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif
" https://vimjc.com/vim-ctag.html#%E4%BA%8C%E3%80%81ctags%E5%8F%82%E6%95%B0%E4%BB%8B%E7%BB%8D
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
let g:gutentags_ctags_exclude = ["**/env/**","**/__pycache__/**"]

" Tagbar Settings
nmap <F8> :TagbarToggle<CR>
let g:tagbar_sort = 0
let g:tagbar_width = 30

" Neoterm Settings
let g:neoterm_default_mod='belowright'
nmap gx <Plug>(neoterm-repl-send)
xmap gx <Plug>(neoterm-repl-send)
nmap gxx <Plug>(neoterm-repl-send-line)
let g:neoterm_autoscroll=1
let g:neoterm_size=16 "

" ====> easymotion Settings
let g:EasyMotion_do_mapping = 0
nmap <Leader>f <Plug>(easymotion-overwin-f2)
nmap <Leader>w <Plug>(easymotion-overwin-w)
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1

" ====> vim-slime Settings
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": "{right}"}
let g:slime_dont_ask_default = 1
let g:slime_no_mappings = 1
nmap <c-c><c-c> <ESC>:1,$SlimeSend<CR>  " Send entire file
xmap <c-c><c-c> <Plug>SlimeRegionSend
nmap <c-c>v     <Plug>SlimeConfig

" ====> FZF-vim Settings
nnoremap <C-p> :Files<Cr>
nnoremap <a-T> :BTags<Cr>
nnoremap <a-t> :Tags<Cr>
nnoremap <a-f> :Rg<Cr>

autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>
let g:fzf_action = {
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" ====> vim-test Settings
let test#python#runner = 'djangotest'
let g:test#preserve_screen = 1
" Customized runner using AsyncRun in Floaterm
function! AsyncRunFloat(cmd)
  execute 'AsyncRun -mode=term -pos=floaterm '.a:cmd
endfunction
let g:test#custom_strategies = {'asyncrun_float': function('AsyncRunFloat')}
" Set strategy to use custom strategie
let g:test#strategy = 'asyncrun_float'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ====> coc Settings Start
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Remap keys for gotos
nmap <silent> <leader>d <Plug>(coc-definition)
nmap <silent> <leader>r <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <leader>k :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Format selected
vmap <leader>s  <Plug>(coc-format-selected)
nmap <leader>s  <Plug>(coc-format-selected)
" Show yank history
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" <coc-snippet> settings
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'

" <coc-prettier>
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" <coc-explorer> settings
nmap <space>e :CocCommand explorer<CR>

" <coc-actions> settings
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ====> coc Settings End
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" indentLine settings
let g:indentLine_setColors = 0
let g:indentLine_fileType = ['python']
