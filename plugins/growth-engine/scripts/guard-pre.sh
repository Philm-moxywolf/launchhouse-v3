#!/bin/sh
# PreToolUse on Write, Edit and MultiEdit.
#
# Decides from the path alone, before anything is written:
#   - a Launchhouse file being written outside growth-engine/ (design rule 4)
#   - a path that climbs out of the folder
#   - a file at the top of growth-engine/ that is not one of ours
#   - the other track's file, or a track file before a track is chosen (rule 1)
#   - a person file whose name is not a plain slug
# Then keeps a copy of the file as it was, so guard-post.sh can put it back if
# the new words break a rule.

. "$(dirname "$0")/lib.sh" 2>/dev/null || exit 0
lh_active || exit 0

input=$(cat) || exit 0
path=$(lh_json_get file_path "$input") || exit 0
[ -n "$path" ] || exit 0

rel=$(lh_rel "$path")
base=${rel##*/}

case $rel in
  growth-engine/*) ;;
  *)
    if [ -n "$(lh_file_track "$base")" ] && [ "$base" != ".launchhouse" ]; then
      lh_deny_pre "Not written: $base belongs inside the growth-engine folder, and every Launchhouse file lives there so nothing gets lost. Write it to growth-engine/$base instead."
    fi
    exit 0 ;;
esac

inner=${rel#growth-engine/}

case "/$inner/" in
  */../*|*/./*) lh_deny_pre "Not written: $rel climbs out of the growth-engine folder. Keep every path inside growth-engine/." ;;
esac

case $inner in
  */*)
    top=${inner%%/*}
    case $top in
      people)
        case $base in
          README.md) ;;
          *)
            slug=${base%.md}
            if [ "$slug" = "$base" ] || ! printf '%s' "$slug" | grep -Eq '^[a-z0-9]+(-[a-z0-9]+)*$' || [ ${#slug} -gt 60 ]; then
              lh_deny_pre "Not written: person files are named as a plain slug, lower case letters, digits and single dashes, ending .md, for example sam-example-com.md. Rename it and write it again."
            fi ;;
        esac ;;
      uploads|voice-samples|drafts|.state) ;;
      *) lh_deny_pre "Not written: growth-engine/$top/ is not one of the Launchhouse folders. Use drafts/ for work in progress, uploads/ for documents, voice-samples/ for the founder's own writing." ;;
    esac ;;
  *)
    ftrack=$(lh_file_track "$inner")
    if [ -z "$ftrack" ]; then
      lh_deny_pre "Not written: $inner is not one of the Launchhouse files. Put work in progress in growth-engine/drafts/ instead, or use the file name the engine asks for."
    fi
    if [ "$ftrack" = b2b ] || [ "$ftrack" = b2c ]; then
      track=$(lh_track)
      case $track in
        b2b|b2c) ;;
        *) lh_deny_pre "Not written: $inner is for one track only, and the Founder Brain does not have a track yet. Build or finish the Founder Brain first (/growth-engine:brain)." ;;
      esac
      if [ "$track" != "$ftrack" ]; then
        other=$(printf '%s' "$ftrack" | tr 'bc' 'BC')
        lh_deny_pre "Not written: $inner is part of the $other method, and this founder is on the $(printf '%s' "$track" | tr 'bc' 'BC') track. Never write the other track's files."
      fi
    fi ;;
esac

# Keep the file as it was, for guard-post.sh.
if lh_is_judged "$inner"; then
  pre="$(lh_root)/growth-engine/.state/.pre"
  mkdir -p "$pre" 2>/dev/null || exit 0
  key=$(lh_key "$inner")
  file="$(lh_root)/$rel"
  if [ -f "$file" ]; then
    cp -p "$file" "$pre/$key" 2>/dev/null && rm -f "$pre/$key.new"
  else
    : > "$pre/$key.new" 2>/dev/null && rm -f "$pre/$key"
  fi
fi
exit 0
