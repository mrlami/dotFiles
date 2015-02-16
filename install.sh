#!/bin/bash

# ask for the administrator password upfront.
sudo -v

# setup aliases (-f: remove existing file, -n: don't replace existing symlink)
echo "Aliasing dotfiles..."
ln -sf ~/_bin/dot-files/bashrc ~/.bashrc #bash
ln -sf ~/_bin/dot-files/bash_profile ~/.bash_profile #bash

ln -sf ~/_bin/dot-files/gitconfig ~/.gitconfig #git
ln -sf ~/_bin/dot-files/gitignore ~/.gitignore #gitignore

ln -sf ~/_bin/dot-files/zshrc ~/.zshrc #zsh
ln -sf ~/_bin/dot-files/vimrc ~/.vimrc #vim
ln -sf ~/_bin/dot-files/nanorc ~/.nanorc #nano

# source rc files
echo "Sourcing aliased dotfiles..."
source ~/.bashrc
source ~/.zshrc
install_pygments


echo ''
echo '=============================================================='
echo 'run "clean_map_setup" if this is a fresh mac installation'
echo '-OR-'
echo 'run "init_mac_settings" - to initialize mac settings'
echo 'run "install_brew_and_cask" - to install homebrew and homebrew-cask'
echo 'run "install_default_brew_apps" - to install homebrew apps (reference https://github.com/mrlami/dotFiles)'
echo 'run "install_default_cask_apps" - to install cask apps (reference https://github.com/mrlami/dotFiles)'
echo 'run "install_default_npm_apps" - to install npm apps (reference https://github.com/mrlami/dotFiles)'
echo 'run "install_composer" - to install PHP composer'
echo 'run "install_tmuxifier" - to install tmuxifier'
echo 'run "install_hushlogin" - to install hushlogin'
echo 'run "install_pygments" - to install pygments'
echo '=============================================================='
