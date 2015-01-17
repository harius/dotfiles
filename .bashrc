# everybody has 256 colors now, right?
if [ $TERM = 'xterm' ]; then
    export TERM=xterm-256color
fi

# predefined colors
orange='\[\e[01;38;05;180m\]'
blue='\[\e[01;38;05;67m\]'
plain='\[\e[0m\]'

# execute custom part of .bashrc
if [ -f ~/.bashrc_custom ]; then
    source ~/.bashrc_custom
fi

# don't put lines starting with space in the history.
HISTCONTROL=ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000

# update the values of LINES and COLUMNS when necessary
shopt -s checkwinsize

# make less more friendly for non-text input files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# prompt
PS1="\n${prompt_color}\u@\h${plain}\n\$ "

# header
set_header_text () {
    echo -ne "\033]0;$1\007"
}

prepare_header_text () {
    git_branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
    if [ $? -eq 0 ]; then
      git_branch=" ($git_branch)"
    fi
    echo "$PWD$git_branch"
} 

PROMPT_COMMAND='set_header_text "$(prepare_header_text)"'

# disable virtualenv prompt manipulations
export VIRTUAL_ENV_DISABLE_PROMPT=1

# load aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# enable history search by prefix
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# enable auto cd
shopt -s autocd

# execute private part of .bashrc
if [ -f ~/.bashrc_private ]; then
    source ~/.bashrc_private
fi

