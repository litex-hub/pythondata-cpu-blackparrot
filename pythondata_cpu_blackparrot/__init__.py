import os.path
__dir__ = os.path.split(os.path.abspath(os.path.realpath(__file__)))[0]
data_location = os.path.join(__dir__, "system_verilog")
src = "https://github.com/enjoy-digital/black-parrot.git"

# Module version
version_str = "0.0.post1799"
version_tuple = (0, 0, 1799)
try:
    from packaging.version import Version as V
    pversion = V("0.0.post1799")
except ImportError:
    pass

# Data version info
data_version_str = "0.0.post1748"
data_version_tuple = (0, 0, 1748)
try:
    from packaging.version import Version as V
    pdata_version = V("0.0.post1748")
except ImportError:
    pass
data_git_hash = "30b599caed3c2b26450914901f5bf99a1fbd17ff"
data_git_describe = "v0.0-1748-g30b599ca"
data_git_msg = """\
commit 30b599caed3c2b26450914901f5bf99a1fbd17ff
Merge: dbb13f31 34fbb75c
Author: enjoy-digital <florent@enjoy-digital.fr>
Date:   Wed May 13 08:06:45 2020 +0200

    Merge pull request #1 from scanakci/master
    
    update source files and organize repo

"""

# Tool version info
tool_version_str = "0.0.post51"
tool_version_tuple = (0, 0, 51)
try:
    from packaging.version import Version as V
    ptool_version = V("0.0.post51")
except ImportError:
    pass


def data_file(f):
    """Get absolute path for file inside pythondata_cpu_blackparrot."""
    fn = os.path.join(data_location, f)
    fn = os.path.abspath(fn)
    if not os.path.exists(fn):
        raise IOError("File {f} doesn't exist in pythondata_cpu_blackparrot".format(f))
    return fn
