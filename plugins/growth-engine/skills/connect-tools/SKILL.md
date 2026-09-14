---
name: connect-tools
description: Connect GoHighLevel, and Apollo for B2B founders, to the founder's Claude account and prove each connection works by reading their own account back to them. Records where each connection stands, and sets the tool permissions that keep sending and buying in the founder's hands. Trigger on "connect GoHighLevel", "connect Apollo", "connect my tools", "is GoHighLevel connected", "check my connections", or before publishing or building a sequence when nothing is connected.
---

# Connect the tools

GoHighLevel publishes the founder's posts and holds their contacts. Apollo, for B2B founders only, finds people and builds the sequence. Both connect to the founder's own Claude account as **connectors**: a connection that lets Claude use the tool on their behalf, on their own account.

**The doubt to name first.** Connecting a tool to Claude sounds like handing over the keys. So say what it can and cannot do here:
- Claude can read, and it can create drafts and paused sequences when the founder says yes.
- It cannot send a message from their GoHighLevel account, start an Apollo sequence, or buy anything. The Launchhouse checks stop those.

**Who is reading.** A founder who does not use a terminal. Never ask them to run a command.

Each check writes a row in `growth-engine/.state/setup.md`, in the shape in `../../references/contract.md`. **Evidence is only ever what the tool returned**, never what the founder said.

## 0. Before starting

1. **Check the folder.** Read the session context. If it says this is not the founder folder, stop and tell them which folder to open.
2. **Read the track** from the Brain. Apollo is B2B only. A B2C founder never sees an Apollo step, and not seeing one is correct.
3. **Check what is done.** Read `growth-engine/.state/setup.md` if it exists. Skip what is already done unless they asked to check again.

## 1. GoHighLevel

### Do they have it

Ask: "Can you log in to GoHighLevel?" The programme buys the Starter plan in Session 2.
- **If not yet:** record `GoHighLevel connector | not needed yet | <date> | not bought yet`. Say they are not behind, and stop this part.
- **If they are not sure:** tell them to look in their inbox for an email from GoHighLevel with a login link. If there is nothing, they have not bought it yet, and that is fine.

### Is it connected

Look at the tools available to you. A GoHighLevel connection gives tools whose names end in things like `social-media-posting_get-account`, `locations_get-location` and `contacts_get-contacts`.

**If there are none,** walk them through connecting it, one step at a time:

1. In the Claude desktop app, open **Settings**, then **Connectors**.
2. Look for **HighLevel** or **GoHighLevel** in the list of connectors and connect it.
3. **If it is not in the list,** follow GoHighLevel's own guide, which is kept current: https://help.gohighlevel.com/support/solutions/articles/155000005741-how-to-setup-and-use-the-highlevel-mcp-server

**If their guide asks for a Private Integration token,** these are the steps founders found hard, so walk them slowly:

1. **Find Private Integrations.**
   - When we last looked, it was under Settings, then Private Integrations. Menus move.
   - If it is not there, search the page for the word Private: Ctrl and F, or Command and F on a Mac.
   - The Starter plan does carry this screen.
   - If they cannot find it at all, do not let them buy an upgrade. Record `needs a hand`, and send them to the Slack channel with what their Settings menu lists.
2. **Do it inside the sub-account, not at agency level.** A token made at agency level does not reach their business.
3. **Tick the permissions GoHighLevel's guide asks for.** At the least, the connector needs:
   - View and Edit Social Media Posts
   - View Social Media Accounts
   - View Social Media Statistics
   - View and Edit Contacts
   - View Locations

   Copy each name rather than typing it. One typed at 10pm comes out slightly wrong.
4. **The token is shown once.** Keep that tab open until the connection works.
5. **The Location ID** is on the business profile. When we last looked, that was under Settings, then Business Profile, near the top. It looks like a password and is not one: it is more like a house number.

When they have connected it, the new tools may need a fresh conversation to appear. If you still cannot see them, ask them to start a new conversation in this folder and say "check my connections".

### Prove it

Do not tick a box. Read their own account back to them, which a broken connection cannot fake.

**Location**
- Call the tool ending `locations_get-location`.
- Say: "Connected to <location name>. Is that your business?"
- Record `GoHighLevel connector | done | <date> | read back location: <name>`.

