#!/usr/bin/env zsh
# ══════════════════════════════════════════════════════════════════════════════
#  ⚡ ZSH BOOST - INSTALLATEUR INTERACTIF
# ══════════════════════════════════════════════════════════════════════════════

# ══════════════════════════════════════════════════════════════════════════════
# CONFIGURATION
# ══════════════════════════════════════════════════════════════════════════════

# Format: "brew_name:binary:description:type"
TOOLS=(
    "zoxide:zoxide:🧭 Navigation intelligente:brew"
    "eza:eza:📁 Listing moderne:brew"
    "fzf:fzf:🔎 Fuzzy finder:brew"
    "ripgrep:rg:📝 Recherche rapide:brew"
    "fd:fd:🔍 Recherche fichiers:brew"
    "bat:bat:🦇 Cat coloré:brew"
    "starship:starship:🚀 Prompt moderne:brew"
    "uv:uv:🐍 Python manager:brew"
    "node:node:📦 Node.js:brew"
    "pnpm:pnpm:📦 Package manager:brew"
    "font-fira-code-nerd-font:FONT:✏️ Nerd Font:cask"
)

PLUGINS=(
    "zsh-autosuggestions:https://github.com/zsh-users/zsh-autosuggestions"
    "zsh-syntax-highlighting:https://github.com/zsh-users/zsh-syntax-highlighting"
    "fzf-tab:https://github.com/Aloxaf/fzf-tab"
)

# ══════════════════════════════════════════════════════════════════════════════
# UTILS
# ══════════════════════════════════════════════════════════════════════════════

is_installed() {
    local bin="$1" type="$2"
    if [[ "$type" == "cask" ]]; then
        ls ~/Library/Fonts 2>/dev/null | grep -qi "FiraCode"
    else
        command -v "$bin" &>/dev/null
    fi
}

header() {
    clear
    gum style --foreground 212 --border-foreground 212 --border double \
        --align center --width 50 --margin "1" --padding "1" \
        "⚡ ZSH BOOST" "Installateur"
}

# ══════════════════════════════════════════════════════════════════════════════
# PRÉREQUIS
# ══════════════════════════════════════════════════════════════════════════════

setup() {
    # Homebrew
    if ! command -v brew &>/dev/null; then
        echo "❌ Homebrew requis. Installation..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
    
    # Gum
    if ! command -v gum &>/dev/null; then
        echo "📦 Installation de gum..."
        brew install gum
    fi
}

# ══════════════════════════════════════════════════════════════════════════════
# SYMLINK DYNAMIQUE
# ══════════════════════════════════════════════════════════════════════════════

setup_symlink() {
    header
    echo ""
    gum style --bold "🔗 Configuration du Symlink"
    echo ""
    
    # Détection automatique du chemin du repo (où est install.sh)
    local SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
    local REPO_ZSHRC="$SCRIPT_DIR/.zshrc"
    local USER_ZSHRC="$HOME/.zshrc"
    
    gum style --faint "  📂 Repo détecté : $SCRIPT_DIR"
    echo ""
    
    # Vérifier que le .zshrc du repo existe
    if [[ ! -f "$REPO_ZSHRC" ]]; then
        gum style --foreground 196 "  ❌ Fichier $REPO_ZSHRC introuvable !"
        gum input --placeholder "Entrée pour continuer" > /dev/null
        return 1
    fi
    
    # Vérifier l'état actuel
    if [[ -L "$USER_ZSHRC" ]]; then
        local current_target="$(readlink "$USER_ZSHRC")"
        if [[ "$current_target" == "$REPO_ZSHRC" ]]; then
            gum style --foreground 82 "  ✓ Symlink déjà configuré correctement !"
            gum input --placeholder "Entrée pour continuer" > /dev/null
            return 0
        else
            gum style --foreground 214 "  ⚠️ Symlink existant vers : $current_target"
            echo ""
            if ! gum confirm "Remplacer par le nouveau symlink ?"; then
                gum style --foreground 214 "  Annulé"
                gum input --placeholder "Entrée pour continuer" > /dev/null
                return 0
            fi
        fi
    elif [[ -f "$USER_ZSHRC" ]]; then
        gum style --foreground 214 "  ⚠️ Fichier ~/.zshrc existant (pas un symlink)"
        echo ""
        if gum confirm "Faire une sauvegarde et remplacer ?"; then
            local backup="$HOME/.zshrc.backup.$(date +%Y%m%d_%H%M%S)"
            mv "$USER_ZSHRC" "$backup"
            gum style --foreground 82 "  → Backup créé : $backup"
        else
            gum style --foreground 214 "  Annulé"
            gum input --placeholder "Entrée pour continuer" > /dev/null
            return 0
        fi
    fi
    
    # Créer le symlink
    echo ""
    gum spin --spinner dot --title "Création du symlink..." -- sleep 0.5
    
    if ln -sf "$REPO_ZSHRC" "$USER_ZSHRC"; then
        gum style --foreground 82 --bold "  ✓ Symlink créé !"
        echo ""
        gum style --faint "  ~/.zshrc → $REPO_ZSHRC"
        echo ""
        gum style --foreground 82 "  Lance 'exec zsh' pour recharger."
    else
        gum style --foreground 196 "  ❌ Erreur lors de la création du symlink"
    fi
    
    echo ""
    gum input --placeholder "Entrée pour continuer" > /dev/null
}

