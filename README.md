My dotfiles.

Stored in `~/dotfiles`, deployed by rsync:

```bash
rsync -ab --cvs-exclude --exclude .git --backup-dir .backup ~/dotfiles ~
rsync -ab --cvs-exclude --exclude .git --backup-dir .backup ~/dotfiles "$destination_host:"
```
