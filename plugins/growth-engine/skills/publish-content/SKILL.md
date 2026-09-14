---
name: publish-content
description: Publish the founder's approved content through their GoHighLevel connector, as drafts or scheduled posts on the accounts they choose, after showing exactly what will go out, where and when, and getting a yes. Records every post in the ledger. Also shows what has gone out and how it did. Trigger on "publish my posts", "post the next five pieces", "schedule my content", "put my posts into GoHighLevel", "what did I publish", "how did my posts do".
---

# Publish content

Puts approved pieces from `content-30.md` into GoHighLevel's Social Planner, on the founder's own account.

**Who is reading.** A founder who does not use a terminal. Never ask them to run a command.

**The promise.** Nothing goes out that the founder has not read, approved, and said yes to publishing, with the account, the time and the words in front of them.

## 0. Before starting

1. **Check the folder.** Read the session context. If it says this is not the founder folder, stop and tell them which folder to open.
2. **Check GoHighLevel is connected.** You need tools whose names end in `social-media-posting_create-post` and `social-media-posting_get-account`. If they are not there, stop and run `/growth-engine:connect`.
3. **Read these:**
   - `growth-engine/founder-brain.md`, for the track
   - `growth-engine/content-30.md`
   - the `C|` rows in `growth-engine/ledger.md`
   - `growth-engine/.state/profile.md`, for their timezone
4. **If there is no content,** send them to `/growth-engine:content`.
5. **If there is no timezone,** ask where they are before scheduling anything.

## 1. Choose the pieces

Only pieces at `approved` can be published.

If the founder asks for "the next five", take the first five approved rows that have no post id, in ledger order.

A row's id says where its words are: a plain number is that piece in `content-30.md`, and `<suffix>-<n>` is piece n in `content-30-<suffix>.md`. Always publish the words from that file, exactly as they are there.

**If they name pieces that are still `draft`:**
1. Show each one in full.
2. Ask whether they have read it and approve it.
3. Approve only those they say yes to, by setting the row to `approved`.

Reading a piece in this conversation and saying yes is approving it. Silence is not.

**Pictures.**
- A piece whose lane is `media` is still waiting on a clip or photo. Ask whether they have it now and it is in their GoHighLevel Media Library. If not, leave it out and say which ones wait for pictures. If they have it, set the lane to `text`.
- A piece with a `media_note` naming a picture they have goes out as a draft, so they attach the picture in Social Planner before it goes live. Say that plainly.

## 2. Check the words again

The founder may have edited pieces by hand since they were written. Use the `rules-reviewer` agent on the chosen pieces only.

**If it holds a line:**
- Show it.
- Leave that piece out of this batch.
- Offer to fix it: a figure goes in the Brain if it is real, otherwise the line is rewritten.

## 3. Choose where and when

1. **Get the accounts.** Call the tool ending `social-media-posting_get-account`, and match each piece to the right accounts by its `platform` in the matching sheet: `content-30.csv` for a plain id, `content-30-<suffix>.csv` for an archived one.
   - B2B pieces usually go to LinkedIn.
   - B2C pieces go to Instagram and the Facebook Page.
   - If a platform is not connected, say so, and do not post that piece there.
2. **Ask draft or scheduled.**
   - **Draft** is the default. It puts the post in Social Planner for them to check and send.
   - **Scheduled** needs a date and time for each piece. Suggest a spread of no more than one post a day per account, at a time that suits their audience, and let them change it.
3. **Times.** Take every time the founder gives as their own time, in the timezone from their profile. If the tool asks for UTC, convert it, and check the conversion across any clock change.

## 4. Show exactly what will happen, then wait

Show a table, one row per post:

| # | First line | Account | Draft or scheduled | When, their time |
|---|---|---|---|---|

Then say: "Nothing goes out until you say yes. Shall I put these into GoHighLevel?"

**Wait for a clear yes.** A yes covers exactly this table. If they change anything, show the table again.

## 5. Publish

For each post, one at a time:

1. **Read the tool's own parameters.** Use them as they are. Never guess at a field it does not list. If the tool cannot do what the table promised (a draft, a scheduled time, an account), stop, say what it cannot do, and ask what they would like instead.
2. **Call the tool ending `social-media-posting_create-post`,** with the piece's words exactly as approved, the chosen accounts, and draft or the scheduled time.
3. **Read it back.** Call the tool ending `social-media-posting_get-post` with the id it returned, and check the words and the time match.
4. **Update the ledger row:**
   - post id: the id GoHighLevel returned
   - status: `scheduled` for a scheduled post. A draft stays `approved` with the post id set, because it has not been scheduled yet.
   - goes out: the scheduled time in their timezone, as `2026-09-25T09:00`, or `-` for a draft
5. **Record the result** as a line in `ops-log.md`: `- HH:MM result: scheduled piece 7 to LinkedIn for 25 Sep 09:00`.

**If a call fails,**
- set that row's status to `failed`
- say which piece, and the reason in plain words
- carry on with the rest only if the founder says so

**Never** delete, move or edit a post the founder did not name. To change a post already in GoHighLevel, show the change and use the tool ending `social-media-posting_edit-post` only after a yes.

## 6. Save and report

1. Run `git add growth-engine` then `git commit -m "Published pieces <numbers>"`. Push if there is a remote.
2. Tell them in three lines:
   - what went in
   - what waits for a picture or a fix
   - how many approved pieces are left to publish

## What went out, and how it did

When they ask what was published:
- Read the ledger rows at `scheduled` and `posted`.
- Check any past their time against the tool ending `social-media-posting_get-posts`.
- A scheduled post that has gone out becomes `posted`.

When they ask how posts did:
- Call the tool ending `social-media-posting_get-social-media-statistics`.
- Report what it returns, in plain words. Never invent a figure it did not return, and never compare it to a benchmark nobody gave you.
- If something clearly worked or clearly did not, offer to note it in the What worked or What did not block of `memory.md`, dated, so the next refill uses it.
