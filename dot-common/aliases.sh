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
alias dl="cd /apps/_code/logiq-one"
alias mx="cd /apps/munetrix"
alias sg="cd /apps/scigames"

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Shortcuts for misc commands
alias cl="clear"
alias clearcache="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder;say cache flushed"
alias cpd="cp -aR" #copy directory
alias p="ping -c 5"
alias psh="psysh"
alias rmd="rm -rf" #delete directory
alias rdel="recursively_delete_files_ending_with"
alias renamelower='for f in *; do mv "$f" "`echo $f | tr "[:upper:]" "[:lower:]"`"; done'
alias renameupper='for f in *; do mv "$f" "`echo $f | tr "[:lower:]" "[:upper:]"`"; done'
alias serve="php -S localhost:8000" # use -t to specify different doc root
alias subl='open -a "Sublime Text"'
alias startmaria='mysql.server start'
alias startpostgres='postgres -D /usr/local/var/postgres'
alias startredis='redis-server /usr/local/etc/redis.conf'
alias updatehosts="sudo bash -c 'cat ~/_ssh/hosts > /private/etc/hosts'"

alias aliases="c ~/_bin/dot-common/aliases.sh"
alias brews="c ~/_bin/install-brew.sh"
alias casks="c ~/_bin/install-cask.sh"
alias functionz="c ~/_bin/dot-common/help-functions.sh"
alias hosts="c ~/_ssh/hosts"
alias sourcebash="source ~/.bashrc"
alias sourcezsh="source ~/.zshrc"
alias sourcebin="source ~/_bin/install.sh"
alias sourcessh="source ~/_ssh/install.sh"

# Colored cat! // install Pygments first - "sudo easy_install Pygments"
alias c='pygmentize -O style=monokai -f console256 -g'

# Node
alias nlist='npm list -g --depth=0'

# Laravel
alias art='php artisan'

# Git
alias g='git'
alias gs='git status -sb'
alias gl='git log --oneline --decorate --graph' #-5 --author mrlami --before "Sat Aug 30 2014"
alias gl2='git shortlog -s -n -e' #-s squash commit msgs into the # of commits, -n sorts the list by # of commits, -e append emails
alias gl3="git log --graph -10 --branches --remotes --tags  --format=format:'%Cgreen%h %Creset• %<(75,trunc)%s (%cN, %cr) %Cred%d' --date-order" #whos been working on last 10 commits (basically who's working on what now)
alias ga='git add --all'
alias gc='git commit -m'
alias gc2='git commit -m --amend'
alias gp='git push'
alias gpl='git pull'
alias gcl='git clone'
alias gco='git checkout'

# Vagrant
alias v='vagrant'
alias vs='vagrant status'
alias vu='vagrant up --provider virtualbox'
alias vd='vagrant destroy -f'
alias vh='vagrant halt'
alias vsh='vagrant ssh'
alias vg='vagrant global-status'

# Homebrew & Cask
alias b='brew'
alias bs='brew search'
alias bin='brew install'
alias bun='brew uninstall'
alias bcl='brew update; brew upgrade --all; brew cleanup; brew cask cleanup'
alias bc='brew cask'
alias bcs='brew cask search'
alias bcin='brew cask install'
alias bcun='brew cask uninstall'


## paths ##
#homebrew (nvm, composer)
export PATH="$HOME/.composer/vendor/bin:$PATH"
export NVM_DIR=~/.nvm && source $(brew --prefix nvm)/nvm.sh