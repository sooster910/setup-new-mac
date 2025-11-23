#!/bin/bash

set -e

echo "🍎 Step 6: Installing Oh-My-Zsh and Powerlevel10k"
echo "=================================================="
echo ""

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Install Oh-My-Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh-My-Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    echo -e "${GREEN}✓ Oh-My-Zsh installed${NC}"
else
    echo -e "${GREEN}✓ Oh-My-Zsh already installed${NC}"
fi

echo ""
echo "Installing Powerlevel10k theme..."

# Install Powerlevel10k theme
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    echo -e "${GREEN}✓ Powerlevel10k installed${NC}"
else
    echo -e "${GREEN}✓ Powerlevel10k already installed${NC}"
fi

echo ""
echo "Configuring .zshrc..."

# Set Powerlevel10k as default theme in .zshrc
if [ -f "$HOME/.zshrc" ]; then
    sed -i '' 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' "$HOME/.zshrc"
    # Add configuration wizard disable if not present
    if ! grep -q "POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD" "$HOME/.zshrc"; then
        echo 'POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true' >> "$HOME/.zshrc"
    fi
    echo -e "${GREEN}✓ .zshrc configured${NC}"
fi

echo ""
echo "Setting zsh as default shell..."

# Change shell to zsh if not already
if [ "$SHELL" != "$(which zsh)" ]; then
    chsh -s "$(which zsh)"
    echo -e "${GREEN}✓ Default shell changed to zsh${NC}"
else
    echo -e "${GREEN}✓ zsh is already the default shell${NC}"
fi

echo ""
echo -e "${YELLOW}Step 6 Complete!${NC}"
echo ""
