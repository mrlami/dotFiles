## aliases ##

# Color ls
colorflag="-G"
alias ls="ls ${colorflag}"
alias la="ls -A ${colorflag}" # all files inc dotfiles
alias l="ls -lF ${colorflag}" # all files, in long format
alias ll="ls -laF ${colorflag}" # all files inc dotfiles, in long format
alias lsd='ls -lF | grep "^d"' # only directories
alias llsd='ls -laF | grep "^d"' # only directories inc dotfiles

# Quicker navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Shortcuts to folders
alias h="cd ~/"
alias hbin="cd ~/_bin"
alias hssh="cd ~/_ssh"
alias d="cd ~/Downloads"
alias a="cd /apps"
alias code="cd /apps/_code"
alias dl="cd /apps/datalogiq"
alias mx="cd /apps/munetrix"
alias sg="cd /apps/scigames"

# Shortcuts for misc commands
alias s='open -a "Sublime Text"'
alias cl="clear"
alias p="ping -c 5"
alias rmd="rm -rf"
alias serve="php -S localhost:8000"     # use -t to specify different doc root
alias aliases="c ~/_bin/dot-common/aliases.sh"
alias functionz="c ~/_bin/dot-common/help-functions.sh"
alias hosts="c ~/_ssh/hosts"
alias sourcebash="source ~/.bashrc"
alias sourcezsh="source ~/.zshrc"
alias sourcebin=". ~/_bin/install.sh"
alias sourcessh=". ~/_ssh/install.sh"
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias renamelower='for f in *; do mv "$f" "`echo $f | tr "[:upper:]" "[:lower:]"`"; done'
alias renameupper='for f in *; do mv "$f" "`echo $f | tr "[:lower:]" "[:upper:]"`"; done'
alias enabletmux='export TMUXIFIER_TMUX_ITERM_ATTACH="-CC"'
alias disabletmux='export TMUXIFIER_TMUX_ITERM_ATTACH=""'

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Colored cat! // install Pygments first - "sudo easy_install Pygments"
alias c='pygmentize -O style=monokai -f console256 -g'

# Git
alias g='git'
alias gs='git status -sb'
alias gl='git log --oneline --decorate --graph' #-5 --author mrlami --before "Sat Aug 30 2014"
alias gl2='git shortlog -s -n -e'       #-s squash commit msgs into the # of commits, -n sorts the list by # of commits, -e append emails
alias ga='git add --all'
alias gc='git commit -m'
alias gcamend='git commit --amend -m'
alias gp='git push'
alias gpl='git pull'
alias gcl='git clone'
alias gco='git checkout'
alias gcomp='gl master..origin/master'  #check what commits have been added to upstream
alias gshow='git show --name-status'

# Vagrant
alias v='vagrant'
alias vs='vagrant status'
alias vu='vagrant up'
alias vu2='vagrant up --provider vmware_fusion'
alias vd='vagrant destroy -f'
alias vh='vagrant halt'
alias vsh='vagrant ssh'
alias vsus='vagrant suspend'
alias vres='vagrant resume'
alias vg='vagrant global-status --prune'

# Homebrew & Cask
alias b='brew'
alias bs='brew search'
alias bin='brew install'
alias bun='brew uninstall'
alias bcl='brew update && brew upgrade --all && brew cleanup'
alias bc='brew cask'
alias bcs='brew cask search'
alias bcin='brew cask install'
alias bcun='brew cask uninstall'
alias bccl='brew cask update && brew cask cleanup'

# Tmux & Tmuxifier
alias mux='tmuxifier'

# iojs & Sailsjs
alias nlist='npm list -g --depth=0'

# PHP & Laravel


## paths ##
export PATH="$HOME/.composer/vendor/bin:$PATH"

#homebrew
export PATH="$(brew --prefix homebrew/php/php56)/bin:$PATH"
export PATH=$PATH:/usr/local/opt/go/libexec/bin

#tmuxifier
export PATH="$HOME/.tmuxifier/bin:$PATH"
export TMUXIFIER_LAYOUT_PATH="$HOME/_bin/tmux-layouts"
eval "$(tmuxifier init -)"