/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

brew install wget llvm lld bat jq neovim ripgrep fzf fd wezterm starship git-delta eza procs fnm macism ncdu cloc systemd zoxide mcfly
brew install zsh zsh-syntax-highlighting zsh-autosuggestions
brew install --cask cmake font-hack-nerd-font visual-studio-code rectangle maccy switchhosts
brew tap daipeihust/tap && brew install im-select
brew tap laishulu/homebrew && brew install macism

git clone git@github.com:xusd320/xsh.git

ln -s ~/xsh/wezterm ~/.config/wezterm
ln -s ~/xsh/zshrc ~/.zshrc
ln -s ~/xsh/starship.toml ~/.config/starship.toml
ln -s ~/xsh/gitconfig ~/.gitconfig
ln -s ~/xsh/lazygit ~/.config/lazygit
ln -s ~/xsh/nvim ~/.config/nvim
ln -s ~/xsh/ripgreprc ~/.ripgreprc

sudo chown -R $(whoami) /usr/local/bin

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# sudo xcode-select -switch /Library/Developer/CommandLineTools

