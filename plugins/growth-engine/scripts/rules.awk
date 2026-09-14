# The Launchhouse rules, as a portable awk program.
#
# Usage: awk -v track=b2b|b2c|"" -v brain=0|1 -f rules.awk FILE
# Output, one finding per line, tab separated:
#   HOLD|NOTE <tab> line <tab> code <tab> quote <tab> message
#
# Ported from Launchhousev2 src/server/rules. The app's codes and outcomes are
# kept (the outcomes table in Launchhousev2 rules/confidence.ts). This is the fast first layer: exact and
# near-exact shapes. The rules-reviewer agent reads for meaning and is the
# authority on DM offers and on proof, which a regex cannot judge.
#
# Portable on purpose: POSIX awk only. No interval expressions, no gawk extras,
# because founders run this under macOS awk, mawk and Git for Windows gawk.

function W(re) { return "(^|[^a-z0-9_])(" re ")([^a-z0-9_]|$)" }

function trim(s) { sub(/^[[:space:]]+/, "", s); sub(/[[:space:]]+$/, "", s); return s }

function quote(s) {
  s = trim(s); gsub(/\t/, " ", s)
  if (length(s) > 140) s = substr(s, 1, 137) "..."
  return s
}

function emit(kind, ln, code, q, msg) {
  if (kind == "HOLD") {
    if (held[ln SUBSEP code]++) return
  } else {
    if (noted[code]++) { notecount[code]++; return }
  }
  printf "%s\t%d\t%s\t%s\t%s\n", kind, ln, code, quote(q), msg
}

