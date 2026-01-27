# ╔══════════════════════════════════════════════════════════════════════════════╗
# ║                               GITIGNORE                                      ║
# ╠══════════════════════════════════════════════════════════════════════════════╣
# ║  Génère un fichier .gitignore via gitignore.io                               ║
# ╚══════════════════════════════════════════════════════════════════════════════╝

gi() {
    if [ -z "$1" ]; then
        echo "❌ Usage: gi <langage/framework> (ex: gi node,macos,vscode)"
        return 1
    fi
    
    gum spin --spinner globe --title "Génération du .gitignore..." -- \
        curl -sL "https://www.gitignore.io/api/$1" > .gitignore
        
    if [ -s .gitignore ]; then
        gum style --foreground 82 "✅ .gitignore généré pour : $1"
        cat .gitignore | head -n 5
        echo "... (fin du fichier)"
    else
        echo "❌ Erreur lors de la récupération"
        rm -f .gitignore
    fi
}
