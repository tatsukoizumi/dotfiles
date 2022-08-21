#!/bin/bash
set -eu

VSCODE_SETTING_DIR=$HOME/dotfiles/vscode

paths=($VSCODE_SETTING_DIR/keybindings.json $VSCODE_SETTING_DIR/settings.json)

for file_path in ${paths[@]}
do
    ln -snfv $file_path $HOME/Library/Application\ Support/Code/User
done

cat $VSCODE_SETTING_DIR/extensions | while read line
do
    code --install-extension $line
done