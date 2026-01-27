# ╔══════════════════════════════════════════════════════════════════════════════╗
# ║                            NAVIGATION ALIASES                                ║
# ╠══════════════════════════════════════════════════════════════════════════════╣
# ║  zoxide (cd intelligent) + eza (ls amélioré) + navigation rapide             ║
# ╚══════════════════════════════════════════════════════════════════════════════╝

# ┌─────────────────────────────────────────────────────────────────────────────┐
# │ ZOXIDE - cd intelligent                                                     │
# │   cd proj     → Va au dossier fréquent contenant "proj"                    │
# │   cdi         → Mode interactif avec fzf                                   │
# └─────────────────────────────────────────────────────────────────────────────┘
if command -v zoxide &>/dev/null; then
    eval "$(zoxide init zsh --cmd cd)"
fi

# ┌─────────────────────────────────────────────────────────────────────────────┐
# │ EZA - ls amélioré                                                           │
# │   ls  → Liste simple avec icônes                                          │
# │   ll  → Liste détaillée (permissions, taille, date, git)                  │
# │   la  → Liste détaillée + fichiers cachés                                 │
# │   lt  → Vue arborescence (2 niveaux)                                      │
# └─────────────────────────────────────────────────────────────────────────────┘
if command -v eza &>/dev/null; then
    alias ls="eza --icons --group-directories-first"
    alias ll="eza -l --icons --group-directories-first --git"
    alias la="eza -la --icons --group-directories-first --git"
    alias lt="eza --tree --level=2 --icons"
else
    alias ls="ls -G"
    alias ll="ls -lh"
    alias la="ls -lAh"
fi

# ┌─────────────────────────────────────────────────────────────────────────────┐
# │ NAVIGATION RAPIDE                                                           │
# │   ..   → Remonte d'1 niveau                                                │
# │   ...  → Remonte de 2 niveaux                                              │
# │   .... → Remonte de 3 niveaux                                              │
# └─────────────────────────────────────────────────────────────────────────────┘
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# ┌─────────────────────────────────────────────────────────────────────────────┐
# │ UTILITAIRES                                                                 │
# │   cls → Efface le terminal                                                 │
# │   rld → Recharge la configuration ZSH                                     │
# └─────────────────────────────────────────────────────────────────────────────┘
alias cls="clear"
alias rld="source ~/.zshrc"
