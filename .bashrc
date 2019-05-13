export PATH="$HOME/.local/bin:/usr/local/sbin:$PATH"

if [ -d ~/.local/pyenv ];
then
  export PYENV_ROOT=~/.local/pyenv
  export PATH="$(pyenv root)/shims:$PATH"
fi

[ -d ~/.local/stack ] && \
  export PATH="$HOME/.local/stack:$PATH"

shopt -s nullglob
if [ -d ~/.bashrc.d ]; then
    for rcfile in ~/.bashrc.d/*; do
        source $rcfile
    done
fi
shopt -u nullglob

# Don't apply bashrc unless the session is interactive.
[ -n "$PS1" ] || return

# Make a fancy prompt and preserve it from external intrusions.
PS1="\[\e[32m\](\A) \[\e[37m\]\w\n\[\e[32m\]\$ \[\e[0m\]"
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

export PS_FORMAT=uname,pid,ppid,pgid,c,stime,time,cmd
export MSSQL_CLI_TELEMETRY_OPTOUT=1

dotfiles-install () {
  if [[ ! -d "$1" || -z "$2" || "$#" > 2 ]]; then
    echo "Usage:" >/dev/stderr
    echo "  dotfiles-install path/to/dotfiles [host:]path/to/home" >/dev/stderr

    return 1
  fi

  rsync -ab --cvs-exclude --exclude .git --backup-dir .backup "$1/" "$2"
}
