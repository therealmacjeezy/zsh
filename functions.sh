#!/bin/sh

#### Variables
email_address="josh[at]macjeezy.com"
github_username=""

getrepos(){
    GITHUB_TOKEN=$(python3 -c 'import keyring; print(keyring.get_password("gh cli", "bender.rules"))')
    gh repo list
}

scriptHeader(){
    echo "What type of script are you trying to right? "
    printf '1) Shell (#!/bin/bash)\n'
    printf '2) Python 3\n'
    read script_type

    echo "What is the name of this script?"
    read script_name

    case $script_type in
    1)
        script_type="#!/bin/bash\r\r##########################################"
        script_name="${script_name}.sh"
        ;;
    2)
        script_type="##########################################"
        script_name="${script_name}.py"
        ;;
    *)
        echo "Unknown option selected. Using default shell (#!/bin/bash).."
        script_type="#!/bin/bash"
        ;;
    esac

    if [[ ! -z "$email_address" ]] && [[ ! -z "$github_username" ]]; then
        user_info="# $email_address\r# https://github.com/$github_username\r##########################################"
    elif [[ -z "$email_address" ]] && [[ ! -z "$github_username" ]]; then
        user_info="# https://github.com/$github_username\r##########################################"
    elif [[ ! -z "$email_address" ]] && [[ -z "$github_username" ]]; then
        user_info="# $email_address\r##########################################"
    elif [[ -z "$email_address" ]] && [[ -z "$github_username" ]]; then
        user_info="##########################################"
    fi


    printf "$script_type
# $script_name
# Created: $(date '+%F')
# Modified: N/A
$user_info

" | pbcopy
}

scriptHeader

# Takes you to the path of the current open Finder window
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
        echo "Switched path to \"$currFolderPath\""
        cd "$currFolderPath"
}

# Opens finder to the path in terminal
finder () {
    currPath=$(pwd)
    echo "Opening a new Finder window for $currPath"
    open $currPath
}