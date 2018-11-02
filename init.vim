set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" Path to Python 3 interpreter. Setting this makes startup faster. Also useful
" for working with virtualenvs.
let g:loaded_python_provider=0
let g:python3_host_prog = $HOME . '/.config/nvim/neovim_env/bin/python3'

set clipboard+=unnamedplus

" deoplete Settings
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#show_docstring = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#sources#jedi#enable_typeinfo = 1
let g:deoplete#auto_complete_delay = 0
