#!/bin/bash

set -e

echo "🍎 Step 7: Configuring Cursor Editor"
echo "====================================="
echo ""

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if Cursor is installed
if [ ! -d "/Applications/Cursor.app" ]; then
    echo "Cursor is not installed. Please run Step 5 first."
    exit 1
fi

echo "Setting up Cursor configuration..."
echo ""

# Create Cursor User directory if it doesn't exist
mkdir -p ~/Library/Application\ Support/Cursor/User

# Copy settings.json
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CONFIG_DIR="$(dirname "$SCRIPT_DIR")/cursor-config"

if [ -f "$CONFIG_DIR/settings.json" ]; then
    cp "$CONFIG_DIR/settings.json" ~/Library/Application\ Support/Cursor/User/settings.json
    echo -e "${GREEN}✓ Cursor settings.json installed${NC}"
else
    echo "settings.json not found in $CONFIG_DIR"
fi

echo ""
echo "Installing Cursor extensions..."
echo "This may take a few minutes..."
echo ""

# Install extensions from list
if [ -f "$CONFIG_DIR/extensions-list.txt" ]; then
    # Filter out invalid entries (those with dots at the start or containing 'darwin')
    while IFS= read -r extension; do
        # Skip empty lines and entries starting with dot or containing 'darwin'
        if [ -z "$extension" ] || [[ "$extension" == .* ]] || [[ "$extension" == *"darwin"* ]]; then
            continue
        fi

        echo "Installing: $extension"
        /Applications/Cursor.app/Contents/MacOS/Cursor --install-extension "$extension" 2>/dev/null || echo "  (skipped or already installed)"
    done < "$CONFIG_DIR/extensions-list.txt"

    echo -e "${GREEN}✓ Extensions installed${NC}"
else
    echo "extensions-list.txt not found in $CONFIG_DIR"
fi

echo ""
echo -e "${YELLOW}Step 7 Complete!${NC}"
echo ""
echo "Note: Please restart Cursor for all settings and extensions to take effect."
echo ""
