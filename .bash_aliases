alias ls='ls --color=auto'

alias wide='less -S'
alias lumos="sed -r 's/	/⇥.../g'"
alias duh='du -h'
alias day='date --rfc-3339=date'

alias tmx='tmux -2 attach || tmux -2 new'

adhoc() {
    cd ~/mrjob/statadhoc-$1
}

