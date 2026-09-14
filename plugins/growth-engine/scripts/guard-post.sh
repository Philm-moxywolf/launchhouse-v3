#!/bin/sh
# PostToolUse on Write, Edit and MultiEdit.
#
# Reads the file as it now stands and runs rules.awk over it. If anything is
# held, the file is put back exactly as it was before the write (or removed, if
# it did not exist), and Claude is told which line, why, and what to do. So a
# held file never stays on disk, which is what the app's gate promised.
#
# Notes do not stop anything. They go back to Claude as context, folded so a
# founder never reads thirty of them.

. "$(dirname "$0")/lib.sh" 2>/dev/null || exit 0
lh_active || exit 0

input=$(cat) || exit 0
path=$(lh_json_get file_path "$input") || exit 0
[ -n "$path" ] || exit 0
rel=$(lh_rel "$path")
case $rel in growth-engine/*) ;; *) exit 0 ;; esac
inner=${rel#growth-engine/}

root=$(lh_root)
file="$root/$rel"
here=$(dirname "$0")

finish() {
  sh "$here/index.sh" >/dev/null 2>&1
  exit 0
}

lh_is_judged "$inner" || finish
[ -f "$file" ] || finish

if [ "$inner" = founder-brain.md ]; then
  brain=1
  track=$(lh_track_of "$file")
else
  brain=0
  track=$(lh_track)
fi
case $track in b2b|b2c) ;; *) track= ;; esac

findings=$(awk -v track="$track" -v brain="$brain" -f "$here/rules.awk" "$file" 2>/dev/null) || finish

key=$(lh_key "$inner")
pre="$root/growth-engine/.state/.pre"

holds=$(printf '%s\n' "$findings" | grep '^HOLD' | head -3)
if [ -n "$holds" ]; then
  if [ -f "$pre/$key" ]; then
    cp -p "$pre/$key" "$file" 2>/dev/null
    how="It has been put back exactly as it was before this write."
  elif [ -f "$pre/$key.new" ]; then
    rm -f "$file"
    how="It was a new file, so it has been removed."
  else
    how="There was no earlier copy to put back, so the file still holds the new words. Rewrite the lines below straight away."
  fi
  rm -f "$pre/$key" "$pre/$key.new"
  reason=$(printf '%s\n' "$holds" | awk -F '\t' -v f="$inner" '
    { printf "Line %s: \"%s\" %s ", $2, $4, $5 }')
  more=$(printf '%s\n' "$findings" | grep -c '^HOLD')
  extra=""
  [ "$more" -gt 3 ] && extra=" There are $((more - 3)) more held lines in this file."
  msg="HELD, NOT SAVED: growth-engine/$inner. $how $reason$extra Fix those lines and write the file again. Tell the founder in one plain sentence what was held and why, never as an error code."
  printf '{"decision":"block","reason":"%s"}\n' "$(lh_json_escape "$msg")"
  sh "$here/index.sh" >/dev/null 2>&1
  exit 0
fi

rm -f "$pre/$key" "$pre/$key.new"

notes=$(printf '%s\n' "$findings" | awk -F '\t' '
  $1 == "NOTE" { n++; if (n <= 3) printf "Line %s: \"%s\" %s ", $2, $4, $5 }
  $1 == "MORE" { more += $5 }
  END { if (more > 0) printf "There are %d more like these in this file.", more }')
if [ -n "$notes" ]; then
  ctx="Saved growth-engine/$inner. Notes from the Launchhouse checks, not errors: $notes Fix these quietly if they are clearly wrong. Mention them to the founder only if a figure or claim needs their say."
  printf '{"hookSpecificOutput":{"hookEventName":"PostToolUse","additionalContext":"%s"}}\n' "$(lh_json_escape "$ctx")"
fi
finish
