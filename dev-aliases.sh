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


# fcoc - checkout git commit
function fcoc() {
  local commits commit
  commits=$(git log --pretty=oneline --abbrev-commit --reverse) &&
  commit=$(echo "$commits" | fzf --tac +s +m -e) &&
  git checkout $(echo "$commit" | sed "s/ .*//")
}

# fbr - checkout git branch
function fbr() {
  local branches branch
  branches=$(git --no-pager branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# fbrr - checkout git branch (including remote branches)
function fbrr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

function mp4() {
    ffmpeg -i $1 -vcodec h264 -acodec mp2 $2
}

function gif() {
    ffmpeg -i $1 -pix_fmt rgb24 $2
}
