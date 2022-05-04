# Custom zsh profile

This repo contains functions, aliases and options (setopt) that can be used in the zsh shell.

## Contents

### Functions
 - `getrepos` *[setup required]*
   - Returns the list of repositories for your Github account
 - `scriptHeader`
   - Prompts you for the name and type of script, creates a script header and copies it to the system clipboard
 - `cdf`
   - Changes directories in the current terminal session to the path open in Finder
 - `finder`
   - Opens a new Finder window at your current working directory

### Aliases
**Name** | **Command** | **Usage**
---- | ---- | ----
**editProfile** | `code ~/.zshrc` | Opens .zshrc in VS Code
**editConfig** | `code ~/.ssh/config` | Opens your SSH Config in VS Code
**applyProfile** | `source ~/.zshrc` | Applies any updates to your terminal session
**please** | `sudo !!` | The best way to rerun that command you forgot to put `sudo` in front of..
**ll** | `ls -alFG` | A better way to list files
**plistbuddy** | `/usr/libexec/PlistBuddy` | Full path to PlistBuddy
**githome** | `~/Github'` | Alias to the Github directory **Update to your location** 
**code** | `code ./` | Opens the current working directory in VS Code
**getip** | `dig +short myip.opendns.com @resolver1.opendns.com` | Gets your Public IP Address

> Some of these aliases use VS Code with the `code` extension installed. Please install both of these before using the following aliases:
 - editProfile
 - editConfig
 - code

### Options (setopt)
**AUTO_CD**
**EXTENDED_HISTORY**
**SHARE_HISTORY**
**APPEND_HISTORY**
**INC_APPEND_HISTORY**
**HIST_IGNORE_DUPS**
**HIST_REDUCE_BLANKS**
**CORRECT**
**CORRECT_ALL**

---
## Setup

1) Clone this repository to `~/.zsh/trmj`

```shell
git clone https://github.com/therealmacjeezy/zsh.git ~/.zsh/trmj
```

> If you don't want to clone it, you can download the repository and unzip the contents into `~/.zsh/trmj`

2) Open `functions.sh` and edit the email address and github URL *(lines 36,37)* to your email address and github URL.

3) Add the zsh functions, aliases and options to .zshrc

**Add everything to the .zshrc**
```shell
echo "source ~/.zsh/trmj/*.sh" >> ~/.zshrc
```

> If you want to only add a specific item to your profile, just replace the asterisk with the item you want to add to your zsh profile:
 - aliases.sh
 - functions.sh
 - options.sh 

 4) When youre done adding the sources to your ~/.zshrc, you can either quit and reopen terminal to start a new session or type the following to update it manually:

 ```shell
 source ~/.zshrc
 ```

 