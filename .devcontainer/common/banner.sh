#!/usr/bin/env bash
set -e

line() {
  printf '%*s\n' "$(tput cols)" '' | tr ' ' '─'
}

show_tool() {
  local name="$1"
  local cmd="$2"

  if command -v "$cmd" >/dev/null 2>&1; then
    local v
    v="$($cmd version 2>/dev/null | head -n1 || echo "unknown version")"
    printf " %-14s %s\n" "$name:" "$v"
  else
    printf " %-14s %s\n" "$name:" "not installed"
  fi
}

echo
line
printf " CodeLab Dev Container\n"
printf " Profile:   %s\n" "${CODELAB_PROFILE:-unknown}"
printf " OS:        %s\n" "$(uname -srm)"
echo

# Expected tools declared by container
for tool in ${CODELAB_EXPECTED_TOOLS:-}; do
  case "$tool" in
    go)              show_tool "Go" go ;;
    git)             show_tool "Git" git ;;
    gopls)           show_tool "gopls" gopls ;;
    dlv)             show_tool "Delve" dlv ;;
    golangci-lint)   show_tool "golangci-lint" golangci-lint ;;
    *)               show_tool "$tool" "$tool" ;;
  esac
done

line
echo
