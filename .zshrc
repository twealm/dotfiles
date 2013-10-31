if [[ `uname` == 'Linux' ]]
then
        export LINUX=1
else
        export LINUX=
fi

if [[ `uname` == 'Darwin' ]]
then
        export OSX=1
else
        export OSX=
fi

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="af-magic"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

if [[ "$LINUX" == "1" ]]
then 
        alias ack="ack-grep"
fi

alias mc="mc -S xoria256"
alias curl="/usr/local/opt/curl/bin/curl"
alias gitst="git status"
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)

if [[ "$OSX" == "1" ]]
then
        plugins=(git ruby osx sublime brew gem zsh-syntax-highlighting)
else
        plugins=(git ruby sublime brew gem zsh-syntax-highlighting)
fi

source $ZSH/oh-my-zsh.sh
if [[ "$OSX" == "1" ]]
then
    source /usr/local/opt/chruby/share/chruby/chruby.sh
else
    source /usr/local/share/chruby/chruby.sh
fi

chruby 2.0.0-p247

# Customize to your needs...
export PATH=/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/opt/ruby/bin
export TERM=xterm-256color

