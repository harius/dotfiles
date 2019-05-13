[ -x /usr/bin/ssh-askpass ] && export SSH_ASKPASS=ssh-askpass
[ -x /usr/bin/keychain ] && eval $(keychain --quiet --eval ~/.ssh/id_rsa)

[ "$BASH" ] && [ "$BASH" != "/bin/sh" ] && [ -f ~/.bashrc ] && source ~/.bashrc
