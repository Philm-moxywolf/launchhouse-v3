---
name: status
description: Show the founder where they are up to in the Launchhouse programme, which gate items are met, what is outstanding, and the one thing to do next. Trigger on "where am I up to", "what have I done", "launchhouse status", "am I ready", "what's left", "check my progress", or at the start of a working session.
---

# Status

Tells the founder exactly where they stand and what to do next.

**Who is reading.** A founder who does not use a terminal. Never ask them to run a command.

## 1. Read the folder

1. **Check the folder.** Read the session context. If it says this is not the founder folder, stop and tell them which folder to open.
2. **Get the gates table.** Use the `status-checker` agent to read `growth-engine/` against `../../references/gates.md`. It returns a table of every gate item for this founder's track: done, nearly empty, not done, or needs asking, with the evidence for each.
3. **Read these yourself:**
   - the Brain's header and Flags
   - `growth-engine/.state/setup.md`
   - `growth-engine/.state/gate-answers.md`

## 2. Report

**Track first**, because everything branches on it. Then, as a short checklist:

| Area | What it has to contain | Built | Checked |
|---|---|---|---|
| Founder Brain | Locked, track, thesis, voice | Session 1 | Gate A, end of Session 1 |
| Content | 30 pieces, the sheet, the refill sources, 30 approved | Session 1 homework | Gate B, Session 2 |
| Engine 2, B2B | Route, sequence with opt-outs, criteria, 25 on the list, 25 first lines | Session 2 homework | Gate C, Session 3 |
| Engine 2, B2C | 25 targets, 25 openers, hook bank with offer tests, inbound scripts | Session 2 homework | Gate C, Session 3 |
| Operations | Bottleneck, snapshot, all copy | Session 2 homework | Gate C, Session 3, then loaded at the clinic on 23 September |
| Connections | GoHighLevel connected, plus Apollo and a mailbox for B2B | Session 2 | Before the clinic |
| 90 day plan | The number, Monday's three actions, kill criteria | Atlanta, Sunday | |
| Playbook insert | Brain, content, engine 2, ops and plan in one document | Session 3 homework | |

Show only this founder's track. Never show the other track's row.

**For each row, say one of these:**
- **Done**
- **Nearly done**: say exactly what is missing, for example "22 of 30 approved"
- **Not started**

**What counts as done**
- File-backed items count only on what the file shows. Never mark something done because the founder says so.
- Self-reported items show what `.state/gate-answers.md` records, or "not asked yet".

**The 90 day plan** is built in Atlanta on the Sunday. Before then its absence is expected. Do not count it against them.

## 3. Flags and time-critical items

Check the Brain's Flags section and surface anything unresolved. These two items quietly break the weekend, so raise them even if the founder asked about something else:
- **B2B:** the sending domain, and whether SPF, DKIM and DMARC are set.
- **B2C:** whether Instagram is Business or Creator and linked to a Facebook Page.

## 4. Self-reported items, only when it matters

When the founder asks "am I ready", or a gate is being checked this week, ask each self-reported item that is not yet answered. Ask one question at a time.

Record each answer as a new dated line in `growth-engine/.state/gate-answers.md`, in the shape in `../../references/contract.md`. Then save it: `git add growth-engine` and `git commit -m "Gate answers"`.

Otherwise, do not pester them with questions they did not ask for.

## 5. A file you cannot account for

The checklist is the whole list. If the folder holds something that is not on it, say what you can see and move on.

Never ask the founder to explain what one of their own files is for, and never offer them a list of things it might have been. They opened this to be told where they stand. A file this skill cannot name is this skill's gap, not their homework.

## 6. One next action

Say what is missing and what to do next. Give one clear next action, not a list of six, with the words or command that starts it:

| What is missing | Next action |
|---|---|
| No Brain | `/growth-engine:brain` |
| Brain has no Thesis, Voice or Locked date | `/growth-engine:brain`, update mode, to add what is missing |
| No content | `/growth-engine:content` |
| Content not approved | read and approve pieces, "approve 1 to 10" |
| No engine 2 | `/growth-engine:engine2` |
| No operations workflow | `/growth-engine:ops` |
| Nothing connected | `/growth-engine:connect` |
| Approved pieces not published | `/growth-engine:publish` |
| B2B Apollo route, sequence not built | `/growth-engine:sequence` |

If they are behind, say so plainly and tell them which single thing to do first. Do not soften it. The gates exist so nobody arrives in Atlanta unable to build.