**Accounts to post to**
- Call the tool ending `social-media-posting_get-account`.
- Name each connected account and its platform.
- Record `GoHighLevel accounts to post to | done | <date> | <platform: name, ...>`.
- If the list is empty, the connection works but nothing is connected to post to. Tell them: in GoHighLevel, open Social Planner and connect their Facebook Page, and their Instagram for B2C, then say "check again". Record `in progress`.

**Contacts**
- Call the tool ending `contacts_get-contacts`, asking for one contact.
- Say contacts are readable. Never show a contact's details.
- Record `GoHighLevel contacts | done | <date> | contacts readable`.

**B2C only: Instagram**
- If an Instagram account appears in the accounts list, record `Instagram Business or Creator | done | <date> | Instagram connected in Social Planner: <name>`. GoHighLevel only connects Business or Creator accounts.
- If there is none, remind them to convert Instagram to Business or Creator and link it to a Facebook Page. Record `not started`.

**When a check fails,** say the likely cause in plain words, and give one next step:

| What happened | Say |
|---|---|
| Not authorised | The connection did not accept the token. The usual reason is that only part of it got copied, or it was made at agency level instead of inside the sub-account. Make a new one. |
| Wrong location | The token works, but not for that sub-account. One of the two came from a different place. |
| A permission refused | The connection works, but one permission was not ticked. Name the one the failing call needed. |
| Too many requests | GoHighLevel is asking us to slow down. Nothing is wrong. Try again in a minute. |
| No answer | That is GoHighLevel's side, not theirs. Try again shortly. |

Record `needs a hand` only when the founder cannot fix it with that step.

## 2. Apollo, B2B only

Skip this whole section for B2C.

### Is it connected

Look for tools whose names end in `apollo_users_api_profile` and `apollo_mixed_people_api_search`.

**If there are none:**

1. In the Claude desktop app, open **Settings**, then **Connectors**.
2. Find **Apollo** and connect it. It asks them to sign in to Apollo. There is nothing to paste.
3. Start a new conversation in this folder if the tools do not appear.

**The free Apollo plan connects in full.** Never tell a founder they need the paid plan to connect. The 65 USD/month plan buys credits, sending limits and mailboxes, and it is set up with sending in Session 2.

### Prove it

**Account**
- Call the tool ending `apollo_users_api_profile`.
- Say: "Connected to Apollo as <their email>."
- Record `Apollo connector | done | <date> | signed in as <email>`.

**Sending mailbox**
- Call the tool ending `apollo_email_accounts_index`.
- If a mailbox is connected, record `Apollo sending mailbox | done | <date> | <address>`.
- If none is, tell them: in Apollo, open the settings for email accounts and connect the mailbox they will send from, which is a two-minute sign-in. Record `not started`.
- Only needed on the Apollo route. If `outreach-sequence.md` records the manual route, record `not needed yet`.

**Never call an enrichment tool to test the connection.** Enrichment spends credits.

**Refusals**
- **Not allowed:** either the plan does not carry that feature yet, or the connection needs signing in again. Try reconnecting first.
- **Too many requests, or no answer:** wait a minute and try again.

### Domain authentication

There is no tool that reads SPF, DKIM and DMARC here. Ask whether Apollo, or their domain provider, shows all three as set. Record the answer as a gate answer, not as setup evidence:

`- <date> gate C, domain set up and sending started: <their answer>`

## 3. Tool permissions

**The Launchhouse checks already stop these tools in this folder:**
- GoHighLevel sending a message
- Apollo sending, starting a sequence, or buying a mailbox

**Their connector settings can stop them everywhere.** If the Connectors settings let them choose per tool, suggest:

| Setting | Tools |
|---|---|
| **Never allow** | GoHighLevel `conversations_send-a-new-message`; Apollo `apollo_emailer_messages_send_now`, `apollo_emailer_campaigns_approve`, `apollo_email_account_purchase_create` |
| **Ask each time** | anything that creates, edits or adds, and Apollo enrichment (`apollo_people_match`, `apollo_people_bulk_match`), which spends credits |
| **Always allow** | tools that only read |

If their settings do not offer this, say the Launchhouse checks cover it in this folder, and move on.

## 4. Save and hand on

1. Run `git add growth-engine/.state` and `git commit -m "Checked connections"`. Push if there is a remote.
2. Tell them in two lines what is connected and what is not.
3. The next step is usually:
   - `/growth-engine:publish` for approved content
   - or, for B2B on the Apollo route, `/growth-engine:sequence`
