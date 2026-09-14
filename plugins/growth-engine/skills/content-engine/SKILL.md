---
name: content-engine
description: Build the content engine. Defines content pillars from the Founder Brain, then writes 30 posts (B2B) or 30 short-form scripts, carousels and captions (B2C) in the founder's captured voice, as a file to read, a sheet for publishing, and a ledger of what is approved. Also refills it monthly and records approvals. Trigger on "build my content engine", "generate my posts", "write my content", "content pillars", "my 30 posts", "refill my content", "approve pieces".
---

# Content Engine

Produces the 30 pieces of content each founder publishes before Atlanta, and keeps it refilling afterwards.

**Who is reading.** A founder who does not use a terminal. Never ask them to run a command.

The shapes of every file this writes are in `../../references/contract.md`, relative to this skill. The gate it feeds is Gate B in `../../references/gates.md`.

## Prerequisites

1. **Check the folder.** Read the session context. If it says this is not the founder folder, stop and tell them which folder to open.
2. **Read the Brain.** Read `./growth-engine/founder-brain.md`.
   - If it genuinely does not exist, stop. Tell the founder the Founder Brain comes first, and offer `/growth-engine:brain` or "build my founder brain". Do not guess at their business or voice.
3. **Read the track.** Read the `Track` line. Everything below branches on it. If there is no track, stop and send them to the Founder Brain to finish it.
4. **Check the voice.** If `## Voice` in the Brain is missing or nearly empty, stop. Thirty pieces without a voice read like anybody's. Offer to capture the voice first with the Founder Brain, in update mode.
5. **Check for writing samples.** If `growth-engine/voice-samples/` has files, read them. They are the founder's own writing and the best guide to how they sound.
   - If it is empty and the Brain's voice came from an interview, carry on.
   - If they mention they have old posts or emails, suggest adding them first (`/growth-engine:add-files`), because it takes five minutes and makes all 30 sound more like them.

If `content-30.md` already exists, this is **refill mode** or **approval**. Go to "Refill mode" or "Approving pieces" below, as fits what they asked.

## Step 1: pillars

Propose four content pillars from the Brain. Pillars are the recurring themes the founder can write about indefinitely without repeating themselves.

Derive them from proof, offer, audience pain, and point of view. Do not use generic marketing pillars.

**B2B pillars** typically land on: the problem the market misdiagnoses, proof and results, how the work actually gets done, and a contrarian position on the industry.

**B2C pillars** typically land on: transformation and outcome, behind the scenes, education against a common mistake, and social proof.

**If the Brain says proof is thin, the proof pillar becomes something else.** Not a thinner version of itself, because a thin proof pillar is where numbers get made up to fill it.
- **On B2B** it becomes what they see go wrong on jobs: the faults, the shortcuts and the misunderstandings they meet, in the detail nobody outside the trade would know. That keeps it apart from the "how the work gets done" pillar, which is about their own method.
- **On B2C** it becomes the founder's own story and what they watch go wrong.

Both are true, both are theirs, and neither needs a number.

Show the four with a one-line rationale each. Let the founder cut or swap. Four is the number. Fewer gets repetitive, more gets thin.

When they agree, add one line to the Decisions block of `growth-engine/memory.md`: `- YYYY-MM-DD content pillars: <the four, short>`.

## Step 2: what they can actually post

**Ask before you write, and ask once.** A founder gets 30 pieces they cannot publish if you plan a shot list they never agreed to.

Say it plainly: what clips and photos have you got, and where are they? They were asked to collect them from Session 1, and to move them into their GoHighLevel Media Library once GoHighLevel is set up in Session 2, so ask about both places. What each track was asked to collect is in `../../references/media.md`. If they have things elsewhere, or nothing, take that answer and carry on.

Hold on to the answer. Step 4 uses it.

## Step 3: generate

30 pieces, distributed across the four pillars, weighted toward whichever pillar has the most proof behind it.

### If track is b2b

Format mix, 30 in all:
- 20 short posts, 80 to 150 words, for LinkedIn and X
- 6 longer posts, 200 to 300 words, for LinkedIn
- 4 posts with a soft call to action, 80 to 150 words, for LinkedIn

Each post has:
- a specific opening line that earns the second line
- one idea
- concrete detail from their proof
- no generic advice

If the Brain flagged thin proof, lean on point of view and observation rather than inventing results. **Never invent numbers, customers, or outcomes.**

**If the Brain says little about how they actually work,** ask before writing the method pieces: "walk me through what you do on a typical job, step by step". One answer gives you ten posts. Never make up how a named customer's job went, or what happened inside their business.

### If track is b2c

