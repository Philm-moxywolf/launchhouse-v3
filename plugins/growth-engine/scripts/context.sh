#!/bin/sh
# SessionStart. Prints a short picture of the founder's folder, which Claude
# Code adds to the conversation: who, which track, what exists, what is next.
# With --compact it adds the instruction not to start again after a summary.
#
# It replaces the app's run header and turn prefix. It never prints a command
# for the founder to run in a terminal.

. "$(dirname "$0")/lib.sh" 2>/dev/null || exit 0

root=$(lh_root)
ge="$root/growth-engine"

if ! lh_active; then
  # The single most common failure: Claude opened one folder up or one down.
  for cand in "$root"/*/growth-engine/.launchhouse "$root/../growth-engine/.launchhouse"; do
    if [ -f "$cand" ]; then
      where=$(cd "$(dirname "$cand")/.." 2>/dev/null && pwd)
      printf 'Launchhouse: this is not the founder folder. Their Launchhouse folder is %s. Before doing any Launchhouse work, tell the founder in one sentence to open that folder instead, because files written here will not be found later.\n' "$where"
      exit 0
    fi
  done
  if [ -f "$root/growth-engine/founder-brain.md" ] || [ -f "$root/growth-engine/README-your-files.md" ]; then
    printf 'Launchhouse: this folder has Launchhouse files but has not been set up. If the founder wants to work on Launchhouse, start with /growth-engine:start.\n'
  fi
  exit 0
fi

sh "$(dirname "$0")/index.sh" >/dev/null 2>&1

founder=$(lh_brain_label Founder)
business=$(lh_brain_label Business)
track=$(lh_track)
model=$(lh_brain_label Model)

tz=""
if [ -f "$ge/.state/profile.md" ]; then
  tz=$(awk -F ':' 'tolower($0) ~ /timezone/ { v = $0; sub(/^[^:]*:[[:space:]]*/, "", v); gsub(/\*/, "", v); gsub(/[[:space:]]/, "", v); print v; exit }' "$ge/.state/profile.md")
  [ -n "$founder" ] || founder=$(awk -F ':' 'tolower($0) ~ /founder/ { v = $0; sub(/^[^:]*:[[:space:]]*/, "", v); gsub(/\*/, "", v); print v; exit }' "$ge/.state/profile.md")
fi
if [ -n "$tz" ]; then
  today=$(TZ="$tz" date '+%A %e %B %Y, %H:%M' 2>/dev/null | tr -s ' ')
  today="$today in $tz"
else
  today=$(date '+%A %e %B %Y, %H:%M' 2>/dev/null | tr -s ' ')
  today="$today (timezone not recorded yet)"
fi

present=""; absent=""
list="founder-brain.md content-30.md content-30.csv rss-feeds.md"
case $track in
  b2b) list="$list outreach-sequence.md outreach-firstlines.csv" ;;
  b2c) list="$list dm-openers.md hook-bank.md inbound-scripts.md" ;;
esac
list="$list ops-workflow.md 90-day-plan.md"
for f in $list; do
  if [ -f "$ge/$f" ] && [ "$(tr -d ' \t\r\n' < "$ge/$f" | wc -c | tr -d ' ')" -ge 40 ]; then
    present="$present $f"
  else
    absent="$absent $f"
  fi
done

leftovers=""
[ -f "$ge/README-your-files.md" ] && leftovers=1
[ -d "$ge/growth-engine" ] && leftovers=1
grep -q '/tmp/ge/' "$ge/.state/HOME" 2>/dev/null && leftovers=1
ls "$root"/*.zip "$ge"/*.zip >/dev/null 2>&1 && leftovers=1

if [ -n "$leftovers" ]; then
  next="bring their work across from the app (/growth-engine:import-from-app)"
elif [ ! -f "$ge/.state/profile.md" ]; then
  next="set the folder up (/growth-engine:start)"
elif [ ! -f "$ge/founder-brain.md" ]; then
  next="build the Founder Brain (/growth-engine:founder-brain)"
elif [ -z "$track" ]; then
  next="finish the Founder Brain, which has no track yet (/growth-engine:founder-brain)"
elif [ ! -f "$ge/content-30.md" ]; then
  next="build the content engine (say: build my content engine)"
elif [ "$track" = b2b ] && [ ! -f "$ge/outreach-sequence.md" ]; then
  next="build the outreach engine (say: build my outreach)"
elif [ "$track" = b2c ] && [ ! -f "$ge/dm-openers.md" ]; then
  next="build the audience engine (say: build my audience engine)"
elif [ ! -f "$ge/ops-workflow.md" ]; then
  next="build the operations engine (say: build my ops engine)"
elif [ ! -f "$ge/90-day-plan.md" ]; then
  next="build the 90 day plan (say: build my 90 day plan)"
else
  next="ask where they are up to, and pick up from there"
fi

printf 'Launchhouse founder folder. All work lives in growth-engine/ and nowhere else.\n'
printf 'Founder: %s. Business: %s.\n' "${founder:-not recorded yet}" "${business:-not recorded yet}"
if [ -n "$track" ]; then
  printf 'Track: %s' "$track"
  [ -n "$model" ] && printf ', model: %s' "$model"
  printf '. Never write, offer or mention the other track'"'"'s material.\n'
else
  printf 'Track: not chosen yet. Do not assume either track.\n'
fi
printf 'Today: %s.\n' "$today"
printf 'Made:%s\n' "${present:- nothing yet}"
[ -n "$absent" ] && printf 'Not made yet:%s\n' "$absent"
printf 'Most likely next step: %s.\n' "$next"
printf 'The founder does not use a terminal. Never ask them to run a command; offer the plain words or the /growth-engine: name instead.\n'

if [ "$1" = "--compact" ]; then
  printf 'The conversation was just summarised. Do not start again and do not re-ask anything already answered. Read the files in growth-engine/ before assuming anything is missing.\n'
fi
exit 0
