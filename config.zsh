# ╔══════════════════════════════════════════════════════════════════════════════╗
# ║                              CONFIGURATION                                   ║
# ╠══════════════════════════════════════════════════════════════════════════════╣
# ║  🎯 C'EST LE SEUL FICHIER QUE TU DOIS MODIFIER                              ║
# ║                                                                              ║
# ║  Ici tu contrôles :                                                         ║
# ║    • Quels modules sont actifs                                              ║
# ║    • Le thème Oh My Zsh                                                     ║
# ║    • Les plugins à charger                                                  ║
# ╚══════════════════════════════════════════════════════════════════════════════╝

# ┌─────────────────────────────────────────────────────────────────────────────┐
# │ MODULES ACTIFS                                                              │
# │                                                                              │
# │ Commenté (#) = désactivé    |    Décommenté = actif                        │
# │                                                                              │
# │ Après modification : recharge avec "exec zsh" ou "rld"                     │
# Fichier de configuration principal
# Charge tous les modules dans l'ordre défini
# Ne modifiez pas l'ordre de chargement !

# 1. Variables d'environnement (Chargées automatiquement par le loader .zshrc)
# source "$ZSH_CONFIG/core/00-env.zsh" <-- SUPPRIMÉ (Redondant et buggé)
# └─────────────────────────────────────────────────────────────────────────────┘

typeset -a ZSH_MODULES
ZSH_MODULES=(
    core/omz         # 🔒 Système : Oh My Zsh + plugins
    aliases/_loader  # ✅ Aliases : navigation, search, etc.
    utils/_loader    # ✅ Fonctions : fkill, ports, myip, etc.
)

# ┌─────────────────────────────────────────────────────────────────────────────┐
# │ THÈME OH MY ZSH                                                             │
# │                                                                              │
# │ Thèmes populaires : robbyrussell, agnoster, powerlevel10k, starship        │
# │ Liste complète : https://github.com/ohmyzsh/ohmyzsh/wiki/Themes            │
# └─────────────────────────────────────────────────────────────────────────────┘

export ZSH_THEME="robbyrussell"

# ┌─────────────────────────────────────────────────────────────────────────────┐
# │ PLUGINS OH MY ZSH                                                           │
# │                                                                              │
# │ Plugins intégrés : git, z, fzf, docker, npm, python...                     │
# │ Liste complète : https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins           │
# │                                                                              │
# │ Les plugins externes (zsh-autosuggestions, fzf-tab...) doivent être        │
# │ installés dans ~/.oh-my-zsh/custom/plugins/                                │
# └─────────────────────────────────────────────────────────────────────────────┘

export ZSH_PLUGINS=(
    git                      # Alias git (g, gst, gco, gp...)
    z                        # Navigation intelligente (fallback si pas zoxide)
    fzf                      # Intégration fuzzy finder
    zsh-autosuggestions      # Suggestions grisées (→ pour accepter)
    zsh-syntax-highlighting  # Coloration syntaxique des commandes
    fzf-tab                  # Complétion avec fzf (Tab)
)
