export GOPATH=~/go
export PATH=$PATH:~/scripts
export PATH=$PATH:~/go/bin

export GIT_EDITOR=nano
export EDITOR=nano

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

source ~/code/dotfiles/dev-aliases.sh
source ~/code/dotfiles/mattermost.sh
source ~/code/dotfiles/secrets.sh
