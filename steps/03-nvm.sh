#!/bin/bash

set -e

echo "🍎 Step 3: Installing NVM (Node Version Manager)"
echo "================================================="
echo ""

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

if [ ! -d "$HOME/.nvm" ]; then
    echo "Installing NVM..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    echo -e "${GREEN}✓ NVM installed${NC}"
else
    echo -e "${GREEN}✓ NVM already installed${NC}"
fi

echo ""
echo -e "${YELLOW}Step 3 Complete!${NC}"
echo ""
