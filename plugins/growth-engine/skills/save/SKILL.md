---
name: save
description: Save the founder's Launchhouse work, show what changed, and bring back an earlier version of a file, in plain words, using the git history of their folder. Never deletes history. Trigger on "save my work", "save", "what changed", "what have I changed", "undo that", "bring back the old version", "I deleted something", "put it back", "back up to GitHub".
---

# Save

The founder's folder keeps a history of every save. This skill is how they use it without knowing it is git.

**Who is reading.** A founder who does not use a terminal. Run every command yourself. Talk about "saves" and "earlier versions", never commits, branches or hashes.

**What this never does**
- Rewrite or delete history.
- Force push.
- Reset the folder.
- Delete a file the founder did not name.

Any of those can lose work, and none of them is ever needed here.

## Save my work

1. Run `git status --short`.
   - If nothing changed, say everything is already saved, and when: `git log -1 --format=%cd`.
2. Say in one line what is being saved, in words: "your content file and 3 new writing samples".
3. Run `git add -A`.
   - `.gitignore` keeps `people/` and downloaded zips out.
   - If `git status` shows a person file, a zip, `outreach-firstlines.csv`, `dm-openers.md`, or any `.csv` with an email column about to be added, stop. Run `git restore --staged` on it, fix `.gitignore` from the start skill's scaffold, and only then save.
4. Commit with a short plain message that says what the work was: `git commit -m "<what changed>"`.
5. **Push.**
   - If `git remote -v` shows a remote, run `git push`.
   - If the push is refused because GitHub has newer saves (for example, a routine drafted something), run `git pull --no-rebase`, then push again.
   - If the pull stops on a conflict, do not resolve it by guessing. Run `git merge --abort`, say their work is saved on this computer, and tell them a mentor will sort the GitHub copy.
   - If the push asks for a login or fails another way, say their work is saved on this computer, and GitHub can be sorted with a mentor.

**If git has no name or email set,** ask for the email they use for GitHub, and set both for this folder only, as in the start skill.

## What changed

- **Since the last save:** `git status --short` and `git diff --stat`. Describe it in words.
- **Over a period:** `git log --since="<when>" --format="%ad %s" --date=short -- growth-engine`. List the saves in plain words.
- **In one file:** `git diff HEAD -- growth-engine/<file>`. Show the few lines that changed, not the whole diff.

## Bring back an earlier version

1. **Find the file and the version.** Run `git log --format="%h %ad %s" --date=format:"%a %d %b %H:%M" -- growth-engine/<file>`.
2. **Show them the saves** as a short numbered list of dates and messages. Do not show the hashes.
3. **Show what they would get back.** Run `git show <hash>:growth-engine/<file>`, and show the first lines, or the part they care about.
4. **Ask for a yes.**
5. **Save first.** If there are unsaved changes to that file, save them, so nothing is lost by going back.
6. **Restore the file.** Run `git restore --source <hash> -- growth-engine/<file>`.
7. **Save it.** Run `git add -- growth-engine/<file>` and `git commit -m "Brought back <file> from <date>"`. The newer version stays in the history, so they can change their mind.

If the file was deleted, find the last save that had it with `git log --diff-filter=D --format="%h %ad" -- growth-engine/<file>`. Restore from the save before that one.

**Undo that.** The founder means the last thing that changed:
- **A file change that is not saved yet:** show it, and on a yes run `git restore -- growth-engine/<file>`.
- **Already saved:** bring back the version from the save before, as above.

**Never** undo more than they asked for.

## Content approvals

If a restored file is `content-30.md`, any piece whose words changed goes back to `draft` in `ledger.md`, because approval is of the words as they read. Say which.
