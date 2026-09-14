---
name: growth-plan
description: Write the 90 day growth plan that sequences the founder's engines into one connected revenue play, with one number, weekly actions, Monday morning's first three actions, and kill criteria. Built in Atlanta on the Sunday. Trigger on "build my 90 day plan", "growth plan", "what do I do Monday", or the Sunday Growth System Workshop.
---

# 90 Day Growth Plan

The Sunday deliverable. It sequences everything built over the weekend into one plan the founder can carry out from Monday.

**Who is reading.** A founder who does not use a terminal. Never ask them to run a command.

## Prerequisites

1. **Check the folder.** Read the session context. If it says this is not the founder folder, stop and tell them which folder to open.
2. **Read the files that exist:**
   - `./growth-engine/founder-brain.md`, especially Goal and Numbers
   - `./growth-engine/content-30.md` and `./growth-engine/ledger.md`
   - B2B: `./growth-engine/outreach-sequence.md`
   - B2C: `./growth-engine/dm-openers.md`, `./growth-engine/hook-bank.md` and `./growth-engine/inbound-scripts.md`
   - `./growth-engine/ops-workflow.md`
   - the What worked and What did not blocks in `./growth-engine/memory.md`, and the last two weeks of `./growth-engine/ops-log.md`
   - `./growth-engine/.state/setup.md`, which says what is actually connected
3. **If the Brain is missing,** stop. Tell the founder the Founder Brain comes first (`/growth-engine:brain`). There is no plan to build without it.
4. **If the Brain exists but engine files are missing,** build the plan from what exists and note the gaps honestly. Do not pretend an engine is running when it is not.
5. **Read the track.**
   - A B2B plan sequences the sequence, the list and the sending.
   - A B2C plan sequences the DMs, the hooks and the inbound machine.
   - Never put the other track's work in a founder's plan.

## Structure

**The one number.** One primary metric for 90 days, derived from the Brain's stated goal. Not a vanity metric. Something that moves revenue.

**Days 1 to 30.** Get all three engines running consistently. Weekly actions, specific and small enough to actually happen.

**Days 31 to 60.** Volume and iteration: what gets tested, and what gets measured. On the B2C track, volume never means more first messages a day. It means more posts, more hooks, and more of the inbound side switched on. On the B2B track, it means another 25 to a list built and read the same way, not a volume machine.

**Days 61 to 90.** Double down or cut, based on the data.

**Monday morning.** The first three actions, in order, with time estimates. This is the most important section. Most plans die because nobody knows what to do first.

**Kill criteria.** What result at day 30 means stop. Founders never write these, and it is why they persist with things that are not working. Push for a real number.

**Realistic numbers.** Base projections on their actual list size, audience size and conversion assumptions. Do not use the marketing numbers from the landing page. If the maths says a modest outcome, say so.

Every number in this plan is either one the founder gave you, or an assumption:
- **Label assumptions** in the text, with the word assume.
- **Show the arithmetic** in one line, so they can change an input and see what moves.
- **Never project replies** as a promise. A reply rate is an assumption, labelled, with the arithmetic.

A projection that does not say it is a projection becomes a fact the moment it gets pasted somewhere else.

## Output

Write `./growth-engine/90-day-plan.md`.

Keep it to two pages. A plan nobody reads is not a plan.

## Check and save

1. **Record the number.** Add one line to the Decisions block of `memory.md`: `- YYYY-MM-DD 90 day number: <the number>`.
2. **Check.** Use the `rules-reviewer` agent on `90-day-plan.md`. Give it every figure the founder gave in this conversation. Assumptions labelled with the word assume are not claims.
3. **Fix what it holds.** Ask about held figures. Do this at most twice.
4. **Save.** Run `git add growth-engine` then `git commit -m "90 day plan"`. Push if there is a remote.

## Pressure test

The founder presents this in the Sunday pressure-test session. Prepare them for three questions:
1. Is the number realistic?
2. What happens if it does not work?
3. What is the first thing you do Monday?

Offer the `monday-plan` routine (`/growth-engine:routines`), which drafts each week's three actions from this plan.
