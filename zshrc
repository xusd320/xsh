export LANG=en_US.UTF-8

source /opt/homebrew/share/antigen/antigen.zsh
antigen use oh-my-zsh

antigen bundle git
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

if [[ "$OSTYPE" == "darwin"* ]]; then
    antigen bundle osx
fi

antigen apply

eval "$(starship init zsh)"

alias ls='exa -G  --color auto --icons -a -s type'
alias ll='exa -l --color always --icons -a -s type'

alias vi="nvim"
alias vim="nvim"
export EDITOR=nvim

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="/opt/homebrew/opt/python@3.10/libexec/bin:$PATH"
export PATH="$HOME/.local/bin/:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

export AR=llvm-ar
export LD=lld
export NM=llvm-nm
export STRIP=llvm-strip
export RANLIB=llvm-ranlib

export RIPGREP_CONFIG_PATH=~/.ripgreprc

eval "$(fnm env --use-on-cd)"

export TABBY_DISABLE_USAGE_COLLECTION=1
