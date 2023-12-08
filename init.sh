/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew tap homebrew/cask-fonts daipeihust/tap
brew install wget llvm bat jq neovim ripgrep fd cmake wezterm starship antigen git-delta exa im-select fnm
brew install --cask clashx rectangle font-hack-nerd-font visual-studio-code rectangle maccy

git clone git@github.com:xusd320/xsh.git

ln -s ~/xsh/starship.toml ~/.config/starship.toml
ln -s ~/xsh/gitconfig ~/.gitconfig
ln -s ~/xsh/wezterm ~/.config/wezterm
ln -s xsh/zshrc ~/.zshrc
ln -s ~/xsh/lazygit ~/.config/lazygit

LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)
ln -s ~/xsh/nvim ~/.config/nvim

sudo chown -R $(whoami) /usr/local/bin

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

sudo xcode-select -switch /Library/Developer/CommandLineTools

brew install tabbyml/tabby/tabby
tabby serve --device metal --model TabbyML/StarCoder-1B
