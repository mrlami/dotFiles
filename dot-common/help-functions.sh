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

function update_hosts_file() {
    sudo bash -c 'cat ~/_ssh/hosts > /private/etc/hosts'
}

function setup_dropbox_app_backups() {
    # Moom
    open -a "Moom"
    osascript -e 'quit app "Moom"'
    mv ~/Library/Preferences/com.manytricks.Moom.plist ~/Library/Preferences/com.manytricks.Moom.bak.plist
    ln -sf ~/Dropbox/Apps/Moom/com.manytricks.Moom.plist ~/Library/Preferences/com.manytricks.Moom.plist
    mkdir -p ~/Library/Application\ Support/Moom
    ln -sf ~/Dropbox/Apps/Moom/Blacklist.plist ~/Library/Application\ Support/Moom/Blacklist.plist

    # Bartender
    open -a "Bartender"
    osascript -e 'quit app "Bartender"'
    mv ~/Library/Preferences/com.surteesstudios.Bartender.plist ~/Library/Preferences/com.surteesstudios.Bartender.bak.plist
    ln -sf ~/Dropbox/Apps/Bartender/com.surteesstudios.Bartender.plist ~/Library/Preferences/com.surteesstudios.Bartender.plist
    defaults read com.surteesstudios.Bartender
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
    osascript -e 'quit app "Bartender"'

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

    open -a "Bartender"
}

function init_mac_settings() {
    source ~/_bin/installs/mac-setup.sh
}

function clean_mac_setup() {
    # ask for the administrator password upfront
    sudo -v

    # homebrew & cask
    install_brew_and_cask
    install_default_brew_apps
    install_default_cask_apps

    # pygments, prezto, tmuxifier, etc.
    install_pygments
    install_prezto
    install_tmuxifier
    install_hushlogin

    # dev language apps
    install_node_apps
    install_php_apps

    # others
    #install_vagrant_plugins
    #setup_dropbox_app_backups

    # setup mac defaults
    #init_mac_settings
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
    brew doctor
    brew install caskroom/cask/brew-cask
}

function install_default_brew_apps() {
    if check_brew_installation; then
        source ~/_bin/installs/brew.sh
    fi
}

function install_default_cask_apps() {
    if check_brew_installation; then
        source ~/_bin/installs/cask.sh
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
    composer global require "laravel/homestead=~2.0" #homestead
    composer global require "laravel/installer=~1.1" #laravel
    composer global require "laravel/lumen-installer=~1.0" #lumen
    composer global require "laravel/envoy=~1.0" #envoy
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
}

#clone a repository and cd into it
function sgclone() {
    git clone ssh://l_adabonyan@172.30.204.246:29418/SCBZ/$1.git $2

    if [ $# -lt 2 ]; then
        cd $1
    else
        cd $2
    fi
}

#request a review
function sgreview() {
    if [ -z "$1" ]; then
        rbt post --username mrlami -o -X '*.png' -X '*.jpg' -X '*.map' -X '*.min.js' -X '*.min.css'
    else
        rbt post -r $1 -o -X '*.png' -X '*.jpg' -X '*.map' -X '*.min.js' -X '*.min.css'
    fi
}