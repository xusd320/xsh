# =============================================================================
# Environment Variables
# =============================================================================
export LANG=en_US.UTF-8
export EDITOR=nvim
export XDG_CONFIG_HOME="$HOME/.config"
export RIPGREP_CONFIG_PATH=~/.ripgreprc
export HOMEBREW_NO_AUTO_UPDATE=1

# =============================================================================
# Path Configuration
# =============================================================================
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.local/bin/:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

# =============================================================================
# Oh My Zsh & Plugins
# =============================================================================
export ZSH="$HOME/.oh-my-zsh"

plugins=(
  eza
  fnm
  git
  git-commit
  history-substring-search
  starship
  z
)

source $ZSH/oh-my-zsh.sh

# --- Zsh Defer (Lazy Loading) ---
source ~/xsh/zsh-defer/zsh-defer.plugin.zsh

zsh-defer source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
zsh-defer source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

function zsh-completions-init() {
  if type brew &>/dev/null; then
      FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
      autoload -Uz compinit
      compinit
  fi
}
zsh-defer zsh-completions-init

# =============================================================================
# Tool Configuration
# =============================================================================

# --- LLVM / Clang ---
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export CC="/opt/homebrew/opt/llvm/bin/clang"
export CXX="/opt/homebrew/opt/llvm/bin/clang++"
export CPATH="/opt/homebrew/opt/llvm/include/c++/v1"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib -Wl,-rpath,/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include -I/opt/homebrew/opt/llvm/include/c++/v1/"
export AR=llvm-ar
export LD=lld
export NM=llvm-nm
export STRIP=llvm-strip
export RANLIB=llvm-ranlib

# --- FNM (Fast Node Manager) ---
eval "$(fnm env)"

# =============================================================================
# Aliases
# =============================================================================
alias vi="nvim"
alias vim="nvim"

source ~/xsh/git-auto-perf.zsh

# --- Cursor Fix ---
# Force cursor to be a blinking block everywhere
# This fixes the issue where the cursor reverts to a bar in Zsh
_fix_cursor() {
  printf '\033[1 q'
}

precmd_functions+=(_fix_cursor)

zle-line-init() {
  _fix_cursor
}
zle -N zle-line-init

zle-keymap-select() {
  _fix_cursor
}
zle -N zle-keymap-select


