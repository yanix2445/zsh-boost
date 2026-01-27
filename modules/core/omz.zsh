# ╔══════════════════════════════════════════════════════════════════════════════╗
# ║                                OH MY ZSH                                     ║
# ╠══════════════════════════════════════════════════════════════════════════════╣
# ║  Charge Oh My Zsh avec le thème et les plugins définis dans config.zsh     ║
# ║                                                                              ║
# ║  ⚠️  NE PAS MODIFIER - Contrôle via config.zsh                              ║
# ╚══════════════════════════════════════════════════════════════════════════════╝

# Thème (défini dans config.zsh ou défaut)
ZSH_THEME="${ZSH_THEME:-robbyrussell}"

# Plugins de base
plugins=(${ZSH_PLUGINS:-git})

# ┌─────────────────────────────────────────────────────────────────────────────┐
# │ PLUGINS EXTERNES                                                            │
# │ Installés dans ~/.oh-my-zsh/custom/plugins/                                │
# │                                                                              │
# │ Installation :                                                               │
# │   git clone https://github.com/zsh-users/zsh-autosuggestions \             │
# │       ${ZSH_CUSTOM}/plugins/zsh-autosuggestions                            │
# └─────────────────────────────────────────────────────────────────────────────┘

_custom="${ZSH_CUSTOM:-$ZSH/custom}"
[[ -d "$_custom/plugins/zsh-autosuggestions" ]]     && plugins+=(zsh-autosuggestions)
[[ -d "$_custom/plugins/zsh-syntax-highlighting" ]] && plugins+=(zsh-syntax-highlighting)
[[ -d "$_custom/plugins/fzf-tab" ]]                 && plugins+=(fzf-tab)
unset _custom

# Charge Oh My Zsh
source "$ZSH/oh-my-zsh.sh"
