#!/bin/bash

set -e

echo "🍎 Step 4: Installing Node v22.18.0"
echo "===================================="
echo ""

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Source NVM if it exists
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

if ! command -v nvm &> /dev/null; then
    echo "NVM is not installed. Please run Step 3 first."
    exit 1
fi

echo "Installing Node v22.18.0..."
nvm install 22.18.0
nvm use 22.18.0
nvm alias default 22.18.0
echo -e "${GREEN}✓ Node v22.18.0 installed${NC}"

echo ""
echo "Versions:"
node -v
npm -v

echo ""
echo -e "${YELLOW}Step 4 Complete!${NC}"
echo ""
