from ..installer import Package as _Package


bash = _Package(
    __name__,
    {
        'profile': '~/.profile',
        'bash_profile': '~/.bash_profile',
        'bashrc': '~/.bashrc',
        'inputrc': '~/.inputrc'
    }
)
