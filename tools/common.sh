cdls() {
  cd "$1"
  ls -a
}

git::clean() {
  git reset --hard HEAD
  git clean -f
}

ffind() {
  find . -name "$1" -print -quit
}

wrun() {
  cmd.exe /c "$@"
}

wln() {
  flags=""
  for word in $@; do
    flags="${word/-/\/} $flags"
  done
  cmd.exe /c "mklink $flags"
}



pushd() {
  if [ $# -eq 0 ]; then
    DIR="${HOME}"
  else
    DIR="$1"
  fi

  builtin pushd "${DIR}" > /dev/null
}

md() {
  mkdir -p "$@"
  cd "$@"
}

pushd_builtin() {
  builtin pushd > /dev/null
}

popd() {
  builtin popd > /dev/null
}

prev() {
  local arg="${1:-1}"
  if [[ "$arg" =~ ^[0-9]+$ ]]; then
    echo "$(dirs)" | cut -d' ' -f $(( ${1:-1} + 1))
  else
    search="$arg"  # sample input containing metachars.
    local searchEscaped=$(sed 's/[^^]/[&]/g; s/\^/\\^/g' <<<"$search") # escape it.
    local box="\\S*$searchEscaped\\S*"
    echo "$(dirs)" | grep -o "$box" | head -1
  fi
}

alias cd='pushd'
alias bk='popd'

alias flip='pushd_builtin'