---
name: routines
description: Explain and switch on Launchhouse routines, scheduled Claude agents that run in the cloud against the founder's own GitHub copy of their folder and draft the recurring work, such as the Monday plan, a content top-up, what worked, Apollo sequence health and the countdown to Atlanta. Routines only draft and read. They never publish, send or spend. Trigger on "routines", "schedule my Monday plan", "set up a routine", "automate my weekly plan", "remind me every week", "what routines are there".
---

# Routines

A routine is a Claude agent that runs on a schedule, in the cloud, against the founder's GitHub copy of their Launchhouse folder. It does a job they would otherwise have to remember, and leaves the result in `growth-engine/drafts/` for them to read.

**The doubt to name first.** "Something running on its own" sounds like the automation this programme warns about. It is not, because routines follow three rules:
1. **Draft only.** A routine never publishes, schedules, sends, enriches or buys, and never marks anything approved.
2. **Read only against the tools.** It can read post statistics and sequence activity, never change them.
3. **Nothing is final until the founder says so.** Every draft waits in `drafts/` until they accept it.

**Who is reading.** A founder who does not use a terminal. Never ask them to run a command.

## 0. Before starting

1. **Check the folder.** Read the session context. If it says this is not the founder folder, stop and tell them which folder to open.
2. **Check for a GitHub copy.** Run `git remote -v`. Routines run against the GitHub copy, so a folder with no remote cannot have routines. Tell them a mentor can connect it to GitHub, then come back.
3. **Save and push.** Run `git status --short` and save anything unsaved with `/growth-engine:save`, so the routine sees their latest work.

## 1. The routines

The prompt for each one is in `../../routines/`, relative to this skill, one file each. Read the one the founder picks before setting it up.

| Routine | File | When | What it leaves | Track |
|---|---|---|---|---|
| Monday plan | `monday-plan.md` | Mondays, 07:00 their time | `drafts/week-YYYY-WW.md`: three actions for the week from the 90 day plan, what is overdue, where the gates stand | both |
| Content top-up | `content-top-up.md` | Mondays, 08:00 their time | `drafts/content-refill-YYYY-MM-DD.md`: the next 10 pieces, but only when fewer than 10 approved pieces are left to publish | both |
| What worked | `what-worked.md` | Fridays, 16:00 their time | `drafts/what-worked-YYYY-MM-DD.md`: the week's posts and how they did, with suggested lines for memory | both |
| Sequence health | `sequence-health.md` | Weekdays, 09:00 their time | `drafts/sequence-YYYY-MM-DD.md`: sent, bounced, opted out, replied, and anyone to stop | B2B |
| Countdown | `countdown.md` | Daily, 21 to 25 September, 08:00 their time | `drafts/before-atlanta.md`: what is not done yet, gate by gate | both |

**Recommend two to start with:** Monday plan, and countdown before Atlanta. More routines means more drafts to read. A routine producing drafts nobody reads gets switched off.

Never offer the B2B routine to a B2C founder.

## 2. Say what it costs and what it needs

- **Cost.** Routines run on the founder's own Claude plan, and each run uses some of it. Say so plainly.
- **Tools.** The routines that read GoHighLevel or Apollo (what worked, sequence health) need those connectors to be available when the routine runs. If a run finds no connector, it says so in its draft instead of guessing, and the founder can run the same check in the Code tab on a Monday.

## 3. Set it up

1. Read the chosen routine's file. It holds the prompt and the schedule.
2. Convert the schedule to a time in the founder's timezone from `.state/profile.md`.
3. Show them: the name, when it runs in their time, what it leaves, and that it never publishes, sends or spends. Wait for a yes.
4. Create it:
   - **If you have a scheduling tool or a `/schedule` command for routines,** create it with the prompt copied from the file exactly, the founder's repository, and the schedule.
   - **Otherwise,** walk them through it. In Claude on the web, open Claude Code, then Routines, then create a new routine. Pick their Launchhouse repository, paste the prompt (you show it in a code block to copy), and set the schedule.
5. Add a line to `growth-engine/memory.md` under Decisions: `- YYYY-MM-DD routine on: <name>, <when>`.
6. Save and push.

## 4. Using the drafts

When the founder opens a session, the drafts are in `growth-engine/drafts/` on their GitHub copy. To bring them into this folder, run `git pull --no-rebase`. `/growth-engine:save` does this too when it pushes.

**After the first run, check where the draft landed.** Some cloud setups save a routine's work to its own branch rather than the main copy.
1. Run `git fetch`, then `git branch -r`.
2. If the draft is on a separate branch, bring just the drafts across with `git checkout <that branch> -- growth-engine/drafts/`, then save.
3. Suggest the founder allows the routine to save to the main copy in its settings, so it lands in one place from then on.

**Accepting a draft:**
- **A week plan:** read it with them. Nothing needs moving.
- **A content refill:** follow the content engine's refill mode, using the draft as the new batch. Each piece is still read and approved one by one.
- **What worked:** the lines they agree with go into `memory.md`.
- **Sequence health:** anyone who asked to be left alone gets stopped, with `/growth-engine:sequence`.

Then delete the draft and save.

## 5. Switching one off

Walk them through it the same way they switched it on: the scheduling tool, or Routines in Claude Code on the web. Add a Decisions line to `memory.md`: `routine off`.
