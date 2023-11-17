if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

if [ ! -d "$HOME/.cache/zsh" ]; then
    mkdir -p $HOME/.cache/zsh
fi

export ZSH_COMPDUMP="$HOME/.cache/zsh/zcompdump-$HOST-$ZSH_VERSION"

source $ZSH/oh-my-zsh.sh

source $HOME/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export HOMEBREW_NO_AUTO_UPDATE=1
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="$HOME/.local/bin/:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.depot_tools/:$PATH"
export PATH="/opt/homebrew/opt/python@3.10/libexec/bin:$PATH"

export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

export AR=llvm-ar
export LD=lld
export NM=llvm-nm
export STRIP=llvm-strip
export RANLIB=llvm-ranlib

export RIPGREP_CONFIG_PATH=~/.ripgreprc

if [ "$(command -v lvim)" ]; then
  alias vi="lvim"
  alias vim="lvim"
  export EDITOR=lvim
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export TABBY_DISABLE_USAGE_COLLECTION=1
