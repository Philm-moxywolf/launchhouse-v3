---
name: apollo-sequence
description: For B2B founders on the Apollo route. Builds the list of 25 through the founder's Apollo connector from their written criteria, shows the credit cost before any enrichment, records each person, hands back for first lines, then creates the sequence in their Apollo account with the copy in it, paused, with the 25 added. Never starts or sends it. Trigger on "build my Apollo sequence", "find my 25", "build my list in Apollo", "put my sequence into Apollo", "load my outreach into Apollo".
---

# Apollo sequence

Takes the founder's outreach engine into their own Apollo account.

**The line that does not move.** The sequence is built **paused**. Starting it is a button the founder presses in Apollo, having read the messages. Nothing here starts it, sends a message, or buys anything. The Launchhouse checks stop those tools in this folder anyway.

**Who is reading.** A founder who does not use a terminal. Never ask them to run a command.

## 0. Before starting

1. **Check the folder.** Read the session context. If it says this is not the founder folder, stop and tell them which folder to open.
2. **Check the track.** Read the Brain. If `Track` is not `b2b`, stop. Apollo is not part of the B2C track. Send them to `/growth-engine:audience`.
3. **Check the sequence exists.** Read `growth-engine/outreach-sequence.md`.
   - If it does not exist, the sequence and criteria come first: `/growth-engine:outreach`.
   - If it records the manual route (Microsoft 365 or other), stop. Their route is by hand, and `outreach-firstlines.csv` is their checklist. Offer to switch routes only if their work email has changed to Google.
4. **Check Apollo is connected.** You need tools whose names end in `apollo_mixed_people_api_search` and `apollo_sequences_create`. If not, run `/growth-engine:connect`.

**Credits.** Whenever a tool's response includes an `mcp_credits` block, tell the founder the estimated cost before the spend, and the credits used and balance after. Always, unprompted.

## 1. Build the list, free

**Skip this step** if `growth-engine/people/` already holds 25 or more prospects not at `cut`. Go to step 3.

1. **Search.** Use the tight criteria from `outreach-sequence.md` with the tool ending `apollo_mixed_people_api_search`.
   - Search does not spend credits.
   - It returns a catalogue: names with the surname hidden, titles and companies, and whether an email is likely. No email addresses.
2. **Widen if needed.** If tight returns fewer than 35 good matches, add medium, then broad. Say which you used.
3. **Show about 35 candidates** as a short table: first name, title, company, and why they fit the criteria. Never invent a detail.
4. **Cut to 30 with the founder.** They cut the ones that are not a fit on a second look. Keeping 5 over 25 covers addresses that will not verify.

## 2. Enrich, only with a yes

Enrichment finds each person's email address, and **it spends the founder's Apollo credits**.

1. **Say the cost.** Say how many people, and the credit cost the tool estimates.
2. **Ask:** "This uses about <n> of your Apollo credits. Shall I get the addresses for these <n>?"
3. **Wait for a clear yes.**
4. **Enrich.** Use the tool ending `apollo_people_bulk_match`, or `apollo_people_match` one at a time.
   - Never ask for personal emails or phone numbers. Work email only.
5. **Report the spend:** the credits used and the balance left.

For each person with a work email, write a person file in `growth-engine/people/`, named by the slug of their email, in the prospect shape in `../../references/contract.md`:
- `kind: prospect`
- `status: candidate`
- `source: apollo`
- `email`, `first_name`, `name`, `company`, `title`
- `email_status`: `valid` only when Apollo says the address is verified, otherwise `unverified`
- `apollo_contact_id`, if one came back

People with no address, or an address Apollo marks as not deliverable, get `status: cut` and a note saying why.

If more than 25 remain, go through them with the founder and cut to 25. Cut people keep their file at `status: cut`, never deleted.

## 3. First lines

Every person not at `cut` needs a first line in the Opener block of their file.

If any are missing, write them now, following Step 4 of the outreach engine exactly:
- one line specific to that company or person, from real detail
- a generic honest line when there is nothing specific
- batches of 5 to 10, so the founder can check as they go

Then rewrite `growth-engine/outreach-firstlines.csv` from the people not at `cut`, in the contract's shape.

Use the `rules-reviewer` agent on `outreach-firstlines.csv` before loading anything.

## 4. Load into Apollo

**Check the mailbox first.** Call the tool ending `apollo_email_accounts_index`. If no mailbox is connected, stop here and tell them to connect the one they will send from in Apollo. Nothing can go into a sequence without it. Everything so far is saved, so they carry on from this step once it is connected.

