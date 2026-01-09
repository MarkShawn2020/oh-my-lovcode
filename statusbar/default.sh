#!/bin/bash
# Lovcode default statusbar script
# Receives JSON context via stdin, outputs status bar text with ANSI colors

# Read JSON input
input=$(cat)

# Extract values using jq (fallback to defaults if jq unavailable)
if command -v jq &> /dev/null; then
    APP_NAME=$(echo "$input" | jq -r '.app_name // "Lovcode"')
    VERSION=$(echo "$input" | jq -r '.version // "?"')
    PROJECTS=$(echo "$input" | jq -r '.projects_count // 0')
    FEATURES=$(echo "$input" | jq -r '.features_count // 0')
    LINES_ADDED=$(echo "$input" | jq -r '.today_lines_added // 0')
    LINES_DELETED=$(echo "$input" | jq -r '.today_lines_deleted // 0')
else
    APP_NAME="Lovcode"
    VERSION="?"
    PROJECTS="?"
    FEATURES="?"
    LINES_ADDED=0
    LINES_DELETED=0
fi

# ANSI color codes
RESET="\033[0m"
BOLD="\033[1m"
DIM="\033[2m"
GREEN="\033[32m"
RED="\033[31m"
YELLOW="\033[33m"
CYAN="\033[36m"

# Build output
OUTPUT="${BOLD}${APP_NAME}${RESET} ${DIM}v${VERSION}${RESET}"
OUTPUT+=" │ 📁 ${PROJECTS} 🔀 ${FEATURES}"

# Add today's changes if any
if [ "$LINES_ADDED" -gt 0 ] || [ "$LINES_DELETED" -gt 0 ]; then
    OUTPUT+=" │ ${GREEN}+${LINES_ADDED}${RESET} ${RED}-${LINES_DELETED}${RESET}"
fi

# Add timestamp
OUTPUT+=" │ $(date '+%H:%M:%S')"

echo -e "$OUTPUT"
