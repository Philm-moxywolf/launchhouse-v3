#!/bin/sh
# Rebuilds growth-engine/.state/index.md from what is actually on disk.
# Never trusted, always rebuilt. Rows fork on the Brain's Track line, so a
# founder never sees the other track's files listed.
#
# Status: missing, empty (under 40 characters that are not spaces), or ok.
# Count: the numbers the gates need, counted here once so no agent has to count
# quoted CSV records or person files by eye.
#
# Files kept off GitHub on purpose (people/, outreach-firstlines.csv,
# dm-openers.md) are absent from a cloud copy of the folder. When one is absent
# but git ignores it and the last index had it, its row is kept and marked
# "ok, on the founder's computer", so a routine does not report it missing.

. "$(dirname "$0")/lib.sh" 2>/dev/null || exit 0
lh_active || exit 0

root=$(lh_root)
ge="$root/growth-engine"
mkdir -p "$ge/.state" 2>/dev/null || exit 0
track=$(lh_track)
old="$ge/.state/index.md"

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
ghl-values.md|-
90-day-plan.md|-
playbook-insert.md|-
ledger.md|-
memory.md|-
ops-log.md|-"

# Quote-aware CSV record count, header excluded.
csv_records() {
  awk 'BEGIN { q = 0; n = 0; started = 0 }
    {
      line = $0; sub(/\r$/, "", line)
      if (!started && line ~ /^[[:space:]]*$/) next
      started = 1
      c = gsub(/"/, "\"", line)
      if (q == 0) n++
      if (c % 2 == 1) q = !q
    }
    END { if (n > 0) n--; print n }' "$1"
}

# Pieces in content-30.md: numbered headings if there are any, else numbered
# list items that open with a bold label (the app's format), else numbered items.
pieces() {
  h=$(grep -Ec '^#+[[:space:]]*[0-9]+[.)]' "$1")
  if [ "$h" -gt 0 ]; then printf '%s' "$h"; return; fi
  b=$(grep -Ec '^[0-9]+[.)][[:space:]]+\*\*' "$1")
  if [ "$b" -gt 0 ]; then printf '%s' "$b"; return; fi
  grep -Ec '^[0-9]+[.)][[:space:]]' "$1"
}

openers() {
  h=$(grep -Ec '^#+[[:space:]]*[0-9]+[.)]' "$1")
  if [ "$h" -gt 0 ]; then printf '%s' "$h"; return; fi
  grep -Ec '^[0-9]+[.)][[:space:]]' "$1"
}

count_for() {
  f="$ge/$1"
  [ -f "$f" ] || { printf -- '-'; return; }
  case $1 in
    content-30.md) printf '%s pieces' "$(pieces "$f")" ;;
    content-30.csv|outreach-firstlines.csv) printf '%s rows' "$(csv_records "$f")" ;;
    dm-openers.md) printf '%s openers' "$(openers "$f")" ;;
    ledger.md)
      awk -F '|' '/^C\|/ { n++; if ($6 == "approved" || $6 == "scheduled" || $6 == "posted") a++ }
        END { printf "%d pieces, %d approved", n, a }' "$f" ;;
    *) printf -- '-' ;;
  esac
}

ignored() {
  command -v git >/dev/null 2>&1 || return 1
  (cd "$root" && git check-ignore -q "growth-engine/$1") 2>/dev/null
}

previous_row() {
  [ -f "$old" ] || return 1
  grep -F "| $1 |" "$old" | head -1
}

# The files kept off GitHub were seen here, so this is the founder's own computer,
# not a cloud copy: from now on a missing one really is missing. The marker lives
# in .state/.pre/, which is itself kept off GitHub.
if [ -f "$ge/outreach-firstlines.csv" ] || [ -f "$ge/dm-openers.md" ] || [ "$(ls "$ge/people/" 2>/dev/null | grep -c '\.md$' | tr -d ' ')" -gt 1 ]; then
  mkdir -p "$ge/.state/.pre" 2>/dev/null && : > "$ge/.state/.pre/private-seen" 2>/dev/null
