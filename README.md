# Utils module | [![build status](https://gitlab.com/space-sh/utils/badges/master/build.svg)](https://gitlab.com/space-sh/utils/commits/master)

Miscellaneous system utilities.



## /sleep/
	Sleep for a number of seconds (or indefinitely).


## /waitforfile/
	Wait for file(s) to exist.

	Wait for one or more files to exist, then exit.
	Possibly wait using timeout. Exit 1 on time out.
	


# Functions 

## UTILS\_DEP\_INSTALL()  
  
  
  
Do nothing, but conform to the  
/\_dep\_install/ pattern.  
  
  
  
## UTILS\_WAITFORFILE()  
  
  
  
Wait for one or more files or directories.  
Optionally using timeout.  
  
### Parameters:  
- $1: list of file paths  
- $2: timeout in seconds (optional)  
  
### Returns:  
- 0: success  
- 1: time out  
  
  
  
## UTILS\_SLEEP()  
  
  
  
Sleep for number of seconds or indefinitely.  
  
### Parameters:  
- $1: timeout in seconds. Empty means sleep forever.  
  
### Returns:  
- Non-zero on error.  
  
  
  
