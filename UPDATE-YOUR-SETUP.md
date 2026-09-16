# Update your setup

You already have your own copy of the Launchhouse folder, open in Claude. This is how to take the newest plugin, and it takes about two minutes.

## First, the thing founders worry about

**The plugin is the instructions. Your folder is your work. They are two different things.**

Updating cannot lose your Brain, your posts or your files, because they live in your own folder on your computer, not inside the plugin. Nothing in your folder is touched, renamed or rewritten. Nothing is regenerated, and you are never asked about your business again.

## Why update at all

The step that writes your snapshot's words arrived in a later version. You run it in the week before the clinic, not on the day. Without it, Claude does not know your value names, how many there are, or which of them have to be filled before you publish.

Updates are never automatic. You take them when we say, so that a room of 130 people is running the same thing.

## Update it

**In the desktop app, or in Cowork:**

1. Open the Claude desktop app on your Launchhouse folder.
2. Press the **+** button next to the message box and open **Plugins**.
3. Find **growth-engine** and update it. You want version **0.9.4** or later.
4. If it still shows the old version, quit the app and open it again.

**In Claude Code, the terminal:**

```
/plugin marketplace update launchhouse-v3
```

Then reinstall the plugin if you are asked to.

**If you never installed it at all:**

```
/plugin marketplace add Philm-moxywolf/launchhouse-v3
/plugin install growth-engine@launchhouse-v3
```

In the desktop app it is the **+** button, then **Plugins**, then add `Philm-moxywolf/launchhouse-v3` and install **growth-engine**.

## Check it worked

Open your folder in Claude and say **"fill my custom values"**.

If Claude knows what you mean, you are on the new version. That is the only check that proves anything, so do it rather than reading the version number.

## If the command is still not there

Three causes, in this order.

1. **The prefix.** Every command is `/growth-engine:values`, never a bare command on its own. Plain language works too, and is easier: "fill my custom values".
2. **It has not loaded yet.** Quit the app and open it again. In Claude Code, run `/reload-plugins`.
3. **The wrong folder, or the wrong account.** The plugin is switched on per folder, so open your Launchhouse folder itself. In Cowork, add the plugin there too, from the **+** button, then **Plugins**. Then check you are signed in to the Claude account you installed it on.

## Does anything in your own folder need changing?

No. Nothing. The new step reads two files you already have, `growth-engine/founder-brain.md` and `growth-engine/ops-workflow.md`, and writes one new file next to them. There is no setting to change and nothing to move.

If `ops-workflow.md` is missing, say **"build my ops engine"** first. It names the pack you publish first, and your words cannot be written without it.

## Does your folder itself need updating?

No. Your folder is your own private copy, and the engine lives in the plugin, not in the copy. So there is nothing to pull into it and nothing to merge. Nothing in it has to change for the new step, and it has been checked four ways. Your permissions file already allows everything the step runs, your `CLAUDE.md` names no individual skills, and the checks already know the new file by name.

If we ever do change something in the folder itself, we will say exactly which file and Claude will put it in for you.

## If you have two of them

If you also installed the older `launchhouse` toolkit at some point, you now have two sets of the same commands, and Claude will answer with whichever wins.

Keep `growth-engine@launchhouse-v3`. Remove the other from the Plugins panel, then quit and reopen the app. Keeping both is worse than it sounds: only this one carries the checks that hold a file breaking a rule and put it back as it was.

## Checking nothing was lost

Say **"where am I up to"**. Claude reads your folder and tells you what is there.

If something looks missing, it is almost always the folder rather than the file. Claude was opened one level up or one level down. Say **"check my setup"** and it will look in the folder above and in your home folder before concluding anything is gone.

Your real safety net is that your folder is saved as you go. Say **"save my work"**, and Claude shows you when it was last saved and can bring back any earlier version of any saved file. Three things are deliberately kept off GitHub because they hold real people's details: your `people/` folder, `outreach-firstlines.csv` and `dm-openers.md`. Those live on your computer only, so they have no earlier versions.

## What happens if you never update

Everything you have keeps working. No file is touched and every engine you have already run still runs.

You would only lose the values step. That means arriving at the clinic with nothing written, and spending the day writing instead of pasting. If you get to the clinic without updating, the rule is simple: **load your snapshot, publish nothing, update, then write and paste.** A published workflow with empty words sends blank emails to real people.

## Stuck

Post in the Slack channel. Do not wait for the session.
