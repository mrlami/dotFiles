## functions ##

# create a directory and cd into it
function enter() {
    mkdir $1
    cd $1
}

function enable_tmux_iterm() {
    export TMUXIFIER_TMUX_ITERM_ATTACH="-CC"
}

function disable_tmux_iterm() {
    export TMUXIFIER_TMUX_ITERM_ATTACH=""
}

function init_mac_settings() {
    source ~/_bin/installz/mac-setup.sh
}

function clean_mac_setup() {
    sudo -v # ask for the administrator password upfront.

    # homebrew & cask
    install_brew_and_cask
    install_default_brew_apps
    install_default_cask_apps

    # npm, composer, tmuxifier, etc.
    install_default_npm_apps
    install_composer
    install_tmuxifier
    install_hushlogin
    install_pygments

    #initialize mac settings
    init_mac_settings
}

function install_brew_and_cask() {
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew doctor
    brew install caskroom/cask/brew-cask
}

function install_default_brew_apps() {
    if check_brew_installation; then
        source ~/_bin/installz/brew.sh
    fi
}

function install_default_cask_apps() {
    if check_brew_installation; then
        source ~/_bin/installz/cask.sh
    fi
}

function install_default_npm_apps() {
    if check_npm_installation; then
        npm install -g bower
        npm install -g gulp
    fi
}

function install_composer() {
    if type composer >/dev/null; then
        echo "Composer is already installed»"
    else
        echo "Installing Pygments..."
        curl -sS https://getcomposer.org/installer | php
        mv composer.phar /usr/local/bin/composer
    fi
}

function install_tmuxifier() {
    sudo rm -rf ~/.tmuxifier
    git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier
}

function install_hushlogin() {
    echo "# This file prevents the shell login message from appearing" >> ~/.hushlogin
}

function install_pygments() {
    if type pygmentize >/dev/null; then
        echo "«Pygments is already installed»"
    else
        echo "Installing Pygments..."
        sudo easy_install Pygments
    fi
}

function check_brew_installation() {
    if type brew >/dev/null; then
        return 0
    else
        echo "Homebrew is not installed.  Run the command 'install_brew_and_cask' to install it"
        return 1
    fi
}

function check_npm_installation() {
    if type npm >/dev/null; then
        return 0
    else
        echo "NPM is not installed.  Run the command 'install_default_brew_apps' to install it"
        return 1
    fi
}