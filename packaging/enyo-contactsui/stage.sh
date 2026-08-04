#!/bin/bash
# stage.sh — package the WHOLE enyo contactsui framework (stock ipkg name "enyo-contactsui") as
# its own ipk. On-device this lives at /usr/palm/frameworks/enyo/1.0/framework/lib/contactsui;
# this repo root corresponds to /usr/palm/frameworks/enyo/1.0/framework (see enyo-accounts/stage.sh
# for the same convention), so we stage the lib/contactsui subdirectory only (the rest of the enyo
# framework isn't ours to replace). Confirmed live (2026-08-04): /usr/palm/frameworks/enyo/1.0 is a
# symlink to 0.10 -- there is no separate "1.0" framework tree, it's the same real files either
# way, and this exact "1.0"-prefixed path is what enyo-accounts already uses successfully.
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
REPO="$(cd "$HERE/../.." && pwd)"
STAGE="$1"
# shellcheck source=/dev/null
source "$REPO/packaging/lib/common.sh"

stage_whole "$REPO/framework/lib/contactsui" /usr/palm/frameworks/enyo/1.0/framework/lib/contactsui enyo-contactsui

echo "enyo-contactsui stage complete: $STAGE"
