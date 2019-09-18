# zsh files

## Setup
1) Create .zsh Directory in your home directory

`mkdir ~/.zsh`

2) Clone this repository into the new .zsh created in step 1

`cd ~/.zsh && git clone https://github.com/therealmacjeezy/zsh.git .`

3) Change ZDOTDIR to the .zsh created in step 1

`echo "ZDOTDIR=~/.zsh" > ~/.zshenv`

## Changing Shell To zsh
To change the default shell to zsh use the following command

`chsh -s /bin/zsh`
