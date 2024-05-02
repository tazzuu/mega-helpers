# Mega Helper Scripts

Scripts and methods to help you manage your [Mega](https://mega.nz) accounts.

This repo is designed and tested for use with macOS but will probably work just fine with Linux and likely work fine on Windows with WSL2. Maybe I will even test it on those platforms soon.

**WARNING:** None of the methods here are guaranteed to work or to not cause anything bad to happen. Use at your own risk. It worked for me, I hope it might work for you.

## Preparation

Install `megatools` ([homepage here](https://megatools.megous.com/), [old outdated repo here](https://github.com/MaxFork/MegaTools))

(macOS)

```bash
brew install megatools
```

Test that its working

```
$ megatools --version

Usage:
...
Run: megatools <command> --help for detailed options for each command.

megatools 1.11.1 - command line tools for Mega.nz
Written by Ondrej Jirman <megous@megous.com>, 2013-2022
Go to http://megatools.megous.com for more information
```

## Login to all of your accounts

The included script `login.sh` will do a simple basic login on all of your accounts listed in the file `logins.txt`. This is helpful in order to easily "refresh" or "revive" your account after it has been inactive for a long time (and could get deleted due to inactivity).

First, replace the contents of the included file `logins.txt` with your user account credentials. Make sure you edit the file with a plain-text editor such as Notepad or TextEdit or VS Code, etc.. The format of the file contents should look like this

```
myemail@gmail.com:hunter2
myemail+1@gmail.com:hunter2
```

Where the first value on each line is your Mega login email address, the second value is your password, delimited by a `:` character. Yes, we are saving our Mega account passwords in plain text in a file on disk because we assume you do not actually care about the security of your account or its contents.

Run the script with this super simple command

```bash
./login.sh
```

Should look like this

```
>>> username: myemail@gmail.com password: hunter2
successful login
```

If you get an error message like this

```
ERROR: Can't login to mega.nz: API call 'us' failed: Server returned error ENOENT
ERROR: couldnt log in to myemail@gmail.com
```

Then it means your username and/or password is wrong.

# Resources