/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install wget llvm bat jq tmux neovim ripgrep
brew tap homebrew/cask-fonts michaeleisel/homebrew-zld 
brew install --cask alacritty rectangle font-hack-nerd-font visual-studio-code zld  

defaults write -g AppleFontSmoothing -int 0

git clone git@github.com:xusd320/xsh.git 
ln -s ~/xsh/alacritty.yml ~/.config/alacritty/alacritty.yml
mkdir -p ~/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
chmod 755 /usr/local/share/zsh
chmod 755 /usr/local/share/zsh/site-functions
ln -s xsh/zshrc ~/.zshrc 
ln -s xsh/p10k.zsh ~/.p10k.zsh

LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/fc6873809934917b470bff1b072171879899a36b/utils/installer/install.sh)
ln -s ~/xsh ~/.config/lvim

mkdir -p ~/.config/tmux
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
ln -s ~/xsh/tmux.conf ~/.config/tmux/tmux.conf

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
nvm install lts/erbium

python3 -m pip install --user --upgrade pynvim

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

sudo xcode-select -switch /Library/Developer/CommandLineTools 
sudo ln -s /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/* /usr/local/include/