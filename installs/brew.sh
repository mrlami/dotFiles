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
brew install bash
brew install gawk
brew install nano
brew install tmux
brew install tree
brew install wget
brew install zsh

brew install git
brew install ngrok

brew install redis
brew install postgresql
brew install pgcli

brew install php56
brew install php56-mcrypt
brew install php56-pdo-pgsql

brew install boris
brew install codeception

#misc setup
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist

brew cleanup