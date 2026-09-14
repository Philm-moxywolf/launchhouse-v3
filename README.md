# Launchhouse growth engine

The engines for Launchhouse Atlanta founders, run from the Claude desktop app in their own folder.

Claude asks the founder the questions, writes their Founder Brain and everything built on it, and saves it as it goes. It puts posts into GoHighLevel and builds an Apollo sequence when the founder says yes. It holds back anything that offers to automate cold DMs, says replies are certain, or uses the other track's material. A reviewer checks every figure before the work is called done.

There is no app to host, no key to paste, no database and no terminal. Founders need the Claude desktop app, GitHub Desktop, and their own copy of the founder folder.

This repository is the plugin marketplace `launchhouse-v3`, holding one plugin, `growth-engine`. The folder founders work in is a separate template: [Philm-moxywolf/launchhouse-founder-template](https://github.com/Philm-moxywolf/launchhouse-founder-template).

## For founders

The full guide, with what you will see at each step, is `START-HERE.md` in your copy of the founder folder. In short:

1. **Install the apps.**
   - The Claude desktop app and GitHub Desktop, signed in.
   - On a Windows PC, also Git for Windows from git-scm.com, pressing Next on every screen.
2. **Make your own copy.** Open the founder template on GitHub, press **Use this template**, and choose **Private**.
3. **Put it on your computer.** On your copy, press **Code**, then **Open with GitHub Desktop**, then **Clone**.
4. **Open it in Claude.** In the Claude app, choose **Code**, pick the folder, and accept the Launchhouse plugin.
   - If it is not offered: press **+**, then **Plugins**, add `Philm-moxywolf/launchhouse-v3`, and install **growth-engine**.
5. **Start.** Say **"start launchhouse"**.
6. **Bring your work across.** If you built work in the Launchhouse app, download everything from its Files screen, drag the file into your folder, and say **"bring my work across"**.
7. **Connect your tools.** In **Settings**, then **Connectors**, connect HighLevel, and Apollo if you sell to businesses. Then say **"connect my tools"**.
8. **Check.** Say **"where am I up to"**.

Plain words work for everything. The commands below are there if you prefer them.

## What you can ask for

| Say | Or | What happens |
|---|---|---|
| start launchhouse | `/growth-engine:start` | Checks your computer, asks your name and where you are, sets the folder up |
| bring my work across | `/growth-engine:import` | Brings your work over from the app and tidies it, without rewriting what you wrote |
| build my founder brain | `/growth-engine:brain` | The record of your business every other engine reads. Change your track here too |
| add my writing samples | `/growth-engine:add-files` | Adds old posts, documents, decks and photos, so the engines can read them |
| build my content engine | `/growth-engine:content` | Four pillars and 30 pieces in your voice. Also refills monthly, and records what you approve |
| build my outreach or audience engine | `/growth-engine:engine2` | B2B: sequence, list and 25 first lines. B2C: 25 openers, hooks and inbound scripts |
| build my ops engine | `/growth-engine:ops` | One GoHighLevel workflow and all its copy, ready for the clinic |
| connect my tools | `/growth-engine:connect` | Checks GoHighLevel, and Apollo for B2B, by reading your own account back |
| publish my posts | `/growth-engine:publish` | Puts approved pieces into GoHighLevel, after showing you exactly what and when |
| build my Apollo sequence | `/growth-engine:sequence` | B2B: finds your 25, then builds the sequence paused, for you to start |
| where am I up to | `/growth-engine:status` | Your gates, what is missing, and the one thing to do next |
| my gate submission | `/growth-engine:gate` | A block to paste into the gate form, checked against your files |
| build my 90 day plan | `/growth-engine:plan` | The Sunday plan: one number, Monday's three actions, kill criteria |
| generate my playbook | `/growth-engine:playbook` | Your personalised playbook insert |
| set up a routine | `/growth-engine:routines` | Scheduled drafts: your Monday plan, a content top-up, the countdown to Atlanta |
| save my work | `/growth-engine:save` | Saves, shows what changed, and brings back an earlier version |
| help | `/growth-engine:help` | Checks your setup and sorts common problems. `/growth-engine:doctor` does the same |

## What the rules do

The six programme rules are built in, in three layers.
- **Checks on every file.** Hooks check each file as Claude writes it into `growth-engine/`.
- **A reviewer.** An agent reads each piece of work for meaning before it is called done.
- **The skills.** The same rules are written into the skills themselves.

| Stopped | Waits for the founder's yes | Just happens |
|---|---|---|
| Offering to automate cold Instagram DMs | Putting a post into GoHighLevel | Writing and editing their files |
| Promising replies | Replying to someone who wrote first | Saving each finished piece of work |
| Writing the other track's files or material | Spending Apollo credits | Reading their GoHighLevel and Apollo accounts |
| Starting an Apollo sequence, or sending from Apollo | Adding people to Apollo or a paused sequence | Free Apollo searches |
| Buying anything on their accounts | Marking content approved | Adding their documents |
| Launchhouse files written outside their folder | Bringing back an earlier version | Showing where they are up to |

When a file is held, it is put back exactly as it was, and Claude tells the founder the line and why, in plain words.

## Where founder work lives

Everything is in `growth-engine/` inside the founder's own folder. Most of it is backed up to their private GitHub copy.
- **People's details stay off GitHub.** Three things hold real people's names, emails or handles: `people/`, `outreach-firstlines.csv` and `dm-openers.md`. The folder's `.gitignore` keeps them on the founder's computer only.
- **The full contract** of files, formats and gates is in [`plugins/growth-engine/references/`](plugins/growth-engine/references).

## What is in this repository

| Path | What it is |
|---|---|
| `.claude-plugin/marketplace.json` | The marketplace, `launchhouse-v3` |
| `plugins/growth-engine/` | The plugin. Its own [README](plugins/growth-engine/README.md) lists every skill, agent, command, hook and routine |
| `scripts/validate.sh` | The one check. Run it before every commit |
| `tests/rules/` | 197 real sentences the rules must hold or leave alone, taken from the Launchhouse app's own tests and from founder simulations |
| `tests/hooks/` | Builds a throwaway founder folder and drives the hooks the way Claude does |
| `tests/scaffold/` | Checks the founder template matches what the start skill creates |
| `.github/workflows/validate.yml` | Runs all of it on every push, under sh, dash and bash with two awks, and on Windows |

## For maintainers

Run the check before every commit:

```bash
sh scripts/validate.sh
```

**Validation checks**
- the manifests
- every skill, command and agent, and that every skill, agent and reference file named anywhere exists
- that no command shares a name with a skill
- that the hook scripts parse
- house style in everything a founder or Claude reads: no em or en dashes, no marketing words, no promised replies, commands always namespaced
- that no internal planning material is committed
- the founder template, when it sits next to this repository at `../launchhouse-founder-template`

It then runs all three test suites.

**Working rules**
- **Fix the skill, not the output.** A generic post means the skill is not reading the Brain's voice. Editing the post hides that.
- **Every rules change adds sentences to `tests/rules/corpus.txt`:**
  - `PASS` for ordinary wording that must never be held
  - `HOLD` for shapes that always must be held
  - `CATCH` for offers the hook should catch, which the reviewer covers when it does not
- **Keep the hook scripts portable.** They are POSIX sh and awk on purpose, with no node, python or jq, so they run on a Mac, on Windows through Git for Windows, and in Cowork. Each does nothing outside a folder carrying `growth-engine/.launchhouse`, and lets the write through if it cannot work out what is happening.
- **Keep the scaffold and the template in step.** The start skill's scaffold (`skills/start/references/scaffold.md`) and the founder template must match; `tests/scaffold` fails when they do not.
- **Releasing an update.** Bump `version` in both `plugins/growth-engine/.claude-plugin/plugin.json` and `.claude-plugin/marketplace.json`, then push. Founders update from **+**, then **Plugins**, in the Claude app.

## Licence

See [LICENSE](LICENSE). Provided to participants of Oneday Launchhouse Atlanta for use on their own businesses.
