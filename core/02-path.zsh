# ╔══════════════════════════════════════════════════════════════════════════════╗
# ║                              GESTION DU PATH                                 ║
# ╠══════════════════════════════════════════════════════════════════════════════╣
# ║  Le PATH indique où ZSH cherche les commandes.                              ║
# ║  Quand tu tapes "git", ZSH cherche dans chaque dossier du PATH.             ║
# ║                                                                              ║
# ║  ⚠️  MODIFIER SEULEMENT si tu installes un outil standalone (pas Homebrew)  ║
# ╚══════════════════════════════════════════════════════════════════════════════╝

# ┌─────────────────────────────────────────────────────────────────────────────┐
# │ HOMEBREW                                                                    │
# │ Ajoute /opt/homebrew/bin au PATH                                            │
# │ → Permet d'utiliser : brew, node, npm, pnpm, uv, bat, eza, fzf...          │
# └─────────────────────────────────────────────────────────────────────────────┘
[[ -x "$HOMEBREW_PREFIX/bin/brew" ]] && eval "$($HOMEBREW_PREFIX/bin/brew shellenv)"

# ┌─────────────────────────────────────────────────────────────────────────────┐
# │ PNPM                                                                        │
# │ Ajoute ~/Library/pnpm au PATH                                               │
# │ → Permet d'utiliser : pnpm i -g <package>                                  │
# └─────────────────────────────────────────────────────────────────────────────┘
export PNPM_HOME="$HOME/Library/pnpm"
[[ -d "$PNPM_HOME" ]] || mkdir -p "$PNPM_HOME"
path=("$PNPM_HOME" $path)

# ┌─────────────────────────────────────────────────────────────────────────────┐
# │ BUN                                                                         │
# │ Ajoute ~/.bun/bin au PATH                                                   │
# │ → Permet d'utiliser : bun, bunx                                            │
# └─────────────────────────────────────────────────────────────────────────────┘
[[ -d "$BUN_INSTALL/bin" ]] && path=("$BUN_INSTALL/bin" $path)

# ┌─────────────────────────────────────────────────────────────────────────────┐
# │ RUST / CARGO                                                                │
# │ Ajoute ~/.cargo/bin au PATH                                                 │
# │ → Permet d'utiliser : cargo, rustc, rustup                                 │
# └─────────────────────────────────────────────────────────────────────────────┘
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"