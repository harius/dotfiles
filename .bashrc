export PATH="$HOME/.local/bin:/usr/local/sbin:$PATH"

[ -d ~/.local/stack ] && \
  export PATH="$HOME/.local/stack:$PATH"

shopt -s nullglob
if [ -d ~/.bashrc.d ]; then
    for rcfile in ~/.bashrc.d/*; do
        source $rcfile
    done
fi
shopt -u nullglob

if [ -n "$LC_RELATIVE_PWD" ]; then
  cd "$LC_RELATIVE_PWD"
fi

if [[ -x /usr/bin/direnv || -x /usr/local/bin/direnv ]];
then eval "$(direnv export bash 2>/dev/null)"
fi

# Don't apply bashrc unless the session is interactive.
[ -n "$PS1" ] || return

[ -n "$PROMPT_STYLE" ] || PROMPT_STYLE="\[\e[32m\]"

# Make a fancy prompt and preserve it from external intrusions.
PS1="$PROMPT_STYLE(\A) \[\e[37m\]\w\n$PROMPT_STYLE\$ \[\e[0m\]"
export VIRTUAL_ENV_DISABLE_PROMPT=1

if [ ! -d ~/.cache ]; then
    mkdir ~/.cache
fi

# Those who cannot remember the past are condemned to repeat it.
shopt -s histappend
HISTFILE=~/.cache/bash_history
HISTSIZE=10000

[ -x /bin/stty ] && /bin/stty -ixon

[ -x /usr/bin/vim ] && export EDITOR=vim

ls --version >/dev/null 2>/dev/null && alias ls='ls --color=auto'
export CLICOLOR=1

ssh () {
    LC_RELATIVE_PWD="${PWD#$HOME}"
    LC_RELATIVE_PWD="${LC_RELATIVE_PWD#/}" /usr/bin/ssh "$@"
}

export PS_FORMAT=uname,pid,ppid,pgid,c,stime,time,cmd
export MSSQL_CLI_TELEMETRY_OPTOUT=1

if [[ -x /usr/bin/direnv || -x /usr/local/bin/direnv ]];
then eval "$(direnv hook bash)"
fi
