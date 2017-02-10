#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

export ZPLUG_HOME=~/.zplug
source $ZPLUG_HOME/init.zsh

zplug 'joel-porquet/zsh-dircolors-solarized' # directory colors
zplug 'zsh-users/zaw' # ctl-x ; launches a menu for... sutff
zplug 'supercrabtree/k' # ls with git information baked in
zplug 'zlsun/solarized-man' # colored man pages
zplug 'Tarrasch/zsh-bd' # go back directories
zplug 'caarlos0/zsh-pg' # postgresql shortcuts
zplug 'hcgraf/zsh-sudo' # esc-esc adds sudo to current command
zplug 'srijanshetty/zsh-pip-completion' # pip completions
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose

# auto rehash
zstyle ':completion:*' rehash true

# help
autoload -Uz run-help
alias help=run-help

autoload -U zmv

# remember recent directories
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

source /usr/share/autojump/autojump.zsh

# aliases
alias l=ls
alias g=grep
alias c=clear

# environment variables
export PATH=$PATH:$HOME/bin
export FZF_DEFAULT_COMMAND='ag -g ""'
export EDITOR='vim'
export VIRTUAL_ENV_DISABLE_PROMPT='1'
[[ -z $TMUX ]] && export TMUX=1

_gen_fzf_default_opts() {
  local base03="8"
  local base02="0"
  local base01="14"
  local base00="12"
  local base0="11"
  local base1="10"
  local base2="7"
  local base3="15"
  local yellow="3"
  local orange="9"
  local red="1"
  local magenta="5"
  local violet="13"
  local blue="4"
  local cyan="6"
  local green="2"

  # Solarized Dark color scheme for fzf
  export FZF_DEFAULT_OPTS="
    --color fg:-1,bg:-1,hl:$blue,fg+:$base2,bg+:$base02,hl+:$blue
    --color info:$yellow,prompt:$yellow,pointer:$base3,marker:$base3,spinner:$yellow
  "
}
_gen_fzf_default_opts
