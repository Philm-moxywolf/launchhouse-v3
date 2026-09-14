#!/bin/sh
# End to end: a throwaway founder folder, and the hook scripts fed the JSON
# Claude Code sends them. Runs under whatever sh calls it (sh, dash, bash).
here=$(cd "$(dirname "$0")" && pwd)
S="$here/../../plugins/growth-engine/scripts"
SH=${SHELL_UNDER_TEST:-sh}
fail=0
proj=${TMPDIR:-/tmp}/lh-hooks.$$
trap 'rm -rf "$proj"' EXIT

reset() {
  rm -rf "$proj"; mkdir -p "$proj/growth-engine/.state" "$proj/growth-engine/people"
  : > "$proj/growth-engine/.launchhouse"
}
brain() {
  printf '# Founder Brain\n\n- **Founder:** Sam Okoye\n- **Business:** Northfield Ops\n- **Track:** %s\n- **Locked:** 2026-09-08\n\n## Thesis\nSmall site teams lose a day a week to paperwork they could hand off.\n' "$1" > "$proj/growth-engine/founder-brain.md"
}
json() { printf '{"session_id":"t","hook_event_name":"%s","tool_name":"%s","tool_input":{"file_path":"%s","content":"x"}}' "$1" "$2" "$3"; }
pre() { json PreToolUse Write "$1" | CLAUDE_PROJECT_DIR="$proj" $SH "$S/guard-pre.sh"; }
post() { json PostToolUse Write "$1" | CLAUDE_PROJECT_DIR="$proj" $SH "$S/guard-post.sh"; }
ok() { printf 'ok    %s\n' "$1"; }
bad() { printf 'FAIL  %s\n      %s\n' "$1" "$2"; fail=1; }
expect_deny() { case $2 in *'"permissionDecision":"deny"'*) ok "$1" ;; *) bad "$1" "expected deny, got: $2" ;; esac; }
expect_quiet() { [ -z "$2" ] && ok "$1" || bad "$1" "expected nothing, got: $2"; }

reset
expect_deny "unlisted file at the top of growth-engine" "$(pre "$proj/growth-engine/notes.md")"
expect_deny "a Launchhouse file outside growth-engine" "$(pre "$proj/founder-brain.md")"
expect_quiet "an ordinary file outside growth-engine" "$(pre "$proj/website/index.html")"
expect_deny "a track file before any track is chosen" "$(pre "$proj/growth-engine/outreach-sequence.md")"
brain b2b
expect_deny "the other track's file" "$(pre "$proj/growth-engine/dm-openers.md")"
expect_quiet "this track's file" "$(pre "$proj/growth-engine/outreach-sequence.md")"
expect_deny "a person file that is not a slug" "$(pre "$proj/growth-engine/people/Sam Okoye.md")"
expect_quiet "a person file that is a slug" "$(pre "$proj/growth-engine/people/sam-example-com.md")"
expect_quiet "drafts are allowed" "$(pre "$proj/growth-engine/drafts/week-2026-38.md")"
expect_deny "a folder that is not ours" "$(pre "$proj/growth-engine/misc/a.md")"
expect_deny "climbing out of the folder" "$(pre "$proj/growth-engine/../x/founder-brain.md")"
expect_quiet "a refill archive name" "$(pre "$proj/growth-engine/content-30-2026-09.md")"
expect_quiet "a second archive in one month" "$(pre "$proj/growth-engine/content-30-2026-09-2.md")"
expect_quiet "the playbook PDF" "$(pre "$proj/growth-engine/playbook-insert.pdf")"
expect_quiet "gate answers in .state" "$(pre "$proj/growth-engine/.state/gate-answers.md")"

# A new file that offers DM automation: held, and removed.
brain b2c
expect_quiet "new content file, pre" "$(pre "$proj/growth-engine/content-30.md")"
printf '## Post 1\n\nSet up a bot to send the 25 cold DMs overnight while you sleep.\n' > "$proj/growth-engine/content-30.md"
out=$(post "$proj/growth-engine/content-30.md")
case $out in *'"decision":"block"'*Instagram*) ok "a DM offer is held" ;; *) bad "a DM offer is held" "$out" ;; esac
[ ! -f "$proj/growth-engine/content-30.md" ] && ok "a held new file is removed" || bad "a held new file is removed" "file still there"

# An existing good file edited into a reply promise: put back as it was.
printf '## Post 1\n\nWe groomed 340 dogs last year.\n' > "$proj/growth-engine/content-30.md"
cp "$proj/growth-engine/content-30.md" "$proj/good.copy"
brain b2b
pre "$proj/growth-engine/content-30.md" >/dev/null
printf '## Post 1\n\nSend these and we guarantee a reply.\n' > "$proj/growth-engine/content-30.md"
out=$(post "$proj/growth-engine/content-30.md")
case $out in *'"decision":"block"'*) ok "a reply promise is held" ;; *) bad "a reply promise is held" "$out" ;; esac
cmp -s "$proj/growth-engine/content-30.md" "$proj/good.copy" && ok "a held edit is put back exactly" || bad "a held edit is put back exactly" "$(cat "$proj/growth-engine/content-30.md")"

