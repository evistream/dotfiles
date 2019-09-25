source ~/venv/bin/activate

export LANG=C

# prompt
PS1="%% "
autoload -Uz promptinit
promptinit
prompt bart green

# color
autoload -Uz colors
colors

# emacs-like key bindings
bindkey -e

# histroy
HISTFILE=~/.zsh_history_sakura
HISTSIZE=1000000
SAVEHIST=1000000

# kugiri wo word tanni ni
autoload -Uz select-word-style
select-word-style default

# completion
autoload -Uz compinit
compinit

# ignore case for completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# don't show current dir for completion after '../'
zstyle ':completion:*' ignore-parents parent pwd ..
 
setopt print_eight_bit
setopt ignore_eof
setopt interactive_comments
setopt auto_cd
setopt share_history
setopt extended_glob

bindkey '^R' history-incremental-pattern-search-backward

alias la='ls -a'
alias ll='ls -l'

alias sakura='cd ~/Documents/sakurayama_workspace'