Before each call, read the tool's own parameters and use them as they are. **Never guess at a field it does not list.** If a tool cannot do what a step needs, stop, tell the founder the one thing to do by hand in Apollo, and carry on from there.

### The first line field

1. Call the tool ending `apollo_fields_index`, and look for a contact custom field called `first_line`.
2. If there is none, ask the founder to create it: in Apollo settings, custom fields, a new contact field named exactly `first_line`, as long text. Wait until they say it is done, then check again.
3. Say why the name matters: the CSV column, the Apollo field and the sequence variable all read `first_line`, and a mismatch fails silently.

### Contacts

Only contacts go into sequences.

1. **Show the plan.** Say: "I will add these 25 as contacts in your Apollo account, each with their first line."
2. **Wait for a yes.**
3. **Create.** Use the tool ending `apollo_contacts_bulk_create`, or `apollo_contacts_create` one at a time, with de-duplication on if the tool offers it.
   - Set `first_line` on each contact.
   - **If the create tool cannot set a custom field,** set it afterwards on each contact with the tool ending `apollo_contacts_update`.
   - **If neither can,** tell the founder to import `outreach-firstlines.csv` in Apollo and map the `first_line` column to the field. Wait until they have.
4. **Label them.** With the tools ending `apollo_labels_create` and `apollo_labels_add_entity_ids_to_label_names`, add a label `Launchhouse 25`, so the list is easy to find.
5. **Record the ids.** Write each `apollo_contact_id` into the person file.

### The sequence

1. **Read the copy.** Read the touches from `outreach-sequence.md`: subject lines, bodies with the `{{contact.first_name}}`, `{{account.name}}` and `{{first_line}}` variables, wait intervals, and the same-thread decisions. The personal line goes into touch 1 as `{{first_line}}`, exactly.
2. **Pick the schedule.** Call the tool ending `apollo_emailer_schedules_index`, and choose a weekday business-hours schedule in the founder's timezone. Confirm it with them.
3. **Show the plan.** Say: "I will create the sequence <name>, paused, with <n> touches, sending from <mailbox> on <schedule>. Nothing sends until you press start in Apollo."
4. **Wait for a yes.**
5. **Create it** with the tool ending `apollo_sequences_create`, **inactive**.
   - If the tool can set the steps and copy, set them exactly as written.
   - If it cannot, create the sequence, then tell the founder to paste each touch from `outreach-sequence.md` into the steps in Apollo, in order, with the waits. Offer to show each touch for copying.
6. **Read it back.** Call the tool ending `apollo_emailer_campaigns_show`, and check it is not active, the steps match, and stop-on-reply is on. If stop-on-reply is off, tell them to turn it on in the sequence settings.

### Add the 25

1. **Ask:** "Add the 25 to the paused sequence, sending from <mailbox>?"
2. **Wait for a yes.**
3. **Add them.** Use the tool ending `apollo_emailer_campaigns_add_contact_ids`, with the mailbox's id as the sending account.
4. **Update each person file.** Set `status: enrolled`, and add a touch line `- YYYY-MM-DD email out: added to the paused Apollo sequence`.

## 5. Hand it to the founder

Tell them, in this order:

1. The sequence is in Apollo, paused, with 25 people and their first lines.
2. Before starting it, open it in Apollo and read every step as one of the 25 would see it. Check the first line shows up in the preview.
3. Check open and click tracking are off in the sequence settings.
4. Starting it is their button, in Apollo. Nothing here will press it.

Never promise replies. If they ask what to expect, say replies depend on the list, the offer and the timing, and the plan tracks what happens rather than predicting it.

## 6. Save

1. Add a line to `ops-log.md`: `- HH:MM result: Apollo sequence <name> built paused with 25 contacts`.
2. Run `git add growth-engine` then `git commit -m "Apollo sequence built, paused"`. Person files stay out of git. Push if there is a remote.

## Afterwards

When the founder asks how it is going:
- Call the tool ending `apollo_emailer_campaigns_activity_feed` or `apollo_emailer_messages_search`, and report what it returns: sent, bounced, opted out, replied.
- Never compare against a reply rate nobody gave you.
- Replied people become `status: replied` in their file.

When someone asks to be left alone, stop them straight away with the tool ending `apollo_emailer_campaigns_remove_or_stop_contact_ids`, after telling the founder, and set their status to `stopped`.
