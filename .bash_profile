# Invoke keychain on startup
if [ -x /usr/bin/keychain ]; then
    eval $(keychain --eval ~/.ssh/id_rsa)
fi

# Execute .bashrc
if [ -f .bashrc ]; then
    source .bashrc
fi

