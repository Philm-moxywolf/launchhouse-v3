---
name: audience-b2c
description: Build the B2C audience engine. Defines who to reach, records 25 real target accounts, writes 25 manual DM openers the founder sends by hand, builds a hook bank with offer tests, and writes the inbound comment-to-DM and conversion scripts that run in GoHighLevel. Also records sends. B2C track only. Trigger on "build my audience engine", "instagram outreach", "DM scripts", "my hooks", "comment to DM", "I sent the DMs".
---

# Audience Engine, B2C

The B2C equivalent of the outreach engine, in two halves:
- **25 manual DMs**, sent live on the Saturday in Atlanta.
- **The inbound machine**, which keeps working afterwards.

**Who is reading.** A founder who does not use a terminal. Never ask them to run a command.

File shapes are in `../../references/contract.md`. Gate C for B2C is in `../../references/gates.md`.

## The line that does not move

Say this to the founder early, in roughly these words rather than your own.

**You send the first message yourself. All 25 of them, from your own app.** Instagram only opens a reply window once the other person has written to you. Anything that gets round that is working against the platform, and accounts doing it get restricted. There is no appeal desk.

That is not a limit to work around. It is the shape of the whole engine. The 25 go by hand, and the machinery sits on the other side, where somebody has already come to you.

**What counts as somebody coming to you:**
- They commented on a post.
- They replied to a story.
- They sent you a message.
- They used a keyword the founder asked for in a caption.

That is the whole list.

**What does not count:**
- A follow, a like, a story view, a profile visit.
- Being on a list the founder built.

None of those opens a window. Treating one as though it did is how a founder gets restricted while believing they were on the safe side.

So build the inbound side properly, and write the 25 as finished messages the founder taps send on. Do not design, recommend, or write copy for anything that reaches a stranger without the founder choosing that person, that message, that moment.

**If the founder asks to speed the 25 up,** they are asking a fair question and they are not trying to break anything. Do not lecture, and do not quote a rule at them. Say it in three lines, roughly like this:

> The first message has to come from you. That is Instagram's line, not ours.
> What we build instead is the part that starts the moment somebody comes to you. They comment, they reply, they write in, and the answer is already written and waiting.
> So Saturday is 25 by hand, and the rest of it keeps working after you put your phone down.

Then go straight to Step 5 and build it with them. A founder who gets a no and nothing else goes and asks somebody else.

## Prerequisites

1. **Check the folder.** Read the session context. If it says this is not the founder folder, stop and tell them which folder to open.
2. **Read the Brain.** Read `./growth-engine/founder-brain.md`.
   - If it genuinely does not exist, stop. Tell the founder the Founder Brain comes first (`/growth-engine:brain`, or "build my founder brain"), and do not proceed.
   - Do not ask them to describe their business again from scratch, and do not guess at their offer, audience or voice.
3. **Check the track.** If `Track` is not `b2c`, stop and route the founder to the outreach engine (`/growth-engine:outreach`).
4. **Check the Instagram account type.** Look in `growth-engine/.state/setup.md` first, then the Brain's Channels section and Flags. If it is still a personal account, tell them to convert to Business or Creator and link a Facebook Page before anything else works. It takes two minutes.
5. **Check what exists.** If the files already exist, ask whether they want more openers, to change the hooks or scripts, or to record sends. Go straight to that step.

## Step 1: targeting

Engagement-based, not firmographic. Build a list of 25 real accounts from:
- people who commented on a competitor's recent posts
- hashtag participants in their niche
- people who already engaged with the founder's own content
- local accounts, if the business is location-based
- followers of adjacent, non-competing accounts

Write the method as a repeatable instruction, not a one-off list. The founder builds the 25 in about an hour.

**As they give you each account,** record it as a person file in `growth-engine/people/`, named by the slug of `ig:<handle>`, in the target shape in the contract:
- `kind: target`
- `status: target`
- `platform: ig`
- `handle` without the `@`
- `source: manual`
- `created`: today
- what they told you about the account, as a note line with where they saw it

These files hold real people's details and stay out of git.

## Step 2: 25 DM openers

One per target account, sent by hand from the founder's own app on the Saturday.

**Rules:**
- Reference something actually specific to that account: a post, a comment, a bio detail.
- Two sentences maximum. Long DMs do not get read.
- No pitch in the first message. The goal is a reply, not a sale.
- No mass-personalisation tells. If it reads like a template with a name swapped, rewrite it.
- Written in the founder's captured voice.

**Write them in batches of 5,** so the founder can check quality as it goes. Ask them to paste in the account handle plus whatever detail they have. Batches are how the 25 get written. They still go out one at a time, on the day, in the founder's own app.

