---
name: outreach-b2b
description: Build the B2B outreach engine. Chooses how the 25 messages will be sent, turns the ICP into Apollo search criteria, writes a four to five touch sequence in the founder's voice, records the list of 25, and writes a personalised first line for every person on it. B2B track only. Trigger on "build my outreach", "write my sequence", "apollo filters", "cold email", "first lines", "I sent the emails", or Session 2 homework for B2B founders.
---

# Outreach Engine, B2B

Produces the sequence and the 25 personalised messages sent live on the Saturday in Atlanta.

**Who is reading.** A founder who does not use a terminal. Never ask them to run a command.

File shapes are in `../../references/contract.md`. Gate C for B2B is in `../../references/gates.md`.

## Prerequisites

1. **Check the folder.** Read the session context. If it says this is not the founder folder, stop and tell them which folder to open.
2. **Read the Brain.** Read `./growth-engine/founder-brain.md`.
   - If it genuinely does not exist, stop. Tell the founder the Founder Brain comes first (`/growth-engine:brain`, or "build my founder brain"), and do not proceed.
   - Do not ask them to describe their business again from scratch, and do not guess at their offer, audience or voice. Everything this skill produces is only as good as the Brain behind it.
3. **Check the track.** If `Track` is not `b2b`, stop and route the founder to the audience engine (`/growth-engine:audience`). Do not run a B2B sequence for a B2C founder.
4. **Check what exists.** If `outreach-sequence.md` already exists, ask whether they want to change the sequence, add to the list, write more first lines, or record sends. Go straight to that step.

## Step 0: what is going to send this

Decide this before writing a word, because it changes the merge variables and the export. The Brain's Channels section may already record it. If it does, confirm it in one line rather than asking again.

Ask one question: **is their work email on Google (Gmail or Google Workspace), or on Microsoft 365, or something else?**

### If Google

They build the list and send from Apollo.
- Apollo does not run its own mail servers. Every message leaves through their own connected mailbox, by a two-minute sign-in, so their domain carries the reputation either way.
- Sequences handle the follow-up touches, and stop-on-reply is on by default, which is the whole reason to use a sequencer at this volume.

### If Microsoft 365 or anything else

They send by hand from their own mailbox, and schedule the follow-ups with their mail app's own scheduled send.

This is a real route, not a consolation. At 25 messages it meets the promise completely, costs nothing, needs no new account, and replies land where they already read email.

Record the answer in the output file. Nobody chooses twice.

### On the cost, and get this the right way round

The free Apollo plan connects in full, so connecting Claude to it costs nothing. The 65 USD/month plan is what carries real sending: credits, sending limits and mailboxes. The programme sets it up in Session 2, with sending.

Say it that way round. Telling a founder they need the plan to connect is not true. They will find that out, and every other number in this programme is worth less to them afterwards.

They are already carrying Claude, a domain and GoHighLevel at 97 USD. A founder who says the total is too much is doing arithmetic rather than hesitating, and arguing is how this skill loses them. That founder takes the manual route, which is real and meets the promise at 25 messages.

**On the manual route, schedule two touches at a time, never all four.** If someone replies, there are only two things to cancel, and cancelling is the job people forget.

## Step 1: list criteria

Convert the ICP into filters a founder can type into Apollo.

Output the criteria as a plain list they can copy:
- industry
- headcount band
- revenue band
- geography
- job titles
- seniority
- any technology or keyword filters that indicate the trigger event

Give three variants:
- **Tight:** the best-fit list, which may be small.
- **Medium.**
- **Broad:** the fallback if tight returns under 100 results.

**Build to 35, then cut to 25.** Some rows will be wrong: the person left, the address bounces, the company is not a fit on a second look. Topping up a list under time pressure on the Saturday is how founders end up messaging people they have not read.

Tell them to verify emails before sending. An unverified list destroys domain reputation faster than bad copy.

## Step 2: sequence

Four to five touches over two to three weeks.

