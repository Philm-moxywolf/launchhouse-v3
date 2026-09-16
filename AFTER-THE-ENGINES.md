# After your engines: making your GoHighLevel snapshot send

Your engines wrote the words. This page is what happens next, in order, and it ends with a real email arriving in your own inbox.

Read it once before the clinic on Wednesday 23 September. It takes about an hour on the day, and fifteen minutes of that is pasting.

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

Ten steps, and the order is the whole point. Your snapshot page, the printed pack you are given at the clinic, carries the lists for your own snapshot. This is the spine that every founder follows.

### 1. Load the snapshot

**Add yourself as a user first, before you load anything.** Go to `Switch to Agency View`, then `Settings`, then `Team`. Open your own user, go to `Roles & Permissions`, and add your business sub-account. Users never travel in a snapshot, and the alerts inside yours go to the users of the account, so if you are not one you get none of them.

Then open the share link we give you on the day, choose your sub-account, and wait. It takes a few minutes. If it asks about conflicts, leave every item unticked.

**What arrives:** every workflow, every tag, your pipelines, your forms, and the name of every message slot.

**What does not arrive: your words.** Custom value contents never travel in a snapshot, and neither do users. Every email arrives built, with empty slots where your words go, and an empty slot sends as a blank space to a real person.

### 2. Put everything back to draft

Nobody has documented what state workflows arrive in, so make it certain. Go to `Automation`, then `Workflows`. Show the published ones, select them, and set them to draft under `Bulk Actions`. Selecting only covers the page you can see, so check every page.

Nothing can fire at a real person while you work.

### 3. Business profile and wallet

Two settings, and email does not work properly without either.

**Business Profile:** your business name, your `Business Physical Address`, and a `Business Email` on your own domain, never gmail, yahoo or outlook. Every email you send ends with these. Leave the unsubscribe box ticked.

**Wallet:** in `Agency View`, `Settings`, `Billing`, then `Wallet & Transactions`, add a card and set auto recharge. Every email costs a little, your own alerts included, and sending stops when the wallet runs dry.

### 4. Fill the values

A custom value is a named slot in your account. Your workflows are built to drop your words into those slots, so one welcome email is written once and used everywhere. The snapshot brings you the empty slots, and this is where the words go in.

Say **"fill my custom values"**, or type `/growth-engine:values`.

Claude reads your Brain and your engine files, asks you the few things nothing else answers, writes every message in your voice, and saves them to `ghl-values.md` in your folder.

Both lists come out of the one snapshot you loaded, because every snapshot carries **Essentials** inside it. So you fill **Essentials**, which is 11 values, and the list for the snapshot you chose. Nothing else. That is between 11 and 22 values in total. Nine of the eleven Essentials values are needed before you publish; the two that welcome a new client or customer are only needed if you switch that pair of workflows on.

If you loaded **Review request**, it has no custom values at all. Its two emails live in your review templates, at `Reputation`, the `Settings` tab, then the email request settings, then `Set Email Templates`. Both arrive holding the word PLACEHOLDER and send exactly as they are, so rewrite both before you publish: `Review Ask Email` goes in the `Live` slot and `Review Reminder Email` in the `Retry` slot.

### 5. Put them into your account

**By hand, which is how most people do it.** Switch back to your sub-account first if you are still in Agency View. Open `Settings`, then `Custom Values`. Every name is already sitting there. Open each one, paste the words, save. Around fifteen minutes.

**Change the words only, never the name.** When a value is first saved, GoHighLevel quietly makes a permanent label out of its name, and every workflow step points at that label rather than at the name you see. Rename it afterwards and the label stays behind, so every message that used it goes out blank, with nothing on screen to tell you.

**Over the API, only if you would rather.** Most people do it by hand, and that is the route we support on the day. This one is for founders who are comfortable with it. You make a Private Integration Token yourself, in your own sub-account, at `Settings`, then `Private Integrations`, ticking the custom values boxes and nothing else.

That token is a password for your whole account, and it keeps working for 90 days. So: keep it out of your Launchhouse folder, never type it into the chat, put it in a plain text file somewhere else and tell Claude where it is, and delete it in GoHighLevel as soon as the values are in. Claude shows you the whole list and waits for your yes before it writes anything.

Your GoHighLevel connector cannot do this part. It reads your account and posts content, and it has no custom values tool, so do not go looking for one.

### 6. Check four things

When the words are in, tell Claude you have finished pasting. If you filled them by hand, Claude cannot see inside your account, so it reads your list back to you one at a time and you check each one on screen:

1. Every value on your two lists is there.
2. None is empty.
3. None still says PLACEHOLDER, and none has a square or curly bracket in it.
4. No name was changed, so the keys your workflows use still match.

If you used the API route, Claude reads all four back out of the account itself.

### 7. Re-pick anything blank

A load can leave a choice inside a step empty. Your snapshot page lists every step to open. Check the pipeline and stage on each card mover, the `Form Is` choice on each form trigger, and the tag under every tag trigger.

Claude cannot see inside your account, so this one is done by eye. Your `ops-workflow.md` names the pipeline your snapshot uses, so ask Claude which stage a step should point at if you are unsure.

### 8. Publish, in the order on your snapshot page

Publish every workflow that is not optional, in the order your snapshot page gives: **the card movers first, then the automations, then the event workflows, then the entry workflows.** Publish one group, check every workflow in it shows as published, then start the next.

Order matters here. A card mover that is still a draft when an automation starts leaves cards sitting in the wrong place.

**Leave `Essentials 13` and `Essentials 14` as drafts** unless you filled the two welcome values. They are optional on both tracks.

**Drafts never run**, so a test before publishing proves nothing, and a published workflow with empty values sends blanks to real people. That is why filling comes first.

### 9. Re-pick what points at another workflow

These wait until now, because a workflow that is still a draft may not appear in the list to pick from. Your snapshot page names each one. Open them, re-pick anything blank, and save.

### 10. One live test

From a second email address of your own, not the one your account sends from. Open your `Enquiry form` link, fill it in with just your first name and that address, and send it.

Within about three minutes the welcome email arrives, opening with your greeting word and your first name, then your words, then your business name and address at the bottom. Read all of it.

On the two Instagram snapshots the trigger is a comment on one of your posts, or a DM, so use a second Instagram account or ask a friend.

- A blank where words should be: that value is still empty.
- Curly brackets in the email: a value was renamed after it was made.
- Nothing at all: the workflow is still a draft.

If something is wrong, put that workflow back to draft, fix it, and test again. Then run the live tests on your own snapshot page: they carry on from this one.

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
