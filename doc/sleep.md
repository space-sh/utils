---
modulename: Utils
title: /sleep/
giturl: gitlab.com/space-sh/utils
weight: 200
---
# Utils module: Sleep

Sleeps for a number of seconds or indefinitely.


## Example

Sleeping for 60 seconds:
```sh
space -m utils /sleep/ -- "60"
```

Sleeps forever:
```sh
space -m utils /sleep/ -- "0"
```

Exit status code is expected to be 0 on success.
