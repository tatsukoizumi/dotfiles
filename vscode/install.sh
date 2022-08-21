#!/bin/bash
set -eu

paths=(keybindings.json settings.json)

cd $HOME

for file_path in ${paths[@]}
do
    ln -snfv ./dotfiles/vscode/$file_path ./Library/Application\ Support/Code/User
done

cat ./dotfiles/vscode/extensions | while read line
do
    code --install-extension $line
done