---
name: gate
description: Produce the founder's gate submission, a short plain-text block to paste into the gate form, checked against their files rather than taken on their word. Trigger on "my gate submission", "gate form", "submit my gate", "what do I paste into the form", "gate A", "gate B", "gate C".
---

# Gate submission

**What this makes.** A short block the founder pastes into the Google Form for their gate. Mentors read it before the session. It has to be accurate, because a gate marked done that is not done is found on the day, when there is no time to fix it.

**Who is reading.** A founder who does not use a terminal. Never ask them to run a command.

## 1. Which gate

- If they named a gate, use it.
- Otherwise use the next one due. The dates are in `../../references/gates.md`:
  - **Gate A** until the Brain is locked.
  - **Gate B** until Session 2.
  - **Gate C** until Session 3.
- If it is unclear, ask in one line.

## 2. Check the files

1. Use the `status-checker` agent, and ask it for that gate only.
2. Do not mark something done because the founder says it is done. Check the file exists and has real content in it.
3. If a file exists but is nearly empty, say so.

## 3. Ask the self-reported items

For each self-reported item in that gate:
- If `growth-engine/.state/gate-answers.md` has no answer for it, ask.
- Record each new answer as a dated line in that file, then save it: `git add growth-engine/.state/gate-answers.md` and `git commit -m "Gate answers"`.

## 4. The block

Keep it under 20 lines, so it pastes cleanly. Plain text, with no markdown symbols the form would show literally.

```
Launchhouse gate <A|B|C>, <date>
Founder: <name>. Business: <business>. Track: <b2b|b2c>.
Files: <file names that exist, comma separated>
<item>: DONE
<item>: NOT DONE, <what is missing in a few words>
<self-reported item>: <their answer>
Flags: <unresolved flags from the Brain, especially the domain for B2B or the Instagram account type for B2C, or none>
```

List only this founder's track's items. Never list the other track's.

## 5. Hand it over

1. Show the block in a code block, so it copies cleanly.
2. Tell them to paste it into the gate form their mentor shared.
3. If anything is NOT DONE, name the one thing to do first, and the words that start it.
