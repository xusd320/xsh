xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

brew tap daipeihust/tap
brew tap laishulu/homebrew
brew install wget llvm lld bat jq neovim ripgrep fzf fd starship git-delta eza fnm macism cloc im-select macism
brew install zsh zsh-syntax-highlighting zsh-autosuggestions
brew install --cask cmake font-hack-nerd-font visual-studio-code rectangle switchhosts wezterm@nightly tree-sitter-cli

git clone git@github.com:xusd320/xsh.git
git submodule update --init

mkdir -p ~/.config

force_link() {
    src=$1
    dst=$2
    rm -rf "$dst"
    ln -s "$src" "$dst"
}

force_link ~/xsh/wezterm ~/.config/wezterm
force_link ~/xsh/zshrc ~/.zshrc
force_link ~/xsh/starship.toml ~/.config/starship.toml
force_link ~/xsh/gitconfig ~/.gitconfig
force_link ~/xsh/lazygit ~/.config/lazygit
force_link ~/xsh/nvim ~/.config/nvim
force_link ~/xsh/ripgreprc ~/.ripgreprc

sudo chown -R $(whoami) /usr/local/bin

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# sudo xcode-select -switch /Library/Developer/CommandLineTools
