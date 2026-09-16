# After your engines: making your GoHighLevel snapshot send

Your engines wrote the words. This page is what happens next, in order, and it ends with a real email arriving in your own inbox.

Read it once before the clinic on Wednesday 23 September. It takes about half an hour on the day.

## First, update the plugin

Your copy of the plugin is the version you installed. Updates are not automatic, and the values step below arrived in a later one.

1. Open the Claude desktop app on your Launchhouse folder.
2. Press the **+** button next to the message box and open **Plugins**.
3. Find **growth-engine** and update it.
4. If it still shows the old version, quit the app and open it again.

**This never touches your work.** Your Brain, your posts and your files live in your own folder on your computer, not inside the plugin. Updating cannot lose them.

If you have not installed the plugin at all: press **+**, then **Plugins**, add `Philm-moxywolf/launchhouse-v3`, and install **growth-engine**.

**Check it worked.** Say **"fill my custom values"**. If Claude knows what you mean, you are on the new version. If it says it does not have that, the update has not landed yet, so quit and reopen the app and try once more.

## What you should already have

Say **"where am I up to"** and read the answer before you go further. Inside your folder there is a folder called `growth-engine`, and that is where all of this lives:

- `founder-brain.md`, locked
- `content-30.md`, with your 30 approved
- your second engine: `outreach-sequence.md` for B2B, or `hook-bank.md`, `dm-openers.md` and `inbound-scripts.md` for B2C
- `ops-workflow.md`, which names the one snapshot you chose and holds its copy

If `ops-workflow.md` is missing, say **"build my ops engine"** first. Everything below reads it.

## The order, and why it is this order

### 1. Load the snapshot

A snapshot is a pack of ready-built workflows, the one you chose in your ops engine. It arrives as a set of workflows, not as a single one.

You do this at the clinic, on Wednesday 23 September. We give you the share link on the day.

**Add yourself as a user first, before you load anything.** Go to `Switch to Agency View`, then `Settings`, then `Team`. Open your own user, go to `Roles & Permissions`, and add your business sub-account. Do this first: users never travel in a snapshot, and the alerts inside yours go to the users of the account, so if you are not one you get none of them.

Then open the share link, choose your sub-account, and wait for it to finish processing. It takes a few minutes.

**What arrives:** every workflow, every tag, your pipelines, your forms, and the name of every message slot.

**What does not arrive: your words.** Custom value contents never travel in a snapshot, and neither do users. Every email arrives built, with empty slots where your words go, and an empty slot sends as a blank space to a real person.

### 2. Fill the values

A custom value is a named slot in your account. Your workflows are built to drop your words into those slots, so one welcome email is written once and used everywhere. The snapshot brings you the empty slots, and this is where the words go in.

Say **"fill my custom values"**, or type `/growth-engine:values`.

Claude reads your Brain and your engine files, asks you the few things nothing else answers, writes every message in your voice, and saves them to `ghl-values.md` in your folder.

Both lists come out of the one snapshot you loaded, because every snapshot carries **Essentials** inside it. So you fill **Essentials**, which is 11 values, and the list for the snapshot you chose. Nothing else. That is between 11 and 22 values in total. Nine of the eleven Essentials values are needed before you publish; the two about welcoming a new client or customer are only needed if you switch that pair of workflows on.

If you loaded **Review request**, it has no custom values at all. Its two emails live in your review templates, at `Reputation`, the `Settings` tab, then the email request settings, then `Set Email Templates`. Claude will point you there. Both templates arrive holding the word PLACEHOLDER and send exactly as they are, so rewrite both before you publish: `Review Ask Email` goes in the `Live` slot and `Review Reminder Email` in the `Retry` slot.

### 3. Put them into your account

**By hand, which is how most people do it.** Switch back to your sub-account first if you are still in Agency View. Open `Settings`, then `Custom Values`. Every name is already sitting there. Open each one, paste the words, save. Around fifteen minutes.

