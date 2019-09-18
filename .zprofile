### setopt settings
setopt AUTO_CD
setopt CORRECT
setopt CORRECT_ALL

### Prompt settings
PROMPT='%B%F{400}%/ %# > %f%b'

# git info (Shows name and branch)
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{240}(%b)%r%f'
zstyle ':vcs_info:*' enable git

### Functions
# Switch to current open Finder window in the console
cdf () {
		currFolderPath=$( /usr/bin/osascript <<EOT
			tell application "Finder"
				try
			set currFolder to (folder of the front window as alias)
				on error
			set currFolder to (path to desktop folder as alias)
				end try
				POSIX path of currFolder
			end tell
EOT
		)
		echo "cd to \"$currFolderPath\""
		cd "$currFolderPath"
}

# Copy Script Header to Clipboard
scriptHeader() {
# Capture shell being used
printf 'Which Shell [Default: zsh]]?\n'
printf '1) zsh\n'
printf '2) bash\n'
printf 'Enter Number: '
read SHELL_CHOICE

case $SHELL_CHOICE in
1)
  SHELL="#!/bin/zsh"
  ;;
2)
  SHELL="#!/bin/bash"
  ;;
*)
  echo "Using Default Shell (zsh)"
  SHELL="#!/bin/zsh"
  ;;
esac

# Script Header Variables
USER_FULL_NAME=$(dscl . -read "/Users/$(who am i | awk '{print $1}')" RealName | sed -n 's/^ //g;2p')
CURR_USER=$(ls -l /dev/console | awk '{print $3}')
CURR_DATE=$(date +%B\ %Y)

echo "$SHELL

#################################################
# <Script_Name>
# $USER_FULL_NAME | $CURR_DATE
#################################################" | pbcopy
}

# Edit zprofile
editProfile() {
  code ${ZDOTDIR}/.zprofile
}

# Apply zshprofile
applyProfile() {
	source ${ZDOTDIR}/.zprofile
}

### Aliases
# PIVSSH
alias pivssh='ssh -A -o PKCS11Provider=/usr/lib/ssh-keychain.dylib'
