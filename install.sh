#!/bin/bash
# oh-my-lovcode installer
# Usage: curl -fsSL https://raw.githubusercontent.com/MarkShawn2020/oh-my-lovcode/main/install.sh | bash

set -e

OH_MY_LOVCODE_DIR="${OH_MY_LOVCODE_DIR:-$HOME/.oh-my-lovcode}"
LOVCODE_CONFIG_DIR="$HOME/.lovstudio/lovcode"

echo "Installing oh-my-lovcode..."

# Clone or update
if [ -d "$OH_MY_LOVCODE_DIR" ]; then
    echo "Updating existing installation..."
    git -C "$OH_MY_LOVCODE_DIR" pull --ff-only
else
    echo "Cloning oh-my-lovcode..."
    git clone https://github.com/MarkShawn2020/oh-my-lovcode.git "$OH_MY_LOVCODE_DIR"
fi

# Ensure lovcode config directory exists
mkdir -p "$LOVCODE_CONFIG_DIR"

# Backup existing statusbar if it's not a symlink
if [ -d "$LOVCODE_CONFIG_DIR/statusbar" ] && [ ! -L "$LOVCODE_CONFIG_DIR/statusbar" ]; then
    echo "Backing up existing statusbar config..."
    mv "$LOVCODE_CONFIG_DIR/statusbar" "$LOVCODE_CONFIG_DIR/statusbar.backup.$(date +%Y%m%d%H%M%S)"
fi

# Create symlink
if [ -L "$LOVCODE_CONFIG_DIR/statusbar" ]; then
    rm "$LOVCODE_CONFIG_DIR/statusbar"
fi
ln -s "$OH_MY_LOVCODE_DIR/statusbar" "$LOVCODE_CONFIG_DIR/statusbar"

echo "Done! oh-my-lovcode installed to $OH_MY_LOVCODE_DIR"
echo "Statusbar linked to $LOVCODE_CONFIG_DIR/statusbar"
