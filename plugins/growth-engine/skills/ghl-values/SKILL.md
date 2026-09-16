---
name: ghl-values
description: Fill the GoHighLevel custom values a loaded snapshot arrives with empty, in the founder's own voice, from their Brain and the copy their engines already wrote, then put them into their account by hand or over the API. Both tracks. Trigger on "fill my custom values", "my snapshot emails are blank", "write my GoHighLevel copy", "finish setting up my snapshot", "what goes in custom values", or "my workflow sent a blank email".
---

# GoHighLevel values

A loaded snapshot arrives with every workflow built and every message empty. Only the names of the slots travel, never the words in them. Until the words are in, the workflows send blank emails to real people.

This turns the copy the founder already wrote into the exact list their account is waiting for, and gets it in.

**It never builds a workflow, creates a tag, creates a pipeline or sends anything.** All of that arrives with the snapshot.

**Who is reading.** A founder who does not use a terminal. Never ask them to run a command.

**Order matters.** The snapshot is loaded first, at the clinic on 23 September. Loading brings the value names. Filling them comes after, and publishing comes after that. If they have not loaded yet, say so plainly, then offer to write the words now so the paste takes minutes on the day.

## Prerequisites

1. **Check the folder.** Read the session context. If it says this is not the founder folder, stop and tell them which folder to open.
2. **Read the Brain.** Read `./growth-engine/founder-brain.md`.
   - If it genuinely does not exist, stop. Tell the founder the Founder Brain comes first (`/growth-engine:brain`, or "build my founder brain"), and do not proceed.
   - Do not ask them to describe their business again from scratch, and do not guess at their offer, audience or voice.
3. **Read `./growth-engine/ops-workflow.md`.** It names the snapshot they chose and holds the copy already written for it. Reuse that copy rather than writing a second version of the same email.
   - If it does not exist, build the operations engine first (`/growth-engine:ops`, or "build my ops engine"). The snapshot choice lives there.
4. **Check for existing values.** If `ghl-values.md` already exists, ask whether they want to change the words or start again, and go straight there.

## Step 1: name the two lists

A founder fills the `Essentials` list for their track, plus the list for the **one snapshot** they loaded. Nothing else. The full lists, with every name, key and what belongs in it, are in `references/values.md`.

| Track | Always | Plus one of |
|---|---|---|
| B2B | `Essentials`, 11 values | `Lead follow-up` 6, `Discovery booking` 11, `Proposal chase` 6 |
| B2C | `Essentials`, 11 values | `Comment to DM` 7, `DM qualify and book` 10, `Review request` 0 |

So a founder has between 11 and 22 values. In each `Essentials` list, 9 of the 11 must be filled before anything is published: the two client or customer welcome values are only needed if they switch that pair of workflows on.

`Review request` has no custom values at all. Its two emails live in the review templates at `Reputation`, then the `Settings` tab, then the email request settings, then `Set Email Templates`. Send them there and say why, or they will hunt for values that do not exist.

Confirm the pair in one line before writing: "You loaded Essentials plus Discovery booking, so that is 11 plus 11. Right?" If they do not know which snapshot they have, `ops-workflow.md` names it, and `Automation`, then `Workflows` shows the folder names.

## Step 2: use what they already wrote

Their voice is on paper already. Take it from there rather than inventing a second voice.

| File | What to take from it |
|---|---|
| `ops-workflow.md` | The snapshot they chose, and every message already written for it |
| `content-30.md` | Their 30 pieces: the clearest sample of how they actually write |
| `outreach-sequence.md` | B2B: the subject lines and angles they already send |
| `hook-bank.md` | B2C: hooks worth reworking into subject lines |
| `dm-openers.md` | B2C: how they open a conversation |
| `inbound-scripts.md` | B2C: their comment and DM wording, for the two Instagram snapshots |
| `90-day-plan.md` | What they are pushing this quarter, so the ask matches |

Two rules when files disagree. **The Brain wins on voice and on what may be claimed.** A post naming a number the Brain does not record does not license that number here. **The list in `references/values.md` decides what exists.** Copy written before the snapshot was picked can hold a message with nowhere to go. Leave those out and say plainly which ones, and why.

## Step 3: ask only what nothing answers

Never ask for something the Brain or their files already say. After reading everything there are usually four gaps at most. Ask them together, in one message:

1. The one word every email opens with: Hi, Hey, Hello or Good morning.
2. What actually happens after someone enquires, and how fast. The welcome email promises this, so it has to be true.
3. How they sign off, and the name they sign with.
4. `Discovery booking` only: what a call with them is like, and their booking link, copied from their own `Discovery call` calendar with `Share`, then `Copy Link`.

## Step 4: write the words

- Their voice from the Brain and their own posts. Short sentences. No em dashes or en dashes, and none of the sales words the house style rules out.
- **Never invent proof.** No numbers, results, customer counts or testimonials the Brain does not record. Thin proof means writing from point of view and observation instead.
- **No greeting inside a body.** The step writes the greeting word and their first name above it. A greeting in the words gives every reader two.
- **Nothing in curly or square brackets, anywhere in a value.** No `[first name]`, no merge field code. `ops-workflow.md` is written with plain placeholders like `[first name]` on purpose; this is where those come out, because the step supplies the name and a value holds only the words that are the same for everyone.
- **The Instagram values carry no name at all.** Outside email there is no fallback, so a missing name sends a blank.
- Subjects are a few plain words that read correctly with no name in them.
- **Length comes from the row in `references/values.md`, not from habit.** Write the paragraphs or sentences that row asks for, with a blank line between paragraphs. Where a row names no length, an email body is two to four short sentences and an Instagram message is one or two, well under the 640 characters Meta allows.
- A message carrying a link leaves the link out of the words: the step puts it on its own line underneath.
- The last message of any chase says plainly that it is the last one.
- Every value goes to everyone who gets that message, so write each one to read correctly for all of them.

