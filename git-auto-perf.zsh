# Automatically enable git performance optimizations for large repositories

function _git_auto_perf() {
  # Only run if git is installed
  (( $+commands[git] )) || return

  # Check if we are in a git repository
  local git_dir
  git_dir=$(git rev-parse --git-dir 2>/dev/null) || return

  # Resolve absolute path if necessary (though rev-parse usually returns absolute or relative correctly for use)
  # If git_dir is relative, make it absolute based on PWD
  if [[ "$git_dir" != /* ]]; then
    git_dir="$PWD/$git_dir"
  fi

  local index_file="$git_dir/index"

  # Check if index file exists
  [[ -f "$index_file" ]] || return

  # Check index file size (in bytes)
  # macOS stat: -f %z
  # Linux stat: -c %s
  local index_size
  if [[ "$OSTYPE" == darwin* ]]; then
    index_size=$(stat -f %z "$index_file" 2>/dev/null)
  else
    index_size=$(stat -c %s "$index_file" 2>/dev/null)
  fi

  # Threshold: 1MB (1048576 bytes)
  # 4.5MB index caused ~1s delay, so 1MB is a reasonable start for optimization
  local threshold=1048576

  if (( index_size > threshold )); then
    # Check if optimizations are already enabled
    local fsmonitor
    fsmonitor=$(git config core.fsmonitor)

    if [[ "$fsmonitor" != "true" ]]; then
      echo "🚀 Large repository detected (Index: $((index_size/1024/1024))MB). Enabling git optimizations..."
      
      git config core.fsmonitor true
      git config core.untrackedcache true
      git config feature.manyFiles true
      
      # Start the daemon in background if not running
      git fsmonitor--daemon start &>/dev/null &
      
      echo "✅ Git optimizations enabled!"
    fi
  fi
}

# Add to chpwd hook
autoload -Uz add-zsh-hook
add-zsh-hook chpwd _git_auto_perf

# Run once on init in case we start in a large repo
_git_auto_perf