# Notes do not hold.
pre "$proj/growth-engine/content-30.md" >/dev/null
printf '## Post 1\n\nThis is a seamless way to book 3-5 jobs a week.\n' > "$proj/growth-engine/content-30.md"
out=$(post "$proj/growth-engine/content-30.md")
case $out in *additionalContext*) ok "style issues come back as notes" ;; *) bad "style issues come back as notes" "$out" ;; esac
grep -q seamless "$proj/growth-engine/content-30.md" && ok "a noted file is kept" || bad "a noted file is kept" "gone"

# A Brain with no Track line is held.
cp "$proj/growth-engine/founder-brain.md" "$proj/brain.copy"
pre "$proj/growth-engine/founder-brain.md" >/dev/null
printf '# Founder Brain\n\n- **Founder:** Sam\n\n## Thesis\nSomething long enough to count as real content here.\n' > "$proj/growth-engine/founder-brain.md"
out=$(post "$proj/growth-engine/founder-brain.md")
case $out in *'"decision":"block"'*Track*) ok "a Brain without a Track line is held" ;; *) bad "a Brain without a Track line is held" "$out" ;; esac
cmp -s "$proj/growth-engine/founder-brain.md" "$proj/brain.copy" && ok "the Brain is put back" || bad "the Brain is put back" "differs"

# Founder-written folders are never judged.
mkdir -p "$proj/growth-engine/voice-samples"
printf 'Automate your Instagram DMs so every new follower gets a message.\n' > "$proj/growth-engine/voice-samples/old-post.md"
expect_quiet "a voice sample is not judged" "$(post "$proj/growth-engine/voice-samples/old-post.md")"

# The index is rebuilt.
grep -q '| founder-brain.md | gate A | ok |' "$proj/growth-engine/.state/index.md" && ok "the index is rebuilt from disk" || bad "the index is rebuilt from disk" "$(cat "$proj/growth-engine/.state/index.md" 2>/dev/null)"

# The vendor tools that send.
out=$(printf '{"tool_name":"mcp__e03ab338-9ab0__conversations_send-a-new-message","tool_input":{}}' | CLAUDE_PROJECT_DIR="$proj" $SH "$S/deny-mcp.sh")
expect_quiet "a GoHighLevel reply is not hard blocked" "$out"
out=$(printf '{"tool_name":"mcp__e03ab338-9ab0__conversations_send-a-new-message","tool_input":{}}' | CLAUDE_PROJECT_DIR="$proj" $SH "$S/ask-mcp.sh")
case $out in *'"permissionDecision":"ask"'*) ok "a GoHighLevel reply asks every time" ;; *) bad "a GoHighLevel reply asks every time" "$out" ;; esac
out=$(printf '{"tool_name":"mcp__d09f__apollo_emailer_campaigns_approve","tool_input":{}}' | CLAUDE_PROJECT_DIR="$proj" $SH "$S/deny-mcp.sh")
expect_deny "Apollo sequence activation is denied" "$out"
out=$(printf '{"tool_name":"mcp__d09f__apollo_mixed_people_api_search","tool_input":{}}' | CLAUDE_PROJECT_DIR="$proj" $SH "$S/deny-mcp.sh")
expect_quiet "Apollo search is allowed" "$out"

# Activating a sequence is denied, building one paused is not.
out=$(printf '{"tool_name":"mcp__d09f__apollo_sequences_update","tool_input":{"id":"x","active":true}}' | CLAUDE_PROJECT_DIR="$proj" $SH "$S/deny-mcp.sh")
expect_deny "switching a sequence on is denied" "$out"
out=$(printf '{"tool_name":"mcp__d09f__apollo_sequences_create","tool_input":{"name":"x","active":false}}' | CLAUDE_PROJECT_DIR="$proj" $SH "$S/deny-mcp.sh")
expect_quiet "creating a sequence paused is allowed" "$out"

# Spending and publishing always ask.
out=$(printf '{"tool_name":"mcp__d09f__apollo_people_bulk_match","tool_input":{}}' | CLAUDE_PROJECT_DIR="$proj" $SH "$S/ask-mcp.sh")
case $out in *'"permissionDecision":"ask"'*) ok "enrichment asks every time" ;; *) bad "enrichment asks every time" "$out" ;; esac
out=$(printf '{"tool_name":"mcp__e03a__social-media-posting_create-post","tool_input":{}}' | CLAUDE_PROJECT_DIR="$proj" $SH "$S/ask-mcp.sh")
case $out in *'"permissionDecision":"ask"'*) ok "publishing asks every time" ;; *) bad "publishing asks every time" "$out" ;; esac

