#!/bin/sh
# Rebuilds growth-engine/.state/index.md from what is actually on disk.
# Never trusted, always rebuilt. Rows fork on the Brain's Track line, so a
# founder never sees the other track's files listed.
#
# Status: missing, empty (under 40 characters that are not spaces), or ok.

. "$(dirname "$0")/lib.sh" 2>/dev/null || exit 0
lh_active || exit 0

root=$(lh_root)
ge="$root/growth-engine"
mkdir -p "$ge/.state" 2>/dev/null || exit 0
track=$(lh_track)

rows="founder-brain.md|gate A
content-30.md|gate B
content-30.csv|gate B
rss-feeds.md|gate B"
case $track in
  b2b) rows="$rows
outreach-sequence.md|gate C
outreach-firstlines.csv|gate C" ;;
  b2c) rows="$rows
dm-openers.md|gate C
hook-bank.md|gate C
inbound-scripts.md|gate C" ;;
esac
rows="$rows
ops-workflow.md|gate C
90-day-plan.md|-
playbook-insert.md|-
ledger.md|-
memory.md|-
ops-log.md|-"

tmp="$ge/.state/index.md.tmp.$$"
{
  printf '# Index\n\n'
  printf 'Rebuilt from the folder after every change. Do not edit by hand.\n\n'
  if [ -z "$track" ]; then
    printf 'No track chosen yet, so only the files every founder needs are listed.\n\n'
  else
    printf 'Track: %s\n\n' "$track"
  fi
  printf '| file | gate | status | bytes | modified |\n|---|---|---|---|---|\n'
  printf '%s\n' "$rows" | while IFS='|' read -r name gate; do
    f="$ge/$name"
    if [ -f "$f" ]; then
      bytes=$(wc -c < "$f" | tr -d ' ')
      real=$(tr -d ' \t\r\n' < "$f" | wc -c | tr -d ' ')
      if [ "$real" -lt 40 ]; then status=empty; else status=ok; fi
      mod=$(date -r "$f" +%Y-%m-%d 2>/dev/null || printf -- '-')
    else
      status=missing; bytes=0; mod=-
    fi
    printf '| %s | %s | %s | %s | %s |\n' "$name" "$gate" "$status" "$bytes" "$mod"
  done
  people=$(ls "$ge/people" 2>/dev/null | grep -c '\.md$' | tr -d ' ')
  [ -f "$ge/people/README.md" ] && people=$((people - 1))
  printf '| people/ | gate B or C | %s files | - | - |\n' "$people"
  for d in uploads voice-samples drafts; do
    count=$(ls -A "$ge/$d" 2>/dev/null | grep -vc '^\.gitkeep$' | tr -d ' ')
    printf '| %s/ | - | %s files | - | - |\n' "$d" "$count"
  done
} > "$tmp" 2>/dev/null || { rm -f "$tmp"; exit 0; }

if [ -f "$ge/.state/index.md" ] && cmp -s "$tmp" "$ge/.state/index.md"; then
  rm -f "$tmp"
else
  mv "$tmp" "$ge/.state/index.md"
fi
exit 0
