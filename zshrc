export LANG=en_US.UTF-8

source /opt/homebrew/share/antigen/antigen.zsh
antigen use oh-my-zsh

antigen bundle common-aliases
antigen bundle command-not-found
antigen bundle compleat
antigen bundle copyfile
antigen bundle copypath
antigen bundle git
antigen bundle git-commit
antigen bundle git-escape-magic
antigen bundle git-extra
antigen bundle git-fast
antigen bundle git-flow
antigen bundle history
antigen bundle nats
antigen bundle ripgrep
antigen bundle z
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-syntax-highlighting

if [[ "$OSTYPE" == "darwin"* ]]; then
    antigen bundle osx
    antigen bundle brew
fi

antigen apply

eval "$(starship init zsh)"

alias ls='eza --color auto --icons -a -s type'

alias vi="nvim"
alias vim="nvim"
export EDITOR=nvim
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.local/bin/:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="/opt/homebrew/opt/python@3.10/libexec/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-L/opt/homebrew/opt/llvm/lib -Wl,-rpath,/opt/homebrew/opt/llvm/lib"
export AR=llvm-ar
export LD=lld
export NM=llvm-nm
export STRIP=llvm-strip
export RANLIB=llvm-ranlib

export RIPGREP_CONFIG_PATH=~/.ripgreprc

export XDG_CONFIG_HOME="$HOME/.config"

export HOMEBREW_NO_AUTO_UPDATE=1

export TABBY_DISABLE_USAGE_COLLECTION=1

eval "$(fnm env --use-on-cd)"
