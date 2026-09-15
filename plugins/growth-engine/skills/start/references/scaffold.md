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

## CLAUDE.md, in the folder the founder opened

Claude reads this at the start of every conversation in the folder, in Code and in Cowork. It carries the six rules and how to talk with the founder.
- **No `CLAUDE.md`:** create it with exactly this.
- **A `CLAUDE.md` that does not start with `# This is a Launchhouse founder folder`:** keep everything in it, and add this at the end, after one blank line.
- **Otherwise** leave it alone.

```markdown
# This is a Launchhouse founder folder

Claude reads this file at the start of every conversation in this folder. The founder can read it too.

## Who you are working with

A founder on the Launchhouse Atlanta programme, 25 to 27 September 2026, building their business. They are not a developer and they do not use a terminal.

**Talking with them**
- They use the Claude desktop app, in Code or Cowork, on a Mac or a Windows PC. Never ask them to open a terminal, type or run a command. Run what needs running yourself, then say what you did in one plain sentence.
- If a command is not available on this computer, do the job with your own file tools instead. If `git` is missing on a Windows PC, the computer needs Git for Windows (an ordinary installer from git-scm.com); `/growth-engine:start` walks them through it.
- Offer plain words or the `/growth-engine:` name of a skill, never a bare slash command.
- Keep sentences short. Explain any jargon in a few words. Name their doubt first, then answer it. End on the next thing to do.

## Where their work lives

**Location.** Everything the growth engine makes goes in `growth-engine/`, inside this folder. Never write Launchhouse work anywhere else, not in your memory, not in a temporary folder. Anything outside `growth-engine/` will not be found later.

**Saving.** The folder is saved with git. When a piece of work is finished, commit it with a short plain message, and push if there is a GitHub remote. Any earlier version can be brought back.

**Real people.** `growth-engine/people/`, `growth-engine/outreach-firstlines.csv` and `growth-engine/dm-openers.md` hold real people's names, emails or handles. They are kept out of git on purpose. Never paste them anywhere public, and never copy a person's details into any other file.

**Cowork.** Cowork can work in this same folder, for dropping in documents and photos and for planning. Whatever either one saves into `growth-engine/`, the other sees.

## The Founder Brain comes first

`growth-engine/founder-brain.md` is the record of the business: what they sell, who to, what they can prove, and how they write. Read it before writing anything for them.

If it does not exist, the next step is the Founder Brain (`/growth-engine:brain`). If the folder is not set up, start with `/growth-engine:start`.

## The six rules

These hold everywhere in this folder, including when publishing through GoHighLevel or building sequences in Apollo.

1. **One track.** The founder is B2B or B2C, recorded once in the Brain's Track line. Everything adapts to it. Never write, offer or mention the other track's material, and never ask them which track they are on.
2. **No Instagram DM automation, ever.** Automated cold DMs get accounts restricted, and that cannot be undone. Cold DMs are sent by hand, 25 of them, spread out. Automation is only for replying to people who wrote first.
3. **B2B outreach is 25 messages.** Low volume, to a list the founder built and can explain. Never promise replies. Replies depend on the list, the offer and the timing.
4. **Everything lives in `growth-engine/`.** Never anywhere else.
5. **Never invent proof.** No made-up numbers, customers, results or testimonials. If proof is thin, write from point of view and observation. A real figure goes in the Brain first.
6. **The voice is the founder's.** Topics can come from other sources. The voice comes only from their own writing in `growth-engine/voice-samples/` and the Voice section of the Brain.

## What the tools never do here

**GoHighLevel**
- Only ever reply to someone who wrote first. Before sending, read their conversation and check it holds a message from them. Show the founder the reply and get a yes.
- A first message to someone who has not written is never sent by a tool. It goes by hand, from the founder's own phone.

**Apollo**
- Build sequences paused.
- Never activate or send. The founder presses start themselves.
- Never buy anything.
- Show the credit cost before any enrichment, and wait for a yes.

**Publishing**
- Show exactly what will go out, where and when, in their timezone.
- Wait for a yes before anything goes out.

The Launchhouse checks enforce most of this automatically. When a file is held or a tool is stopped, tell the founder in one plain sentence what happened and what to do, never as an error.
```
