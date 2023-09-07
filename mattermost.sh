export MM_DEBUG=1
export MM_SERVICESETTINGS_ENABLEDEVELOPER=1

# source <(mmctl completion zsh)
alias ptof="tail -f ~/mattermost/mattermost-server/ptof.log"
alias moveptof='cp ~/mattermost/ptof.go .'
alias matter='cd ~/mattermost'
alias e='source ~/mattermost/.env.vars'

export PATH="/Users/koch/mattermost/mattermost/server/bin:$PATH"

export GOPATH=~/go
export PATH=$PATH:~/go/bin

export ANDROID_HOME=/Users/koch/Library/Android/sdk
export PATH=/Users/koch/Library/Android/sdk/emulator:/Users/koch/Library/Android/sdk/platform-tools:/Users/koch/Library/Android/sdk/tools:/Users/koch/Library/Android/sdk/emulator:/Users/koch/Library/Android/sdk/platform-tools:/Users/koch/Library/Android/sdk/tools:/Users/koch/.nvm/versions/node/v16.18.0/bin:/Users/koch/.nvm/versions/node/v16.10.0/bin:/Users/koch/.nvm/versions/node/v16.10.0/bin:/Users/koch/bin:/usr/local/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin:/Users/koch/.nvm/versions/node/v16.10.0/bin:/Users/koch/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/Users/koch/scripts:/Users/koch/go/bin:/Applications/Alacritty.app/Contents/MacOS:/opt/homebrew/opt/fzf/bin:/Users/koch/scripts:/Users/koch/go/bin:/Applications/Alacritty.app/Contents/MacOS:/Users/koch/scripts:/Users/koch/go/bin

function cuser() {
    echo "mmctl user create --email $1@example.com --username $1 --password SomePassword1337! --local"
    mmctl user create --email $1@example.com --username $1 --password SomePassword1337! --local
}

function vbump() {
    git stash -u && \
    git checkout master && \
    git pull && \

    BRANCH="release-bump-v$1"

    git checkout -b "${BRANCH}" && \

    sed "s/\"version\": \".*/\"version\": \"$1\",/g" plugin.json |
    sed "s/release_notes_url\": \(.*\)\/v.*/release_notes_url\": \1\/v$1\",/g" > temp.json
    mv temp.json plugin.json

    make apply

    git add .
    git commit -m "Release bump v$1"
    git push -u origin HEAD

    PREVIOUS_TAG=$(git ls-remote --tag origin | tail -n 1 | cut -d'/' -f3)
    git log "${PREVIOUS_TAG}..HEAD" --oneline | pbcopy

    CWD=$(pwd | awk -F/ '{print $NF}')
    URL="https://github.com/mattermost/${CWD}/compare/master...${BRANCH}?quick_pull=1"
    open $URL
}
