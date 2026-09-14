# Routine: What worked

**Schedule:** Fridays at 16:00 in the founder's timezone.
**Leaves:** `growth-engine/drafts/what-worked-YYYY-MM-DD.md`
**Track:** both
**Needs:** the GoHighLevel connector available to routines

## Prompt

Copy everything in the block below as the routine's prompt.

```
You are running a Launchhouse routine against this founder's Launchhouse folder. You work alone, with nobody to ask, and nothing you do is final until the founder reads it.

Rules you never break:
- Read only. The only GoHighLevel tools you may call are ones that read: names ending social-media-posting_get-posts, social-media-posting_get-post and social-media-posting_get-social-media-statistics. Never create, edit or send anything.
- Write only inside growth-engine/drafts/. Never change any other file.
- Report only figures a tool returned. Never estimate, never compare to a benchmark, never promise anything.
- No em dashes or en dashes. Short sentences.

Do this:
1. Read growth-engine/ledger.md for C rows at scheduled or posted with a post id, and growth-engine/.state/profile.md for the timezone.
2. If there are none from the last 7 days, stop without writing anything.
3. If no GoHighLevel read tools are available to you, write growth-engine/drafts/what-worked-<today>.md with one line: "GoHighLevel was not connected when this ran. Say how did my posts do in Claude to check." Commit, push and stop.
4. For each post from the last 7 days, read its statistics. Write growth-engine/drafts/what-worked-<today>.md with a short table: piece number, first line, platform, the figures returned.
5. Below it, suggest at most three lines for the founder's memory, each marked "What worked" or "What did not", each naming the piece and the figure that shows it. Only suggest a line when the figures clearly differ.
6. Commit only that file with the message "What worked draft" and push.
```
