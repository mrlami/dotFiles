#!/bin/bash

# taps
brew tap caskroom/versions
brew tap caskroom/fonts

brew cask doctor


#fonts
brew cask install font-source-code-pro.rb
brew cask install font-source-code-pro-for-powerline
brew cask install font-ubuntu-mono-powerline

# utility apps
brew cask install bartender
brew cask install caffeine
brew cask install launchpad-manager-yosemite
brew cask install moom
brew cask install time-out
brew cask install wallpaper-wizard

brew cask install atext
brew cask install alfred
brew cask install iterm2
brew cask install xtrafinder
brew cask install --appdir="/Applications" cleanmymac
brew cask install keka
brew cask install namechanger
brew cask install imageoptim

#brew cask install --appdir="/Applications" snagit
brew cask install --appdir="/Applications" camtasia
brew cask install screenflow
brew cask install quicklook-json

# media apps
brew cask install 4k-video-downloader
brew cask install handbrake
brew cask install vlc
brew cask install spotify

# cloud & web apps
brew cask install dropbox
brew cask install google-drive
brew cask install cloudup

brew cask install transmission
#brew cask install utorrent
#brew cask install bittorrent-sync

brew cask install google-chrome
brew cask install firefoxdeveloperedition

#communication tools
brew cask install hipchat
brew cask install screenhero
brew cask install skype
brew cask install slack

# devops tools
brew cask install iojs
brew cask install vmware-fusion
brew cask install virtualbox
brew cask install vagrant

brew cask install cornerstone
brew cask install navicat-premium
brew cask install pgadmin3
brew cask install tower
brew cask install transmit

# dev tools
brew cask install dash
brew cask install kaleidoscope
brew cask install codekit
brew cask install coderunner
brew cask install rbtools

brew cask install sketch

brew cask install sublime-text3
brew cask install java6 phpstorm
#brew cask install appcode
#brew cask install intellij-idea
#brew cask install xamarin-studio

# office tools
brew cask install macdown
#brew cask install gitbook

#others
#brew cask install appcleaner
#brew cask install coconutbattery
#brew cask install dashlane
#brew cask install totalfinder


brew cask cleanup
