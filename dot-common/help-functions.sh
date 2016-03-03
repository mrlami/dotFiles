## functions ##

function enter() {
    mkdir $1
    cd $1
}

function cs() {
    if [ "$1" = "bash" ]; then
        echo ' »» swithing shell to bash'
        chsh -s /bin/bash #`which bash`
        bash
        source ~/.bashrc
    elif [ "$1" = "zsh" ]; then
        echo ' »» swithing shell to zsh'
        chsh -s /bin/zsh #`which zsh`
        zsh
        source ~/.zshrc
    else
        echo '...........'
        echo ' you have to pass either "bash" or "zsh" to switch shell (cs) command as parameters'
        echo ' »» cs bash'
        echo ' »» cs zsh'
        echo '...........'
    fi
}

function setup_dropbox_app_backups() {
    # Bartender
    open -a "Bartender"
    osascript -e 'quit app "Bartender"'
    mv ~/Library/Preferences/com.surteesstudios.Bartender.plist ~/Library/Preferences/com.surteesstudios.Bartender.bak.plist
    ln -sf ~/Dropbox/Apps/Bartender/com.surteesstudios.Bartender.plist ~/Library/Preferences/com.surteesstudios.Bartender.plist
    defaults read com.surteesstudios.Bartender

    # Moom
    open -a "Moom"
    osascript -e 'quit app "Moom"'
    mv ~/Library/Preferences/com.manytricks.Moom.plist ~/Library/Preferences/com.manytricks.Moom.bak.plist
    ln -sf ~/Dropbox/Apps/Moom/com.manytricks.Moom.plist ~/Library/Preferences/com.manytricks.Moom.plist
    mkdir -p ~/Library/Application\ Support/Moom
    ln -sf ~/Dropbox/Apps/Moom/Blacklist.plist ~/Library/Application\ Support/Moom/Blacklist.plist

    # Sublime Text
    open -a "Sublime Text"
    osascript -e 'quit app "Sublime Text"'
    mv ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User.orig.bak
    ln -s ~/Dropbox/Apps/SublimeText/User
}

function mac() {
    local MACNAME

    if [ -z "$1" ]; then
        MACNAME="retina-mrlami"
    else
        MACNAME=$1
    fi

    sudo scutil --set ComputerName "$MACNAME"
    sudo scutil --set LocalHostName "$MACNAME"
    sudo scutil --set HostName "$MACNAME"
    sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$MACNAME"
}

function bar() {
    osascript -e 'quit app "Bartender 2"'

    if [ -z "$1" ] || [ "$1" = "default" ]; then
        ln -sf ~/Dropbox/Apps/Bartender/com.surteesstudios.Bartender.plist ~/Library/Preferences/com.surteesstudios.Bartender.plist
        defaults read com.surteesstudios.Bartender
        echo "✓ loaded **default** bartendar settings"
    elif [ "$1" = "clear" ] || [ "$1" = "screencast" ]; then
        ln -sf ~/Dropbox/Apps/Bartender/com.surteesstudios.Bartender.clear.plist ~/Library/Preferences/com.surteesstudios.Bartender.plist
        defaults read com.surteesstudios.Bartender
        echo "✓ loaded **clear / screencast** bartendar settings"
    elif [ "$1" = "time" ]; then
        ln -sf ~/Dropbox/Apps/Bartender/com.surteesstudios.Bartender.time.plist ~/Library/Preferences/com.surteesstudios.Bartender.plist
        defaults read com.surteesstudios.Bartender
        echo "✓ loaded **time** bartendar settings"
    elif [ "$1" = "all" ]; then
        ln -sf ~/Dropbox/Apps/Bartender/com.surteesstudios.Bartender.all.plist ~/Library/Preferences/com.surteesstudios.Bartender.plist
        defaults read com.surteesstudios.Bartender
        echo "✓ loaded **all** bartendar settings"
    fi

    open -a "Bartender 2"
}