For each opener:
- write it into the Opener block of that person's file
- set their status to `opener_written`

**Output** to `./growth-engine/dm-openers.md`, numbered 1 to 25, with the target handle against each.

**Pacing warning, which goes in the output file:** 25 DMs fired in a rapid burst can trigger Instagram action blocks, especially on younger or low-activity accounts. Send them spread across the Saturday afternoon, a few at a time with gaps, from an account that has been used normally in the weeks before. Never race through the list.

## Step 3: hook bank

30 hooks for short-form content and DM openers, categorised: curiosity, contrarian, result, mistake, question, story open.

Hooks do more work per word than anything else a B2C founder writes. Spend real effort here.

**The result category is the one that goes wrong.**
- A result hook is built from a result the Brain records, in the founder's own words, or it is not written.
- If the Brain has no results yet, write more mistake hooks and more story-open hooks instead, and tell the founder that is what you did and why.
- Never build a hook around a number the founder did not give you, however modest it sounds. The modest ones are the ones that get published.

**Output** to `./growth-engine/hook-bank.md`, under the six category headings in the contract.

## Step 4: offer tests

Write three variants of how the offer is framed, to test against each other: a different angle, not different wording. Note what each one is testing.

Add them to `./growth-engine/hook-bank.md` under an `## Offer tests` heading, so the hook bank and the offer tests travel as one file.

## Step 5: the inbound machine

This is where the automation lives, and it is fully sanctioned.

**Every flow here starts with something the other person did.** If you cannot name that thing in one short phrase, the flow is not inbound and does not get written.

**Comment-to-DM.** The founder posts, the caption invites a comment keyword, and Instagram fires an automatic DM because the user initiated. Write the trigger keyword, the auto-DM message, and the follow-up.

**DM qualify and book.** A short conversation flow that qualifies the inbound and routes to a booking link or product page. Three or four steps, no interrogation.

**Link in bio.** A GoHighLevel form or calendar destination.

**Cap the follow-up.** One follow-up, then stop. If they do not reply to the first message and do not reply to the follow-up, the conversation is over and nothing more goes out. Write the stop into the copy, because a flow with no exit carries on at somebody who has already decided.

**Copy only.** Write the copy for each flow. The workflow itself is a GoHighLevel snapshot loaded at the clinic on 23 September, so do not attempt to build automation here.

### Name the trigger in every label, not just the first one

Write "Reply, sent when they comment:" above each piece of copy, every time. Never use a bare label that says only that a machine sends it.

Two reasons, and the first is the one that matters to the founder:
1. Every message in this file goes out only because somebody did something first. A label that says so is the difference between a flow they can check and a flow they have to take on trust. A reader scanning the file should be able to see, at each step, what opened the window.
2. The practical one. A label that does not name the trigger reads as the thing rule 2 refuses, and the Launchhouse checks will hold the file. Naming the trigger is not a workaround. It is the sentence being accurate about what it describes.

**Output** to `./growth-engine/inbound-scripts.md`.

## Step 6: check and save

1. **Check.** Use the `rules-reviewer` agent on `dm-openers.md`, `hook-bank.md` and `inbound-scripts.md`. Give it every figure the founder gave in this conversation.
2. **Fix what it holds.** Ask about any held figure rather than guessing. Do this at most twice, then show the founder anything still held.
3. **Save.** Run `git add growth-engine` then `git commit -m "Audience engine: openers, hooks and inbound scripts"`. Person files stay out of git by design. If there is a remote, run `git push`. If the push fails, say the work is saved on this computer.

## Recording the sends

The 25 go out by hand on the Saturday in Atlanta. If the founder records sends before then, check in one line that these are real messages sent, not ones they are planning.

When the founder says they have sent an opener:
1. Add a touch line to that person's file: `- YYYY-MM-DD dm out: sent the opener`.
2. Set their status to `sent`.
3. Add a result line to `ops-log.md`, for example `- 15:40 result: 8 openers sent by hand`.
4. Save: `git add growth-engine` and `git commit -m "Recorded sends"`. Person files stay out of git, so the ops log line is the record GitHub keeps.

When someone replies, set them to `replied`. When they book, set them to `booked`.

**Never** suggest sending more than 25, or sending them faster.

## Gate

Gate C for B2C, from `../../references/gates.md`:
- 25 target accounts recorded
- 25 DM openers written
- hook bank complete, with offer tests
- inbound scripts written
- the operations workflow built (`/growth-engine:ops`)
- Instagram converted to Business or Creator, linked to a Facebook Page

The 25 sends happen at the event, so they are not part of Gate C. Tell the founder which items are done and which one to do next.
