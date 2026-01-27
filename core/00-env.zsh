# ╔══════════════════════════════════════════════════════════════════════════════╗
# ║                          VARIABLES D'ENVIRONNEMENT                           ║
# ╠══════════════════════════════════════════════════════════════════════════════╣
# ║  Définit les chemins globaux utilisés par d'autres outils.                  ║
# ║  Ces variables sont lues par core/02-path.zsh et les modules.               ║
# ║                                                                              ║
# ║  ⚠️  NE PAS MODIFIER sauf si tu installes un outil standalone               ║
# ╚══════════════════════════════════════════════════════════════════════════════╝

# ┌─────────────────────────────────────────────────────────────────────────────┐
# │ HOMEBREW                                                                    │
# │ Gestionnaire de paquets macOS - Installe 95% de tes outils                 │
# │ Sur Apple Silicon (M1/M2/M3) → /opt/homebrew                               │
# │ Sur Intel                    → /usr/local                                  │
# └─────────────────────────────────────────────────────────────────────────────┘
export HOMEBREW_PREFIX="/opt/homebrew"

# ┌─────────────────────────────────────────────────────────────────────────────┐
# │ BUN                                                                         │
# │ Runtime JavaScript ultra-rapide (alternative à Node.js)                     │
# │ Installé via : curl -fsSL https://bun.sh/install | bash                    │
# └─────────────────────────────────────────────────────────────────────────────┘
export BUN_INSTALL="$HOME/.bun"

# ┌─────────────────────────────────────────────────────────────────────────────┐
# │ OH MY ZSH                                                                   │
# │ Framework ZSH avec thèmes et plugins                                        │
# │ Installé via : sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/...)"    │
# └─────────────────────────────────────────────────────────────────────────────┘
export ZSH="$HOME/.oh-my-zsh"

# Optimisation man page
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
