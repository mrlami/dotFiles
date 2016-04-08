#!/bin/bash

# taps
brew tap caskroom/versions
brew tap caskroom/fonts

brew cask doctor


#fonts
brew cask install font-blokk.rb
brew cask install font-fira-code.rb font-fira-sans.rb font-fira-mono.rb font-fira-mono-for-powerline.rb
brew cask install font-nexa
brew cask install font-open-sans.rb font-open-sans-condensed.rb
brew cask install font-source-code-pro.rb font-source-code-pro-for-powerline


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
brew cask install elmedia-player

# office tools
brew cask install macdown

# cloud & web apps
brew cask install bittorrent-sync
brew cask install dropbox
brew cask install google-chrome #google-chrome-canary
brew cask install opera
brew cask install google-drive
brew cask install transmission

# communication tools
#brew cask install hipchat
#brew cask install skype
#brew cask install slack
#brew cask install textual

# devops tools
brew cask install vmware-fusion
brew cask install virtualbox
brew cask install vagrant
brew cask install vagrant-manager

brew cask install cornerstone
brew cask install tower

brew cask install navicat-premium
brew cask install mysqlworkbench
brew cask install transmit

# dev tools
brew cask install codekit
brew cask install coderunner
brew cask install dash
brew cask install kaleidoscope
brew cask install postman
brew cask install rbtools

brew cask install sketch
brew cask install sublime-text3


brew cask cleanup
defaults write com.runningwithcrayons.Alfred-Preferences dropbox.allowappsfolder -bool TRUE
