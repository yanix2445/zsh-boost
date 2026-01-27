# ╔══════════════════════════════════════════════════════════════════════════════╗
# ║                                  COPY                                        ║
# ╠══════════════════════════════════════════════════════════════════════════════╣
# ║  Copie le contenu d'un fichier dans le presse-papier                         ║
# ╚══════════════════════════════════════════════════════════════════════════════╝

copy() {
    if [ -z "$1" ]; then
        echo "❌ Usage: copy <fichier>"
        return 1
    fi

    if [ ! -f "$1" ]; then
        echo "❌ Fichier introuvable : $1"
        return 1
    fi

    pbcopy < "$1"
    gum style --foreground 82 "✅ Contenu de '$1' copié !"
}
