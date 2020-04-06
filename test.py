#!/usr/bin/env python3
import os

from litex.data.cpu import blackparrot

print("Found blackparrot @ version", blackparrot.version_str, "(with data", blackparrot.data_version_str, ")")
print()
print("Data is in", blackparrot.data_location)
assert os.path.exists(blackparrot.data_location)
print("Data is version", blackparrot.data_version_str, blackparrot.data_git_hash)
print("-"*75)
print(blackparrot.data_git_msg)
print("-"*75)
print()
print("It contains:")
for root, dirs, files in os.walk(blackparrot.data_location):
    dirs.sort()
    for f in sorted(files):
        path = os.path.relpath(os.path.join(root, f), blackparrot.data_location)
        print(" -", path)
