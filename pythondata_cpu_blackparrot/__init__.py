import os.path
__dir__ = os.path.split(os.path.abspath(os.path.realpath(__file__)))[0]
data_location = os.path.join(__dir__, "system_verilog")
src = "https://github.com/enjoy-digital/black-parrot.git"

# Module version
version_str = "0.0.post1809"
version_tuple = (0, 0, 1809)
try:
    from packaging.version import Version as V
    pversion = V("0.0.post1809")
except ImportError:
    pass

# Data version info
data_version_str = "0.0.post1751"
data_version_tuple = (0, 0, 1751)
try:
    from packaging.version import Version as V
    pdata_version = V("0.0.post1751")
except ImportError:
    pass
data_git_hash = "03d2514542557199a79373443c8e405f0bfee53f"
data_git_describe = "v0.0-1751-g03d25145"
data_git_msg = """\
commit 03d2514542557199a79373443c8e405f0bfee53f
Merge: 30b599ca 10401383
Author: enjoy-digital <florent@enjoy-digital.fr>
Date:   Fri May 15 12:47:57 2020 +0200

    Merge pull request #2 from scanakci/master
    
    Missing files due to gitignore

"""

# Tool version info
tool_version_str = "0.0.post58"
tool_version_tuple = (0, 0, 58)
try:
    from packaging.version import Version as V
    ptool_version = V("0.0.post58")
except ImportError:
    pass


def data_file(f):
    """Get absolute path for file inside pythondata_cpu_blackparrot."""
    fn = os.path.join(data_location, f)
    fn = os.path.abspath(fn)
    if not os.path.exists(fn):
        raise IOError("File {f} doesn't exist in pythondata_cpu_blackparrot".format(f))
    return fn
