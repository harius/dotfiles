from ..installer import Package as _Package


terminfo = _Package(
    __name__,
    {
        'rxvt-unicode-256color': '~/.terminfo/r/rxvt-unicode-256color'
    }
)
