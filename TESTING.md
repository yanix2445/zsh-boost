# 🧪 Guide de Test Complet - Zsh Boost

Ce guide recense toutes les commandes à exécuter pour valider le bon fonctionnement de votre configuration Zsh. Cochez les cases mentalement à chaque succès !

## 🟢 1. Core & Maintenance

| Commande | Action attendue | Résultat Test |
|----------|-----------------|---------------|
| `rld` | Recharge la configuration Zsh instantanément. **Aucune erreur** ne doit s'afficher. | [ ] OK |
| `up` | Lance le script de mise à jour global (Homebrew, OMZ, Node, System...). | [ ] OK |
| `cls` | Vide l'écran du terminal (alias de `clear`). | [ ] OK |

## 🧭 2. Navigation Avancée

| Commande | Action attendue | Résultat Test |
|----------|-----------------|---------------|
| `ls` | Liste les fichiers avec des icônes (si `eza` installé). | [ ] OK |
| `ll` | Liste détaillée (permissions, taille, git status). | [ ] OK |
| `lt` | Affiche l'arborescence (tree view). | [ ] OK |
| `..` | Remonte d'un dossier parent. | [ ] OK |
| `...` | Remonte de 2 dossiers parents. | [ ] OK |
| `z <nom>` | Change de dossier intelligemment (ex: `z down` -> `~/Downloads`). | [ ] OK |
| `mkcd <dossier>` | Crée le dossier ET rentre dedans directement. | [ ] OK |

## 🔍 3. Recherche & Visualisation

| Commande | Action attendue | Résultat Test |
|----------|-----------------|---------------|
| `find <nom>` | Cherche un fichier ultra-rapidement (alias `fd`). | [ ] OK |
| `grep <texte>` | Cherche du texte dans les fichiers (alias `rg`). | [ ] OK |
| `cat <fichier>` | Affiche le contenu avec coloration syntaxique (alias `bat`). | [ ] OK |
| `Ctrl+R` | (Raccourci) Ouvre la recherche historique floue (fzf). | [ ] OK |
| `Ctrl+T` | (Raccourci) Navigue et sélectionne un fichier (fzf). | [ ] OK |

## 🛠 4. Utilitaires Système

| Commande | Action attendue | Résultat Test |
|----------|-----------------|---------------|
| `myip` | Affiche votre IP locale, IP publique et statut réseau. | [ ] OK |
| `ports` | Affiche les ports ouverts et permet d'en tuer un ("kill"). | [ ] OK |
| `fkill` | Liste les processus et permet d'en tuer un interactivement. | [ ] OK |
| `copy <fichier>` | Copie le contenu du fichier dans le presse-papier macOS. | [ ] OK |
| `trash <fichier>` | Déplace un fichier vers la corbeille (plus sûr que `rm`). | [ ] OK |
| `bak <fichier>` | Crée une copie de sauvegarde (ex: `file.txt` -> `file.txt.bak-2024...`). | [ ] OK |
| `extract <archive>`| Décompresse intelligemment n'importe quel format (zip, tar, gz...). | [ ] OK |

## 🌐 5. Web & Data

| Commande | Action attendue | Résultat Test |
|----------|-----------------|---------------|
| `serve` | Lance un serveur web statique dans le dossier courant (port 8000). | [ ] OK |
| `qr <texte>` | Génère un QR Code dans le terminal (pour WiFi, URL...). | [ ] OK |
| `json` | Formate et colore du JSON (ex: `echo '{"a":1}' | json`). | [ ] OK |
| `gi <technos>` | Génère un .gitignore (ex: `gi node,python,macos`). | [ ] OK |

## 💻 6. Dev Stack (Alias Rapides)

| Commande | Signification |
|----------|---------------|
| **Git** | `g` (git), `gst` (status), `gl` (pull), `gp` (push), `glog` (graph) |
| **Docker**| `d` (docker), `dc` (compose), `dps` (ps), `dstop` (stop all) |
| **Node** | `n` (npm), `ni` (install), `ns` (start), `nrun` (run) |
| **Bun** | `b` (bun), `bi` (install), `bd` (dev), `br` (run) |
| **Rust** | `c` (cargo), `cb` (build), `cr` (run), `ct` (test) |

## ✅ Protocole de Validation

1.  Lancez `rld`. Si ça marche, le Core est bon.
2.  Testez `myip` et `ls`. Si ça marche, les Utils et Alias sont chargés.
3.  Essayez `bak README.md` puis `ls`. Vous devriez voir `README.md.bak...`.
4.  Testez `trash README.md.bak...`. Il doit disparaître (dans la corbeille).
5.  Tapez `gi list` pour voir si l'API gitignore fonctionne.

---
*Si une commande échoue, vérifiez qu'elle est bien installée (`brew list`).*
