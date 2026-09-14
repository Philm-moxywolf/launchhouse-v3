#!/bin/sh
# The one check this repo has. Run before every commit, and in CI.
#
# Fails on: broken JSON, broken skill or agent frontmatter, a hook pointing at
# a script that does not exist, a shell script that does not parse, a banned
# dash or word in anything a founder reads, a bare or unknown /growth-engine:
# command, internal planning material, and any failing test.

cd "$(dirname "$0")/.." || exit 1
P=plugins/growth-engine
errors=0; warnings=0
err() { printf 'ERROR  %s\n' "$1"; errors=$((errors + 1)); }
warn() { printf 'warn   %s\n' "$1"; warnings=$((warnings + 1)); }

# ---------------------------------------------------------------- JSON
json_ok() {
  if command -v python3 >/dev/null 2>&1; then python3 -c 'import json,sys; json.load(open(sys.argv[1]))' "$1" 2>/dev/null
  elif command -v node >/dev/null 2>&1; then node -e 'JSON.parse(require("fs").readFileSync(process.argv[1],"utf8"))' "$1" 2>/dev/null
  elif command -v jq >/dev/null 2>&1; then jq empty "$1" 2>/dev/null
  else warn "no python3, node or jq, so $1 was not parsed"; return 0; fi
}
for f in .claude-plugin/marketplace.json $P/.claude-plugin/plugin.json $P/hooks/hooks.json; do
  [ -f "$f" ] || { err "$f is missing"; continue; }
  json_ok "$f" || err "$f is not valid JSON"
done

mname=$(sed -n 's/^  "name": "\(.*\)",$/\1/p' .claude-plugin/marketplace.json | head -1)
[ "$mname" = "launchhouse-v3" ] || err "marketplace name is '$mname', expected launchhouse-v3"
grep -q '"source": "./plugins/growth-engine"' .claude-plugin/marketplace.json || err "marketplace does not point at ./plugins/growth-engine"
pname=$(sed -n 's/^  "name": "\(.*\)",$/\1/p' $P/.claude-plugin/plugin.json | head -1)
[ "$pname" = "growth-engine" ] || err "plugin name is '$pname', expected growth-engine"
mv1=$(grep -o '"version": "[^"]*"' .claude-plugin/marketplace.json | sort -u)
pv=$(grep -o '"version": "[^"]*"' $P/.claude-plugin/plugin.json)
printf '%s\n' "$mv1" | grep -qxF "$pv" || err "plugin version $pv does not match the marketplace"
[ "$(printf '%s\n' "$mv1" | wc -l | tr -d ' ')" = 1 ] || err "marketplace.json carries two different versions"

# ---------------------------------------------------------------- skills and agents
frontmatter() { # file expected-name kind
  f=$1; want=$2
  [ "$(sed -n 1p "$f")" = "---" ] || { err "$f does not open with ---"; return; }
  [ -n "$(sed -n 2p "$f")" ] || err "$f has a blank line inside its frontmatter"
  name=$(awk 'NR>1 && /^---$/ {exit} /^name:/ {sub(/^name:[[:space:]]*/, ""); print}' "$f")
  [ "$name" = "$want" ] || err "$f is named '$name', expected '$want'"
  awk 'NR>1 && /^---$/ {exit} /^description:[[:space:]]*[^[:space:]]/ {found=1} END {exit !found}' "$f" || err "$f has no description"
}
skills=""
for d in $P/skills/*/; do
  s=$(basename "$d"); skills="$skills $s"
  [ -f "$d/SKILL.md" ] || { err "skill $s has no SKILL.md"; continue; }
  frontmatter "$d/SKILL.md" "$s"
done
for f in $P/agents/*.md; do
  [ -f "$f" ] || continue
  frontmatter "$f" "$(basename "$f" .md)"
  awk 'NR>1 && /^---$/ {exit} /^tools:/ {found=1} END {exit !found}' "$f" || err "$f does not list its tools"
done

# ---------------------------------------------------------------- hooks and scripts
for s in $(grep -o 'scripts/[a-z-]*\.sh' $P/hooks/hooks.json | sort -u); do
  [ -f "$P/$s" ] || err "hooks.json runs $s, which does not exist"
done
for s in $P/scripts/*.sh scripts/*.sh tests/*/run.sh; do
  sh -n "$s" 2>/dev/null || err "$s does not parse as sh"
