if [[ -o login ]]; then
    print Bok\ $(whoami)!
    print You\ are\ running\ zsh\ $ZSH_VERSION!
fi

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
path=($path . ~/scripts ~/Applications/local/bin)
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

# Key bindings {{{
bindkey -v
autoload -Uz edit-command-line
bindkey -M vicmd 'v' edit-command-line

bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey "^[[3~" vi-delete-char

bindkey "^A" vi-beginning-of-line
bindkey "^E" vi-end-of-line

autoload -Uz colors && colors
function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NOR]% %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}"
    RPS2=$RPS1
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1
# }}}
