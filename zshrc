export LANG=en_US.UTF-8
export PATH="/opt/homebrew/bin:$PATH"

export ZSH="$HOME/.oh-my-zsh"

plugins=(
  alias-finder
  copyfile
  copypath
  cp
  extract
  eza
  fnm
  fzf
  gh
  git
  git-commit
  history-substring-search
  procs
  rust
  starship
  systemd
  zoxide
)

source $ZSH/oh-my-zsh.sh

export EDITOR=nvim

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.local/bin/:$PATH"

export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-L/opt/homebrew/opt/llvm/lib -Wl,-rpath,/opt/homebrew/opt/llvm/lib"
export AR=llvm-ar
export LD=lld
export NM=llvm-nm
export STRIP=llvm-strip
export RANLIB=llvm-ranlib

export RIPGREP_CONFIG_PATH=~/.ripgreprc

export XDG_CONFIG_HOME="$HOME/.config"

export PATH="$HOME/.cargo/bin:$PATH"

export HOMEBREW_NO_AUTO_UPDATE=1

alias vi="nvim"
alias vim="nvim"

eval "$(fnm env)"