- **Touch 1: the opener.** Specific to them, one clear reason for the message, one low-friction ask.
- **Touch 2: proof.** A result or case relevant to their situation, taken from the Brain's Proof section and from nowhere else.
- **Touch 3:** a different angle on the same problem.
- **Touch 4:** a short, direct close.
- **Touch 5, optional:** the break-up.

**Rules that are not negotiable:**
- Under 120 words per touch. Shorter converts.
- One ask per message.
- A subject line on touch 1. For each later touch, a decision on whether it replies in the same thread or starts a new one. Same thread is the default.
- A wait interval stated between every touch. Three to four working days is the normal spacing across two to three weeks.
- **A plain opt-out line in the body of every touch.** One sentence, in their own words, for example "if this is not for you, say so and I will leave you alone". Do not rely on a tool's unsubscribe link: the free plan may not have one, and at this volume a human sentence reads better anyway. This is not optional. It is what the law expects and what a real person deserves.
- Written in the founder's captured voice, not in generic sales English.
- No fake familiarity, no invented compliments, no "I noticed you..." unless it is genuinely specific.

### Merge variables

**On the Apollo route only.**
- Apollo uses `{{contact.first_name}}` and `{{account.name}}`. The older `{{first_name}}` and `{{company}}` still work.
- The personalised opening line is not one of those. It is a custom field on the contact called `first_line`, holding a different sentence for every person, written into touch 1 as `{{first_line}}`. So the sequence has one body, and each recipient reads a line written for them.

**On the manual route there are no merge variables at all.** Write all 25 messages out in full, finished, with the name and detail already in the text. There is nothing to substitute and nothing to go wrong.

### Stop on reply

- **In Apollo** this is on by default, as is pausing on an out of office. Confirm it is on rather than assuming.
- **On the manual route** this is the founder's job, and it is the single thing most likely to be forgotten three weeks after the event.

### Claims

**Never write a claim the Brain does not support, and never write a number the founder did not give you.**

If the Proof section is thin, touch 2 is still touch 2. Write it from one of these instead, in this order:
1. The one named case they do have, in the detail they gave you.
2. What they have seen across the jobs they have done. The fault that turns up again and again, the thing every owner says in the first meeting.
3. The step they take that the cheaper option skips. That is method, and it needs no number at all.

A specific observation about the reader's own world reads as true. A number nobody gave you can be checked, and in a trade this size somebody will check it.

**Never promise replies**, anywhere in the sequence or in anything you say about it. Replies depend on list quality, timing and offer.

## Step 3: the list

### Where the list comes from

- **On the Apollo route, with Apollo connected,** the founder can have the search run and the addresses filled in with `/growth-engine:sequence`, and the list arrives without anybody typing it. If they take that:
  1. First write `./growth-engine/outreach-sequence.md` as in Step 6, with the route, the criteria and the sequence, because that skill builds from it.
  2. Run Step 7 on it.
  3. Hand over to `/growth-engine:sequence`. It builds the list, writes the first lines to the same rules as Step 4 below, and loads everything paused.
- **Otherwise** they run the search in Apollo themselves, or use their own contacts, and paste the leads in. Take whatever they have: name, email, company, job title, and anything specific about them.

### Record each person

Write one file per person in `growth-engine/people/`, named by the slug of their email address, in the prospect shape in the contract:
- `kind: prospect`
- `status: candidate`
- `source`: `apollo` when it came through the Apollo connector, `import` for a list they pasted or exported from somewhere, `manual` for people they typed in one by one
- `created`: today
- `email`, `first_name`, `company`, `title` when known
- anything specific about them as note lines, with where it came from

These files hold real people's details. They are kept out of git on purpose and never pasted anywhere public.

### Build to 35, cut to 25

When there are more than 25, go through them with the founder. Set the ones they drop to `status: cut`, and keep a one-line reason as a note. Never delete a person file.

## Step 4: first lines

For each person not at `cut`, write one opening line specific to that company or that person.

**Generate from the actual detail:** company name, website copy, a recent post, a job ad, a news item. If there is nothing specific, tell the founder which people you had nothing on, and write their line from the segment rather than fabricating a detail. **A generic honest line beats an invented specific one.**