done
grep -n 'shell: *true\|eval ' $P/scripts/*.sh >/dev/null 2>&1 && err "a hook script uses eval"

# ---------------------------------------------------------------- founder-facing prose
# Everything a founder or Claude reads as instructions. rules.awk and the corpus
# spell out the banned shapes on purpose, so they are exempt from those checks.
prose=$(find README.md $P/skills $P/agents -type f \( -name '*.md' \) 2>/dev/null)
msgs=$(find $P/scripts -name '*.sh' 2>/dev/null)

for f in $prose $msgs; do
  grep -n '—\|–' "$f" >/dev/null 2>&1 && err "$f contains an em or en dash: $(grep -n '—\|–' "$f" | head -1 | cut -c1-80)"
done
banned='(^|[^-[:alnum:]])(supercharge[a-z]*|unlock[a-z]*|revolutionary|seamless[a-z]*|leverage[a-z]*|effortless[a-z]*|synergy|turnkey|game[ -]changer|cutting[ -]edge|best[ -]in[ -]class)([^-[:alnum:]]|$)'
for f in $prose; do
  grep -Eni "$banned" "$f" >/dev/null 2>&1 && err "$f uses marketing language: $(grep -Eni "$banned" "$f" | head -1 | cut -c1-80)"
done
for f in $prose; do
  case $f in */agents/rules-reviewer.md) continue ;; esac
  grep -Ein 'guarantee[ds]? (a )?(reply|replies|response)|promise[ds]? (a )?(reply|replies)' "$f" \
    | grep -Eiv 'never|not |no |cannot|no one|nobody|none of|nothing' >/dev/null 2>&1 \
    && err "$f appears to promise replies"
done
for f in $prose; do
  grep -Eio 'automat[a-z]* (cold )?dms?|dm automation' "$f" >/dev/null 2>&1 && warn "$f mentions DM automation. Read it: it must refuse, never offer"
done

# Commands: always namespaced, and every one must exist.
for f in $prose README.md; do
  grep -Eo '(^|[^:a-z-])/(start|founder-brain|import-from-app|brain|content|engine2|ops|plan|playbook|status|setup|doctor|gate|help)([^a-z-]|$)' "$f" 2>/dev/null \
    | grep -v '/growth-engine' >/dev/null && err "$f names a bare command. Write /growth-engine:<name>"
  for c in $(grep -Eo '/growth-engine:[a-z0-9-]+' "$f" 2>/dev/null | sort -u); do
    n=${c#/growth-engine:}
    case " $skills " in *" $n "*) ;; *) err "$f names $c, and there is no skill called $n" ;; esac
  done
done

# ---------------------------------------------------------------- what must never be here
tracked=$(git ls-files 2>/dev/null)
printf '%s\n' "$tracked" | grep -q '^growth-engine/' && err "a founder growth-engine folder is committed at the root"
printf '%s\n' "$tracked" | grep -Eq '(^|/)(planning|briefs|runs)/' && err "internal planning material is committed"
for f in $tracked; do
  case $f in scripts/validate.sh) continue ;; esac
  [ -f "$f" ] || continue
  grep -Eqi 'MASTERPLAN|RUNBOOK|AUDIT\.md|TASKS\.md|spike-findings|our retainer|hourly rate' "$f" 2>/dev/null && err "$f mentions internal planning material"
done

# ---------------------------------------------------------------- tests
sh tests/rules/run.sh >/tmp/lh-validate-rules.$$ 2>&1 || { err "tests/rules failed"; cat /tmp/lh-validate-rules.$$; }
tail -2 /tmp/lh-validate-rules.$$ | head -1; rm -f /tmp/lh-validate-rules.$$
sh tests/hooks/run.sh >/tmp/lh-validate-hooks.$$ 2>&1 || { err "tests/hooks failed"; grep -v '^ok' /tmp/lh-validate-hooks.$$; }
rm -f /tmp/lh-validate-hooks.$$

printf '\n%d errors, %d warnings\n' "$errors" "$warnings"
[ "$errors" = 0 ]
