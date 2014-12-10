# invoke keychain on startup
if [ -x /usr/bin/keychain ]; then
    eval $(keychain --eval ~/.ssh/id_rsa)
fi

