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
brew install tmux
brew install tree
brew install wget

brew install git
brew install node

brew install redis
brew install php56
brew install php56-pdo-pgsql
brew install php56-mcrypt

brew install phpunit
brew install codeception
brew install behat


brew cleanup