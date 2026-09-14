# Launchhouse growth engine

The engines for Launchhouse Atlanta founders, run from Claude in your own folder. Claude asks you the questions and writes your Founder Brain and everything built on it. It publishes to GoHighLevel and builds your Apollo sequence when you say yes, and saves everything with git.

It holds back anything that invents a number or offers to automate cold DMs.

There is no app to set up, no key to paste and no database. You need the Claude desktop app and your own copy of the founder folder.

## For founders

1. Make your own private copy of the founder folder. On GitHub, open `Philm-moxywolf/launchhouse-founder-template`, press **Use this template**, and choose **Private**.
2. Open it in the Claude desktop app, in **Code**, and accept the Launchhouse plugin when it is offered.
3. Say **"start launchhouse"**.

**If you built work in the Launchhouse app:** download everything from its Files screen, drag the file into your folder, and say **"bring my work across"**.

**To install the plugin by hand:** in the Claude desktop app, press **+** next to the message box, choose **Plugins**, add the marketplace `Philm-moxywolf/launchhouse-v3`, and install **growth-engine**.

Plain words work for everything. The commands below are there if you prefer them.

## What you can ask for

| Say | Or | What happens |
|---|---|---|
| start launchhouse | `/growth-engine:start` | Sets your folder up: your name, your timezone, saving |
| bring my work across | `/growth-engine:import` | Brings your work over from the app and tidies it, without rewriting what you wrote |
| build my founder brain | `/growth-engine:brain` | The record of your business every other engine reads. Change your track here too |
| add my writing samples | `/growth-engine:add-files` | Adds old posts, documents, decks and photos, so the engines can read them |
| build my content engine | `/growth-engine:content` | Four pillars and 30 pieces in your voice. Also refills monthly, and records what you approve |
| build my outreach or audience engine | `/growth-engine:engine2` | B2B: sequence, list and 25 first lines. B2C: 25 openers, hooks and inbound scripts |
| build my ops engine | `/growth-engine:ops` | One GoHighLevel workflow and all its copy, ready for the clinic |
| connect my tools | `/growth-engine:connect` | Connects GoHighLevel, and Apollo for B2B, and proves each works |
| publish my posts | `/growth-engine:publish` | Puts approved pieces into GoHighLevel, after showing you exactly what and when |
| build my Apollo sequence | `/growth-engine:sequence` | B2B: finds your 25, then builds the sequence paused, for you to start |
| where am I up to | `/growth-engine:status` | Your gates, what is missing, and the one thing to do next |
| my gate submission | `/growth-engine:gate` | A block to paste into the gate form, checked against your files |
| build my 90 day plan | `/growth-engine:plan` | The Sunday plan: one number, Monday's three actions, kill criteria |
| generate my playbook | `/growth-engine:playbook` | Your personalised playbook insert |
| set up a routine | `/growth-engine:routines` | Scheduled drafts: your Monday plan, a content top-up, the countdown to Atlanta |
| save my work | `/growth-engine:save` | Saves, shows what changed, and brings back an earlier version |
| help | `/growth-engine:help` | Checks your setup and sorts common problems |

## What is in the plugin

| Part | What it is |
|---|---|
| `skills/` | Eighteen skills, one per job above, plus `outreach-b2b` and `audience-b2c`, which engine 2 picks between by track |
| `commands/` | The short names above, each pointing at its skill |
| `agents/rules-reviewer` | Reads what was written for invented proof, cold DM offers, reply promises and the other track's material |
| `agents/voice-reviewer` | Checks writing sounds like the founder, against their own samples |
| `agents/status-checker` | Reads the folder against the gates and reports what the files prove |
| `agents/file-ingester` | Converts one supplied file into readable text with a note of where it came from |
| `hooks/` | Tell Claude where you are up to at the start of a session. Put back any file that breaks a rule. Stop the GoHighLevel and Apollo tools that send, activate or buy |
| `references/` | The folder contract, the gates, and the media lists every skill works to |
| `routines/` | Five routine prompts: Monday plan, content top-up, what worked, sequence health, countdown |

## The rules, in code

1. **Two tracks.** B2B or B2C, chosen once in the Brain. The other track's files cannot be written, and its material is held.
2. **No Instagram DM automation.** An offer to automate cold DMs is held before it stays on disk, and GoHighLevel's send-message tool is stopped.
3. **25 B2B messages, and no promised replies.** A line promising replies is held. Apollo sequences are built paused, and starting one is the founder's button.
4. **Everything lives in `growth-engine/`.** A Launchhouse file written anywhere else is refused.
5. **No invented proof.** The reviewer checks every figure against the Brain as it was before the work, and against what the founder said.
6. **Your voice.** Voice comes only from the founder's own writing.

## For maintainers

Run the check before every commit:

```bash
sh scripts/validate.sh
```

**What it checks.**
- The manifests.
- Every skill, command and agent, and that each skill, agent and reference file they name exists.
- The hook scripts.
- House style in everything a founder or Claude reads.
- Commands are namespaced.
- The founder template, when it sits alongside this repo.

**What it runs.** Three suites:
- `tests/rules` holds the rules to the sentences the app's own tests used.
- `tests/hooks` builds a throwaway founder folder and drives the hooks as Claude Code does.
- `tests/scaffold` checks the template matches the start skill.

CI runs them under sh, dash and bash, with mawk and gawk, and on Windows.

**How the hooks are built.** The hook scripts are POSIX sh and awk on purpose, with no node, python or jq. That way they run on a founder's Mac, on Windows through Git for Windows, and in Cowork. Each does nothing outside a folder carrying `growth-engine/.launchhouse`, and lets the write through if it cannot work out what is happening.
