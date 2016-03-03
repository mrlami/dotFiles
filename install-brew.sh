#!/bin/bash

# taps
brew tap homebrew/dupes
brew tap homebrew/versions
brew tap homebrew/homebrew-php

brew doctor
brew update
brew upgrade


# brew installs
brew install ack
brew install gawk
brew install nano
brew install openssl
brew install tmux
brew install tree
brew install wget
brew install httpie
brew install imagemagick

brew install bash
brew install zsh
brew install zsh-completions

brew install git
brew install mycli
brew install ngrok

brew install nvm
brew install composer

brew install rethinkdb
brew install postgresql
brew install pgcli --ignore-dependencies

brew install php56
brew install php56-mcrypt
brew install php56-pdo-pgsql --ignore-dependencies
brew install php56-xdebug

brew install codeception
brew install boris


brew cleanup