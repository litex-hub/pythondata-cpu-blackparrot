import os.path
__dir__ = os.path.split(os.path.abspath(os.path.realpath(__file__)))[0]
data_location = os.path.join(__dir__, "system_verilog")
src = "https://github.com/enjoy-digital/black-parrot.git"

# Module version
version_str = "0.0.post1793"
version_tuple = (0, 0, 1793)
try:
    from packaging.version import Version as V
    pversion = V("0.0.post1793")
except ImportError:
    pass

# Data version info
data_version_str = "0.0.post1746"
data_version_tuple = (0, 0, 1746)
try:
    from packaging.version import Version as V
    pdata_version = V("0.0.post1746")
except ImportError:
    pass
data_git_hash = "dbb13f31370a743633dc94d3639d55c8c4d74e1d"
data_git_describe = "v0.0-1746-gdbb13f31"
data_git_msg = """\
commit dbb13f31370a743633dc94d3639d55c8c4d74e1d
Author: Florent Kermarrec <florent@enjoy-digital.fr>
Date:   Sun Feb 9 19:44:22 2020 +0100

    remove submodules

"""

# Tool version info
tool_version_str = "0.0.post47"
tool_version_tuple = (0, 0, 47)
try:
    from packaging.version import Version as V
    ptool_version = V("0.0.post47")
except ImportError:
    pass
