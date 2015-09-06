from ..installer import Package as _Package


openbox = _Package(
    __name__,
    {
        'rc.xml': '~/.config/openbox/rc.xml',
        'menu.xml': '~/.config/openbox/menu.xml',
        'network-menu-cmd': '~/.config/openbox/network-menu-cmd'
    }
)
