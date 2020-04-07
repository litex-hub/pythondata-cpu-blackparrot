# litex-data-cpu-blackparrot

Non-Python data files required to use the blackparrot with
[LiteX](https://github.com/enjoy-digital/litex.git).

The data files can be found under the Python module `litex.data.cpu.blackparrot`. The
`litex.data.cpu.blackparrot.location` value can be used to find the files on the file system.

Example of getting the data file directly;
```python
import litex.data.cpu.blackparrot

my_data_file = "abc.txt"

with open(os.path.join(litex.data.cpu.blackparrot.data_location, my_data_file)) as f:
    print(f.read())
```

Example of getting the data file using `litex.data.find` API;
```python
from litex.data.find import find_data

my_data_file = "abc.txt"

with open(os.path.join(find_data("cpu", "blackparrot"), my_data_file)) as f:
    print(f.read())
```


The data files come from https://github.com/enjoy-digital/black-parrot.git
and are imported using `git subtrees` to the directory
[litex/data/cpu/blackparrot/system_verilog](litex/data/cpu/blackparrot/system_verilog).



## Installing

## Manually

You can install the package manually, however this is **not** recommended.

```
git clone https://github.com/litex-hub/litex-data-cpu-blackparrot.git
cd litex-data-cpu-blackparrot
sudo python setup.py install
```

## Using [pip](https://pip.pypa.io/)

You can use [pip](https://pip.pypa.io/) to install the data package directly
from github using;

```
pip install --user git+https://github.com/litex-hub/litex-data-cpu-blackparrot.git
```

If you want to install for the whole system rather than just the current user,
you need to remove the `--user` argument and run as sudo like so;

```
sudo pip install git+https://github.com/litex-hub/litex-data-cpu-blackparrot.git
```

You can install a specific revision of the repository using;
```
pip install --user git+https://github.com/litex-hub/litex-data-cpu-blackparrot.git@<tag>
pip install --user git+https://github.com/litex-hub/litex-data-cpu-blackparrot.git@<branch>
pip install --user git+https://github.com/litex-hub/litex-data-cpu-blackparrot.git@<hash>
```

### With `requirements.txt` file

Add to your Python `requirements.txt` file using;
```
-e git+https://github.com/litex-hub/litex-data-cpu-blackparrot.git
```

To use a specific revision of the repository, use the following;
```
-e https://github.com/litex-hub/litex-data-cpu-blackparrot.git@<hash>
```
