#!/bin/bash

# =============================================================================
# System & Package Manager Setup
# =============================================================================
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# =============================================================================
# Homebrew Packages
# =============================================================================
brew tap daipeihust/tap
brew tap laishulu/homebrew

# CLI Tools
brew install wget llvm lld bat jq neovim ripgrep fzf fd starship git-delta eza fnm macism cloc im-select zoxide zsh-history-substring-search lazygit rustup cmake tree-sitter
brew install zsh zsh-syntax-highlighting zsh-autosuggestions

# GUI Applications & Fonts
brew install --cask font-monaspace-nerd-font visual-studio-code rectangle switchhosts ghostty

# =============================================================================
# Dotfiles Setup
# =============================================================================
git clone git@github.com:xusd320/xsh.git ~/xsh
cd ~/xsh
git submodule update --init

mkdir -p ~/.config

force_link() {
    src=$1
    dst=$2
    rm -rf "$dst"
    ln -s "$src" "$dst"
    echo "Linked $src -> $dst"
}

force_link ~/xsh/ghostty ~/.config/ghostty
force_link ~/xsh/zshrc ~/.zshrc
force_link ~/xsh/starship.toml ~/.config/starship.toml
force_link ~/xsh/gitconfig ~/.gitconfig
force_link ~/xsh/lazygit ~/.config/lazygit
force_link ~/xsh/nvim ~/.config/nvim
force_link ~/xsh/ripgreprc ~/.ripgreprc
force_link ~/xsh/opencode ~/.config/opencode

# =============================================================================
# Post-Install Configuration
# =============================================================================
# Rust Setup
rustup-init -y
sudo chown -R $(whoami) /usr/local/bin

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
