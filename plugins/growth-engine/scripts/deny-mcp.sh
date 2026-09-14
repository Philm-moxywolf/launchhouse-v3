#!/bin/sh
# PreToolUse on the vendor tools that send, activate or buy.
#
# GoHighLevel conversations_send-a-new-message sends a message from the
# founder's account: rule 2 says no cold DM is ever sent by a tool.
# Apollo send_now, messages_create and campaigns_approve start sending, and so
# does creating or updating a sequence with active set to true: the founder
# presses start in Apollo themselves, having read it.
# Apollo email_account_purchase_create spends their money.
#
# In a Launchhouse folder, and also when the founder opened a folder next to
# one, because the wrong folder is the most common way in.

. "$(dirname "$0")/lib.sh" 2>/dev/null || exit 0
lh_active || [ -n "$(lh_near)" ] || exit 0

input=$(cat) || exit 0
tool=$(lh_json_get tool_name "$input") || tool=""

case $tool in
  *conversations_send-a-new-message)
    why="Launchhouse never sends a message from the founder's GoHighLevel account. Cold DMs go out by hand, from their own phone, 25 of them, spread out. Replies to people who wrote first are handled by the workflow they loaded at the clinic." ;;
  *apollo_emailer_campaigns_approve|*apollo_emailer_messages_send_now|*apollo_emailer_messages_create)
    why="Launchhouse builds the Apollo sequence paused and stops there. The founder reads it and presses start in Apollo themselves." ;;
  *apollo_sequences_create|*apollo_sequences_update)
    printf '%s' "$input" | tr -d '\n' | grep -Eq '"active"[[:space:]]*:[[:space:]]*(true|"true")' || exit 0
    why="Launchhouse builds sequences paused, with active set to false. The founder switches the sequence on in Apollo themselves, having read it. Make the same call with active false." ;;
  *apollo_email_account_purchase_create)
    why="Launchhouse never buys anything on the founder's account. If they want a mailbox, they buy it in Apollo themselves." ;;
  *) exit 0 ;;
esac

lh_deny_pre "$why Tell the founder plainly what to do in the vendor's own app instead."
