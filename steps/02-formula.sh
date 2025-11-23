#!/bin/bash

set -e

echo "🍎 Step 2: Installing Homebrew Formula packages"
echo "================================================"
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

echo "Installing git and neovim..."
brew install git neovim
echo -e "${GREEN}✓ git and neovim installed${NC}"

echo ""
echo -e "${YELLOW}Step 2 Complete!${NC}"
echo ""
