" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Plugins
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
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

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run the install script
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  " Both options are optional. You don't have to install fzf in ~/.fzf
  " and you don't have to run the install script if you use fzf only in Vim.
Plug 'junegunn/fzf.vim'

" Themes
" Plug 'jdkanani/vim-material-theme'
" Plug 'kaicataldo/material.vim'
" Plug 'kristijanhusak/vim-hybrid-material'
" Plug 'liuchengxu/space-vim-dark' 
Plug 'dracula/vim', { 'as': 'dracula' }

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
    " let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
    " let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

" Enable syntax
syntax on

let g:material_theme_style = 'dark'
set background=dark
" colorscheme material
" colorscheme space-vim-dark
colorscheme dracula

hi Normal guibg=NONE ctermbg=NONE
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
set cmdheight=2

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

"restore backspace for deletion
set backspace=indent,eol,start

" Always show the status line
set laststatus=2

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" Cmd line height
set cmdheight=2

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Function Helpers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
com! FormatJSON %!python -m json.tool

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => plugins settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ====> Jedi-vim Settings
" let g:jedi#force_py_version=3
" let g:jedi#auto_initialization = 1
" let g:jedi#auto_vim_configuration = 0
" " Using deoplete-jedi instead
" let g:jedi#completions_command = ""
" let g:jedi#completions_enabled = 0 
" let g:jedi#popup_on_dot = 0
" let g:jedi#show_call_signatures = "0"
" 
" let g:jedi#documentation_command = "<leader>k"
" let g:jedi#goto_assignments_command = "<leader>g"
" let g:jedi#goto_command = "<leader>d"
" let g:jedi#rename_command = "<leader>r"
" let g:jedi#usages_command = "<leader>n"
" let g:jedi#use_tabs_not_buffers = 0  " Open in buffer instead
" let g:jedi#force_py_version=3


" ====> Ale Settings
" let g:ale_python_flake8_executable = 'flake8'
" let g:ale_completion_enabled = 0
" let g:ale_linters_explicit = 1
" let g:ale_fix_on_save = 1
" let g:ale_fixers = {
"         \'python': ['autopep8'],
"     \}
" let g:ale_lint_on_enter = 0
" let g:ale_linters = {
"         \'python': ['flake8', 'pylint'],
"         \'yaml': ['yamllint'],
"         \'ansible': ['ansible-lint']
"     \}
" let g:ale_python_flake8_options='--ignore=E501 --max-line-length=120'
" let g:ale_python_pylint_options='--max-line-length=120'
" let g:ale_python_autopep8_options='--max-line-length=120'
" let g:ale_sign_error = 'E'
" let g:ale_sign_warning = 'W'
" let g:ale_sign_column_always = 1
" let g:ale_echo_msg_format = '[%linter%] %code: %%s'
" let g:ale_lint_on_insert_leave = 1
" let g:ale_lint_on_text_changed = 'normal'

" ====> Airline Settings
let g:airline_theme='luna'
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
let airline#extensions#tmuxline#snapshot_file = "~/.tmux-status.conf"
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'c'    : ['#(whoami)', '#(hostname)', '#(uptime | cut -d " " -f 1,2,3)'],
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W', '#F'],
      \'y'    : ['%R', '%a','%m/%d/%Y'],
      \'z'    : '#H'}
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#coc#enabled = 0

" ====> Gitgutter Settings
let g:gitgutter_map_keys = 0  " To disable all key mappings:
" nmap ]h <Plug>(GitGutterNextHunk)
" nmap [h <Plug>(GitGutterPrevHunk)
" nmap <leader>hs <Plug>(GitGutterStageHunk)
" nmap <leader>hu <Plug>(GitGutterUndoHunk)
" nmap <leader>hp <Plug>(GitGutterPreviewHunk)
" let g:gitgutter_highlight_linenrs = 1

" " ====> vim-multiple-cursors Settings
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_key      = 'g<C-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" ====> Signify Settings
" let g:signify_realtime = 1
" let g:signify_vcs_list = [ 'git' ]

" ====> AsyncRun Settings
let g:asyncrun_open = 8
let g:asyncrun_bell = 1
noremap <F9> :call asyncrun#quickfix_toggle(8)<cr> 
augroup python_file
    autocmd!
    autocmd FileType python nnoremap <F10> :AsyncRun python -u "%"<CR>
augroup END


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

" deoplete Settings
" let g:deoplete#enable_at_startup = 1
" call deoplete#custom#option({
"             \'ignore_sources': {
" 		\ '_': ['tag', 'buffer']
" 		\},
"             \'ignore_case': v:true,
"             \'smart_case': v:true,
"             \'auto_complete_delay': 0,
"         \})
" function g:Multiple_cursors_before()
"     call deoplete#custom#buffer_option('auto_complete', v:false)
" endfunction
" function g:Multiple_cursors_after()
"     call deoplete#custom#buffer_option('auto_complete', v:true)
" endfunction

" deoplete-jedi Settings
" let g:deoplete#sources#jedi#show_docstring = 1
" let g:deoplete#sources#jedi#enable_typeinfo = 1


" Tagbar Settings
nmap <F8> :TagbarToggle<CR>
let g:tagbar_sort = 0

" Neoterm Settings
let g:neoterm_default_mod='vertical'
nmap gx <Plug>(neoterm-repl-send)
xmap gx <Plug>(neoterm-repl-send)
nmap gxx <Plug>(neoterm-repl-send-line)

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
nnoremap <a-t> :BTags<Cr>
nnoremap <a-T> :Tags<Cr>
nnoremap <a-f> :Ag<Cr>
autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>
let g:fzf_action = {
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'
" Using the custom window creation function
let g:fzf_layout = { 'window': 'call OpenFloatingWin()' }
" Disable preview windows
let g:fzf_preview_window = ''
" Floating windows
function! OpenFloatingWin()
  let height = &lines - 3
  let width = float2nr(&columns - (&columns * 2 / 10))
  let col = float2nr((&columns - width) / 2)

  " 设置浮动窗口打开的位置，大小等。
  " 这里的大小配置可能不是那么的 flexible 有继续改进的空间
  let opts = {
        \ 'relative': 'editor',
        \ 'row': height * 0.3,
        \ 'col': col + 30,
        \ 'width': width * 2 / 3,
        \ 'height': height / 2
        \ }

  let buf = nvim_create_buf(v:false, v:true)
  let win = nvim_open_win(buf, v:true, opts)

  " 设置浮动窗口高亮
  call setwinvar(win, '&winhl', 'Normal:Pmenu')

  setlocal
        \ buftype=nofile
        \ nobuflisted
        \ bufhidden=hide
        \ nonumber
        \ norelativenumber
        \ signcolumn=no
endfunction

" ====> vim-test Settings
let test#python#runner = 'djangotest'
let test#strategy = "neovim"
let g:test#preserve_screen = 1
let test#neovim#term_position = "belowright"
let test#strategy = {
  \ 'nearest': 'neovim',
  \ 'file':    'neoterm',
  \ 'suite':   'neoterm',
\}

" ====> coc Settings
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
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
vmap <leader>s  <Plug>(coc-format-selected)
nmap <leader>s  <Plug>(coc-format-selected)
" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" Show yank history
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" <coc-snippet> settings
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

" <Coc-highlight> settings
" autocmd CursorHold * silent call CocActionAsync('highlight')
" hi CocHighlightText guibg=Brown

" <coc-prettier>
command! -nargs=0 Prettier :CocCommand prettier.formatFile
