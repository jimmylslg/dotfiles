# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export SHELL=/bin/zsh
# export TERM="xterm-256color"
# export COLORTERM="truecolor"

# load ~/.zshrc.local if exists
[[ -s $HOME/.zshrc.local ]] && source "$HOME/.zshrc.local"

# Returns whether the given command is executable or aliased.
_has() {
  return $( whence $1 >/dev/null )
}

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="punctual"
ZSH_THEME="kayid"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  autojump
  tmux
  copydir
  django
  vi-mode
)
ZSH_DISABLE_COMPFIX="true"
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='nvim'
# else
#   export EDITOR='vim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias n=nvim
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi
alias e=nvim
alias ipy="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"
alias editvim='vim ~/.vimrc'
alias editzsh='vim ~/.zshrc'
alias edittmux='vim ~/.tmux.conf'
alias ll='ls -lGh'
alias gs='git status'
alias gd='git diff'
alias sls='screen -ls'
alias sr='screen -r'
alias ssh='ssh -q'
alias grep='grep --color=auto'
alias zogs='ssh -q zogs'
alias kal-el='ssh -q kal-el'
alias s='ssh -q'
alias ld='ls -lGhd'
alias jp='ssh -q root@dev-jp-001'
alias jp2='ssh -q root@dev-jp-002'
alias activate='source ./env/bin/activate'
alias snow_hosts='/Users/jimmpan/devenv/esp_cli/env/bin/python -m esp_cli.snow_hosts --config=/Users/jimmpan/devenv/__no__/snow_jimmy.yaml'
alias iaca='cd ~/devenv/GIS-IAC/api_router && ll &&activate'
alias iacp='cd ~/devenv/GIS-IAC/iac-ansible && ll &&activate'
alias es='nvim $(fzf)'
alias gco='git checkout $(git branch |fzf)'


# The Silver Searcher is even faster than Ack.
# https://github.com/ggreer/the_silver_searcher
if _has ag; then
  alias ag='ag --color-path 1\;31 --color-match 1\;32 --color -U --path-to-ignore ~/.ignore'
fi

#FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# fzf + ag configuration
if _has fzf && _has ag; then
  export FZF_DEFAULT_COMMAND='ag -U --nocolor --path-to-ignore ~/.ignore -g ""'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_DEFAULT_OPTS='
  --height 40%
  --layout=reverse
  --border
  --color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108
  --color info:108,prompt:109,spinner:108,pointer:168,marker:168
  '
fi


# autojump
[[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh


# ZSH checking on cached .zcompdump to see if it needs regenerating only one time a day
# https://medium.com/@dannysmith/little-thing-2-speeding-up-zsh-f1860390f92
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

