/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install --cask iterm2
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chmod 755 /usr/local/share/zsh\nchmod 755 /usr/local/share/zsh/site-functions
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
ln -s .SpaceVim.d/p10k.zsh ./.p10k.zsh
curl https://raw.githubusercontent.com/JonathanSpeek/palenight-iterm2/master/palenight.itermcolors -o ~/Downloads/palenight.itermcolors

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh\n

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
nvm use lts
npm i -g javascript-typescript-langserver typescript-language-server

pip3 install python-language-server

curl -sLf https://spacevim.org/cn/install.sh | bash
