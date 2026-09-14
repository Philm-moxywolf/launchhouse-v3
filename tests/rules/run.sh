#!/bin/sh
# Runs every corpus sentence through rules.awk as a line in content-30.md.
# Fails on any HOLD not held, and on any PASS held. Reports the CATCH rate.
here=$(cd "$(dirname "$0")" && pwd)
awkfile="$here/../../plugins/growth-engine/scripts/rules.awk"
tmp=${TMPDIR:-/tmp}/lh-rules.$$
mkdir -p "$tmp"; trap 'rm -rf "$tmp"' EXIT
fail=0; caught=0; catches=0; n=0
while IFS= read -r row; do
  case $row in ''|'#'*) continue ;; esac
  track=${row%%|*}; rest=${row#*|}; expect=${rest%%|*}; sentence=${rest#*|}
  printf '## Post 1\n\n%s\n' "$sentence" > "$tmp/content-30.md"
  out=$(awk -v track="$track" -v brain=0 -f "$awkfile" "$tmp/content-30.md")
  if printf '%s\n' "$out" | grep -q '^HOLD'; then held=1; else held=0; fi
  n=$((n + 1))
  case $expect in
    HOLD) [ $held = 1 ] || { printf 'NOT HELD   %s\n' "$sentence"; fail=1; } ;;
    PASS) [ $held = 0 ] || { printf 'HELD WRONGLY  %s\n    %s\n' "$sentence" "$(printf '%s\n' "$out" | grep '^HOLD' | cut -f3)"; fail=1; } ;;
    CATCH) catches=$((catches + 1)); [ $held = 1 ] && caught=$((caught + 1)) ;;
  esac
done < "$here/corpus.txt"
printf '%d sentences. DM offers caught by the hook: %d of %d (the rest go to rules-reviewer).\n' "$n" "$caught" "$catches"
[ $fail = 0 ] && printf 'rules corpus: ok\n'
exit $fail
