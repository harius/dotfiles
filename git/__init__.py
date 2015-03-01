from ..installer import Package as _Package


git = _Package(
    __name__,
    {
        'gitconfig': '~/.gitconfig'
    }
)