# ══════════════════════════════════════════════════════════════════════════════
# STATUT
# ══════════════════════════════════════════════════════════════════════════════

status() {
    header
    echo ""
    gum style --bold "📦 Statut"
    echo ""
    
    local ok=0 ko=0
    for t in "${TOOLS[@]}"; do
        local name="${t%%:*}" rest="${t#*:}"
        local bin="${rest%%:*}" rest2="${rest#*:}"
        local desc="${rest2%%:*}" type="${rest2##*:}"
        
        if is_installed "$bin" "$type"; then
            gum style --foreground 82 "  ● $name — $desc"
            ((ok++))
        else
            gum style --foreground 196 "  ○ $name — $desc"
            ((ko++))
        fi
    done
    
    echo ""
    echo "  $(gum style --foreground 82 "● $ok")  $(gum style --foreground 196 "○ $ko")"
    echo ""
    gum input --placeholder "Entrée pour continuer" > /dev/null
}

# ══════════════════════════════════════════════════════════════════════════════
# INSTALLER
# ══════════════════════════════════════════════════════════════════════════════

install_tools() {
    header
    
    # Construire liste des manquants
    local missing=()
    for t in "${TOOLS[@]}"; do
        local name="${t%%:*}" rest="${t#*:}"
        local bin="${rest%%:*}" rest2="${rest#*:}"
        local desc="${rest2%%:*}" type="${rest2##*:}"
        
        if ! is_installed "$bin" "$type"; then
            missing+=("$name|$desc|$type")
        fi
    done
    
    if [[ ${#missing[@]} -eq 0 ]]; then
        echo ""
        gum style --foreground 82 "✓ Tout est installé ! 🎉"
        sleep 2
        return
    fi
    
    # Afficher sélection
    echo ""
    gum style --bold "Sélectionne les outils à installer"
    gum style --faint "Espace = toggle, Entrée = confirmer"
    echo ""
    
    # Construire options pour gum
    local opts=()
    for m in "${missing[@]}"; do
        local n="${m%%|*}" r="${m#*|}"
        local d="${r%%|*}"
        opts+=("$n — $d")
    done
    
    local sel
    sel=$(printf '%s\n' "${opts[@]}" | gum choose --no-limit --selected="${opts[*]}")
    
    if [[ -z "$sel" ]]; then
        gum style --foreground 214 "Annulé"
        sleep 1
        return
    fi
    
    # Installer
    echo ""
    gum style --bold "🚀 Installation..."
    echo ""
    
    echo "$sel" | while IFS= read -r line; do
        local tool="${line%% —*}"
        
        # Trouver le type
        local ttype="brew"
        for m in "${missing[@]}"; do
            local n="${m%%|*}" r="${m#*|}"
            local ty="${r##*|}"
            if [[ "$n" == "$tool" ]]; then
                ttype="$ty"
                break
            fi
        done
        
        echo -n "  → $tool "
        
        if [[ "$ttype" == "cask" ]]; then
            if brew install --cask "$tool" &>/dev/null; then
                gum style --foreground 82 "✓"
            else
                gum style --foreground 196 "✗"
            fi
        else
            if brew install "$tool" &>/dev/null; then
                gum style --foreground 82 "✓"
            else
                gum style --foreground 196 "✗"
            fi
        fi
    done
    
    echo ""
    gum style --foreground 82 "Terminé !"
    gum input --placeholder "Entrée pour continuer" > /dev/null
}

# ══════════════════════════════════════════════════════════════════════════════
# PLUGINS OMZ
# ══════════════════════════════════════════════════════════════════════════════

install_plugins() {
    header
    echo ""
    gum style --bold "🔌 Plugins Oh My Zsh"
    echo ""
    
    local custom="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
    
    if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
        gum style --foreground 196 "Oh My Zsh non installé"
        gum input --placeholder "Entrée pour continuer" > /dev/null
        return
    fi
    
    for p in "${PLUGINS[@]}"; do
        local name="${p%%:*}" url="${p#*:}"
        local dest="$custom/plugins/$name"
        
        echo -n "  → $name "
        if [[ -d "$dest" ]]; then
            gum style --foreground 82 "déjà installé"
        else
            if git clone --depth=1 "$url" "$dest" &>/dev/null; then
                gum style --foreground 82 "✓"
            else
                gum style --foreground 196 "✗"
            fi
        fi
    done
    
    echo ""
    gum input --placeholder "Entrée pour continuer" > /dev/null
}

# ══════════════════════════════════════════════════════════════════════════════
# TOUT INSTALLER
# ══════════════════════════════════════════════════════════════════════════════

full_install() {
    header
    echo ""
    gum style --bold "🚀 Installation complète"
    echo ""
    
    # Outils
    for t in "${TOOLS[@]}"; do
        local name="${t%%:*}" rest="${t#*:}"
        local bin="${rest%%:*}" rest2="${rest#*:}"
        local type="${rest2##*:}"
        
        echo -n "  → $name "
        
        if is_installed "$bin" "$type"; then
            gum style --foreground 82 "✓"
        else
            if [[ "$type" == "cask" ]]; then
                brew install --cask "$name" &>/dev/null && \
                    gum style --foreground 82 "✓" || gum style --foreground 196 "✗"
            else
                brew install "$name" &>/dev/null && \
                    gum style --foreground 82 "✓" || gum style --foreground 196 "✗"
            fi
        fi
    done
    
    echo ""
    
    # Plugins
    local custom="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
    if [[ -d "$HOME/.oh-my-zsh" ]]; then
        gum style --faint "Plugins..."
        for p in "${PLUGINS[@]}"; do
            local name="${p%%:*}" url="${p#*:}"
            local dest="$custom/plugins/$name"
            [[ ! -d "$dest" ]] && git clone --depth=1 "$url" "$dest" &>/dev/null
        done
    fi
    
    echo ""
    gum style --foreground 82 --bold "✓ Terminé ! 🎉"
    gum style --faint "exec zsh pour recharger"
    echo ""
    gum input --placeholder "Entrée pour continuer" > /dev/null
}

# ══════════════════════════════════════════════════════════════════════════════
# MENU
# ══════════════════════════════════════════════════════════════════════════════

main() {
    setup
    
    while true; do
        header
        echo ""
        
        local choice
        choice=$(gum choose \
            "🔗 Configurer le Symlink" \
            "📦 Installer des outils" \
            "📊 Voir le statut" \
            "🔌 Plugins OMZ" \
            "🚀 Tout installer" \
            "❌ Quitter")
        
        case "$choice" in
            "🔗"*) setup_symlink ;;
            "📦"*) install_tools ;;
            "📊"*) status ;;
            "🔌"*) install_plugins ;;
            "🚀"*) full_install ;;
            *) header; gum style --foreground 82 "👋 Bye!"; echo ""; exit 0 ;;
        esac
    done
}

[[ -t 1 ]] && main || echo "Terminal requis"
