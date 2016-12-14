from ..installer import Package as _Package


ssh = _Package(
    __name__,
    {
        'rc': '~/.ssh/rc'
    }
)
