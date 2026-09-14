# The starting contents of a Launchhouse folder

Create a file only when it is missing. Never overwrite one that exists.

## growth-engine/.launchhouse

```
This is a Launchhouse founder folder. Everything the growth engine makes lives in this growth-engine folder.
```

## growth-engine/ledger.md

```markdown
# Ledger

One row per content piece. Format: C|id|pillar|format|lane|status|post id|goes out
Status is draft, approved, scheduled, posted, failed or archived. A piece becomes approved only when the founder says so.
```

## growth-engine/memory.md

```markdown
# Memory

Curated. What matters, not everything. The full record is in ops-log.md.
Add one line per entry inside the marked blocks, dated. Anything under Notes is the founder's own.

## Decisions
<!-- GE:DECISIONS:START -->
<!-- GE:DECISIONS:END -->

## What worked
<!-- GE:WORKED:START -->
<!-- GE:WORKED:END -->

## What did not
<!-- GE:DIDNOT:START -->
<!-- GE:DIDNOT:END -->

## Voice notes
<!-- GE:VOICE:START -->
<!-- GE:VOICE:END -->

## Angles used
<!-- GE:ANGLES:START -->
<!-- GE:ANGLES:END -->

## Open threads
<!-- GE:THREADS:START -->
<!-- GE:THREADS:END -->

## Notes
Anything below this heading is the founder's own.
```

## growth-engine/ops-log.md

```markdown
# Ops log

Append only. Every day gets its own heading, as ## YYYY-MM-DD, then lines as - HH:MM decision|result|blocker|note: text
```

## growth-engine/people/README.md

```markdown
# people

One file per person the founder is selling to.

These files hold real people's names, companies and contact details. They are kept out of git on purpose and never shared.
```

## .gitignore, in the folder the founder opened

Add any of these lines that are missing. Keep whatever else is there.

```
# Real people's details. Never in git.
**/people/*
!growth-engine/people/README.md
growth-engine/outreach-firstlines.csv
growth-engine/dm-openers.md
# A copy unzipped in the wrong place, or twice.
growth-engine/growth-engine/
growth-engine */
# Working copies the Launchhouse checks keep for a moment.
growth-engine/.state/.pre/
# Downloads from the app, once brought across.
*.zip
.lh-import/
.DS_Store
```

## .claude/settings.json, in the folder the founder opened

Create this only when the file does not exist. It turns the Launchhouse plugin on for this folder, and lets Claude save work and run the commands the engines need without asking every time. If the file exists, leave it alone and tell a mentor if the founder is being asked permission for everything.

```json
{
  "extraKnownMarketplaces": {
    "launchhouse-v3": {
      "source": {
        "source": "github",
        "repo": "Philm-moxywolf/launchhouse-v3"
      }
    }
  },
  "enabledPlugins": {
    "growth-engine@launchhouse-v3": true
  },
  "permissions": {
    "defaultMode": "acceptEdits",
    "allow": [
      "Bash(git status:*)",
      "Bash(git add:*)",
      "Bash(git commit:*)",
      "Bash(git show:*)",
      "Bash(git log:*)",
      "Bash(git diff:*)",
      "Bash(git rev-parse:*)",
      "Bash(git remote -v)",
      "Bash(git pull --no-rebase)",
      "Bash(git fetch)",
      "Bash(git branch -r)",
      "Bash(git restore:*)",
      "Bash(git mv:*)",
      "Bash(git merge --abort)",
      "Bash(git init)",
      "Bash(git config user.name:*)",
      "Bash(git config user.email:*)",
      "Bash(date:*)",
      "Bash(readlink /etc/localtime)",
      "Bash(ls:*)",
      "Bash(mkdir:*)",
      "Bash(unzip:*)",
      "Bash(tar -xf:*)",
      "Bash(textutil:*)",
      "Bash(sips:*)",
      "Bash(git push:*)",
      "Bash(git checkout origin/:*)",
      "Bash(cp:*)",
      "Bash(rm -rf .lh-import)",
      "Bash(rm -rf growth-engine/growth-engine)",
      "Bash(rm -rf growth-engine/.state/snapshots)",
      "Bash(rm growth-engine/drafts/:*)",
      "Bash(rm growth-engine/README-your-files.md)",
      "Bash(rm growth-engine/.state/HOME)",
      "Bash(rm growth-engine/.gitignore)",
      "Bash(powershell -NoProfile -Command Expand-Archive:*)",
      "Bash(rm growth-engine/.state/log.bytes)",
      "Bash(rm growth-engine/.state/memory.lock)"
    ]
  }
}
```