# ---------------------------------------------------------------- masking
function mask(s) {
  gsub(/`[^`]*`/, " ", s)
  gsub(/<!--.*-->/, " ", s)
  gsub(/https?:\/\/[^[:space:])]*/, " ", s)
  gsub(/www\.[^[:space:])]*/, " ", s)
  gsub(/[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+/, " ", s)
  return s
}

# ---------------------------------------------------------------- rule 1
function other_track_words(ln, raw, m,    lo, ctxlink, ctxseq, ctxspf) {
  lo = tolower(m)
  if (track == "b2c") {
    if (match(lo, W("apollo"))) return hold_word(ln, raw, "Apollo")
    if (match(lo, /outreach[- ]sequence/)) return hold_word(ln, raw, "the outreach sequence")
    if (match(lo, /outreach[- ]firstlines/)) return hold_word(ln, raw, "the outreach first lines")
    if (match(m, /(^|[^A-Za-z0-9_])ICP([^A-Za-z0-9_]|$)/)) return hold_word(ln, raw, "an ICP")
    if (match(lo, /firmographic/)) return hold_word(ln, raw, "firmographics")
    if (match(lo, W("dkim|dmarc"))) return hold_word(ln, raw, "DKIM and DMARC")
    if (match(lo, W("cold emails?"))) return hold_word(ln, raw, "cold email")
    ctxspf = "dkim|dmarc|domain|dns|sending|sender|email|inbox|deliverab|record"
    if (match(lo, W("spf")) && match(lo, ctxspf)) return hold_word(ln, raw, "SPF records")
    ctxlink = "url|urls|connect|invite|inmail|outreach|prospect|sequence|search|export|scrape"
    if (match(lo, W("linkedin"))) {
      if (match(lo, ctxlink)) return hold_word(ln, raw, "LinkedIn prospecting")
      emit("NOTE", ln, "track.wrong-track-word-maybe", raw, "Mentions LinkedIn, which is usually part of the B2B method. Probably fine. Worth a glance.")
      return
    }
    ctxseq = "email|outreach|enrol|enroll|step|cadence|drip|prospect|sender|inbox"
    if (match(lo, W("sequences?"))) {
      if (match(lo, ctxseq)) return hold_word(ln, raw, "an email sequence")
      emit("NOTE", ln, "track.wrong-track-word-maybe", raw, "Mentions a sequence, which is usually part of the B2B method. Probably fine. Worth a glance.")
      return
    }
    if (match(lo, W("prospects?")))
      emit("NOTE", ln, "track.wrong-track-word-maybe", raw, "Mentions prospects, which is usually B2B language. Probably fine. Worth a glance.")
  } else if (track == "b2b") {
    if (match(lo, /hook[- ]bank/)) return hold_word(ln, raw, "the hook bank")
    if (match(lo, /dm[- ]openers?/)) return hold_word(ln, raw, "DM openers")
    if (match(lo, /inbound[- ]scripts?/)) return hold_word(ln, raw, "inbound scripts")
    if (match(m, /(Business|Creator) account/)) return hold_word(ln, raw, "an Instagram Business or Creator account")
    if (match(lo, W("instagram|link in bio|reels?")))
      emit("NOTE", ln, "track.wrong-track-word-maybe", raw, "Mentions Instagram, which is usually part of the B2C method. Probably fine. Worth a glance.")
  }
}

function hold_word(ln, raw, label,    other) {
  other = (track == "b2c") ? "B2B" : "B2C"
  emit("HOLD", ln, "track.wrong-track-word", raw, "This uses " label ", which is part of the " other " method, and this founder is on the " toupper(track) " track. Never write, offer or mention the other track's material.")
}

# ---------------------------------------------------------------- rule 3
function cancels_before(s) {
  return match(s, W("no|not|never|none|nobody|nothing|neither|nor|nowhere|cannot|without|hardly|avoid|stop|skip|omit|deny|wrong|dishonest|unfair|misleading|false|untrue|ban|forbid|prohibit|prevent|resist")) \
      || match(s, /refus|declin|overclaim|overpromis|n't|rather than|instead of|short of|other than|far from|no one/)
}

function promise_check(ln, sent,    lo, p, clauses, n, i, c, before, rest) {
  lo = tolower(sent)
  if (!match(lo, /(guarantee[ds]?|promise[ds]?) (a )?(reply|replies|response)/)) return
  gsub(/;|:/, "|", lo)
  gsub(/, (and|but|or|so|yet|then) /, "|", lo)
  gsub(W("and|but|or|so|yet|then|because|although|though|while|whereas"), "|", lo)
  n = split(lo, clauses, "|")
  for (i = 1; i <= n; i++) {
    c = clauses[i]
    if (match(c, /(guarantee[ds]?|promise[ds]?) (a )?(reply|replies|response)/)) {
      before = substr(c, 1, RSTART - 1)
      if (cancels_before(before)) return
      rest = substr(c, RSTART)
      if (cancels_before(rest) || match(c, /that (guarantee|promise)|which (guarantee|promise)/)) {
        emit("NOTE", ln, "prose.promise-reply-unclear", sent, "This may read as promising replies. Nothing here promises a reply, because replies depend on the list, the offer and the timing. Worth a glance.")
        return
      }
      emit("HOLD", ln, "prose.promise-reply", sent, "This promises a reply. Nothing Launchhouse writes promises replies, because they depend on list quality, the offer and timing. Say what the work is instead.")
      return
    }
  }
}

# ---------------------------------------------------------------- rule 2
function firstpos(s, re) { return match(s, re) ? RSTART : 0 }
function minpos(a, b) { if (a == 0) return b; if (b == 0) return a; return a < b ? a : b }

function channel_pos(lo,    p, igword) {
  p = firstpos(lo, W("dm|dms|dm's|dming|dmed|dmmed|dmming|dm'd"))
  p = minpos(p, firstpos(lo, "direct[ -]?messag"))
  p = minpos(p, firstpos(lo, "(instagram|insta|(^|[^a-z])ig) (dms?|messag)"))
  p = minpos(p, firstpos(lo, "messag[a-z]* (on|via|through|in) (instagram|ig|the dms)"))
  igword = match(lo, /instagram|insta|follower/) || match(lo, W("ig"))
  if (igword) {
    p = minpos(p, firstpos(lo, "messag|inbox|conversation|opener|first (message|dm|touch|contact)|auto ?responder|auto[ -]?repl|outreach|reach out"))
  }
  return p
}

# Scan every place a pattern starts and test a short window from there.
function windowed(lo, startre, winre, width,    s, off, p, w) {
  s = lo; off = 0
  while (match(s, startre)) {
    p = off + RSTART
    w = substr(lo, p, width)
    if (match(w, winre)) return p
    off = p; s = substr(lo, p + 1)
  }
  return 0
}

function delegate_pos(lo, orig,    p, actors, verbs, s, off, q, w, name) {
  actors = "tool|app|bot|script|software|service|platform|plugin|extension|integration|automation|scheduler|sender|responder|autoresponder|agent|assistant|ai|sequence|campaign|crm|zap|macro|workflow|system|robot"
  verbs = "send|blast|fire|deliver|dm|message|push|answer|repl|respond|handle|manage|open|start|initiat|write|draft|take"
  p = 0
  p = minpos(p, firstpos(lo, W("bulk|mass|batch|blast|blasts|drip")))
  p = minpos(p, firstpos(lo, "at scale|in volume|high volume|at volume"))
  p = minpos(p, firstpos(lo, W("bot|bots|chatbot|chatbots")))
  p = minpos(p, firstpos(lo, "schedul|(^|[^a-z])queue|(^|[^a-z])timer([^a-z]|$)|(^|[^a-z])cron([^a-z]|$)"))
  p = minpos(p, firstpos(lo, "automat(e|es|ed|ing|ion|ions|ic|ically)"))
  p = minpos(p, firstpos(lo, "auto[ -]?(dm|send|message|repl|respond)"))
  p = minpos(p, windowed(lo, W(actors), "^(^|[^a-z])?(" actors ")s? (that |which |to |will |can |should |could |and it |so it |then )[a-z' ]*(" verbs ")", 70))
  p = minpos(p, windowed(lo, W("let|have|point"), "^(^|[^a-z])?(let|have|point) (it|them|something else|the (" actors ")|an? (" actors ")) [a-z ]*(run|work|handle|send|write|dm|message|go|fire|do|take|open)", 50))
  p = minpos(p, firstpos(lo, "(it|they|that) (handles it|takes it from there|takes over|does the rest|works through|runs itself)"))
  p = minpos(p, windowed(lo, W("every|each|all|any|everyone|whoever"), "^(^|[^a-z])?(every|each|all|any|everyone|whoever)[a-z' ]* (gets|receives|is sent|are sent)[a-z ]*(dm|message)", 70))
  p = minpos(p, windowed(lo, "(send|dm|message|blast|fire)", "^(send|dm|message|blast|fire)[a-z]* (it |them |the [a-z]+ )?(to |at )?(everyone|every new|all your|all of your|each new|whoever|anyone who)", 50))
  if (match(lo, /on your behalf|while you sleep|without you|hands[- ]off|set and forget|autopilot|overnight|round the clock|24\/7|by itself|on its own|runs itself/) && match(lo, /send|dm|messag|deliver|fire|go out|goes out|land/))
    p = minpos(p, firstpos(lo, "on your behalf|while you sleep|without you|hands[- ]off|set and forget|autopilot|overnight|round the clock|24/7|by itself|on its own|runs itself"))
  if (match(lo, /once (it is |it's )?(configured|set up|wired up|connected|live|installed|turned on|enabled|running)/) && match(lo, /send|deliver|get|receive|dm|messag|go out/))
    p = minpos(p, firstpos(lo, "once (it is |it's )?(configured|set up|wired up|connected|live|installed|turned on|enabled|running)"))
  # A named tool: an install verb, then a capitalised name, then it sending.
  s = orig; off = 0
  while (match(s, /(Use|Connect|Install|Add|Try|Get|Run|Configure|Integrate|Buy|Enable|use|connect|install|try|configure|integrate) [A-Z][A-Za-z0-9][A-Za-z0-9]+/)) {
    q = off + RSTART
    w = substr(orig, q, RLENGTH)
    name = w; sub(/^[A-Za-z]+ /, "", name)
    if (name !~ /^(Instagram|Facebook|GoHighLevel|HighLevel|Apollo|Claude|Gmail|Google|Outlook|Canva|Meta|LinkedIn|Slack|The|This|Your|It)$/) {
      w = tolower(substr(orig, q + RLENGTH, 45))
      if (match(w, /^,? ?(to|that|which|and it|it)[a-z' ]* (send|dm|message|fire|deliver)/)) { p = minpos(p, q); break }
    }
    off = q + RLENGTH - 1; s = substr(orig, q + RLENGTH)
  }
  return p
}

function started_by_them(lo) {
  return match(lo, /comment[ -](to|2)[ -]dm|(messag[a-z]*|contacted|wr[io]te|dm[a-z']*) you first|user[- ]initiated|started the conversation|(^|[^a-z])inbound|triggered by|keyword trigger|trigger keyword|comment keyword|in (reply|response) to|repl[a-z]* to (their|the|a|every|each|any|incoming) (comment|message|dm|question|reply|story)|respond[a-z]* to (their|the|a|every|each|any|incoming)|who (comment|messag|dm|asked|replied|wrote|reply|replies)|opt(ed)?[- ]in|messaging window|24[- ]hour window|on (the|their|a|each|every|any) (comment|reply|message|dm)|(someone|somebody|a follower|they|people|anyone|customers) (comment|comments|commented|messages|dms|replies|writes|asks)/)
}

function cold_span(lo,    s, off, p, before) {
  s = lo; off = 0
  while (match(s, /cold|unsolicited|outbound|new followers?|every follower|each follower|all (your )?followers|your list|the list|prospects|target accounts|target list|story viewers|post viewers|profile viewers|(people|users|everyone|accounts|anyone) who (view|like|liked|likes|follow|visit)|not spoken|haven't spoken|have not spoken|never spoken|first message|first dm|first touch|openers?|in bulk|on your behalf|while you sleep|autopilot|set and forget/)) {
    p = off + RSTART
    before = substr(lo, (p > 16 ? p - 16 : 1), (p > 16 ? 16 : p - 1))
    if (!match(before, /(never|not|no|rather than|instead of|without|excludes?|except)[^.!?]*$/)) return 1
    off = p + RLENGTH - 1; s = substr(lo, off + 1)
  }
  return 0
}

function consequence(s) {
  return match(s, /restrict|banned|shadowban|suspend|blocked|action block|at risk|flagged|forbidden|against|violat|is a bug|bad idea|mistake|risky|dangerous|not worth|a trap|off the table|not something|puts the account|lose your account|scrap/) \
      || match(s, W("not|never|no|cannot|don't|do not|won't"))
}

function dm_check(ln, sent, nextsent,    lo, c, d, dist, replaces, before, refusal) {
  lo = tolower(sent)
  c = channel_pos(lo); if (!c) return
  d = delegate_pos(lo, sent); if (!d) return
  dist = c - d; if (dist < 0) dist = -dist
  if (dist > 140) return
  if (started_by_them(lo) && !cold_span(lo)) return
  replaces = match(lo, /instead of|rather than|no more|no need to|so you (never|don't|do not|are not|aren't|won't)|saves you|without you|no work|with no effort/)
  refusal = 0
  if (!replaces) {
    before = substr(lo, 1, d - 1)
    if ((match(before, W("never|not|no|cannot|can't|don't|avoid|against|without|manual|manually|stop|nothing|none|neither|nor")) || match(before, /refus|forbid|by hand|do not/)) \
        && !match(lo, /nothing stops|no reason not to|why not|regardless/)) refusal = 1
    if (match(lo, /by hand|manually|one at a time|one by one|yourself|from your own (account|phone|app)/)) refusal = 1
    if (consequence(substr(lo, d))) refusal = 1
    if (nextsent != "" && consequence(tolower(nextsent)) && !delegate_pos(tolower(nextsent), nextsent)) refusal = 1
  }
  if (refusal) return
  emit("HOLD", ln, "dm.offered", sent, "This offers messages going out on Instagram to people who did not write first, sent by something other than the founder. Instagram restricts accounts that do this. Cold DMs are sent by hand, 25 of them, spread out. Automation is only for replying to people who messaged first.")
}

# ---------------------------------------------------------------- house style
function style(ln, raw,    lo, m) {
  if (match(raw, /—|–/))
    emit("NOTE", ln, "prose.dash", raw, "Uses a long dash. Break the sentence, or use a comma, colon or brackets.")
  lo = tolower(raw)
  if (match(lo, /(^|[^-a-z0-9])(supercharge[a-z]*|unlock[a-z]*|revolutionary|seamless[a-z]*|leverage[a-z]*|effortless[a-z]*|synergy|turnkey|game[ -]changer|cutting[ -]edge|best[ -]in[ -]class)([^-a-z0-9]|$)/))
    emit("NOTE", ln, "prose.banned-word", raw, "Uses marketing language (" trim(substr(lo, RSTART, RLENGTH)) "). Say the plain thing instead.")
  m = raw
  gsub(/[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]/, " ", m)
  if (match(m, /(^|[^A-Za-z0-9])[0-9]+(\.[0-9]+)? ?[a-z%]?[a-z%]?-[0-9]/))
    emit("NOTE", ln, "prose.range-dash", raw, "Writes a range with a dash. Write ranges as \"11 to 13\".")
}

# ---------------------------------------------------------------- main
{
  lines[NR] = $0
}

END {
  n = NR

  if (brain == 1) {
    found = 0
    for (i = 1; i <= n; i++) {
      if (lines[i] ~ /^## /) break
      l = tolower(lines[i]); gsub(/\*/, "", l)
      if (match(l, /^[-[:space:]]*track[[:space:]]*:[[:space:]]*/)) {
        found = i
        v = substr(l, RSTART + RLENGTH); sub(/[[:space:]].*$/, "", v)
        break
      }
    }
    if (!found)
      emit("HOLD", 1, "track.missing-from-brain", "# Founder Brain", "The Founder Brain has no Track line in its header. Every engine forks on it. Add - **Track:** b2b or b2c above the first section.")
    else if (v != "b2b" && v != "b2c")
      emit("HOLD", found, "track.unknown-value", lines[found], "The Track line must say b2b or b2c, exactly one of them.")
  }

  # Masked copy for the other-track words.
  infence = 0
  for (i = 1; i <= n; i++) {
    raw = lines[i]
    if (raw ~ /^[[:space:]]*(```|~~~)/) { infence = !infence; continue }
    style(i, raw)
    if (infence) continue
    if (track == "b2b" || track == "b2c") other_track_words(i, raw, mask(raw))
  }

  # Paragraph units for sentences: wrapped lines are joined, block starts split.
  unit = ""; ustart = 0
  for (i = 1; i <= n + 1; i++) {
    raw = (i <= n) ? lines[i] : ""
    blank = (i > n) || raw ~ /^[[:space:]]*$/ || raw ~ /^[[:space:]]*(```|~~~)/
    block = raw ~ /^[[:space:]]*(#|[-*+] |>|\||[0-9]+[.)] )/
    if (blank || block) {
      if (unit != "") { units[++nu] = unit; ustarts[nu] = ustart }
      unit = ""; ustart = 0
      if (blank) continue
    }
    if (unit == "") { unit = raw; ustart = i } else unit = unit " " raw
  }

  for (u = 1; u <= nu; u++) {
    text = units[u]; ns = 0
    while (match(text, /[.!?]+([[:space:]]|$)/)) {
      sents[++ns] = substr(text, 1, RSTART + RLENGTH - 1)
      text = substr(text, RSTART + RLENGTH)
    }
    if (trim(text) != "") sents[++ns] = text
    for (k = 1; k <= ns; k++) {
      nxt = (k < ns) ? sents[k + 1] : ""
      promise_check(ustarts[u], sents[k])
      dm_check(ustarts[u], sents[k], nxt)
      delete sents[k]
    }
  }

  for (code in notecount)
    printf "MORE\t0\t%s\t\t%d\n", code, notecount[code]
}
