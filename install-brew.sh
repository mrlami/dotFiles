#!/bin/bash

# taps
brew tap caskroom/cask
brew tap homebrew/services

brew tap homebrew/dupes
brew tap homebrew/versions
brew tap homebrew/homebrew-php

brew doctor
brew update
brew upgrade


# brew installs
brew install ack
brew install gawk
brew install git
brew install httpie
brew install imagemagick
brew install nano
brew install openssl
brew install tmux
brew install tree
brew install vim
brew install wget

brew install bash
brew install zsh
brew install zsh-completions

brew install mycli
brew install pgcli

brew install go
brew install nvm
brew install composer

brew install mariadb
brew install postgresql
brew install rethinkdb
brew install redis

brew install php70 php70-mcrypt
brew install codeception psysh


brew cleanup