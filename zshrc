if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

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
export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="$HOME/.local/bin/:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.depot_tools/:$PATH"

export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

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