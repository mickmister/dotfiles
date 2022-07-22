# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/koch/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="zhann"
plugins=(
    git
    history-substring-search
    # zsh-autosuggestions
    colored-man-pages
    colorize
    dircycle
    # zsh-dircolors-solarized
    dirhistory
    virtualenv
    # virtualenvwrapper
    # you-should-use
    oh-my-matrix
)

source $ZSH/oh-my-zsh.sh

source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

export GOPATH=~/go
export PATH=$PATH:~/scripts
export PATH=$PATH:~/go/bin
