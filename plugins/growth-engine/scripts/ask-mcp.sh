#!/bin/sh
# PreToolUse on the vendor tools that spend credits, publish, or put people into
# a sequence. Claude Code asks the founder every time, whatever was allowed
# before, so one "always allow" cannot remove the founder's yes.

. "$(dirname "$0")/lib.sh" 2>/dev/null || exit 0
lh_active || [ -n "$(lh_near)" ] || exit 0

input=$(cat) || exit 0
tool=$(lh_json_get tool_name "$input") || tool=""

case $tool in
  *apollo_people_match|*apollo_people_bulk_match|*apollo_organizations_enrich|*apollo_organizations_bulk_enrich)
    why="This spends Apollo credits. Check the founder has seen the cost and said yes." ;;
  *apollo_emailer_campaigns_add_contact_ids)
    why="This adds people to an Apollo sequence. Check it is paused and the founder said yes." ;;
  *apollo_contacts_create|*apollo_contacts_bulk_create)
    why="This adds people to the founder's Apollo account. Check the founder said yes." ;;
  *social-media-posting_create-post|*social-media-posting_edit-post)
    why="This puts a post into GoHighLevel. Check the founder has seen the words, the account and the time, and said yes." ;;
  *conversations_send-a-new-message)
    why="This sends a message from the founder's GoHighLevel account. It is only for replying to someone who wrote first: check their conversation shows a message from them, show the founder the reply, and get a yes. A first message to someone who has not written goes by hand from the founder's own phone." ;;
  *emails_create-template)
    why="This creates an email template in GoHighLevel. Check the founder said yes." ;;
  *) exit 0 ;;
esac

printf '{"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"ask","permissionDecisionReason":"%s"}}\n' "$(lh_json_escape "Launchhouse: $why")"
exit 0
