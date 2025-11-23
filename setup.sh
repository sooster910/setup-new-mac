#!/bin/bash

set -e

echo "🍎 New Mac Development Environment Setup"
echo "=========================================="
echo ""

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 1. Install Homebrew
echo -e "${BLUE}Step 1: Installing Homebrew...${NC}"
if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo -e "${GREEN}✓ Homebrew installed${NC}"
else
    echo -e "${GREEN}✓ Homebrew already installed${NC}"
fi

# 2. Install Homebrew Formula (git, neovim)
echo ""
echo -e "${BLUE}Step 2: Installing Homebrew Formula packages...${NC}"
brew install git neovim

# 3. Install NVM
echo ""
echo -e "${BLUE}Step 3: Installing NVM (Node Version Manager)...${NC}"
if [ ! -d "$HOME/.nvm" ]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    echo -e "${GREEN}✓ NVM installed${NC}"
else
    echo -e "${GREEN}✓ NVM already installed${NC}"
fi

# 4. Install Node v22.18.0
echo ""
echo -e "${BLUE}Step 4: Installing Node v22.18.0...${NC}"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install 22.18.0
nvm use 22.18.0
nvm alias default 22.18.0
echo -e "${GREEN}✓ Node v22.18.0 installed${NC}"

# 5. Install Homebrew Cask applications
echo ""
echo -e "${BLUE}Step 5: Installing Cask applications...${NC}"
brew install --cask raycast obsidian rectangle figma cursor postman chrome slack wakatime arc grabit docker warp daisyclean

echo ""
echo -e "${GREEN}=========================================="
echo "✓ Setup Complete!"
echo "==========================================${NC}"
echo ""
echo "Installed:"
echo "  • Homebrew (package manager)"
echo "  • Git"
echo "  • Neovim"
echo "  • NVM (Node Version Manager)"
echo "  • Node v22.18.0"
echo "  • Cask apps: raycast, obsidian, rectangle, figma, cursor, postman,"
echo "               chrome, slack, wakatime, arc, grabit, docker, warp, daisyclean"
echo ""
echo -e "${YELLOW}Next steps:${NC}"
echo "  1. Restart your terminal or run: source ~/.zshrc"
echo "  2. Verify installation: node -v && npm -v && git --version"
echo "  3. Start coding! 🚀"
echo ""