**Work in batches of 5 to 10**, so the founder can check quality as it goes. For each person, write the line inside the Opener block of their person file.

## Step 5: deliverability brief

Cover this even though it is not copy, because it decides whether any of it works.

- **Volume.** 25 messages is low volume. At this scale, authentication matters more than warmup duration.
- **Authentication.** SPF, DKIM and DMARC must all be configured. Without them, mail gets filtered no matter how old the domain is.
- **Domain.** An existing domain with real sending history is still better than a fresh one. Use it if they have it.
- **Fresh domains.** On a fresh domain, sending ten to twenty normal messages a day in the weeks beforehand is sufficient at this volume.
- **Verify.** Verify every email before sending. An unverified list does more damage than a cold domain.
- **Replies.** Never promise replies. Replies depend on list quality, timing and offer, none of which are guaranteed.
- **Tracking.** Turn open and click tracking off. Tracking pixels and rewritten links are a spam signal, and at 25 messages the data is worth nothing.
- **The subdomain question. Say this plainly, once.** Best practice for high-volume cold email is to send from a separate outreach subdomain, never the main company domain. This programme sends from the main domain on purpose, because 25 authenticated, genuinely personalised messages with an opt-out line carry low risk, and setting up a second domain properly is more work than the runway allows. The risk is low. It is not zero. The founder should know that rather than find out.

## Step 6: export

Write `./growth-engine/outreach-sequence.md` containing:
- the route chosen in Step 0
- the three list criteria
- the full sequence, with subject lines, wait intervals and the opt-out line in every touch
- the merge variables, on the Apollo route only
- the deliverability brief from Step 5, under `## Before you send`

Write `./growth-engine/outreach-firstlines.csv`:
- columns `email`, `first_name`, `company`, `first_line`
- one row per person not at `cut`, in list order
- `first_line` holds the line from their Opener block
- quote any field holding a comma or a quote

**Name it `first_line`, not anything generic,** so the CSV column, the Apollo custom field and the variable in the sequence all read the same. A mismatch here fails silently and takes the most valuable output of this skill with it.

## Step 7: check and save

1. **Check.** Use the `rules-reviewer` agent on `outreach-sequence.md` and `outreach-firstlines.csv`. Give it every figure the founder gave in this conversation.
2. **Fix what it holds.** Ask about any held figure rather than guessing. Do this at most twice, then show the founder what is still held.
3. **Save.** Run `git add growth-engine` then `git commit -m "Outreach engine: sequence and first lines"`. Person files stay out of git by design. If there is a remote, run `git push`. If the push fails, say the work is saved on this computer.

## Sending it

### On the Apollo route

`/growth-engine:sequence` builds the sequence in their Apollo account, with the copy and first lines already in it, **paused**. Starting it is a button they press in Apollo, having read the messages. Nothing sends before that, and nothing here can make it.

### On the manual route

The CSV is a checklist, not an import. It is the founder's running sheet for the Saturday: who, what the opening line is, and what has gone.

When they say they have sent to someone:
- set that person's `status` to `contacted_ok`
- add a touch line `- YYYY-MM-DD email out: sent touch 1`
- add a result line to `ops-log.md`
- save: `git add growth-engine` and `git commit -m "Recorded sends"`. Person files stay out of git, so the ops log line is the record GitHub keeps.

When someone replies, set them to `replied` and remind the founder to cancel that person's scheduled follow-ups.

### Never GoHighLevel

This is a cold list, so it never goes into GoHighLevel's email tool. GoHighLevel is the CRM and the publisher for this programme. It is not the cold sender.

## Gate

Gate C for B2B, from `../../references/gates.md`:
- the route is chosen and the sequence written, with an opt-out line in every touch
- the list criteria are written down, tight, medium and broad
- the list is built: 25 prospects not at `cut`
- first lines exist for the 25
- the operations workflow is built (`/growth-engine:ops`)
- domain set up and sending started, which the founder confirms

Tell the founder which of these are done and which one to do next.
