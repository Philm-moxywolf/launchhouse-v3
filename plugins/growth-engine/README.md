# growth-engine

The Launchhouse plugin. It teaches Claude the programme, runs the engines, and checks what they write. It works in the Claude desktop app, in Code and in Cowork, on Mac and Windows.

It only acts inside a founder folder, one that carries `growth-engine/.launchhouse`. Everywhere else its hooks do nothing.

Any folder can become a founder folder. The founder template is the quickest start, but saying "start launchhouse" in any other folder creates the same starting files, including `CLAUDE.md`.

## Skills

Founders reach every skill by plain words, or by the short command where one exists.

**Setting up and moving across**

| Skill | Command | What it does | Writes |
|---|---|---|---|
| `start` | `/growth-engine:start` | Checks Git and the checks are running, asks name and timezone, gives any folder what the template has, saves | `.state/profile.md`, starting files, `.gitignore`, `.claude/settings.json`, `CLAUDE.md` |
| `import-from-app` | `/growth-engine:import` | Brings a Launchhouse app download across, saves it as it arrived, adjusts it to the contract, reviews it | the app's files, `.state/imported.md` |
| `add-files` | `/growth-engine:add-files` | Turns documents, decks, sheets, PDFs and photos into readable files. Writing samples go apart from facts | `uploads/`, `voice-samples/` |
| `connect-tools` | `/growth-engine:connect` | Proves GoHighLevel, and Apollo for B2B, by reading the founder's own account back | `.state/setup.md` |

**The engines**

| Skill | Command | What it does | Writes |
|---|---|---|---|
| `founder-brain` | `/growth-engine:brain` | The interview, the voice, the track, and changing track | `founder-brain.md` |
| `content-engine` | `/growth-engine:content` | Pillars, 30 pieces in batches, monthly refill, approvals | `content-30.md`, `content-30.csv`, `rss-feeds.md`, `ledger.md` |
| `outreach-b2b` | `/growth-engine:outreach` | Send route, criteria, sequence, the list of 25, first lines. B2B only | `outreach-sequence.md`, `outreach-firstlines.csv`, `people/` |
| `audience-b2c` | `/growth-engine:audience` | 25 targets and openers, hook bank, inbound scripts, sends. B2C only | `dm-openers.md`, `hook-bank.md`, `inbound-scripts.md`, `people/` |
| `ghl-workflows` | `/growth-engine:ops` | Bottleneck, one snapshot of six, every message in it | `ops-workflow.md` |
| `growth-plan` | `/growth-engine:plan` | The 90 day plan, built in Atlanta on the Sunday | `90-day-plan.md` |
| `playbook-export` | `/growth-engine:playbook` | Compiles the personalised playbook insert | `playbook-insert.md` |

The `engine2` command is not a skill. It reads the Track line and routes to `outreach-b2b` or `audience-b2c`.

**Using the tools**

| Skill | Command | What it does | Writes |
|---|---|---|---|
| `publish-content` | `/growth-engine:publish` | Approved pieces into GoHighLevel as drafts or scheduled posts, after a yes. Reports how posts did | `ledger.md`, `ops-log.md` |
| `apollo-sequence` | `/growth-engine:sequence` | Free search, enrichment only after a yes, contacts, a paused sequence with the 25 added. B2B only | `people/`, `outreach-firstlines.csv` |
| `routines` | `/growth-engine:routines` | Explains and switches on scheduled routines that only draft | `memory.md` |

**Keeping track**

| Skill | Command | What it does | Writes |
|---|---|---|---|
| `status` | `/growth-engine:status` | Gates for the founder's track, flags, one next action | `.state/gate-answers.md` |
| `gate` | `/growth-engine:gate` | The paste block for the gate form, checked against files | `.state/gate-answers.md` |
| `save` | `/growth-engine:save` | Saves, shows what changed, brings back an earlier version | commits |
| `help` | `/growth-engine:help`, `/growth-engine:doctor` | Setup checks and the common problems | nothing |

## Agents

| Agent | Tools | Used by | Job |
|---|---|---|---|
| `rules-reviewer` | Read, Grep, Glob, Bash (reading git only) | every skill that writes | Invented figures and people, cold DM offers, lines that say replies are certain, the other track's material. Track from the Brain on disk, grounding from the last saved Brain |
| `voice-reviewer` | Read, Grep, Glob | content, openers, sequence copy | Whether it sounds like the founder, against their own writing samples |
| `status-checker` | Read, Grep, Glob | status, gate | Every gate item for the founder's track, from the index counts and the files |
| `file-ingester` | Read, Write, Bash, Glob | add-files | One supplied file into readable form, with a note of where it came from |

## Hooks

All in `hooks/hooks.json`, running POSIX sh scripts in `scripts/`.

| When | Script | What it does |
|---|---|---|
| Session start, and after a summary | `context.sh` | Tells Claude the founder, track, today in their timezone, what is made, the next step. Names the right folder when the wrong one is open |
| Before a write | `guard-pre.sh` | Refuses a Launchhouse file outside `growth-engine/`, in the wrong folder, of the other track, or unlisted. Keeps a copy of the file as it was |
| After a write | `guard-post.sh` with `rules.awk` | Runs the rules on the new words. If a line is held, puts the file back and tells Claude the line and why. Notes go back as context |
| After a write | `index.sh` | Rebuilds `growth-engine/.state/index.md` with the counts the gates need |
| Before an Apollo send, activate or buy tool | `deny-mcp.sh` | Refuses it, including a sequence created or updated as active |
| Before a publish, reply, spend or enrol tool | `ask-mcp.sh` | Makes Claude Code ask the founder every time |

Every script fails open. If a check cannot run, the write goes ahead, and the rules reviewer is still there.

## References

| File | What it is |
|---|---|
| `references/contract.md` | Every file a founder folder can hold, its shape, and which skill writes it |
| `references/gates.md` | Gates A, B and C, what proves each item, and the counts |
| `references/media.md` | The pictures, clips and writing samples each track was asked to collect |

## Routines

Prompt templates the `routines` skill sets up. Each one only drafts into `growth-engine/drafts/` and never publishes, sends or spends.

| Routine | When | Leaves |
|---|---|---|
| `monday-plan.md` | Mondays | The week's three actions, what is overdue, gate status |
| `content-top-up.md` | Mondays, only when needed | The next 10 pieces, when fewer than 10 approved are left |
| `what-worked.md` | Fridays | The week's posts and figures, with suggested memory lines |
| `sequence-health.md` | Weekdays, B2B | Sent, bounced, opted out, replied, and anyone to stop |
| `countdown.md` | 21 to 25 September | What is not done, gate by gate |
