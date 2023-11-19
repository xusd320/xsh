export LANG=en_US.UTF-8

export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions", use:"zsh-autosuggestions.zsh"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

eval "$(starship init zsh)"

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

alias vi="nvim"
alias vim="nvim"
export EDITOR=nvim

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export TABBY_DISABLE_USAGE_COLLECTION=1
