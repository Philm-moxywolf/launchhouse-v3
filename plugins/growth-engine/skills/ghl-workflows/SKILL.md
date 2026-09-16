---
name: ghl-workflows
description: Build the operations engine. Runs a bottleneck diagnostic, names the GoHighLevel snapshot the founder's track decides, and writes all the copy that goes inside it, ready to load at the clinic. Both tracks. Trigger on "build my ops engine", "which workflow should I automate", "my bottleneck", "pick a snapshot", "operations engine".
---

# Operations Engine

One workflow running on the founder's own business before they leave Atlanta.

**The workflow is a pre-built GoHighLevel snapshot.** It is loaded into the founder's own account at the clinic on Wednesday 23 September, and every message inside it arrives empty. This skill does the two things that actually need thinking: choosing the right one, and writing the words inside it.

**Founders do not build workflows.** If a founder starts describing a bespoke automation, bring them back to the library. A custom build cannot be loaded and tested in one clinic session; a snapshot can.

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

## Step 2: name their snapshot, then order the packs

**The founder does not choose a snapshot.** Their Brain does. Read the `Track` line and the hybrid flag, say which one they have, and move on.

| In the Brain | Snapshot | What is in it |
|---|---|---|
| B2B | **B2B** | Essentials B2B, Lead follow-up, Discovery booking, Proposal chase |
| B2C | **B2C** | Essentials B2C, Comment to DM, DM qualify and book, Review request |
| Either, hybrid | **Hybrid** | One Essentials, plus packs from both sides |

Every pack arrives as drafts, in its own workflow folder. Nothing runs until the founder publishes it, so what the bottleneck decides is **which folder they publish first, and whose words get written first.**

### B2B packs

| Pack | Runs on | Publish this one first when |
|---|---|---|
| Lead follow-up | Email | Inbound leads are not chased consistently |
| Discovery booking | Email | Booking a call takes too many messages |
| Proposal chase | Email | Proposals go quiet and nobody follows up |

### B2C packs

| Pack | Runs on | Publish this one first when |
|---|---|---|
| Comment to DM | Instagram | Content gets engagement but no conversation |
| DM qualify and book | Instagram | DMs arrive but conversion is manual and slow |
| Review request | Email | Reviews are never asked for |

**The list is deliberately small.** If the founder's bottleneck falls outside these six (onboarding, reactivation, abandoned checkout, win-back):
- name the nearest pack and adapt the message copy to it
- note the gap in the output file, so a mentor can help individually
- do not invent a pack that does not exist, and do not attempt a bespoke build

**Name the platform from the table, never from memory.** A B2C pack runs on Instagram, or on email. Saying one runs on LinkedIn puts the other track's platform in front of a founder who is not on it, and it sends them to the wrong place on the day.

A B2C founder with `Model: ecommerce` usually publishes review request or comment to DM first. With `Model: service`, DM qualify and book is usually the one. Recommend, never force.

Name the pack that answers their bottleneck, say why, and let them override. The rest of their snapshot stays as drafts until they want it.

## Step 3: write the copy

The snapshot is the plumbing. The copy is the founder's.

For the chosen snapshot, write every message it sends: emails with subject lines, DM replies, public comment replies and the words on any buttons. Write in the captured voice, matched to track.

Two rules that make the copy usable later. **No greeting inside a message body:** the workflow step writes the greeting and the first name above it. **Nothing in square or curly brackets:** the words in a slot are the same for everyone who receives that message, and anything about one person is merged by the step.

**Reuse what exists.** For the two DM snapshots, if `inbound-scripts.md` already holds the comment-to-DM or qualify-and-book copy, use that copy, fitted to the snapshot's steps, rather than writing a second version. Say so in the file.

**Placeholders in plain words.** The snapshot brings its own trigger, stages, tags and fields, and their exact names are only known once it loads at the clinic. Write personal details as plain placeholders, `[first name]`, `[business name]`, `[booking link]`, never merge-field code, and describe tags and stages in plain words. They are matched to the snapshot's own fields when it is loaded, and the values step takes the placeholders out, because the workflow step writes the greeting and the first name itself.

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

Most founders do not need this. If the founder does not clearly need it, do not raise it. If they do, note the requirement in the output file and flag it for one-to-one support rather than trying to solve it here.

## Step 5: export

Write `./growth-engine/ops-workflow.md` containing:
- the named bottleneck
- the chosen snapshot, and why
- all message copy
- the trigger, the timings, the exit condition and the tags
- any gap in the library, or n8n requirement, for a mentor

## Step 6: check and save

First add one line to the Decisions block of `growth-engine/memory.md`: `- YYYY-MM-DD ops workflow: <snapshot>, for <bottleneck in a few words>`.

1. **Check.** Use the `rules-reviewer` agent on `ops-workflow.md`. Give it every figure the founder gave in this conversation.
2. **Fix what it holds.** Ask about any held figure rather than guessing. Do this at most twice.
3. **Save.** Run `git add growth-engine` then `git commit -m "Operations engine: <snapshot>"`. Push if there is a remote. If the push fails, say it is saved on this computer.

## At the clinic

The founder brings this file to the clinic on 23 September and loads the snapshot. Loading brings every workflow and the empty name of every message slot, and none of the words.

The words go in next, as custom values, with `/growth-engine:values`, or by saying "fill my custom values". That step fills the Essentials slots every founder gets as well as the snapshot's own, so the copy written here is part of the list rather than all of it. Publishing and the first live test come after that, because a published pack with empty values sends blank emails to real people.

**Do not put this copy into their account yet, anywhere.** The snapshot brings the empty slots, and the values step fills them. An email template made now is a second copy that no workflow reads, and the founder ends up typing the same words twice.

Never create, change or switch on a workflow. The snapshot does that.

## Gate

- bottleneck named in one sentence
- snapshot chosen
- all copy written
