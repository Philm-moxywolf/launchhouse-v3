---
name: start
description: Set up a founder's Launchhouse folder the first time they open it in Claude, or check it is set up. Asks their name and where they are, makes sure the growth-engine folder and its starting files exist, saves the folder in git, then hands on to bringing their work across from the app or to building the Founder Brain. Trigger on "start launchhouse", "get started", "set up my folder", "I'm new", "set up launchhouse", "first time", or when the session context says the folder is not set up.
---

# Start

This is the first thing a founder runs in their Launchhouse folder. It takes about two minutes. It never asks about their business: that is the Founder Brain's job.

**Who is reading.** A founder who does not use a terminal. Never ask them to type a command. Run what needs running yourself, and describe what you did in one plain sentence.

## 0. Check this computer is ready

Founders use the Claude desktop app, on a Mac or a Windows PC, and never a terminal. Two things have to be on the computer, and both are ordinary installs.

1. **Git.** Run `git --version`.
   - If it works, carry on.
   - If it fails on a **Windows PC**, the computer needs **Git for Windows**. Tell the founder: go to git-scm.com, press Download for Windows, run the installer, and press Next on every screen without changing anything. Then quit the Claude app completely and open it again, in this same folder, and say "start launchhouse" again. Git for Windows is what lets Claude save their work and run the Launchhouse checks. Stop here until it is done.
   - If it fails on a **Mac**, a window may appear offering to install developer tools. Tell them to press Install, wait for it to finish, then say "start launchhouse" again.
2. **The Launchhouse checks.** The top of this conversation should hold a line starting "Launchhouse founder folder", "Launchhouse: this is not the founder folder", or "Launchhouse: this folder has Launchhouse files". If this folder has `growth-engine/.launchhouse` and there is no such line, the checks are not running on this computer.
   - On Windows, that almost always means Git for Windows is missing: follow step 1.
   - Otherwise, ask them to quit the Claude app and open it again. If the line is still missing, carry on, and tell a mentor. The rules reviewer still checks every piece of work.

## 1. Check you are in the right folder

The session context at the top of this conversation says one of three things.

- **"Launchhouse founder folder."** You are in the right place. Go on.
- **"This is not the founder folder"**, naming another folder. Stop. Tell the founder, in one sentence, to open that folder in Claude instead. Say why: work written here will not be found later. Do nothing else.
- **Nothing about Launchhouse.** Look for `growth-engine/.launchhouse` in the current folder, one folder down, and the parent folder.
  - If you find it somewhere else, say so as above.
  - If there is none anywhere, ask one question: "Is this the folder you want your Launchhouse work to live in?" If yes, go to step 2. If no, tell them to open the right folder and stop.

## 2. Make sure the folder has what it needs

Everything a founder makes lives in `growth-engine/`, inside the folder they opened. Nothing is ever written anywhere else.

Create only what is missing, and never overwrite a file that exists. The folder made from the Launchhouse template already has all of this, so usually there is nothing to do. The exact starting contents are in `references/scaffold.md` next to this file.

- `growth-engine/.launchhouse`
- `growth-engine/ledger.md`, `growth-engine/memory.md`, `growth-engine/ops-log.md`
- `growth-engine/people/README.md`
- `growth-engine/uploads/`, `growth-engine/voice-samples/`, `growth-engine/drafts/`, each with an empty `.gitkeep`
- a `.gitignore` in the folder they opened, containing the lines in the scaffold reference
- `.claude/settings.json` in the folder they opened, only if it does not exist

Do not create `founder-brain.md`. The Founder Brain makes it.

## 3. Two questions

Open with: "Two quick questions, then you are set up. About 30 seconds."

**"What should we call you?"** Their first name, or whatever they prefer.

**Where they are.** Work out their timezone yourself first:
- Run `date '+%H:%M %Z'`.
- On a Mac, `readlink /etc/localtime` gives a path ending in the full name, such as `/var/db/timezone/zoneinfo/Europe/London`. Use the part after `zoneinfo/`.
- On Windows, or if that does not work, skip the lookup: ask which city they are nearest and use its timezone.

Then ask: "It is 14:05 where you are, the Europe/London time. Is that right?" If they say no, ask which city they are nearest and use its timezone. Always record a full name like `America/New_York`, never an abbreviation.

Write `growth-engine/.state/profile.md`:

```markdown
# Profile

- **Founder:** <what to call them>
- **Timezone:** <Area/City>
- **Set up:** <YYYY-MM-DD>
```

## 4. Save the folder

The folder is saved with git, so every change can be seen and undone, and so it can be kept on their GitHub. Handle this without making a thing of it.

1. **Check git.** Run `git rev-parse --is-inside-work-tree`.
   - If it is not a git folder, run `git init`. Tell them in one sentence: "I have set this folder up to keep a history of your work, so nothing is ever lost."
2. **Check the identity.** Run `git config user.name` and `git config user.email`.
   - If either is empty, ask for the email address they use for GitHub. Set both for this folder only: `git config user.name "<name>"` and `git config user.email "<email>"`.
3. **Commit.** Run `git add -A` then `git commit -m "Set up the Launchhouse folder"`. If there is nothing new to commit, that is fine.
4. **Check for GitHub.** Run `git remote -v`.
   - If there is a remote, run `git push`. If the push asks for a login or fails, do not troubleshoot. Say their work is saved on this computer, and that it goes up to GitHub with one button: open GitHub Desktop and press **Push origin**.
   - If there is no remote, say nothing about GitHub now.

## 5. Hand on

Check for work from the app. Any of these means the founder has brought files across:
- `growth-engine/README-your-files.md`
- a folder called `growth-engine` inside `growth-engine`
- `growth-engine/.state/HOME` mentioning `/tmp/ge/`
- a `.zip` file in the folder, or in `growth-engine/`, **unless** `growth-engine/.state/imported.md` exists, which means the import already happened

**If there is app work,** say: "I can see your work from the app. I will bring it across and tidy it for the new setup. Nothing you wrote gets rewritten." Then follow the `import-from-app` skill.

**If the founder says their work is still in the app,** tell them how to get it:
1. In the app, open Files and press the button that downloads everything.
2. Drag the downloaded file into this folder, or tell you where it saved.

Then follow `import-from-app`.

**If there is no app work and no Founder Brain,** say that the Founder Brain comes next. It is the record of their business that everything else reads, about an hour of their own words. Offer to start now, and follow the `founder-brain` skill if they say yes.

**If the Brain already exists and nothing needs importing,** tell them they are set up and ask what they would like to work on.

End with one line on where their work lives: "Everything we make goes in the growth-engine folder here. Open this same folder whenever you work on Launchhouse, in Claude or in Cowork."
