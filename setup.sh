#!/data/data/com.termux/files/usr/bin/bash

# update
pkg update && apt upgrade -y

# install
pkg install -y curl unzip wget openssh python git nodejs neovim openssl

# git config
git config --global user.name "Brief"
git config --global user.email "brf2053@gmail.com"

## termux config
# add extra-keys
mkdir ~/.termux
echo "extra-keys = [['+', '-', '\"', '/', '>', '&', 'ENTER', 'BACKSPACE'], ['ESC', 'echo', 'BACKSLASH', ':', 'HOME', 'UP', 'END', 'PGUP'], ['TAB', 'CTRL', 'ALT', '$', 'LEFT', 'DOWN', 'RIGHT', 'PGDN']]" >~/.termux/termux.properties
# clear termux greet
rm ~/../usr/etc/motd

# add my own alias
echo "#My own alias" >> ~/../usr/etc/bash.bashrc
echo "alias vim='nvim'" >> ~/../usr/etc/bash.bashrc
echo "alias vi='nvim'" >> ~/../usr/etc/bash.bashrc
echo "alias ll='ls -al'" >> ~/../usr/etc/bash.bashrc