# Launchhouse growth engine

The engines for Launchhouse Atlanta founders, run from Claude in your own folder. Claude works in your folder: it asks you the questions, writes your Founder Brain and everything built on it, and saves it with git. It holds back anything that invents a number or offers to automate cold DMs.

There is no app to set up, no key to paste and no database. You need the Claude desktop app and your own copy of the founder folder.

## For founders

1. Make your own private copy of the founder folder: `Philm-moxywolf/launchhouse-founder-template`, **Use this template**, **Private**.
2. Open it in the Claude desktop app, in **Code**, and accept the Launchhouse plugin when it is offered.
3. Say **"start launchhouse"**.

If you built work in the Launchhouse app, download everything from its Files screen, drag the file into your folder, and say **"bring my work across"**.

To install the plugin by hand: in the Claude desktop app press **+** next to the message box, choose **Plugins**, add the marketplace `Philm-moxywolf/launchhouse-v3`, and install **growth-engine**.

## What is in the plugin

| Part | What it does |
|---|---|
| `/growth-engine:start` | Sets the folder up: your name, your timezone, saving with git |
| `/growth-engine:import-from-app` | Brings your work across from the Launchhouse app and tidies it, without rewriting what you wrote |
| `/growth-engine:founder-brain` | Builds or updates the Founder Brain, the record every other engine reads |
| `rules-reviewer` agent | Reads what was written for invented proof, cold DM automation, reply promises and the other track's material |
| Hooks | Show Claude where you are up to at the start of a session. Put back any file that breaks a rule. Stop the GoHighLevel and Apollo tools that send, activate or buy |

More engines follow: content, outreach or audience, operations, the 90 day plan, publishing, and routines that draft your week.

## The rules, in code

1. **Two tracks.** B2B or B2C, chosen once in the Brain. The other track's files cannot be written.
2. **No Instagram DM automation.** An offer to automate cold DMs is held before it stays on disk, and GoHighLevel's send-message tool is stopped.
3. **25 B2B messages, and no promised replies.** A line promising replies is held.
4. **Everything lives in `growth-engine/`.** A Launchhouse file written anywhere else is refused.
5. **No invented proof.** The reviewer checks every figure against what you told it.
6. **Your voice.** Voice comes only from your own writing.

## For maintainers

Run the check before every commit:

```bash
sh scripts/validate.sh
```

It checks the manifests, every skill and agent, the hook scripts, the house style in everything a founder reads, and runs both test suites. `tests/rules` holds the rules to the sentences the app's own tests used. `tests/hooks` builds a throwaway founder folder and drives the hooks as Claude Code does. Both run under sh, dash and bash.

The hook scripts are POSIX sh and awk on purpose, with no node, python or jq, so they run on a founder's Mac, on Windows through Git for Windows, and in Cowork. Every one of them does nothing outside a folder carrying `growth-engine/.launchhouse`, and lets the write through if it cannot work out what is happening.
