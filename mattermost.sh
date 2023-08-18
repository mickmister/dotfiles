export MM_DEBUG=1
export MM_SERVICESETTINGS_ENABLEDEVELOPER=1

# source <(mmctl completion zsh)

source /usr/local/opt/nvm/nvm.sh > /dev/null 2>&1
nvm use v16.10.0 --silent

alias ptof="tail -f ~/mattermost/mattermost-server/ptof.log"
alias moveptof='cp ~/mattermost/ptof.go .'
alias matter='cd ~/mattermost'
alias e='source ~/mattermost/.env.vars'

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
