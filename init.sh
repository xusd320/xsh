/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew tap homebrew/cask-fonts daipeihust/tap
brew install wget llvm bat jq neovim ripgrep fd cmake wezterm git-delta im-select fnm
brew install --cask clashx rectangle font-hack-nerd-font visual-studio-code rectangle maccy

git clone git@github.com:xusd320/xsh.git

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

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
