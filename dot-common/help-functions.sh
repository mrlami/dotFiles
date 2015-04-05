## functions ##

# create a directory and cd into it
function enter() {
    mkdir $1
    cd $1
}

#change default shell and change current prompt session to new shell
function cs() {
    if [ "$1" = "bash" ]
    then
        echo ' »» swithing shell to bash'
        chsh -s `which bash`
        bash
        source ~/.bashrc
    elif [ "$1" = "zsh" ]
    then
        echo ' »» swithing shell to zsh'
        chsh -s `which zsh`
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

function setup_dropbox_app_setting_backups() {
    mv ~/Library/Preferences/com.manytricks.Moom.plist ~/Library/Preferences/com.manytricks.Moom.bak.plist
    ln -sf ~/Dropbox/Apps/Moom/com.manytricks.Moom.plist ~/Library/Preferences/com.manytricks.Moom.plist
}

function update_hosts_file() {
    sudo bash -c 'cat ~/_ssh/hosts > /private/etc/hosts'
}

function enable_tmux_iterm() {
    export TMUXIFIER_TMUX_ITERM_ATTACH="-CC"
}

function disable_tmux_iterm() {
    export TMUXIFIER_TMUX_ITERM_ATTACH=""
}

function init_mac_settings() {
    source ~/_bin/installs/mac-setup.sh
}

function clean_mac_setup() {
    sudo -v # ask for the administrator password upfront.

    # homebrew & cask
    install_brew_and_cask
    install_default_brew_apps
    install_default_cask_apps

    # composer, tmuxifier, etc.
    install_composer
    install_tmuxifier
    install_hushlogin
    install_pygments

    #initialize mac settings
    init_mac_settings
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

function install_composer() {
    if type composer > /dev/null; then
        echo "Composer is already installed»"
    else
        echo "Installing Composer..."
        curl -sS https://getcomposer.org/installer | php
        mv composer.phar /usr/local/bin/composer
    fi
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

function install_vagrant_vmware_fusion() {
    vagrant plugin install vagrant-vmware-fusion
    vagrant plugin license vagrant-vmware-fusion ~/Dropbox/Apps/_licenses/vagrant-vmware-fusion-license.lic
}