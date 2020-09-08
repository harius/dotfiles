dotfiles-deploy-local () {
    rsync -vv -ab --exclude .git --backup-dir .backup ~/.local/dotfiles*/ ~
}

dotfiles-deploy-remote () {
    if [ -z "$1" ]; then
        echo "Usage: $FUNCNAME <host>" >/dev/stderr
        return 1
    fi
    rsync -vv -ab --exclude .git --backup-dir .backup ~/.local/dotfiles*/ "$1:"
}
