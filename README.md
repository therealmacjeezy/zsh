# Custom zsh profile

This repo contains functions, aliases and options (setopt) that can be used in the zsh shell.

## Contents

### Functions
**Name** | **Overview**
---- | ----
`getrepos` | *[setup required - documentation coming soon..]*
`scriptHeader` | Prompts you for the name and type of script, creates a script header and copies it to the system clipboard
`cdf` | Changes directories in the current terminal session to the path open in Finder
`finder` | Opens a new Finder window at your current working directory

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

> These aliases use VS Code with the `code` shortcut configured [Setup Instructions](https://code.visualstudio.com/docs/setup/mac#_launching-from-the-command-line). Please install VS Code and add `code` to your $PATH before using the following aliases:
> - editProfile
> - editConfig
> - code

### Options (setopt)

- AUTO_CD
- EXTENDED_HISTORY
- SHARE_HISTORY
- APPEND_HISTORY
- INC_APPEND_HISTORY
- HIST_IGNORE_DUPS
- HIST_REDUCE_BLANKS
- CORRECT
- CORRECT_ALL

---
## Setup

1) Clone this repository to `~/.zsh/trmj`

```shell
git clone https://github.com/therealmacjeezy/zsh.git ~/.zsh/trmj
```

> If you don't want to clone it, you can download the repository and unzip the contents into `~/.zsh/trmj`

*2) [optional]* Open `functions.sh` and put your information into the `email_address` and `github_username` variables. These varaiables are **optional**.

**User Info Variables in `functions.sh`**
```shell
#### Variables
email_address=""
github_username=""
```

3) Add the zsh functions, aliases and options to .zshrc

```shell
echo "source /Users/$USER/.zsh/trmj/options.sh" >> ~/.zshrc
echo "source /Users/$USER/.zsh/trmj/aliases.sh" >> ~/.zshrc
echo "source /Users/$USER/.zsh/trmj/functions.sh" >> ~/.zshrc
```

> The order of the sources **does** matter. Make sure the sources are in the following order in your `~/.zshrc`:
> - options.sh
> - aliases.sh
> - functions.sh
 

 4) When youre done adding the sources to your `~/.zshrc`, you can either quit and reopen terminal to start a new session or type the following to update it manually:

 ```shell
 source ~/.zshrc
 ```

 **Example `~/.zshrc`**
 ```shell
 # symlink;
fpath=("$HOMEBREW_PREFIX/share/zsh/site-functions" $fpath)

# homebrew path
export PATH=$PATH:/Users/$USER/Library/Python/3.8/bin

source /Users/$USER/.zsh/trmj/options.sh

# prompt;
autoload -U promptinit; promptinit
# zsh completion
autoload -Uz compinit && compinit
# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

source ~/.spaceship
source /Users/$USER/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source /Users/$USER/.zsh/zsh-syntax-highlighting.zsh
source /Users/$USER/.zsh/trmj/aliases.sh
source /Users/$USER/.zsh/trmj/functions.sh
```

 