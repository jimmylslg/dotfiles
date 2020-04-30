set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" Path to Python 3 interpreter. Setting this makes startup faster. Also useful
" for working with virtualenvs.
let g:loaded_python_provider=0
let g:python3_host_prog = $HOME . '/.config/nvim/neovim_env/bin/python3'

set clipboard+=unnamedplus

" if exists('g:vscode')
"     " VSCode extension
" else
"     " ordinary neovim
" endif
