#!/bin/bash
# stage.sh — package the WHOLE enyo accounts framework (stock ipkg name "enyo-accounts") as its
# own ipk. On-device this lives at /usr/palm/frameworks/enyo/1.0/framework/lib/accounts; this repo
# root corresponds to /usr/palm/frameworks/enyo/1.0/framework, so we stage the lib/accounts
# subdirectory only (the rest of the enyo framework isn't ours to replace).
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
REPO="$(cd "$HERE/../.." && pwd)"
STAGE="$1"
# shellcheck source=/dev/null
source "$REPO/packaging/lib/common.sh"

stage_whole "$REPO/framework/lib/accounts" /usr/palm/frameworks/enyo/1.0/framework/lib/accounts enyo-accounts

echo "enyo-accounts stage complete: $STAGE"
