---
name: help
description: Answer a founder's question about how Launchhouse works, check they are set up properly, and diagnose a problem. Checks the folder, the plugin, git, the connections and the time-critical items, and knows the common problems. Trigger on "help", "check my setup", "am I set up right", "something is broken", "is this working", "doctor", "which folder should I use", "cowork or claude code", "update the plugin", or whenever another skill reports it cannot find the Founder Brain.
---

# Help

The founder's first stop when something is not working, or they are not sure what to do next.

Be plain and unhurried. Many founders on this programme are not technical and will already feel behind. Never ask them to run a command. Run what needs running yourself, and say what you found.

## Two ways in

- **They asked for help.** Work out what they are trying to do, answer it, and point them at the one thing to do next.
- **Something is broken.** Start by asking what is happening, in their own words. Then run only the checks most likely to be relevant, rather than all of them in order.

**Two tries at most.** If two attempts do not resolve it, stop and tell them to post in the Slack channel, saying what they were doing and what they saw. Someone will sort it individually. A founder stuck alone for an hour is worse than a founder who asked for help after ten minutes.

## The checks

### 1. The folder

This is the single most common problem.

**Read the session context at the top of the conversation.**
- If it says this is not the founder folder, tell them which folder to open, and that nothing is lost.
- If it says nothing about Launchhouse, look for `growth-engine/.launchhouse` in this folder, one folder down, and the parent folder.

**If you find more than one Launchhouse folder** (the session context names them):
1. Show each location, what it contains, and when it last changed, from the `modified` column of its `growth-engine/.state/index.md`.
2. Help them decide which is the real one.
3. Do not merge them and do not delete anything. Tell them to move the others aside.

**If there is none,** the folder is not set up. Offer `/growth-engine:start`.

### 2. The plugin

If this skill is running, the plugin is loaded. Say so plainly, because founders often assume something is broken when it is not.

### 3. Saving

1. Run `git status --short` and `git log -1 --format="%cd %s"`.
2. Say when their work was last saved.
3. If there are unsaved changes, offer to save them (`/growth-engine:save`).
4. If `git remote -v` shows nothing, their work is saved on this computer only. Say so without alarm. A mentor can connect it to GitHub.

### 4. Connections

Read `growth-engine/.state/setup.md`.
- If GoHighLevel or Apollo is not done, and they are trying to publish or build a sequence, send them to `/growth-engine:connect`.
- Apollo is B2B only. A B2C founder not seeing Apollo is correct.

### 5. Progress

Hand off to `/growth-engine:status` rather than duplicating it here.

### 6. Time-critical items

Read the Flags section of `growth-engine/founder-brain.md` if it exists.
- **B2B:** is the sending domain sorted, with SPF, DKIM and DMARC configured? If the Brain flags a fresh domain and nothing has happened, raise it now.
- **B2C:** is Instagram converted to Business or Creator and linked to a Facebook Page? Nothing publishes or captures inbound without it.

Raise these even if the founder asked about something else. They are the two items that quietly break the weekend.

## Where they work

**Claude Code, in the desktop app,** opened on their Launchhouse folder. This is where the engines run: interviews, writing, publishing, sequences.

**Cowork, on the same folder.** Good for dropping in documents and photos, reading and summarising, and thinking things through. Anything saved into `growth-engine/` is seen by both. If Cowork does not seem to know about Launchhouse, the plugin may need adding there too, from the + button, Plugins.

If they are unsure, tell them to use the Code tab for the engines. Nothing in this programme needs a terminal.

## Updating the plugin

Updates are not automatic.

1. In the desktop app, press the + button next to the message box and open **Plugins**.
2. Find **growth-engine** and update it.
3. If it does not show the new version, quit and reopen the app.

Updating never touches the founder's `growth-engine/` folder. Their work lives in their own folder, not inside the plugin. Say this if they hesitate.

If a founder reports behaviour that does not match what they were told in a session, updating is the first thing to try.

## Common problems

**"The commands are not there."** If this skill is running, the plugin is loaded in this folder, so the usual cause is the prefix: every command starts with `/growth-engine:`, for example `/growth-engine:status`, and plain language works too. If they mean a different folder or Cowork, the plugin is turned on per folder: open their Launchhouse folder, or add the plugin in Cowork from the + button, Plugins. If it still does not show, quit and reopen the app, and check they are signed in to the Claude account they installed it on.

**"It asked me about my business again."** They are in the wrong folder. Run check 1. Their Brain is almost certainly intact somewhere else.

**"It gave me LinkedIn posts and I sell to consumers."** The Track line in their Brain is wrong.
1. Tell them to say "change my track", which reopens the Founder Brain on that one line.
2. Then regenerate the content.

Do not edit the Track line yourself outside that flow.

**"My files disappeared."** Almost never true.
1. Run check 1.
2. Then run `git log --oneline -10 -- growth-engine`, which shows every save.
3. Any earlier version of a saved file can be brought back with `/growth-engine:save`. `people/`, `outreach-firstlines.csv` and `dm-openers.md` are kept out of git on purpose, so those have no history.

**"It said a file was held."** The Launchhouse checks found a line that offers to automate cold DMs, promises replies, or uses the other track's material. The file was put back as it was, so nothing is lost. The message names the line, and the line gets rewritten.

**"It said a figure was worth a look."** The rules reviewer checks every figure against what the founder has told it. If the figure is real, it goes in the Proof section of the Founder Brain first. Otherwise the line gets rewritten.

It is a backstop, not a guarantee. They still read their own work before it goes out.

**"It will not let me automate Instagram DMs."** Correct behaviour, not a bug. Instagram only opens a reply window once somebody has written to you first, and the accounts that get round that are the ones that get restricted. Say that plainly, then take them to the inbound side and build it with them (`/growth-engine:audience`).

**"It will not send my Apollo sequence."** Also correct. Sequences are built paused, and starting one is a button the founder presses in Apollo, having read it.

**"It is asking permission for everything."** Their folder's settings let Claude save work without asking. If they opened a folder that was not made from the Launchhouse template, the settings are missing. `/growth-engine:start` creates them when they are missing. Some things always ask, on purpose: publishing, spending Apollo credits, and adding people to a sequence.

**"I cannot get any of this working."** Do not keep troubleshooting past two failed attempts. Send them to the Slack channel.

## What this skill does not do

It does not change any founder content. It diagnoses and repairs setup only.
