#!/bin/bash

# taps
brew tap caskroom/versions
brew tap caskroom/fonts

brew cask doctor


#fonts
brew cask install font-blokk.rb
brew cask install font-hack.rb
brew cask install font-nexa
brew cask install font-open-sans.rb
brew cask install font-open-sans-condensed.rb
brew cask install font-source-code-pro.rb
brew cask install font-source-code-pro-for-powerline
brew cask install font-ubuntu-mono-powerline

# utility apps
brew cask install bartender
brew cask install caffeine
brew cask install itsycal

brew cask install atext
brew cask install alfred
brew cask install moom
brew cask install xtrafinder #totalfinder

brew cask install iterm2
brew cask install keka
brew cask install namechanger
brew cask install imageoptim

brew cask install launchpad-manager-yosemite
brew cask install quicklook-json
brew cask install wallpaper-wizard

brew cask install cloudup
brew cask install screenflow
#brew cask install --appdir="/Applications" snagit
#brew cask install --appdir="/Applications" camtasia
#brew cask install --appdir="/Applications" cleanmymac

# media apps
brew cask install audacity
brew cask install vlc

# office tools
brew cask install macdown

# cloud & web apps
brew cask install bittorrent-sync
brew cask install dropbox
brew cask install google-chrome #google-chrome-canary
brew cask install google-drive
brew cask install transmission

# communication tools
#brew cask install hipchat
#brew cask install screenhero
#brew cask install skype
#brew cask install slack

# devops tools
brew cask install vmware-fusion
brew cask install virtualbox
brew cask install vagrant
brew cask install vagrant-manager

brew cask install cornerstone
brew cask install gitup
brew cask install tower

brew cask install navicat-premium
brew cask install mysqlworkbench
brew cask install transmit

# dev tools
brew cask install codekit
brew cask install coderunner
brew cask install dash
brew cask install kaleidoscope
brew cask install rbtools

brew cask install sketch
brew cask install sublime-text3
brew cask install java6

# network tools
#brew cask install namebench
#brew cask install xquartz wireshark


brew cask cleanup