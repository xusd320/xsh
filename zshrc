export LANG=en_US.UTF-8
export PATH="/opt/homebrew/bin:$PATH"

export ZSH="$HOME/.oh-my-zsh"

plugins=(
  command-not-found
  common-aliases
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
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
fi

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