**Change the words only, never the name.** When a value is first saved, GoHighLevel quietly makes a permanent label out of its name, and every workflow step points at that label rather than at the name you see. Rename it afterwards and the label stays behind, so every message that used it goes out blank, with nothing on screen to tell you.

**Over the API, only if you would rather.** Most people do it by hand, and that is the route we support on the day. This one is for founders who are comfortable with it. You make a Private Integration Token yourself, in your own sub-account, at `Settings`, then `Private Integrations`, ticking the custom values boxes and nothing else.

That token is a password for your whole account, and it keeps working for 90 days. So: keep it out of your Launchhouse folder, never type it into the chat, put it in a plain text file somewhere else and tell Claude where it is, and delete it in GoHighLevel as soon as the values are in. Claude shows you the whole list and waits for your yes before it writes anything.

Your GoHighLevel connector cannot do this part. It reads your account and posts content, and it has no custom values tool, so do not go looking for one.

### 4. Check four things

When the words are in, tell Claude you have finished pasting. If you filled them by hand, Claude cannot see inside your account, so it reads your list back to you one at a time and you check each one on screen:

1. Every value on your two lists is there.
2. None is empty.
3. None still says PLACEHOLDER, and none has a square or curly bracket in it.
4. No name was changed, so the keys your workflows use still match.

If you used the API route, Claude reads all four back out of the account itself.

### 5. Re-pick anything blank

A load can leave a choice inside a workflow step empty, most often a pipeline stage. Open each workflow, look for a picker showing nothing, and choose the right one. Claude cannot see inside your account, so this one is done by eye. Your `ops-workflow.md` names the pipeline your snapshot uses, so ask Claude which stage a step should point at if you are unsure.

### 6. Publish, then test

Open `Automation`, then `Workflows`. Your workflows sit in folders and are numbered, `Essentials 1`, `Essentials 2`, and so on. Publish the Essentials folder first, in number order, then your snapshot's folder in number order, by opening each one and moving the switch at the top right from `Draft` to `Publish`. Leave the welcome workflows as drafts unless you filled the two welcome values: that is `Essentials 13`, and on B2B `Essentials 14` as well.

**Drafts never run**, so a test before publishing proves nothing, and a published workflow with empty values sends blanks to real people. That is why filling comes first.

Then fire it yourself, the way a real person would. Your `ops-workflow.md` names your trigger. For most people it is their own `Enquiry form`: open it, fill it in using a second email address you can read, and send it. On the two Instagram snapshots the trigger is a comment on one of your posts, or a DM, so use a second Instagram account or ask a friend. Then read what arrives, in full, subject line included.

- A blank where words should be: that value is still empty.
- Curly brackets in the email: a value was renamed after it was made.
- Nothing at all: the workflow is still a draft.

If something is wrong, put that workflow back to draft, fix it, and test again.

## Before Friday 25 September

A short list, and none of it is urgent on the day:

- **Turn duplicate contacts off**, at `Settings`, then `Business Profile`, under contact deduplication. Without it the same person filling your form twice becomes two contacts and gets two welcomes.
- **Allow more than one card per person**, at `Settings`, then `Objects`, then `Opportunities`. Tick `Allow Multiple Opportunities per Contact`, unless something else in your account already makes cards.
- **Make your QR code and copy your form embed codes last**, after your snapshot is loaded for the last time, so the links point at the forms you are actually using.
- **Put a privacy page on your site** and link it from your forms.
- **A sending domain of your own**, if you have one. Recommended, not required.

## If something arrives wrong

**Blank emails.** A value is empty. Fill it and send another test.

**The word PLACEHOLDER arriving at a real person.** A workflow was published before its values were filled. Put that workflow back to draft, fix the value, publish again.

**Curly brackets in an email.** A value was renamed. Its key no longer matches the step. Tell Claude and it will find which one.

**Nothing arrives at all.** The workflow is still a draft.

## Stuck

Post in the Slack channel. Do not wait for the session.
