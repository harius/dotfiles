from ..installer import Package as _Package


bash = _Package(
    __name__,
    {
        'bash_profile': '~/.bash_profile',
        'bashrc': '~/.bashrc',
        'bash_aliases': '~/.bash_aliases'
    }
)
