# ╔══════════════════════════════════════════════════════════════════════════════╗
# ║                           ZSH BOOST LOADER                                   ║
# ╠══════════════════════════════════════════════════════════════════════════════╣
# ║  Ce fichier charge toute la configuration de manière modulaire.              ║
# ║  NE PAS MODIFIER CE FICHIER DIRECTEMENT.                                     ║
# ║  Utilise 'config.zsh' pour tes préférences.                                  ║
# ╚══════════════════════════════════════════════════════════════════════════════╝

# 1. Définir la racine de la configuration
# Note: Au démarrage du shell, $0 est le nom du shell ("-zsh"), pas le script.
# On déduit le chemin via le lien symbolique ~/.zshrc
if [[ -L "${HOME}/.zshrc" ]]; then
    export ZDOTDIR="${$(readlink "${HOME}/.zshrc"):A:h}"
else
    # Fallback pour sourcing manuel ou si pas de symlink
    export ZDOTDIR="${0:A:h}"
fi

# 2. Charger les modules core (environnement, options, path)
for core in "$ZDOTDIR/core/"*.zsh(N); do
    [[ -r "$core" ]] && source "$core"
done

# 3. Charger la configuration utilisateur (choix des modules, thèmes)
[[ -f "$ZDOTDIR/config.zsh" ]] && source "$ZDOTDIR/config.zsh"

# 4. Charger les modules activés (définis dans ZSH_MODULES)
if (( ${#ZSH_MODULES} )); then
    for module in $ZSH_MODULES; do
        local module_file="$ZDOTDIR/modules/${module}.zsh"
        if [[ -r "$module_file" ]]; then
            source "$module_file"
        else
            echo "⚠️  Module introuvable : $module"
        fi
    done
fi

# 5. Charger les personnalisations locales (exclues de git)
[[ -f "$ZDOTDIR/local/custom.zsh" ]] && source "$ZDOTDIR/local/custom.zsh"

# bun completions
[ -s "/Users/yanis/.bun/_bun" ] && source "/Users/yanis/.bun/_bun"

# Added by Antigravity
export PATH="/Users/yanis/.antigravity/antigravity/bin:$PATH"
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/yanis/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
