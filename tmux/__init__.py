from ..installer import Package as _Package


tmux = _Package(
    __name__,
    {
        'tmux.conf': '~/.tmux.conf'
    }
)
