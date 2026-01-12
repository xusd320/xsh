# =============================================================================
# Environment Variables
# =============================================================================
export LANG=en_US.UTF-8
export EDITOR=nvim
export XDG_CONFIG_HOME="$HOME/.config"
export RIPGREP_CONFIG_PATH=~/.ripgreprc
export HOMEBREW_NO_AUTO_UPDATE=1

# Load secrets (API keys, etc.) from a separate file that is not committed
if [[ -f "$HOME/.zsh_secrets" ]]; then
    source "$HOME/.zsh_secrets"
fi


# =============================================================================
# Path Configuration
# =============================================================================
# Only add paths if they exist and aren't already in PATH
path_append() {
    for dir in "$@"; do
        [[ -d "$dir" && ":$PATH:" != *":$dir:"* ]] && export PATH="$PATH:$dir"
    done
}
path_prepend() {
    for dir in "$@"; do
        [[ -d "$dir" && ":$PATH:" != *":$dir:"* ]] && export PATH="$dir:$PATH"
    done
}

path_prepend "/opt/homebrew/bin" "$HOME/.local/bin" "$HOME/.cargo/bin"
path_append "/usr/local/bin" "/usr/local/sbin"

# =============================================================================
# Zsh Performance & Behavior
# =============================================================================
# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000
setopt HIST_IGNORE_ALL_DUPS  # Store only one copy of each command
setopt HIST_SAVE_NO_DUPS     # Don't save duplicates to disk
setopt HIST_REDUCE_BLANKS    # Remove extra blanks from history
setopt INC_APPEND_HISTORY    # Write to history file immediately
setopt SHARE_HISTORY         # Share history across sessions

# Completion
setopt MENU_COMPLETE         # Press Tab twice to cycle
setopt AUTO_LIST             # Automatically list choices
setopt COMPLETE_IN_WORD      # Allow completion from middle of word
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # Case-insensitive completion

# Speed
zmodload zsh/terminfo
zmodload zsh/datetime
setopt AUTO_CD               # cd by typing folder name
setopt INTERACTIVE_COMMENTS  # Allow comments in CLI

# =============================================================================
# Oh My Zsh & Plugins
# =============================================================================
export ZSH="$HOME/.oh-my-zsh"

# Performance: Only load plugins we actually need
# zsh-defer handles the heavy ones (autosuggestions, syntax-highlighting)
plugins=(
  colored-man-pages
  common-aliases
  copyfile
  copypath
  extract
  eza
  fnm
  fzf
  git
  git-commit
  history-substring-search
  starship
  sudo
  z
)

source $ZSH/oh-my-zsh.sh

# =============================================================================
# FZF Configuration (The Game Changer)
# =============================================================================
# Use fd instead of find for speed and respect .gitignore
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --strip-cwd-prefix --hidden --follow --exclude .git'

# Visual previews for files and directories
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8,fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc,marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced FZF functions
# 'fe' to open files in nvim with fuzzy find
fe() {
  local files
  files=$(fzf --query="$1" --multi --select-1 --exit-0)
  [[ -n "$files" ]] && ${EDITOR:-nvim} "${(f)files[@]}"
}

# --- Zsh Defer (Lazy Loading for Instant Startup) ---
source ~/xsh/zsh-defer/zsh-defer.plugin.zsh

# Defer these to make terminal startup near-instant
zsh-defer source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
zsh-defer source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Bindings for history-substring-search
zsh-defer bindkey '^[[A' history-substring-search-up
zsh-defer bindkey '^[[B' history-substring-search-down

# Completion init
function zsh-completions-init() {
  if [[ -d "/opt/homebrew/share/zsh-completions" ]]; then
      FPATH="/opt/homebrew/share/zsh-completions:$FPATH"
      autoload -Uz compinit && compinit -i
  fi
}
zsh-defer zsh-completions-init

# =============================================================================
# Aliases
# =============================================================================
alias vi="nvim"
alias vim="nvim"
alias ls="eza --icons --group-directories-first"
alias l="eza -lh --icons --group-directories-first"
alias la="eza -lah --icons --group-directories-first"
alias cat="bat --style=plain --paging=never"
alias lg="lazygit"
alias g="git"
alias ..="cd .."
alias ...="cd ../.."

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


