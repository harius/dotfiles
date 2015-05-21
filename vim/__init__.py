from ..installer import Package as _Package


vim = _Package(
    __name__,
    {
        'vimrc': '~/.vimrc'
    }
)
