# The gates

Three gates. Each is checked at the start of the next session, so homework is looked at while there is still time to fix it. They exist so nobody arrives in Atlanta unable to build.

| Gate | What | Built | Checked |
|---|---|---|---|
| A | The Founder Brain | Session 1, Mon 7 or Tue 8 September | End of Session 1 |
| B | The content engine | Session 1 homework | Session 2, Mon 14 or Tue 15 September |
| C | Engine 2 and the operations workflow | Session 2 homework | Session 3, Mon 21 or Tue 22 September |

Also in the programme, with no gate:
- **The clinic,** Wed 23 September: the one GoHighLevel snapshot loaded, and the Brain proved to work in Claude.
- **The 90 day plan:** built in Atlanta on the Sunday.
- **The playbook insert:** Session 3 homework.

## How an item is proved

Every item is one of two kinds:

- **file-backed.** A file proves it. Check the file. Never mark it done because the founder says so.
- **self-reported.** Nothing in the folder can prove it. Ask the founder, and record the answer in `.state/gate-answers.md` as an answer, not as evidence.

**Thresholds**
- **Missing:** the file does not exist.
- **Nearly empty:** a file or section with fewer than 40 characters that are not spaces. Say so, and do not count it.
- **Counts:** the numbers below are the minimum.

## Gate A

| Item | Proved by | How |
|---|---|---|
| The Brain exists and is locked | file-backed | `founder-brain.md` has a `Locked:` date |
| A track is chosen | file-backed | the `Track:` line is exactly `b2b` or `b2c` |
| The thesis is written | file-backed | `## Thesis` is not nearly empty |
| The voice is captured | file-backed | `## Voice` is not nearly empty |
| The flags are answered honestly | self-reported | read `## Flags`, then ask |

The flag that matters most:
- **B2B:** the sending domain, its age, and whether SPF, DKIM and DMARC are set.
- **B2C:** the Instagram account type.

## Gate B

| Item | Proved by | How |
|---|---|---|
| Thirty pieces are written | file-backed | `content-30.md` is not nearly empty, and holds 30 pieces |
| The upload sheet is exported | file-backed | `content-30.csv` has the header `content,platform,scheduled_date,media_note` and 30 rows |
| A source list for the refill exists | file-backed | `rss-feeds.md` is not nearly empty |
| The pieces have been read and approved | file-backed | at least 30 `C|` rows in `ledger.md` at `approved`, `scheduled` or `posted` |
| The pieces sound like the founder | self-reported | ask |

A piece the founder has read but not approved counts as not done, on purpose.

## Gate C, B2B

| Item | Proved by | How |
|---|---|---|
| The route is chosen and the sequence is written | file-backed | `outreach-sequence.md` names the route (Apollo or by hand) and holds 4 or 5 touches, each with an opt-out line |
| The list criteria are written down | file-backed | `outreach-sequence.md` holds tight, medium and broad criteria |
| The list is built | file-backed | at least 25 files in `people/` with `kind: prospect` and a status other than `cut` |
| First lines exist for the 25 | file-backed | `outreach-firstlines.csv` has the header `email,first_name,company,first_line` and 25 rows |
| The workflow is built | file-backed | `ops-workflow.md` names the bottleneck and the snapshot, and holds the copy |
| Domain setup is done and sending has started | self-reported | ask |

Twenty five messages, low volume, to a list the founder built and can explain. Nothing anywhere counts replies.

## Gate C, B2C

| Item | Proved by | How |
|---|---|---|
| Twenty five openers are written | file-backed | `dm-openers.md` holds 25 numbered openers, each against a handle |
| Twenty five targets are recorded | file-backed | at least 25 files in `people/` with `kind: target` |
| A hook bank with offer tests exists | file-backed | `hook-bank.md` has its six categories and an `Offer tests` heading |
| Inbound scripts exist | file-backed | `inbound-scripts.md` is not nearly empty |
| The workflow is built | file-backed | `ops-workflow.md` names the bottleneck and the snapshot, and holds the copy |
| The account is Business or Creator, linked to a Page | self-reported, or read from GoHighLevel | `.state/setup.md` if the connector read it, otherwise ask |
| The messages have been sent | at the event, not counted at Gate C | people at `status: sent`, `replied`, `booked` or `no_reply`, from Saturday 26 September |

**The sends.** The 25 go by hand, from the founder's own phone, spread out, on the Saturday in Atlanta. So they are not due at Gate C, and nothing reports them missing before then. When the founder says they have sent one, set that person's status to `sent` and add a touch line. That is what turns a send into evidence.
