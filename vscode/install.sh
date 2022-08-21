#!/bin/bash
set -eu

paths=(keybindings.json settings.json)

for file_path in ${paths[@]}
do
    ln -snfv $HOME/dotfiles/vscode/$file_path $HOME/Library/Application\ Support/Code/User/$file_path
done

cat $HOME/dotfiles/vscode/extensions | while read line
do
    code --install-extension $line
done