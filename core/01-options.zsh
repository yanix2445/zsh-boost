# ╔══════════════════════════════════════════════════════════════════════════════╗
# ║                              OPTIONS ZSH                                     ║
# ╠══════════════════════════════════════════════════════════════════════════════╣
# ║  Configure le comportement natif de ZSH : navigation, historique, etc.      ║
# ║                                                                              ║
# ║  ⚠️  NE PAS MODIFIER - Ces options sont optimisées                          ║
# ╚══════════════════════════════════════════════════════════════════════════════╝

# ┌─────────────────────────────────────────────────────────────────────────────┐
# │ NAVIGATION                                                                   │
# └─────────────────────────────────────────────────────────────────────────────┘

setopt AUTO_CD           # Tape juste le nom du dossier pour y aller
                         # Exemple : ~/Documents → cd ~/Documents automatique

setopt AUTO_PUSHD        # Chaque cd ajoute le dossier à une pile
                         # Utilise : cd -1, cd -2... pour naviguer

setopt PUSHD_IGNORE_DUPS # Pas de doublons dans la pile de navigation

# ┌─────────────────────────────────────────────────────────────────────────────┐
# │ HISTORIQUE                                                                   │
# │ Tes commandes sont sauvegardées pour Ctrl+R et flèche haut                  │
# └─────────────────────────────────────────────────────────────────────────────┘

HISTFILE=~/.zsh_history  # Fichier où l'historique est stocké
HISTSIZE=10000           # Nombre de commandes en mémoire
SAVEHIST=10000           # Nombre de commandes sauvegardées sur disque

setopt SHARE_HISTORY     # Partage l'historique entre tous les terminaux
setopt HIST_IGNORE_DUPS  # N'enregistre pas les commandes en double

# ┌─────────────────────────────────────────────────────────────────────────────┐
# │ PATH                                                                         │
# └─────────────────────────────────────────────────────────────────────────────┘

typeset -U path fpath    # Supprime les doublons dans le PATH automatiquement
