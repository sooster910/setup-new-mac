#!/bin/bash

set -e

echo "🍎 Step 5: Installing Cask applications"
echo "========================================"
echo ""

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "Homebrew is not installed. Please run Step 1 first."
    exit 1
fi

echo "Installing applications..."
echo "This may take a while..."
echo ""

brew install --cask raycast obsidian rectangle figma cursor postman chrome slack wakatime arc grabit docker warp daisyclean font-maple-mono font-d2coding font-d2coding-nerd-font

echo -e "${GREEN}✓ All cask applications installed${NC}"

echo ""
echo -e "${YELLOW}Step 5 Complete!${NC}"
echo ""
