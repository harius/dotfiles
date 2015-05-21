import subprocess
import os
import sys


class Package(object):
    def __init__(self, module, files):
        self.root_ = os.path.dirname(os.path.abspath(sys.modules[module].__file__))
        self.files_ = files

    def install(self):
        for source, destination in self.files_.iteritems():
            src = os.path.join(self.root_, source)
            dst = os.path.expanduser(destination)
            subprocess.call(["ln", "-s", src, dst])