fi
cloud_copy() { [ ! -f "$ge/.state/.pre/private-seen" ]; }

tmp="$ge/.state/index.md.tmp.$$"
{
  printf '# Index\n\n'
  printf 'Rebuilt from the folder after every change. Do not edit by hand.\n\n'
  if [ -z "$track" ]; then
    printf 'No track chosen yet, so only the files every founder needs are listed.\n\n'
  else
    printf 'Track: %s\n\n' "$track"
  fi
  printf '| file | gate | status | bytes | modified | count |\n|---|---|---|---|---|---|\n'
  printf '%s\n' "$rows" | while IFS='|' read -r name gate; do
    f="$ge/$name"
    if [ -f "$f" ]; then
      bytes=$(wc -c < "$f" | tr -d ' ')
      real=$(tr -d ' \t\r\n' < "$f" | wc -c | tr -d ' ')
      if [ "$real" -lt 40 ]; then status=empty; else status=ok; fi
      mod=$(date -r "$f" +%Y-%m-%d 2>/dev/null || printf -- '-')
      printf '| %s | %s | %s | %s | %s | %s |\n' "$name" "$gate" "$status" "$bytes" "$mod" "$(count_for "$name")"
    else
      prev=$(previous_row "$name")
      case $prev in
        *"| ok"*)
          if ignored "$name" && cloud_copy; then
            printf '%s\n' "$prev" | sed 's/| ok |/| ok, on the founder'"'"'s computer |/'
            continue
          fi ;;
      esac
      printf '| %s | %s | missing | 0 | - | - |\n' "$name" "$gate"
    fi
  done

  # People: counted by kind. Absent in a cloud copy, so the last count is kept.
  if ls "$ge/people/"*.md >/dev/null 2>&1 && [ "$(ls "$ge/people/"*.md | grep -vc '/README\.md$')" -gt 0 ]; then
    prospects=$(grep -l '^kind: prospect' "$ge/people/"*.md 2>/dev/null | while read -r p; do grep -q '^status: cut' "$p" || printf 'x\n'; done | wc -l | tr -d ' ')
    cut=$(grep -l '^kind: prospect' "$ge/people/"*.md 2>/dev/null | while read -r p; do grep -q '^status: cut' "$p" && printf 'x\n'; done | wc -l | tr -d ' ')
    targets=$(grep -l '^kind: target' "$ge/people/"*.md 2>/dev/null | wc -l | tr -d ' ')
    sent=$(grep -l '^kind: target' "$ge/people/"*.md 2>/dev/null | while read -r p; do grep -Eq '^status: (sent|replied|booked|no_reply)' "$p" && printf 'x\n'; done | wc -l | tr -d ' ')
    case $track in
      b2b) printf '| people/ | gate C | ok | - | - | %s prospects, %s cut |\n' "$prospects" "$cut" ;;
      b2c) printf '| people/ | gate C | ok | - | - | %s targets, %s sent |\n' "$targets" "$sent" ;;
      *) printf '| people/ | - | ok | - | - | %s prospects, %s targets |\n' "$prospects" "$targets" ;;
    esac
  else
    prev=$(previous_row "people/")
    case $prev in
      *"| ok"*) if cloud_copy; then printf '%s\n' "$prev" | sed 's/| ok |/| ok, on the founder'"'"'s computer |/'; else printf '| people/ | gate C | missing | - | - | 0 |\n'; fi ;;
      *) printf '| people/ | gate C | missing | - | - | 0 |\n' ;;
    esac
  fi

  for d in uploads voice-samples drafts; do
    n=$(ls -A "$ge/$d" 2>/dev/null | grep -vc '^\.gitkeep$' | tr -d ' ')
    printf '| %s/ | - | - | - | - | %s files |\n' "$d" "$n"
  done
} > "$tmp" 2>/dev/null || { rm -f "$tmp"; exit 0; }

if [ -f "$old" ] && cmp -s "$tmp" "$old"; then
  rm -f "$tmp"
else
  mv "$tmp" "$old"
fi
exit 0
