# ╔══════════════════════════════════════════════════════════════════════════════╗
# ║                            ALIASES LOADER                                    ║
# ╠══════════════════════════════════════════════════════════════════════════════╣
# ║  Charge automatiquement tous les fichiers .zsh de ce dossier                 ║
# ╚══════════════════════════════════════════════════════════════════════════════╝

local aliases_dir="${0:A:h}"

for alias_file in "$aliases_dir"/*.zsh; do
    [[ -f "$alias_file" && "${alias_file:t}" != "_loader.zsh" ]] && source "$alias_file"
done

unset alias_file aliases_dir
