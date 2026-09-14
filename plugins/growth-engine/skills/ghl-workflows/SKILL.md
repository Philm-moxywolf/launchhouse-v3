---
name: ghl-workflows
description: Build the operations engine. Runs a bottleneck diagnostic, picks one GoHighLevel snapshot from the library of six, and writes all the copy that goes inside it, ready to load at the clinic. Both tracks. Trigger on "build my ops engine", "which workflow should I automate", "my bottleneck", "pick a snapshot", "operations engine", or Session 2 homework.
---

# Operations Engine

Delivers the page promise: one workflow running on the founder's live business before they leave Atlanta.

**The workflow is a pre-built GoHighLevel snapshot,** loaded in one click at the clinic on Wednesday 23 September. This skill does the two things that actually need thinking: choosing the right one, and writing the words inside it.

**Founders do not build workflows.** If a founder starts describing a bespoke automation, bring them back to the library. Bespoke is what fails at 130.

**Who is reading.** A founder who does not use a terminal. Never ask them to run a command.

## Prerequisites

1. **Check the folder.** Read the session context. If it says this is not the founder folder, stop and tell them which folder to open.
2. **Read the Brain.** Read `./growth-engine/founder-brain.md`.
   - If it genuinely does not exist, stop. Tell the founder the Founder Brain comes first (`/growth-engine:brain`, or "build my founder brain"), and do not proceed.
   - Do not ask them to describe their business again from scratch, and do not guess at their offer, audience or voice.
3. **Use the Brain** for track, model, stage, offer and goal.
4. **Check for an existing workflow.** If `ops-workflow.md` already exists, ask whether they want to change the copy or pick again, and go straight there.

## Step 1: bottleneck diagnostic

Find the one repetitive task that costs the most time or leaks the most revenue. Ask:

1. What do you do every week that you resent doing?
2. Where do people go quiet on you, and what happens next?
3. What do you forget to do, and what does it cost when you forget?
4. If one repetitive job disappeared on Monday, which one?

Then name the bottleneck in one sentence, in their words. Confirm it with them before moving on. Getting this wrong means automating the wrong thing.

## Step 2: pick the snapshot

One only. Two half-finished workflows are worse than one running.

### B2B library

| Snapshot | Runs on | Use when |
|---|---|---|
| Lead follow-up | Email | Inbound leads are not chased consistently |
| Discovery booking | Email | Booking a call takes too many messages |
| Proposal chase | Email | Proposals go quiet and nobody follows up |

### B2C library

| Snapshot | Runs on | Use when |
|---|---|---|
| Comment-to-DM capture | Instagram | Content gets engagement but no conversation |
| DM qualify and book | Instagram | DMs arrive but conversion is manual and slow |
| Review request | Email and SMS | Reviews are never asked for |

**The library is deliberately small.** If the founder's bottleneck falls outside these six (onboarding, reactivation, abandoned checkout, win-back):
- pick the nearest snapshot and adapt the message copy to it
- note the gap in the output file, so a mentor can help individually
- do not invent a snapshot that does not exist, and do not attempt a bespoke build

**Name the platform from the table, never from memory.** A B2C snapshot runs on Instagram, or email and SMS. Saying one runs on LinkedIn puts the other track's platform in front of a founder who is not on it, and it sends them to the wrong place on the day.

A B2C founder with `Model: ecommerce` usually fits review request or comment-to-DM capture. With `Model: service`, DM qualify and book is usually the one. Recommend, never force.

Recommend one and explain why against their stated bottleneck. Let them override.

## Step 3: write the copy

The snapshot is the plumbing. The copy is the founder's.

For the chosen snapshot, write every message it sends: emails with subject lines, SMS, DM replies, internal notifications. Write in the captured voice, matched to track.

Also specify:
- the trigger
- the wait intervals between steps
- the exit condition
- which tags get applied

Keep waits realistic. Chasing someone four times in two days annoys them.

**On the two DM snapshots, check the trigger before you write a word.** Both start with something the other person did: a comment on a post, or a message they sent in. Write the copy as the answer to that, and label each message with what triggers it, for example "Reply, sent when they comment:". If you find yourself writing to somebody who has done neither, the trigger is wrong, and no amount of rewriting the copy fixes it.

**No message claims a result the Brain does not record.** A review request that says "join our 200 happy customers" is an invented number, sent to a real customer who can count. If the Brain has no number, ask for the review on the work the founder actually did for that person, and name the work.

## Step 4: n8n escape hatch

Only if the data lives outside GoHighLevel: Stripe to a spreadsheet, Shopify to Airtable, a legacy system, multi-API orchestration.

Roughly one founder in six needs this. If the founder does not clearly need it, do not raise it. If they do, note the requirement in the output file and flag it for one-to-one support rather than trying to solve it here.

## Step 5: export

Write `./growth-engine/ops-workflow.md` containing:
- the named bottleneck
- the chosen snapshot, and why
- all message copy
- the trigger, the timings, the exit condition and the tags
- any gap in the library, or n8n requirement, for a mentor

Add one line to the Decisions block of `growth-engine/memory.md`: `- YYYY-MM-DD ops workflow: <snapshot>, for <bottleneck in a few words>`.

## Step 6: check and save

1. **Check.** Use the `rules-reviewer` agent on `ops-workflow.md`. Give it every figure the founder gave in this conversation.
2. **Fix what it holds.** Ask about any held figure rather than guessing. Do this at most twice.
3. **Save.** Run `git add growth-engine` then `git commit -m "Operations engine: <snapshot>"`. Push if there is a remote. If the push fails, say it is saved on this computer.

## At the clinic

The founder brings this file to the clinic on 23 September, loads the snapshot, pastes the copy in, and sends themselves one test through the real trigger.

**If GoHighLevel is connected** (`.state/setup.md`, or GoHighLevel tools are available to you), you can offer one shortcut: create each email in the workflow as an email template in their account, so pasting is quicker.
- Use the tool whose name ends `emails_create-template`, one email at a time.
- Show the subject and body first, and create each one only after they say yes.
- Never create, change or switch on a workflow. The snapshot does that.

## Gate

- bottleneck named in one sentence
- snapshot chosen
- all copy written
