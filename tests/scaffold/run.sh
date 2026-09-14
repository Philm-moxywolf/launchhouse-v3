#!/bin/sh
# The founder template's seed files must be exactly the blocks in the start
# skill's scaffold reference, so the template and the skill never disagree.
here=$(cd "$(dirname "$0")" && pwd)
T=${1:-$here/../../../launchhouse-founder-template}
ref="$here/../../plugins/growth-engine/skills/start/references/scaffold.md"
[ -d "$T" ] || { printf 'no template at %s\n' "$T"; exit 1; }
fail=0
check() { # heading, path
  want=$(awk -v h="## $1" '
    index($0, h) == 1 { found = 1; next }
    found && /^```/ { if (inblock) exit; inblock = 1; next }
    found && inblock { print }
  ' "$ref")
  have=$(cat "$T/$2" 2>/dev/null)
  if [ "$want" = "$have" ]; then printf 'ok    %s\n' "$2"; else printf 'FAIL  %s differs from the scaffold\n' "$2"; fail=1; fi
}
check "growth-engine/.launchhouse" "growth-engine/.launchhouse"
check "growth-engine/ledger.md" "growth-engine/ledger.md"
check "growth-engine/memory.md" "growth-engine/memory.md"
check "growth-engine/ops-log.md" "growth-engine/ops-log.md"
check "growth-engine/people/README.md" "growth-engine/people/README.md"
check ".gitignore, in the folder the founder opened" ".gitignore"
check ".claude/settings.json, in the folder the founder opened" ".claude/settings.json"
[ $fail = 0 ] && printf 'scaffold: ok\n'
exit $fail
