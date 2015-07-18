import os
import sys


class Package(object):
    def __init__(self, module, files):
        self._root = os.path.dirname(
            os.path.abspath(sys.modules[module].__file__)
        )
        self._files = files

    def install(self):
        for source, destination in self._files.iteritems():
            src = os.path.join(self._root, source)
            dst = os.path.expanduser(destination)
            os.symlink(src, dst)