## Step 5: write the file

Write `./growth-engine/ghl-values.md`, grouped by pack.

The one line values, which are the greeting, every subject, every button, every link and any Instagram message that is one line, go in a table:

| Value | Key | Words |

Everything longer than one line, which is every email body and any longer Instagram message, gets its own heading instead, so the paragraph breaks survive and they can copy it straight out:

```
### Welcome Email Body
`welcome_email_body`

<the words, with their blank lines, exactly as they go into the value>
```

Then two short sections:

- **The contact fields**, which are not copy and are never pasted. `Enquiry message` holds what the person typed on the form. `Personal line` holds a sentence or two written for one person, which the founder or Claude fills later on that contact. `Work done` arrives with `Review request` only, and the founder types it once a job is finished.
- **What was left out**, if anything, and why.

## Step 6: check and save

First add one line to the Decisions block of `growth-engine/memory.md`: `- YYYY-MM-DD ghl values: <count> written for <snapshot>`.

1. **Check.** Use the `rules-reviewer` agent on `ghl-values.md`. Give it every figure the founder gave in this conversation.
2. **Fix what it holds.** Ask about any held figure rather than guessing. Do this at most twice.
3. **Save.** Run `git add growth-engine` then `git commit -m "GoHighLevel values: <snapshot>"`. Push if there is a remote. If the push fails, say it is saved on this computer.

## Step 7: put them into GoHighLevel

**Their GoHighLevel connector cannot do this part.** It reads an account and posts content. It has no custom values tool at all, so do not send them round that loop looking for one.

**By hand, which is the normal way.** In their sub-account, open `Settings`, then `Custom Values`. Every name is already there, waiting, because the snapshot brought it. They open each one, paste the words from `ghl-values.md`, and save. Around fifteen minutes for twenty values. Read the names out one at a time if that helps, and keep their place.

**Change the words only, never the name.** GoHighLevel builds the key from the name when the value is made. Rename one later and every step using it goes blank.

**Over the API, only if they would rather.** By hand is the route to recommend. This one is for a founder who is comfortable with it, and it needs a Private Integration Token, which they make themselves, in their own sub-account, at `Settings`, then `Private Integrations`, ticking the custom values scopes and nothing else. Before they decide, say that the token is a password for their whole account and that it stops working 90 days after they make it. Offer it once, never insist, and never make it sound like the real way.

If they choose it:
- **How the token reaches you.** Ask them to put it in a plain text file outside their Launchhouse folder, their Documents folder is fine, and to tell you where it is. Check the path really is outside that folder before using it: a save runs `git add -A`, so a token left inside would reach GitHub. The command reads that file itself, so you write the path and never the token, building the header as `"Authorization: Bearer $(cat <path>)"`. Never open or print that file yourself, because anything you read lands in this conversation. Never ask them to type or paste the token into the chat, and never repeat it back.
- **Never write it down and never print it.** Not in any file in their folder, not in `ghl-values.md`, `memory.md` or `ops-log.md`, not in a command you write out, and not in anything that reaches GitHub.
- **Read what is in the account first, then ask.** Their sub-account id is in the address bar after `/location/`. Show the whole list before anything is written: every value you are about to create, every one you are about to change, what each of those holds now, and which of them already hold words they did not write. Wait for a yes. That one yes covers every create and change on the list you showed, and nothing else.
- **Only the two lists.** Never touch a value that is not on them, never delete one, and never write to a contact, a workflow, a tag or anything else in their account.
- Create the ones that are missing and update the ones that are there. Creating a name twice fails rather than replacing it.
- The endpoint is `https://services.leadconnectorhq.com/locations/<id>/customValues`, with a `Version: 2021-07-28` header.
- **Delete the token with them before you close the job, whether it worked or not.** If they stop part way, a write fails, or they change their mind after making it, delete it then. Send them to `Settings`, then `Private Integrations`, and wait until they say it is gone. Then delete the file they put it in, and say so.

## Step 8: prove it landed

Show them all four:

1. Every value on their two lists exists in the account.
2. None is empty.
3. None still says PLACEHOLDER, and none holds a square or curly bracket.
4. The name of each value is unchanged, so the key the steps use still matches.

Then one live test: send themselves the real trigger, from their own second email address, and read what arrives. A blank where words should be means that value is still empty. Curly brackets in an email mean a value was renamed.

**Publishing comes after this, not before.** Drafts never run, so the test only proves anything once the pack is published, and a published pack with empty values sends blanks to real people. Fill first, publish, then test.

## Gate

- the two lists named, and confirmed with them
- every value on those lists written in their voice, none holding a bracket or a greeting
- `ghl-values.md` saved
- the account filled, checked on all four counts, and one live test read back
