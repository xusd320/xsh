/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew tap homebrew/cask-fonts 
brew tap daipeihust/tap
brew install wget llvm bat jq neovim ripgrep fd wezterm starship git-delta eza im-select fnm
brew install --cask cmake font-hack-nerd-font visual-studio-code rectangle maccy

git clone git@github.com:xusd320/xsh.git

ln -s ~/xsh/wezterm ~/.config/wezterm
ln -s ~/xsh/zshrc ~/.zshrc
ln -s ~/xsh/starship.toml ~/.config/starship.toml
ln -s ~/xsh/gitconfig ~/.gitconfig
ln -s ~/xsh/lazygit ~/.config/lazygit
ln -s ~/xsh/nvim ~/.config/nvim

sudo chown -R $(whoami) /usr/local/bin

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

sudo xcode-select -switch /Library/Developer/CommandLineTools

brew install tabbyml/tabby/tabby
tabby serve --device metal --model TabbyML/StarCoder-1B
