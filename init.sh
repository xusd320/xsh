/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew tap homebrew/cask-fonts daipeihust/tap
brew install wget llvm bat jq tmux neovim ripgrep cmake alacritty starship zplug git-delta exa im-select
brew install --cask clashx rectangle font-hack-nerd-font visual-studio-code rectangle maccy

git clone git@github.com:xusd320/xsh.git

ln -s ~/xsh/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -s ~/xsh/starship.toml ~/.config/starship.toml
ln -s ~/xsh/gitconfig ~/.gitconfig
ln -s xsh/zshrc ~/.zshrc

LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)
ln -s ~/xsh/nvim ~/.config/nvim

sudo chown -R $(whoami) /usr/local/bin

mkdir -p ~/.config/tmux
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
ln -s ~/xsh/tmux.conf ~/.config/tmux/tmux.conf

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
nvm install lts/fermium

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

sudo xcode-select -switch /Library/Developer/CommandLineTools

brew install tabbyml/tabby/tabby
tabby serve --device metal --model TabbyML/StarCoder-1B