Format mix:
- 15 short-form video scripts, 20 to 40 seconds, with a hook in the first three seconds
- 8 carousel or multi-frame outlines, frame by frame
- 7 single-image captions

**Scripts need a spoken hook, not a written one.** Read them aloud in your head. If the first line does not stop a scroll, rewrite it.

Include the on-screen text separately from the spoken line where they differ.

### Both tracks

Write in the voice captured in the Brain, including the verbatim phrases. Vary opening structure across the 30. Nothing should read as templated.

**Numbers.** Every number that says something happened has to be one the founder gave you. That covers:
- counts of dogs, weddings, kitchens, boilers, meals, sessions, callouts, customers or jobs
- money
- percentages
- a before and an after

If it is in the Brain, use it exactly as they said it. If it is not in the Brain, do not reach for one.

There is always something to write instead, and it is usually the better post:
- **What they have seen.** The fault that turns up job after job. The question every customer asks before anything else.
- **What they do differently.** The step they take that the cheap option skips. That is method, and method needs no number.
- **What they think.** A position they will defend out loud.
- **What one real customer said**, if the Brain records it, in that customer's own words.

For example, "We have groomed over 500 dogs" is a number nobody gave you. "Most of the dogs I see for the first time have not been brushed out properly in months, and the owner has no idea" is true, it is theirs, and it is the stronger post.

If a piece genuinely needs a number, stop and ask the founder for it in one question. Asking is quick. A number they have to correct after it is published is not. Keep a note of every figure they give you in this conversation, quoted as they said it, because the reviewer needs them.

### Batches

Generate in batches of 10, and check in with the founder between batches. Thirty in one dump is unreviewable, and the founder will approve it without reading.

**Batch 1**
1. Write the first 10 into `growth-engine/content-30.md`, in the shape in the contract: pillar headings, numbered piece headings with the format labelled.
2. Use the `voice-reviewer` agent on these 10.
3. If it says they do not sound like the founder, fix the pattern before writing more. Say what you changed in one line.

**Batches 2 and 3** go into the same file.

If a write is held by the Launchhouse checks, the message names the line and why. Fix that line and write again. Never argue with a hold and never tell the founder about it in technical terms.

## Step 4: media, marked honestly

Use the answer from Step 2.

**Write all 30 either way. Never write fewer.** A short file hides the problem: it looks finished, and they find out in September that half their month is missing. Thirty pieces with a count on the top is a plan they can act on. Twenty two is a plan that lies.

**Put the count at the top of the file**, just under the title and before the first pillar, in their words:

> 18 of these need a clip or a photo you have not got yet. Each one says which. They are ready to post the moment you have the picture.

**Mark every piece that needs something they do not have.** One line, at the end of that piece, saying what it needs. Not a warning, not an apology. A founder scanning the file has to be able to see in one pass which ones are ready today.

**A piece that needs nothing gets no line.** Marking everything marks nothing.

**Do not:**
- refuse to write a piece because the picture is missing
- quietly turn a video into a text post to avoid the flag, which changes what they asked for to make your output look tidier
- suggest stock images, because a stock photo in a founder's feed reads as a stock photo

**If they have nothing at all,** say so in one sentence at the top, without a lecture. They know. Point them at the list for their track in the media reference, say the words are done and waiting, and carry on.

## Step 5: keeping it running

Thirty pieces at five a week is six weeks of content. The promise is a content engine, not a one-off batch, so the founder needs to know how it refills before they leave Atlanta.

Set this up now, not later.

**The refill routine.** Once a month, the founder runs this skill again in refill mode: 30 new pieces, same pillars, same voice, written against what has happened since. It takes about twenty minutes. Tell them that plainly, because most people assume regenerating means starting over. The `content-top-up` routine can draft the next batch for them automatically (`/growth-engine:routines`).

**What feeds it.** Pull the Source material list from the Brain, and add three to five RSS feeds relevant to their audience. Record them in `./growth-engine/rss-feeds.md`, one per line with a short note of what each is for. This is a source list, not an automation. When they refill, it is what stops the new batch repeating the last one.

**What changes between batches.** Ask them to note new proof as it happens: a result, a customer story, a question they got asked twice. Add a `## New proof` heading at the bottom of `content-30.md` for it. Fresh proof is the difference between month two sounding like month one and month two sounding better.

## Step 6: export

Write the files, in the shapes in the contract:

1. **`./growth-engine/content-30.md`**, already written in batches. Check it holds all 30 and the count line.
2. **`./growth-engine/content-30.csv`**, the same 30 as a table.
   - Columns: `content`, `platform`, `scheduled_date`, `media_note`.
   - `platform` names where the piece goes, from `LinkedIn`, `X`, `Instagram`, `Facebook`, `TikTok`, with more than one separated by semicolons: `LinkedIn;X`.
   - Leave `scheduled_date` blank. When a piece goes out is decided when publishing, not here.
   - `media_note` names the founder's own clip or photo when the piece uses one they have. When it needs one they have not got, it says what to make, plainly, for example "record talking head, 30 seconds". A piece that needs no picture leaves it blank.
   - Quote any field holding a comma, a quote or a line break.
