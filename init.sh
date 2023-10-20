/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install wget llvm bat jq tmux neovim ripgrep cmake
brew tap homebrew/cask-fonts 
brew install --cask clashx iterm2 rectangle font-hack-nerd-font visual-studio-code rectangle maccy

git clone git@github.com:xusd320/xsh.git 
git clone https://github.com/dracula/iterm.git

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

ln -s xsh/zshrc ~/.zshrc 
ln -s xsh/p10k.zsh ~/.p10k.zsh

LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)
ln -s ~/xsh/nvim ~/.config/lvim

sudo chown -R $(whoami) /usr/local/bin

git clone https://github.com/vovkasm/input-source-switcher.git                                                                                                                                                 ✔ 
cd input-source-switcher
mkdir build && cd build
cmake ..
make
make install


mkdir -p ~/.config/tmux
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
ln -s ~/xsh/tmux.conf ~/.config/tmux/tmux.conf

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
nvm install lts/fermium 

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

sudo xcode-select -switch /Library/Developer/CommandLineTools 

brew install tabbyml/tabby/tabby
tabby serve --device metal --model TabbyML/StarCoder-1B
