# Aliases {{{
alias ll='ls -al'
alias ltr='ls -ltr'
alias m='more'
alias h='history'
alias less='less -i'
alias cgrep='grep --color=always'
alias gvim='mvim'
# }}}

# General setup {{{ 
typeset -U path
path=($path ~/scripts ~/Applications/local/bin)
VISUAL=vim
EDITOR=vim
PROMPT="%1~ > "
RPS1="%(?..(%?%))"
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.history_zsh
# }}}

# Command completion {{{
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES
# }}}

# Option setup {{{
setopt auto_cd
# }}}
