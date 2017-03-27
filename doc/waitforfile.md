---
modulename: Utils
title: /waitforfile/
giturl: gitlab.com/space-sh/utils
weight: 200
---
# Utils module: Wait for file

Wait for one or more files to exist.


## Example

Wait for `output.txt` file to be created with a timeout of 60 seconds:
```sh
space -m utils /waitforfile/ -- "/home/janitor/output.txt" "60"
```

Exit status code is expected to be 0 on success.
