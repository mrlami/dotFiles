## aliases ##

# Open specified files in Sublime Text
# "s ." will open the current directory in Sublime
alias s='open -a "Sublime Text"'

# Color ls
colorflag="-G"
alias ls="command ls ${colorflag}"
alias l="ls -lF ${colorflag}" # all files, in long format
alias la="ls -A ${colorflag}" # all files inc dotfiles
alias ll="ls -laF ${colorflag}" # all files inc dotfiles, in long format
alias lsd='ls -lF ${colorflag} | grep "^d"' # only directories

# Quicker navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Shortcuts to folders
alias h="cd ~/"
alias d="cd ~/Downloads"
alias a="cd /apps"
alias code="cd /apps/code"
alias dl="cd /apps/datalogiq"
alias mx="cd /apps/munetrix"
alias sgi="cd /apps/scigames"

# Shortcuts for misc commands
alias cl="clear"
alias p="ping -c 5"
alias server="python -m SimpleHTTPServer 8000"

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Colored cat! // install Pygments first - "sudo easy_install Pygments"
alias c='pygmentize -O style=monokai -f console256 -g'

# Git // install Git first
alias g='git'
alias gs='git status'
alias gl='git log --graph --decorate --pretty=oneline --abbrev-commit'
alias ga='git add --all'
alias gc='git commit -m' # requires you to type a commit message
alias gp='git push'
alias gpo='git push origin master'
alias gpl='git pull'
alias gplo='git pull origin master'
alias gclone='git clone'

# Vagrant
alias v='vagrant'
alias vu='vagrant up'
alias vs='vagrant ssh'
alias vd='vagrant destroy -f'
alias vh='vagrant halt'
alias vsus='vagrant suspend'
alias vres='vagrant resume'
alias vsta='vagrant status'

# Homebrew & Cask
alias b='brew'
alias bs='brew search'
alias bin='brew install'
alias bun='brew uninstall'
alias bcl='brew update && brew upgrade && brew cleanup'
alias bc='brew cask'
alias bcs='brew cask search'
alias bcin='brew cask install'
alias bcun='brew cask uninstall'
alias bccl='brew cask update && brew cask cleanup'

# Tmux & Tmuxifier
alias mux='tmuxifier'

## paths ##
export PATH="$(brew --prefix homebrew/php/php56)/bin:$PATH"
export PATH="/Applications/Postgres.app/Contents/Versions/9.4/bin:$PATH"
export PATH="$HOME/.tmuxifier/bin:$PATH"
export TMUXIFIER_LAYOUT_PATH="$HOME/_bin/tmux-layouts"
eval "$(tmuxifier init -)"