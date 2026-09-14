---
name: playbook-export
description: Compile the founder's personalised playbook insert from their own files, four to six pages, delivered as a PDF alongside the generic Growth Engine playbook body. Session 3 homework. Trigger on "generate my playbook", "playbook insert", "print my playbook", "make my playbook PDF".
---

# Playbook Export

Produces the four to six page personalised insert that goes with the printed generic playbook.

**Who is reading.** A founder who does not use a terminal. Never ask them to run a command.

## Prerequisites

1. **Check the folder.** Read the session context. If it says this is not the founder folder, stop and tell them which folder to open.
2. **Read every file in `./growth-engine/`,** except `people/`, `uploads/` and `.state/`.
3. **If `founder-brain.md` does not exist,** stop. Tell the founder the Founder Brain comes first (`/growth-engine:brain`). There is nothing to compile.

**This is a compilation task, not a generation task.** Do not invent content that is not already in the founder's own files. If a section has no source file, leave it out and say so, rather than writing filler.

## Contents

1. **Cover.** Founder name, business, track.
2. **Your Brain.** Offer, audience, proof and voice, in one page.
3. **Your content.** The pillars, and the 30 pieces as titles and openers only, not the full text.
4. **Your engine 2.**
   - B2B: the sequence.
   - B2C: the hook bank and inbound scripts.
   - Never include the people list or anyone's details.
5. **Your ops.** Bottleneck, snapshot, and message copy.
6. **Your 90 days.** The plan, the number, Monday's three actions, kill criteria.

## Output

Write `./growth-engine/playbook-insert.md`, formatted for print:
- clean headings, no clutter, generous white space
- a page break between sections, as a line holding only `<div style="page-break-after: always"></div>`

**Limits.** Six pages maximum. Format it so it converts cleanly to PDF: no wide tables, and no colour dependence.

## Check and save

1. **Check.** Use the `rules-reviewer` agent on `playbook-insert.md`. It should find nothing new, because it only compiles. Anything it holds came from a source file, so fix it there, then compile again.
2. **Save.** Run `git add growth-engine` then `git commit -m "Playbook insert"`. Push if there is a remote.

## The PDF

**The personalised insert is delivered as a PDF, not printed.** The generic playbook body is printed in two variants, B2B and B2C. Founders receive the insert digitally before Atlanta, and can print it themselves if they want a hard copy.

To make the PDF:
- **If a PDF skill or tool is available to you,** make `growth-engine/playbook-insert.pdf` from the markdown, and tell them where it is.
- **Otherwise,** tell them to open `playbook-insert.md` in any Markdown viewer, and use Print, then Save as PDF.