function clean_mac_setup() {
    # ask for the administrator password upfront
    sudo -v
    mac

    # homebrew & cask
    install_brew_and_cask
    install_default_brew_apps
    install_default_cask_apps

    # pygments, prezto, tmuxifier, etc.
    install_pygments
    install_prezto
    install_tmuxifier
    install_hushlogin
    install_vimrc_ultimate

    # dev language apps
    install_node_apps
    install_php_apps

    # others
    install_vagrant_plugins
    setup_dropbox_app_backups
    setup_mac_defaults
}

function list_all_installs() {
    echo '=============================================================='
    echo 'run "install_brew_and_cask" - to install homebrew and homebrew-cask'
    echo 'run "install_default_brew_apps" - to install homebrew apps (reference https://github.com/mrlami/dotFiles)'
    echo 'run "install_default_cask_apps" - to install cask apps (reference https://github.com/mrlami/dotFiles)'
    echo ''
    echo 'run "install_prezto" - to install prezto'
    echo 'run "install_tmuxifier" - to install tmuxifier'
    echo 'run "install_hushlogin" - to install hushlogin'
    echo 'run "install_pygments" - to install pygments'
    echo 'run "install_vimrc_ultimate" - to install ultimate vimrc'
    echo ''
    echo 'run "install_vagrant_plugins" - to install vmware plugin and license for vagrant'
    echo 'run "install_node_apps" - to default node applications'
    echo 'run "install_php_apps" - to install default php applications'
    echo ''
    echo 'run "setup_dropbox_app_backups" - to setup settings for misc apps'
    echo 'run "setup_mac_app_defaults" - to initialize mac settings for misc apps'
    echo '=============================================================='
}

function check_brew_installation() {
    if type brew > /dev/null; then
        return 0
    else
        echo "Homebrew is not installed.  Run the command 'install_brew_and_cask' to install it"
        return 1
    fi
}

function install_brew_and_cask() {
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew tap caskroom/cask
}

function install_default_brew_apps() {
    if check_brew_installation; then
        source ~/_bin/install-brew.sh
    fi
}

function install_default_cask_apps() {
    if check_brew_installation; then
        source ~/_bin/install-cask.sh
    fi
}

function install_node_apps() {
    #install latest version of node and set it as default
    nvm install node
    nvm alias default node

    #install node apps
    npm install -g yo bower grunt-cli gulp
    npm install -g browserify
    npm install -g trash
    npm install -g speed-test
}

function install_php_apps() {
    composer global require "hirak/prestissimo" #parallel install plugin (speeds up composer)
    composer global require "fabpot/php-cs-fixer"

    composer global require "laravel/homestead"
    composer global require "laravel/installer"
    composer global require "laravel/lumen-installer"
    composer global require "laravel/envoy=~1.0"
}

function install_tmuxifier() {
    rm -rf ~/.tmuxifier
    git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier
}

function update_tmuxifier() {
    cd ~/.tmuxifier
    git pull
}

function install_prezto() {
    echo '»» installing prezto...'
    uninstall_prezto
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

    # setopt EXTENDED_GLOB
    # for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    #     ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    # done

    for f in ~/.zprezto/runcoms/*; do
        if [ "${f##*/}" != "README.md" ]; then
            ln -sf $f ~/.${f##*/}
        fi
    done

    echo '»» mapping zpreztorc & zshrc dotfiles...'
    ln -sf ~/_bin/dot-files/zpreztorc ~/.zpreztorc
    ln -sf ~/_bin/dot-files/zshrc ~/.zshrc
    source ~/.zshrc
}

function uninstall_prezto() {
    rm -rf ~/.zprezto
    rm -f ~/.zlogin ~/.zlogout ~/.zpreztorc ~/.zprofile ~/.zshenv
}

function update_prezto() {
    cd ~/.prezto
    git pull && git submodule update --init --recursive
}

function install_hushlogin() {
    touch ~/.hushlogin
    echo "# This file prevents the shell login message from appearing" >> ~/.hushlogin
}

