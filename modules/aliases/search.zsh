# ╔══════════════════════════════════════════════════════════════════════════════╗
# ║                              SEARCH ALIASES                                  ║
# ╠══════════════════════════════════════════════════════════════════════════════╣
# ║  fzf, ripgrep, fd, bat - Outils de recherche modernes                        ║
# ╚══════════════════════════════════════════════════════════════════════════════╝

# ┌─────────────────────────────────────────────────────────────────────────────┐
# │ FZF - Fuzzy Finder                                                          │
# │   Ctrl+T → Recherche fichier et insère son chemin                          │
# │   Ctrl+R → Recherche dans l'historique                                     │
# └─────────────────────────────────────────────────────────────────────────────┘
if command -v fzf &>/dev/null; then
    export FZF_DEFAULT_OPTS="--height 60% --layout=reverse --border=rounded"
    if [[ -f "$HOMEBREW_PREFIX/opt/fzf/shell/completion.zsh" ]]; then
        source "$HOMEBREW_PREFIX/opt/fzf/shell/completion.zsh"
        source "$HOMEBREW_PREFIX/opt/fzf/shell/key-bindings.zsh"
    fi
fi

# ┌─────────────────────────────────────────────────────────────────────────────┐
# │ RIPGREP - grep ultra-rapide                                                 │
# │   grep "pattern"      → Cherche dans tous les fichiers                     │
# │   grep "TODO" -t js   → Cherche seulement dans les .js                     │
# └─────────────────────────────────────────────────────────────────────────────┘
command -v rg &>/dev/null && alias grep="rg"

# ┌─────────────────────────────────────────────────────────────────────────────┐
# │ FD - find ultra-rapide                                                      │
# │   find "config"  → Trouve les fichiers contenant "config"                  │
# │   find -e js     → Trouve tous les fichiers .js                            │
# └─────────────────────────────────────────────────────────────────────────────┘
command -v fd &>/dev/null && alias find="fd"

# ┌─────────────────────────────────────────────────────────────────────────────┐
# │ BAT - cat avec coloration syntaxique                                        │
# │   cat fichier.py → Affiche avec coloration Python                          │
# └─────────────────────────────────────────────────────────────────────────────┘
if command -v bat &>/dev/null; then
    alias cat="bat --style=auto"
    export BAT_THEME="Catppuccin Mocha"
fi
