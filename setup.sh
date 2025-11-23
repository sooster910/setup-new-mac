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
brew install --cask raycast obsidian rectangle figma cursor postman chrome slack wakatime arc grabit docker warp daisyclean font-maple-mono font-d2coding font-d2coding-nerd-font

# 6. Install Oh-My-Zsh and Powerlevel10k
echo ""
echo -e "${BLUE}Step 6: Installing Oh-My-Zsh and Powerlevel10k...${NC}"
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    echo -e "${GREEN}✓ Oh-My-Zsh installed${NC}"
else
    echo -e "${GREEN}✓ Oh-My-Zsh already installed${NC}"
fi

# Install Powerlevel10k theme
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    echo -e "${GREEN}✓ Powerlevel10k installed${NC}"
else
    echo -e "${GREEN}✓ Powerlevel10k already installed${NC}"
fi

# Set Powerlevel10k as default theme in .zshrc
if [ -f "$HOME/.zshrc" ]; then
    sed -i '' 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' "$HOME/.zshrc"
    # Add configuration wizard disable if not present
    if ! grep -q "POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD" "$HOME/.zshrc"; then
        echo 'POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true' >> "$HOME/.zshrc"
    fi
    echo -e "${GREEN}✓ .zshrc configured${NC}"
fi

# Change shell to zsh if not already
if [ "$SHELL" != "$(which zsh)" ]; then
    chsh -s "$(which zsh)"
    echo -e "${GREEN}✓ Default shell changed to zsh${NC}"
else
    echo -e "${GREEN}✓ zsh is already the default shell${NC}"
fi

echo ""
echo -e "${GREEN}=========================================="
echo "✓ Setup Complete!"
echo "==========================================${NC}"
echo ""
echo "Installed:"
echo "  • Homebrew (package manager)"
echo "  • Git, Neovim"
echo "  • NVM (Node Version Manager) with Node v22.18.0"
echo "  • Fonts: Maple Mono, D2 Coding, D2 Coding Nerd Font"
echo "  • Oh-My-Zsh with Powerlevel10k theme"
echo "  • Cask apps: raycast, obsidian, rectangle, figma, cursor, postman,"
echo "               chrome, slack, wakatime, arc, grabit, docker, warp, daisyclean"
echo ""
echo -e "${YELLOW}Next steps:${NC}"
echo "  1. Restart your terminal or run: source ~/.zshrc"
echo "  2. Verify installation: node -v && npm -v && git --version"
echo "  3. Start coding! 🚀"
echo ""