# The send tool is stopped even from the wrong folder next door.
mkdir -p "$proj/elsewhere"
out=$(printf '{"tool_name":"mcp__d09f__apollo_emailer_messages_send_now","tool_input":{}}' | CLAUDE_PROJECT_DIR="$proj/elsewhere" HOME=/nonexistent $SH "$S/deny-mcp.sh")
expect_deny "Apollo send now is stopped from a folder next to the founder folder" "$out"

# A Launchhouse file written outside the project is refused too.
expect_deny "a Brain written outside the project" "$(pre "/tmp/somewhere/founder-brain.md")"

# Context at session start.
printf '# Profile\n\n- **Founder:** Sam Okoye\n- **Timezone:** Europe/London\n' > "$proj/growth-engine/.state/profile.md"
out=$(CLAUDE_PROJECT_DIR="$proj" $SH "$S/context.sh")
case $out in *"Track: b2b"*"Europe/London"*"outreach"*) ok "context names the track, the day and the next step" ;; *) bad "context names the track, the day and the next step" "$out" ;; esac
: > "$proj/growth-engine/README-your-files.md"
out=$(CLAUDE_PROJECT_DIR="$proj" $SH "$S/context.sh")
case $out in *growth-engine:import*) ok "app leftovers point at the importer" ;; *) bad "app leftovers point at the importer" "$out" ;; esac
mkdir -p "$proj/outer"; out=$(CLAUDE_PROJECT_DIR="$proj/outer" $SH "$S/context.sh")
case $out in *"not the founder folder"*) ok "the wrong folder is named" ;; *) bad "the wrong folder is named" "$out" ;; esac

# Once imported, a leftover zip is not new app work.
rm -f "$proj/growth-engine/README-your-files.md"; : > "$proj/growth-engine.zip"
out=$(CLAUDE_PROJECT_DIR="$proj" $SH "$S/context.sh")
case $out in *growth-engine:import*) ok "a zip before import points at the importer" ;; *) bad "a zip before import points at the importer" "$out" ;; esac
printf '# Imported\n' > "$proj/growth-engine/.state/imported.md"
out=$(CLAUDE_PROJECT_DIR="$proj" $SH "$S/context.sh")
case $out in *growth-engine:import*) bad "a zip after import is left alone" "$out" ;; *) ok "a zip after import is left alone" ;; esac
rm -f "$proj/growth-engine.zip"

# Drafts waiting are mentioned.
mkdir -p "$proj/growth-engine/drafts"; : > "$proj/growth-engine/drafts/week-2026-39.md"; rm -f "$proj/growth-engine/README-your-files.md"
out=$(CLAUDE_PROJECT_DIR="$proj" $SH "$S/context.sh")
case $out in *"Drafts waiting"*) ok "drafts waiting are mentioned" ;; *) bad "drafts waiting are mentioned" "$out" ;; esac

# From the wrong folder: a Brain written next door is refused; ordinary files are not.
expect_deny "a Brain written in a folder next to the founder folder" "$(printf '{"tool_name":"Write","tool_input":{"file_path":"%s"}}' "$proj/elsewhere/founder-brain.md" | CLAUDE_PROJECT_DIR="$proj/elsewhere" HOME=/nonexistent $SH "$S/guard-pre.sh")"
expect_quiet "an ordinary file in a folder next to the founder folder" "$(printf '{"tool_name":"Write","tool_input":{"file_path":"%s"}}' "$proj/elsewhere/notes.md" | CLAUDE_PROJECT_DIR="$proj/elsewhere" HOME=/nonexistent $SH "$S/guard-pre.sh")"

# Two Launchhouse folders side by side are both named.
two=${TMPDIR:-/tmp}/lh-two.$$; mkdir -p "$two/a/growth-engine" "$two/b/growth-engine"; : > "$two/a/growth-engine/.launchhouse"; : > "$two/b/growth-engine/.launchhouse"
out=$(CLAUDE_PROJECT_DIR="$two" HOME=/nonexistent $SH "$S/context.sh"); rm -rf "$two"
case $out in *"2 Launchhouse folders"*) ok "two nearby folders are both named" ;; *) bad "two nearby folders are both named" "$out" ;; esac

# Nothing happens outside a Launchhouse folder.
rm -f "$proj/growth-engine/.launchhouse"
expect_quiet "inert without the marker" "$(pre "$proj/growth-engine/notes.md")"

[ $fail = 0 ] && printf 'hooks: ok\n'
exit $fail
