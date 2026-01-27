# ╔══════════════════════════════════════════════════════════════════════════════╗
# ║                                  TRASH                                       ║
# ╠══════════════════════════════════════════════════════════════════════════════╣
# ║  Supprime des fichiers en les envoyant vers la corbeille système             ║
# ╚══════════════════════════════════════════════════════════════════════════════╝

trash() {
    if [ -z "$1" ]; then
        echo "❌ Usage: trash <fichier/dossier>"
        return 1
    fi
    
    # Demande confirmation via Gum si installé, sinon standard
    if command -v gum &>/dev/null; then
        if ! gum confirm "Envoyer vers la corbeille ?"; then
            echo "❌ Annulé."
            return 1
        fi
    fi
    
    # Déplacement vers la corbeille utilisateur
    mv "$@" ~/.Trash/ && echo "🗑️  Envoyé vers la corbeille."
}
