#!/bin/bash

# ask for the administrator password upfront.
sudo -v

# setup aliases (-f: remove existing file, -n: don't replace existing symlink)
echo "Aliasing dotfiles..."
ln -sf ~/_bin/dot-files/bashrc ~/.bashrc #bash
ln -sf ~/_bin/dot-files/bash_profile ~/.bash_profile #bash
ln -sf ~/_bin/dot-files/zshrc ~/.zshrc #zsh
ln -sf ~/_bin/dot-files/gitconfig ~/.gitconfig #git
ln -sf ~/_bin/dot-files/gitignore ~/.gitignore #gitignore
ln -sf ~/_bin/dot-files/.git_template ~/.git_template #template dir (for git hooks)
ln -sf ~/_bin/dot-files/nanorc ~/.nanorc #nano
ln -sf ~/_bin/dot-files/tmux.conf ~/.tmux.conf #tmux

# source rc files
echo "Sourcing aliased dotfiles..."
source ~/.bashrc
source ~/.zshrc

echo '=============================================================='
echo 'run "clean_map_setup" if this is a fresh mac installation'
echo '-OR-'
echo 'run “list_all_installs” - to view setups/installations available'
echo '=============================================================='