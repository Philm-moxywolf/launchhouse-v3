---
name: import-from-app
description: Bring a founder's work across from the Launchhouse app into this folder, then tidy it for the new setup without rewriting anything they wrote. Handles the downloaded zip, a folder unzipped one level too deep, or files dropped loose. Saves an untouched copy first, adjusts files to the current format, checks them against the rules, and saves again. Trigger on "bring my work across", "import from the app", "I downloaded my files", "move my work over", "here is my zip", or when the session context says there is work from the app in the folder.
---

# Bring work across from the app

The founder built their Brain, and maybe their content and engines, in the Launchhouse app. They have downloaded it. This skill brings it into their folder and hands over to the new setup.

**The promise to the founder:** your work arrives as it was, gets tidied, and nothing you wrote is rewritten without your yes. Never re-interview them for anything that already exists.

**Who is reading.** No terminal. Run commands yourself, then say in plain words what you did.

The full format every file should end up in is in `../../references/contract.md`, relative to this skill. Read it before step 4.

## 1. Find what they brought

Look in the folder they opened, and in `growth-engine/`, for any of these:

- **A zip file**, usually `growth-engine.zip`.
  - If there is none, ask where it saved. It is often the Downloads folder.
  - If they say Downloads, look for `growth-engine*.zip` there. Show them what you found, and copy it into this folder once they say yes.
- **A folder** called `growth-engine` inside `growth-engine`: unzipped one level too deep.
- **Loose files** such as `founder-brain.md` or `content-30.md` sitting in the folder they opened rather than in `growth-engine/`.
- **Files already in the right place**: `growth-engine/founder-brain.md` and friends.

If you cannot find anything, ask them to download everything again. In the app: open Files, press the button that downloads everything. Then drag the file into this folder. Stop until they have.

**Unpack a zip into a holding folder, never straight into growth-engine:**
- Make `.lh-import/`.
- Run `unzip -o <zip> -d .lh-import`. If `unzip` is not available, run `tar -xf <zip> -C .lh-import`.
- The app's zip has a `growth-engine/` folder at its top. Use that folder's contents.

**Before moving anything,** list what came across to the founder, grouped:
- the Brain
- content
- engine 2
- operations
- plan
- people (count only, never names)
- documents and writing samples (counts)

## 2. Move it into place

Move the app's files into `growth-engine/`, keeping their paths. Use `cp -R` from the holding folder, then remove `.lh-import/`. Leave the zip where it is: `.gitignore` keeps zips out of git.

When a file exists in both places:

- **Starting files from the template** (`ledger.md`, `memory.md`, `ops-log.md`, `people/README.md`, `.launchhouse`): the app's version wins, except `.launchhouse`, which stays.
- **Anything the founder already made in this folder**, such as a new Brain: stop and ask which to keep. Show both Locked dates and the first lines. Never merge two Brains yourself.

Then clear out what only the app needed:

- `growth-engine/README-your-files.md`
- `growth-engine/.state/HOME`, which points at a folder on the app's server
- `growth-engine/.state/snapshots/`, `growth-engine/.state/log.bytes`, `growth-engine/.state/memory.lock`, and any file with `.ge-tmp.` in its name
- `growth-engine/.gitignore`. The app's version hides `.state/`, which this setup keeps. The folder-level `.gitignore` already keeps `people/` out of git. Check it has those lines, and add them from the start skill's scaffold if not.

## 3. Save it exactly as it arrived

Run `git add -A` then `git commit -m "Your work from the app, as it was"`.

This is the undo point for everything after. If git needs a name and email, follow step 4 of the `start` skill first.

## 4. Adjust to the current format

Work through `../../references/contract.md`. Change only what is listed there. Keep every word the founder wrote.

### The Founder Brain

**Header**
- If the `Track` line is missing, or is not exactly `b2b` or `b2c`, ask the one question that decides it: "does your revenue come mostly from businesses or from individual consumers?" Set it.
- If the track is `b2c` and there is no `Model` line, ask: "do people book a service from you, or buy products?" Record `service` or `ecommerce`. Never add `Model` for B2B.
- If `Locked` is missing, use the date of the zip.

**Sections**
- If `## Thesis` is missing, compose one from `## Offer` and `## Audience`. Show it to them, and write it only when they say it is right.
- If `## Numbers` is missing, add it after `## Channels`. Fill each line from what the Brain already says, or write `unknown`.
  - `Customers now:`
  - `Average monthly value:`
  - `Target in 90 days:`
  - Ask one question only if the Brain says nothing either way.

If more than two things are missing, say so, and offer the full `founder-brain` skill in update mode rather than asking question after question.

### Content (if `content-30.md` exists)

- **Ledger.** If `ledger.md` has no `C|` rows, add one row per piece:
  - Format: `C|<n>|<pillar number>|<format>|<lane>|draft|-|-`
  - `<n>` is the piece number.
  - `<pillar number>` is 1 to 4, from the pillar heading it sits under.
  - `<format>` is a short slug such as `short-post`, `long-post`, `video-script`, `carousel` or `caption`.
  - `<lane>` is `media` if the piece has a note saying it needs a clip or photo, otherwise `text`.
  - Every row is `draft`. Nothing is approved on import, because approval is the founder reading each piece and saying so.
- **CSV.** Check `content-30.csv` has exactly the header `content,platform,scheduled_date,media_note`, and the same number of pieces as `content-30.md`.
  - If it does not, tell them, and offer to rebuild the CSV from the markdown. Rebuild only if they say yes.

### B2B first lines

If `outreach-firstlines.csv` has a fifth `status` column, rewrite it with only `email,first_name,company,first_line`.

### Refill archives

Rename any `content-30-<month name>.md` to `content-30-YYYY-MM.md`.

### Wording from the app, inside the deliverables

Search the files for:
- "in the app"
- "open Files"
- "from Files"
- "download everything"
- "Launchhouse app"

List any lines found, and ask once whether to remove them. Change nothing else.

### memory.md

If its fourth line mentions `ge remember`, replace that one line with: "Add one line per entry inside the marked blocks, dated. Anything under Notes is the founder's own."

**If a change is held by the Launchhouse checks,** the hook tells you which line and why. Do not try to force the change through. That is the check finding something already in their work. Note it for step 5 and move on.

## 5. Check the rules, do not rewrite

Use the `rules-reviewer` agent on every deliverable in `growth-engine/`. Tell it:
- the files were imported from the app
- the figures the founder gave: none, unless they told you some during this import

Then tell the founder what it found:

- **Nothing held.** Say their work is clean against the Launchhouse checks.
- **Held lines.** List each as "worth a look", with the file, the line, and the reason in plain words. The app already stopped the worst cases, so these are usually small. Offer to fix them one at a time. Change a line only after they say yes to that line.
- **Notes.** Mention the count and offer to show them.

## 6. Save, and hand on

1. Run `git add -A` then `git commit -m "Adjusted to the new setup"`.
2. If `git remote -v` shows a remote, run `git push`. If that fails, say their work is saved on this computer and GitHub can be sorted later.
3. Tell them in three short lines:
   - what came across
   - what was adjusted
   - what is next, from the list below

**What is next:**
- no content yet: build the content engine
- B2B with no `outreach-sequence.md`: build the outreach engine
- B2C with no `dm-openers.md`: build the audience engine
- no `ops-workflow.md`: build the operations engine
- all of those done: connect GoHighLevel, and Apollo for B2B, then publish

End with: "You do not need the app any more. Everything is here, and it is saved."
