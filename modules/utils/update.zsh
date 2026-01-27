# ╔══════════════════════════════════════════════════════════════════════════════╗
# ║                                 UPDATE                                       ║
# ╠══════════════════════════════════════════════════════════════════════════════╣
# ║  Mise à jour globale du système (Homebrew, ZSH, Node, etc.)                  ║
# ╚══════════════════════════════════════════════════════════════════════════════╝

up() {
    # Vérifie si gum est installé
    if ! command -v gum &>/dev/null; then
        echo "❌ gum requis. Installe-le avec 'brew install gum'"
        return 1
    fi

    # Nettoie l'écran pour une vue propre
    clear
    
    # Espace vertical pour "centrer" un peu visuellement
    echo "\n\n"

    gum style --foreground 212 --border-foreground 212 --border double \
        --align center --width 50 --margin "1 2" --padding "1 2" \
        "🚀 GLOBAL UPDATE" "Mise à jour du système"
    echo "\n"

    local log_file="/tmp/zsh_update.log"
    echo "--- UPDATE STARTED AT $(date) ---" > "$log_file"
    echo "Logs: $log_file"

    # 1. Homebrew
    if command -v brew &>/dev/null; then
        gum spin --spinner dot --title "Brew : Update & Upgrade..." --show-output -- \
            sh -c "echo '\n=== HOMEBREW ===' >> $log_file && brew update >> $log_file 2>&1 && brew upgrade >> $log_file 2>&1 && brew cleanup >> $log_file 2>&1"
        gum style --foreground 82 "  ✅ Homebrew à jour"
    fi

    # 2. Oh My Zsh
    if [ -d "$HOME/.oh-my-zsh" ]; then
        gum spin --spinner minidot --title "Oh My Zsh : Mise à jour..." -- \
            sh -c "echo '\n=== OH MY ZSH ===' >> $log_file && env ZSH=$ZSH sh $ZSH/tools/upgrade.sh >> $log_file 2>&1"
        gum style --foreground 82 "  ✅ Oh My Zsh à jour"
    fi

    # 3. ZSH Plugins
    gum spin --spinner points --title "Plugins ZSH : Pull git..." -- \
        sh -c '
        echo "\n=== ZSH PLUGINS ===" >> '"$log_file"'
        plugin_dir="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins"
        if [[ -d "$plugin_dir" ]]; then
            for plugin in "$plugin_dir"/*(N/); do
                echo "Updating ${plugin:t}..."
                git -C "$plugin" pull -q
            done
        fi >> '"$log_file"' 2>&1'
    gum style --foreground 82 "  ✅ Plugins ZSH à jour"

    # 4. Node Package Managers
    if command -v npm &>/dev/null; then
        gum spin --spinner line --title "NPM : Global update..." -- \
            sh -c "echo '\n=== NPM ===' >> $log_file && npm update -g >> $log_file 2>&1"
        gum style --foreground 82 "  ✅ NPM à jour"
    fi
    if command -v pnpm &>/dev/null; then
        gum spin --spinner line --title "PNPM : Self update..." -- \
            sh -c "echo '\n=== PNPM ===' >> $log_file && pnpm self-update >> $log_file 2>&1"
        gum style --foreground 82 "  ✅ PNPM à jour"
    fi
    if command -v bun &>/dev/null; then
        gum spin --spinner line --title "Bun : Upgrade..." -- \
            sh -c "echo '\n=== BUN ===' >> $log_file && bun upgrade >> $log_file 2>&1"
        gum style --foreground 82 "  ✅ Bun à jour"
    fi
    if command -v rustup &>/dev/null; then
        gum spin --spinner line --title "Rust : Update..." -- \
            sh -c "echo '\n=== RUST ===' >> $log_file && rustup update >> $log_file 2>&1"
        gum style --foreground 82 "  ✅ Rust à jour"
    fi

    # 5. macOS (Interactive)
    echo ""
    if gum confirm "Vérifier les mises à jour macOS ?"; then
        gum spin --spinner globe --title "macOS : Recherche de mises à jour..." -- \
            sh -c "echo '\n=== MACOS ===' >> $log_file && softwareupdate -i -a >> $log_file 2>&1"
        gum style --foreground 82 "  ✅ macOS vérifié"
    else
        echo "\n=== MACOS SKIPPED ===\n" >> "$log_file"
        gum style --faint "  ⏩ macOS ignoré"
    fi
    
    echo "\n--- UPDATE FINISHED AT $(date) ---" >> "$log_file"

    echo ""
    gum style --foreground 82 --bold "🎉 TOUT EST À JOUR !"
    echo "Logs complets : $log_file"
    echo ""
}