function install_pygments() {
    if type pygmentize > /dev/null; then
        echo "«Pygments is already installed»"
    else
        echo "Installing Pygments..."
        sudo easy_install Pygments
    fi
}

function install_vimrc_ultimate() {
    #https://github.com/amix/vimrc
    git clone https://github.com/amix/vimrc.git ~/.vim_runtime
    sh ~/.vim_runtime/install_awesome_vimrc.sh
}

function install_vagrant_plugins() {
    # https://github.com/mitchellh/vagrant/wiki/Available-Vagrant-Plugins
    vagrant plugin install vagrant-hostmanager
    vagrant plugin install vagrant-reload

    vagrant plugin install vagrant-aws
    vagrant plugin install vagrant-digitalocean
    vagrant plugin install vagrant-linode
    vagrant plugin install vagrant-vultr

    vagrant plugin install vagrant-vmware-fusion
    vagrant plugin license vagrant-vmware-fusion ~/Dropbox/Apps/_licenses/vagrant-vmware-fusion-license.lic

    echo '--------------------------------------'
    echo 'you might want to install below boxes:'
    echo '--------------------------------------'
    echo 'vagrant box add bento/ubuntu-14.04'
    echo 'vagrant box add laravel/homestead'
    echo '--------------------------------------'
}

#reference https://github.com/kevinSuttle/OSXDefaults
function setup_mac_app_defaults() {
    ###############################################################################
    # Finder                                                                      #
    ###############################################################################
    # Finder: show hidden files by default
    #defaults write com.apple.finder AppleShowAllFiles -bool true

    # Finder: show all filename extensions
    defaults write NSGlobalDomain AppleShowAllExtensions -bool true

    # Finder: show status bar
    defaults write com.apple.finder ShowStatusBar -bool true

    # Finder: show path bar
    defaults write com.apple.finder ShowPathbar -bool true

    # Finder: allow text selection in Quick Look
    defaults write com.apple.finder QLEnableTextSelection -bool true

    # Display full POSIX path as Finder window title
    #defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

    # When performing a search, search the current folder by default
    defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

    # Disable the warning when changing a file extension
    defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

    # Enable spring loading for directories
    #defaults write NSGlobalDomain com.apple.springing.enabled -bool true

    # Remove the spring loading delay for directories
    #defaults write NSGlobalDomain com.apple.springing.delay -float 0

    # Avoid creating .DS_Store files on network volumes
    defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

    # Use list view in all Finder windows by default
    # Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`, `Nlsv`
    defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

    # Disable the warning before emptying the Trash
    defaults write com.apple.finder WarnOnEmptyTrash -bool false

    # Empty Trash securely by default
    #defaults write com.apple.finder EmptyTrashSecurely -bool true

    # Show the ~/Library folder
    chflags nohidden ~/Library

    # Expand the following File Info panes:
    # “General”, “Open with”, and “Sharing & Permissions”
    defaults write com.apple.finder FXInfoPanesExpanded -dict \
        General -bool true \
        OpenWith -bool true \
        Privileges -bool true


    ###############################################################################
    # Dock, Dashboard & Mission Control
    ###############################################################################

    # Wipe all (default) app icons from the Dock? (y/n)
    defaults write com.apple.dock persistent-apps -array

    # Setting the icon size of Dock items to 50 pixels for optimal size/screen-realestate
    defaults write com.apple.dock tilesize -int 45

    # Set Dock to auto-hide
    defaults write com.apple.dock autohide -bool true

    # Show indicator lights for open applications in the Dock
    defaults write com.apple.dock show-process-indicators -bool true


    ###############################################################################
    # Safari & WebKit                                                             #
    ###############################################################################

    # Privacy: don’t send search queries to Apple
    defaults write com.apple.Safari UniversalSearchEnabled -bool false
    defaults write com.apple.Safari SuppressSearchSuggestions -bool true

    # Show the full URL in the address bar (note: this still hides the scheme)
    defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

    # Set Safari’s home page to `about:blank` for faster loading
    defaults write com.apple.Safari HomePage -string "about:blank"

    # Prevent Safari from opening ‘safe’ files automatically after downloading
    defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

    # Disable Safari’s thumbnail cache for History and Top Sites
    defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

    # Enable Safari’s debug menu
    defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

    # Remove useless icons from Safari’s bookmarks bar
    defaults write com.apple.Safari ProxiesInBookmarksBar "()"

    # Enable the Develop menu and the Web Inspector in Safari
    defaults write com.apple.Safari IncludeDevelopMenu -bool true
    defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
    defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

    # Add a context menu item for showing the Web Inspector in web views
    defaults write NSGlobalDomain WebKitDeveloperExtras -bool true


    ###############################################################################
    # Terminal & iTerm 2                                                          #
    ###############################################################################
    # Only use UTF-8 in Terminal.app
    defaults write com.apple.terminal StringEncodings -array 4

    # Don’t display the annoying prompt when quitting iTerm
    defaults write com.googlecode.iterm2 PromptOnQuit -bool false


    ###############################################################################
    # Activity Monitor                                                            #
    ###############################################################################

    # Show the main window when launching Activity Monitor
    defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

    # Visualize CPU usage in the Activity Monitor Dock icon
    defaults write com.apple.ActivityMonitor IconType -int 5

    # Show all processes in Activity Monitor
    defaults write com.apple.ActivityMonitor ShowCategory -int 0

    # Sort Activity Monitor results by CPU usage
    defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
    defaults write com.apple.ActivityMonitor SortDirection -int 0


    ###############################################################################
    # Mac App Store                                                               #
    ###############################################################################

    # Enable the WebKit Developer Tools in the Mac App Store
    defaults write com.apple.appstore WebKitDeveloperExtras -bool true

    # Enable Debug Menu in the Mac App Store
    defaults write com.apple.appstore ShowDebugMenu -bool true


    ###############################################################################
    # Google Chrome & Google Chrome Canary                                        #
    ###############################################################################

    # Allow installing user scripts via GitHub Gist or Userscripts.org
    defaults write com.google.Chrome ExtensionInstallSources -array "https://gist.githubusercontent.com/" "http://userscripts.org/*"
    defaults write com.google.Chrome.canary ExtensionInstallSources -array "https://gist.githubusercontent.com/" "http://userscripts.org/*"

    # Disable the all too sensitive backswipe
    defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
    defaults write com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls -bool false


    ###############################################################################
    # Transmission.app                                                            #
    ###############################################################################

    # Use `~/Downloads/_transit/torrents` to store incomplete downloads
    mkdir -p ~/Downloads/_stuff/torrents
    defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true
    defaults write org.m0k.transmission IncompleteDownloadFolder -string "${HOME}/Downloads/_stuff/torrents"

    # Don’t prompt for confirmation before downloading
    defaults write org.m0k.transmission DownloadAsk -bool false

    # Trash original torrent files
    defaults write org.m0k.transmission DeleteOriginalTorrent -bool true

    # Hide the donate message
    defaults write org.m0k.transmission WarningDonate -bool false

    # Hide the legal disclaimer
    defaults write org.m0k.transmission WarningLegal -bool false
}

#clone a repository and cd into it
function sgclone() {
    git clone ssh://l_adabonyan@172.30.204.246:29418/SCBZ/$1.git $2
}

#request a review
function sgreview() {
    if [ -z "$1" ]; then
        rbt post --username mrlami -o -g -X '*.ico' -X '*.gif' -X '*.png' -X '*.jpg' -X '*.map' -X '*.min.js' -X '*.min.css' -X '*/app/*.php' -X '*/fonts/*'
    else
        rbt post -r $1 -o -g -X '*.png' -X '*.ico' -X '*.gif' -X '*.png' -X '*.jpg' -X '*.map' -X '*.min.js' -X '*.min.css' -X '*/app/*.php' -X '*/fonts/*'
    fi
}
