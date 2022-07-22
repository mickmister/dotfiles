alias mergemaster='git pull && git checkout master && git pull && git checkout - && git merge master'
alias gco='git checkout'
alias rebase-head='git rebase -i origin/$(git rev-parse --abbrev-ref HEAD)'
alias dcu='docker-compose up'
alias dcb='docker-compose build'

alias gents='npm init && npm install --save-dev typescript ts-node && npx tsc --init && echo "// write code please" > index.ts'

NGROK_AUTH_TOKEN=''
alias ngrock="ngrok http -bind-tls=true -hostname=mickmister.ngrok.io -authtoken=$NGROK_AUTH_TOKEN"
alias ngrockk="ngrok http -bind-tls=true -authtoken=$NGROK_AUTH_TOKEN $*"

alias hngrock="ngrok http -hostname=mickmister.ngrok.io -authtoken=$NGROK_AUTH_TOKEN"

function testy() {
    go test -v -run="$1" . 2>&1 | panicparse
}

function testywatch() {
    gow test -v -run="$1" . 2>&1 | panicparse
}

function scp_rpi_download() {
    scp -i ~/.ssh/rasp pi@raspberrypi.local:$1 .
}

function notify() {
    osascript -e "display notification \"$*\""
}

function assume_unchanged() {
    git status | grep modified: | grep $1 | cut -d' ' -f4 | xargs git update-index --assume-unchanged
}

function assumed_file_unchanged() {
    update-index --no-assume-changed-unchanged $1
}

function undo_assumed_unchanged_all() {
    git ls-files -v | grep '^h' | cut -d' ' -f2  | xargs git update-index --no-assume-unchanged
}
