#!/usr/bin/env bash
set -e

MAX_WIDTH=80
WIDTH=${COLUMNS:-80}
(( WIDTH > MAX_WIDTH )) && WIDTH=$WIDTH

line() {
  printf '%*s\n' "$WIDTH" '' | tr ' ' '-'
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

cat <<'EOF'
   ____          _      _          _
  / ___|___   __| | ___| |    __ _| |__
 | |   / _ \ / _` |/ _ \ |   / _` | '_ \
 | |__| (_) | (_| |  __/ |__| (_| | |_) |
  \____\___/ \__,_|\___|_____\__,_|_.__/
EOF

echo
printf " :: CodeLab ::\n"
printf " [Dev Container]\n"
printf " Profile:   %s\n" "${CODELAB_PROFILE:-unknown}"
printf " OS:        %s\n" "$(uname -srm)"
echo

for tool in ${CODELAB_EXPECTED_TOOLS:-}; do
  case "$tool" in
    git)           show_tool "Git" git ;;
    go)            show_tool "Go" go ;;
    gopls)         show_tool "gopls" gopls ;;
    dlv)           show_tool "Delve" dlv ;;
    golangci-lint) show_tool "golangci-lint" golangci-lint ;;
    *)             show_tool "$tool" "$tool" ;;
  esac
done

line
echo
