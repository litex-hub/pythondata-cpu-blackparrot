import os.path
__dir__ = os.path.split(os.path.abspath(os.path.realpath(__file__)))[0]
data_location = os.path.join(__dir__, "verilog")
src = "https://github.com/enjoy-digital/black-parrot.git"
git_hash = "dbb13f31370a743633dc94d3639d55c8c4d74e1d"
git_describe = "v0.0-1746-gdbb13f31"
version_str = "0.0.post1746"
version_tuple = (0, 0)
try:
    from packaging.version import Version as V
    pversion = V("0.0.post1746")
except ImportError:
    pass