3. **`./growth-engine/ledger.md`**: one row per piece, appended below the header lines, as `C|<n>|<pillar>|<format>|<lane>|draft|-|-`. The lane is `media` only for a piece still waiting on a clip or photo the founder has not got; everything ready to post, with or without a picture they already have, is `text`. Every row starts as `draft`.

## Step 7: check and save

1. **Check.** Use the `rules-reviewer` agent on `content-30.md` and `content-30.csv`. Give it every figure the founder gave in this conversation, quoted as they said it.
2. **Fix what it holds.**
   - A held number: ask the founder whether it is real. If it is, add it to the Proof section of the Brain as `- <figure>, checked by me on <date>`, then keep the line. If not, rewrite the piece from observation.
   - Anything else held: rewrite the line.
   - Do this at most twice. Anything still held gets shown to the founder to decide.
3. **Save.** Run `git add growth-engine` then `git commit -m "Content engine: 30 pieces"`. If `git remote -v` shows a remote, run `git push`. If the push fails, say the work is saved on this computer and move on.

## Step 8: reading, and how approval works

Tell the founder the next job is theirs: read all 30 and change anything that does not sound like them. Not approve them unread.

**The gate is 30 approved, not 30 generated.** Say that plainly.

Reading a piece is not approving it. A piece counts towards the gate once it is marked approved. So tell them: when they have read some, they say so, for example "approve 1 to 10" or "approve all the ones I have read".

## Approving pieces

When the founder says they have read and approve pieces:

1. Confirm which numbers, in one line, if it is not obvious.
2. Set those rows in `ledger.md` to `approved`. Only rows at `draft` or already `approved` change.
3. If a piece was changed after it was approved, by them or by you at their request, set it back to `draft` and say it needs approving again, because approval is of the words as they read now.
4. Save: `git add growth-engine` and `git commit -m "Approved pieces <numbers>"`.
5. Say how many are approved out of 30, and that publishing is `/growth-engine:publish` once GoHighLevel is connected.

Never approve a piece the founder has not named.

## Refill mode

If `content-30.md` already exists and they want a new batch:

0. **Check for a routine's draft.** If `growth-engine/drafts/` holds a `content-refill-*.md` from the content top-up routine, show it and offer it as the first 10 of the new batch.
   - Each of those pieces is still read and approved one by one, like any other.
   - Once its pieces are in the new file, delete the draft.
1. **Read what exists.** Read `content-30.md`, the `## New proof` list, `rss-feeds.md`, and the What worked and What did not blocks in `memory.md`. Do not repeat angles already published.
2. **Archive the old batch.** Run `git mv growth-engine/content-30.md growth-engine/content-30-YYYY-MM.md`, using the current year and month.
   - If that name is taken, add `-2`.
   - Keep the old CSV out of the way: rename it the same way with `.csv`.
3. **Update the ledger.** A row's id says which file its words are in: a plain number is `content-30.md`, and `<suffix>-<n>` is `content-30-<suffix>.md`.
   - Rename every row whose id is a plain number from `<n>` to `<suffix>-<n>`, where the suffix is the new archive's, such as `2026-09` or `2026-09-2`. Rows that already carry a suffix belong to an older archive and keep their ids.
   - Rows at `draft` become `archived`.
   - Rows at `approved`, `scheduled` or `posted` keep their status, so approved pieces can still be published from the archive.
4. **Carry forward.** Copy the `## New proof` list into the new file, then add anything new to the Brain's Proof section only with the founder's yes.
5. **Ask about media again.** New clips and photos may have arrived since the last batch. Ask Step 2's question once.
6. **Write the new 30.** Run Steps 3, 4, 6 and 7 again, on the same pillars unless they want to change one. The new rows use plain numbers 1 to 30, because their words are in the new `content-30.md`.

## How these get published

**Posting is GoHighLevel's job, and the founder does it from Claude with `/growth-engine:publish`**, once GoHighLevel is connected (`/growth-engine:connect`). It shows exactly what will go out, where and when, and waits for a yes. Say that in one line when you hand the files over.

**The CSV is the second way in, and it stays.** A founder who has not connected anything yet, or who would rather do it by hand, has a table they can import or work down. It is also the copy they keep if they ever leave.

Do not tell a founder the exact import columns GoHighLevel expects. That format changes, and a confident wrong answer costs them an afternoon.
