# ╔══════════════════════════════════════════════════════════════════════════════╗
# ║                            UTILS LOADER                                      ║
# ╠══════════════════════════════════════════════════════════════════════════════╣
# ║  Charge automatiquement tous les fichiers .zsh de ce dossier                 ║
# ╚══════════════════════════════════════════════════════════════════════════════╝

# Répertoire courant du loader
local utils_dir="${0:A:h}"

# Charge tous les .zsh sauf ce fichier
for util_file in "$utils_dir"/*.zsh; do
    [[ -f "$util_file" && "${util_file:t}" != "_loader.zsh" ]] && source "$util_file"
done

unset util_file utils_dir
