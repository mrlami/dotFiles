#!/bin/bash

# taps
brew tap caskroom/versions

brew cask doctor
brew cask update
brew cask upgrade


# utility apps
brew cask install bartender
brew cask install caffeine
brew cask install flux
brew cask install moom
brew cask install xtrafinder
brew cask install wallpaper-wizard

brew cask install alfred
brew cask install coconutbattery
brew cask install iterm2
brew cask install keka
brew cask install namechanger
brew cask install imageoptim

# media apps
brew cask install 4k-video-downloader
brew cask install handbrake
brew cask install vlc

# cloud & web apps
brew cask install dropbox
brew cask install google-drive
brew cask install yandexdisk

brew cask install google-chrome
brew cask install transmission

# devops tools
brew cask install vmware-fusion
brew cask install virtualbox
brew cask install vagrant
brew cask install hipchat
brew cask install slack

brew cask install cornerstone
brew cask install navicat-premium
brew cask install pgadmin3
brew cask install tower
brew cask install transmit

# dev tools
brew cask install sublime-text-3
brew cask install kaleidoscope
brew cask install codekit

brew cask install sketch
brew cask install liteicon

brew cask install phpstorm
brew cask install appcode
brew cask install xamarin-studio

#others
brew cask install gitbook
#brew cask microsoft-office
#brew cask thinkorswim

#brew cask install appcleaner
#brew cask install cinch
#brew cask install sizeup
#brew cask install cocktail
#brew cask install totalfinder

#brew cask install bittorrent-sync
#brew cask install utorrent
#brew cask install postbox


brew cask cleanup