# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

DOTFILES="$HOME/code/dotfiles"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

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
)

source $ZSH/oh-my-zsh.sh

source /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

source "$DOTFILES/shell.sh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export HOMEBREW_NO_AUTO_UPDATE=1

eval "$(fnm env --use-on-cd)"
