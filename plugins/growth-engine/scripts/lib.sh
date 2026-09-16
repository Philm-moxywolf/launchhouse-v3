# Shared helpers for the Launchhouse hooks. POSIX sh, no jq, no node, no python.
#
# Every hook FAILS OPEN. A script that cannot work out what is going on exits 0
# and lets the write through, because a hook that blocks every write in a room
# of 130 founders stops the event. The rules-reviewer agent is the second layer.

# The founder's project folder. Claude Code sets CLAUDE_PROJECT_DIR for hooks.
lh_root() {
  r=${CLAUDE_PROJECT_DIR:-$PWD}
  printf '%s' "$r" | tr '\\' '/'
}

# A folder is a Launchhouse folder only if it carries the marker. Everywhere
# else these hooks do nothing, so the plugin is inert in a founder's other work.
lh_active() {
  [ -f "$(lh_root)/growth-engine/.launchhouse" ]
}

# The path of a Launchhouse folder near the opened one: one folder down, the
# parent, or the home folder. Empty if none. Used when the founder opened the
# wrong folder, which is the most common failure of all.
lh_near() {
  lh_near_all | head -1
}

# Every Launchhouse folder near the opened one, one per line.
lh_near_all() {
  r=$(lh_root)
  for cand in "$r"/*/growth-engine/.launchhouse "$r/../growth-engine/.launchhouse" "${HOME:-/nonexistent}/growth-engine/.launchhouse"; do
    [ -f "$cand" ] && (cd "$(dirname "$cand")/.." 2>/dev/null && pwd)
  done | awk '!seen[$0]++'
  return 0
}

# Read one JSON string value by key from the hook input (stdin, passed as $2).
# Handles the escapes a path can carry. Only ever used for short values.
lh_json_get() {
  printf '%s' "$2" | awk -v key="$1" '
    BEGIN { RS = "\001" }
    {
      pat = "\"" key "\"[ \t\r\n]*:[ \t\r\n]*\""
      if (!match($0, pat)) exit 1
      s = substr($0, RSTART + RLENGTH); out = ""; i = 1; n = length(s)
      while (i <= n) {
        c = substr(s, i, 1)
        if (c == "\\") {
          d = substr(s, i + 1, 1)
          if (d == "n") out = out "\n"
          else if (d == "t") out = out "\t"
          else if (d == "r") out = out "\r"
          else if (d == "u") { out = out "?"; i += 4 }
          else out = out d
          i += 2; continue
        }
        if (c == "\"") break
        out = out c; i++
      }
      printf "%s", out
    }'
}

# Escape a string for use inside a JSON string. Newlines become spaces.
lh_json_escape() {
  printf '%s' "$1" | awk 'BEGIN { RS = "\001" } {
    gsub(/\\/, "\\\\"); gsub(/"/, "\\\""); gsub(/\t/, " "); gsub(/\r/, ""); gsub(/\n/, " ")
    printf "%s", $0 }'
}

# Path of a file relative to the project root, forward slashes. Empty if the
# file sits outside the project.
lh_rel() {
  p=$(printf '%s' "$1" | tr '\\' '/')
  root=$(lh_root)
  case $p in
    "$root"/*) printf '%s' "${p#"$root"/}" ;;
    /*|[A-Za-z]:/*) printf '' ;;
    ./*) printf '%s' "${p#./}" ;;
    *) printf '%s' "$p" ;;
  esac
}

# The Track line from the Founder Brain header, lower case, or empty.
lh_track() {
  b="$(lh_root)/growth-engine/founder-brain.md"
  [ -f "$b" ] || return 0
  lh_track_of "$b"
}

lh_track_of() {
  awk '
    /^## / { exit }
    {
      line = tolower($0)
      gsub(/\*/, "", line)
      if (match(line, /^[-[:space:]]*track[[:space:]]*:[[:space:]]*/)) {
        v = substr(line, RSTART + RLENGTH)
        sub(/[[:space:]].*$/, "", v)
        print v
        exit
      }
    }' "$1"
}

# A header label from the Brain, as written (first match, trimmed).
lh_brain_label() {
  b="$(lh_root)/growth-engine/founder-brain.md"
  [ -f "$b" ] || return 0
  awk -v want="$1" '
    /^## / { exit }
    {
      line = $0
      gsub(/\*/, "", line)
      low = tolower(line)
      if (match(low, "^[-[:space:]]*" tolower(want) "[[:space:]]*:[[:space:]]*")) {
        v = substr(line, RSTART + RLENGTH)
        sub(/[[:space:]]+$/, "", v)
        print v
        exit
      }
    }' "$b"
}

# Which track a deliverable belongs to: b2b, b2c, both, or empty if unlisted.
lh_file_track() {
  case $1 in
    founder-brain.md|content-30.md|content-30.csv|rss-feeds.md|ops-workflow.md|ghl-values.md|90-day-plan.md|playbook-insert.md|ledger.md|memory.md|ops-log.md|.launchhouse) printf both ;;
    outreach-sequence.md|outreach-firstlines.csv) printf b2b ;;
    dm-openers.md|hook-bank.md|inbound-scripts.md) printf b2c ;;
    content-30-[0-9][0-9][0-9][0-9]-[0-9][0-9].md|content-30-[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9].md|content-30-[0-9][0-9][0-9][0-9]-[0-9][0-9].csv|content-30-[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9].csv|playbook-insert.pdf) printf both ;;
    *) printf '' ;;
  esac
}

# Deliverables the rules read. Bookkeeping files and founder-written folders are not judged.
lh_is_judged() {
  case $1 in
    ledger.md|memory.md|ops-log.md|.launchhouse|*.pdf) return 1 ;;
    people/*|uploads/*|voice-samples/*|.state/*) return 1 ;;
    drafts/*) return 0 ;;
  esac
  [ -n "$(lh_file_track "$1")" ]
}

lh_deny_pre() {
  printf '{"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"deny","permissionDecisionReason":"%s"}}\n' "$(lh_json_escape "$1")"
  exit 0
}

# A short stable name for a path, used for the pre-write copy.
lh_key() {
  printf '%s' "$1" | cksum | awk '{ print $1 }'
}
