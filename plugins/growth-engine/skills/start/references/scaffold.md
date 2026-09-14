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
growth-engine/people/*
!growth-engine/people/README.md
# Working copies the Launchhouse checks keep for a moment.
growth-engine/.state/.pre/
# Downloads from the app, once brought across.
*.zip
.lh-import/
.DS_Store
```
