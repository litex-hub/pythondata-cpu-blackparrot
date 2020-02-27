#!/usr/bin/env python3
import os

from litex.data.cpu import blackparrot

print("Found blackparrot @ version", blackparrot.version_str, "("+blackparrot.git_hash+")")
print("Data is in", blackparrot.data_location)
assert os.path.exists(blackparrot.data_location)
print("It contains:\n -", end=" ")
print("\n - ".join(os.listdir(blackparrot.data_location)))
