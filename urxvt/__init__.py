from ..installer import Package as _Package


urxvt = _Package(
    __name__,
    {
        'Xresources': '~/.Xresources'
    }
)
