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
>>> logging in to account: myemail@gmail.com
successful login
```

If you get an error message like this

```
ERROR: Can't login to mega.nz: API call 'us' failed: Server returned error ENOENT
ERROR: couldnt log in to myemail@gmail.com
```

Then it means your username and/or password is wrong.


## Register new accounts

This method is a little tricker than the previous one and I have not been able to 100% script it up yet (any help is appreciated). But the goal here is to use the "+"-trick with Gmail to create a bunch of new accounts easily.

First, you should create for yourself a "burner" Gmail account. You will need to enable 2-factor authentication (2FA) on it for the latter steps. Its also really really helpful if this account has a mostly empty Inbox with contents that you do not care about and are not sensitive and would not mind losing if anything bad were to happen.

Next, you should update the included file `password.txt` with the password that you want to use for your NEW **Mega** accounts. To make life easier, you can use a long string of random numbers and letters, but consider avoiding special characters and especially avoid including the character `:` because that is used elsewhere.

Now you can use the included script `register.sh` to create a bunch of new accounts. You will use the script by providing it with the base name of your email address, and the start and stop numbers to append to the address for registration. So, if your email address is `myemail@gmail.com` and you want to create 5 Mega accounts starting at number `1` and ending at number `5` then you will run the script like this

```bash
./register.sh myemail 1 5
```

If it works, it should give output like this

```
>>> Registering account for user myemail+1@gmail.com
Registration email was sent to myemail+1@gmail.com. To complete registration, you must run:

  megatools reg --verify FW...... @LINK@

(Where @LINK@ is registration link from the 'MEGA Signup' email)
success
>>> Registering account for user myemail+2@gmail.com
Registration email was sent to myemail+2@gmail.com. To complete registration, you must run:

  megatools reg --verify FW...... @LINK@

(Where @LINK@ is registration link from the 'MEGA Signup' email)
success

```

The script will also create / update the new file `registered_users.txt` which you can open to see the list of new accounts that were created (username, password, and token).

Congrats you just created a bunch of new Mega accounts!

## Verify the new accounts

The hardest part is performing the verification step on these accounts. To verify, you would normally need to click through the link sent in the email. However, because we just created hundreds of new Mega accounts, we dont have time to click a hundred email links. So, we are going to configure our email so that we can pull it down on the command line and dump it out and scrape it to get the verification links back.

First, you need to log in to your Gmail account, and make sure you have enabled 2FA ;

- https://myaccount.google.com/security

Next, you need to create an App Password for Gmail

- https://myaccount.google.com/apppasswords

- having trouble? some helpful links;
  - https://support.google.com/accounts/answer/185833
  - https://support.google.com/accounts/answer/185833?hl=en
  - https://support.google.com/mail/thread/4477145/no-app-passwords-under-security-signing-in-to-google-panel?hl=en

Next, you need to enable IMAP access to your Gmail Inbox

- https://support.google.com/mail/answer/7126229
- https://support.google.com/mail/answer/7104828?hl=en&ref_topic=7280141&sjid=7499020491168243840-NC

# Resources