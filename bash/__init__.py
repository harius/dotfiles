from ..installer import Package as _Package


bash = _Package(
    __name__,
    {
        'profile': '~/.profile',
        'bashrc': '~/.bashrc',
        'inputrc': '~/.inputrc',
        'dircolors': '~/.config/ls/dircolors'
    }
)
