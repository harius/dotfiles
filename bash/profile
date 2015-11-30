# invoke keychain on startup (but not on each tmux window)
if  [ -x /usr/bin/keychain ] && [ -z "$TMUX" ]; then
    print "foo"
    eval $(keychain --eval ~/.ssh/id_rsa)
fi
