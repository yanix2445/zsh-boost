<h1 align="center">
  <img src="https://bashlogo.com/img/symbol/png/full_colored_light.png" alt="Bash" height="50" align="center"/>
  ZSH Boost
</h1>

<p align="center">
  <strong>Configuration ZSH moderne et performante pour développeurs macOS</strong>
</p>

<p align="center">
  <a href="https://github.com/yanix2445/zsh-boost"><img src="https://img.shields.io/badge/macOS-14+-000000?style=for-the-badge&logo=apple&logoColor=white" alt="macOS 14+"/></a>
  <a href="https://www.zsh.org/"><img src="https://img.shields.io/badge/ZSH-5.9+-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white" alt="ZSH 5.9+"/></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-Apache%202.0-blue?style=for-the-badge" alt="Apache 2.0"/></a>
  <a href="https://github.com/yanix2445"><img src="https://img.shields.io/badge/by-@yanix2445-0ea5e9?style=for-the-badge&logo=github&logoColor=white" alt="by @yanix2445"/></a>
</p>

<br/>

---

## 📚 Table des Matières

- [⚡ Installation](#-installation)
- [🎯 C'est quoi ce projet ?](#-cest-quoi-ce-projet-)
- [🏗️ Structure du Projet](#️-structure-du-projet)
- [🎛️ Configuration des Modules](#️-configuration-des-modules)
- [📋 Commandes Disponibles](#-commandes-disponibles)
- [🛠️ Personnalisation](#️-personnalisation)
- [🚨 Problèmes Fréquents](#-problèmes-fréquents)

---

## ⚡ Installation

```bash
git clone https://github.com/yanix2445/zsh-boost.git
cd zsh-boost && ./install.sh
```

> [!TIP]
> **C'est tout !** L'installateur s'occupe de TOUT :
> - Installe Homebrew si manquant
> - Installe les outils CLI modernes (eza, bat, fd, ripgrep, fzf, zoxide, gum)
> - Installe la police Nerd Font
> - Configure le symlink `.zshrc`
> - Ouvre un nouveau terminal et c'est prêt 🎉

---

## 🎯 C'est quoi ce projet ?

**ZSH Boost** transforme ton terminal macOS en machine de guerre :

| Avant | Après |
|:------|:------|
| Terminal lent 🐌 | **< 200ms** au démarrage ⚡ |
| Commandes à rallonge | Aliases courts et intuitifs |
| `ls` noir et blanc | Icônes, couleurs, git status |
| Config bordélique | Architecture modulaire propre |

**Ce projet te donne :**
- ✅ Une config ZSH prête à l'emploi
- ✅ Des outils modernes préconfigurés
- ✅ Une architecture scalable pour tes ajouts
- ✅ Un système de modules activables/désactivables

---

## 🏗️ Structure du Projet

```
zsh-boost/
├── .zshrc              # Point d'entrée (charge tout)
├── config.zsh          # 🎛️ TON fichier de config (modules, thème, plugins)
│
├── core/               # 🔒 Système (ne pas modifier)
│
├── modules/
│   ├── core/           # 🔒 Oh My Zsh
│   │   └── omz.zsh
│   │
│   ├── aliases/        # ✅ Raccourcis de commandes
│   │   ├── navigation.zsh   # ls, ll, .., cls, rld
│   │   ├── search.zsh       # grep, find, cat
│   │   ├── git.zsh          # glog, gundo
│   │   ├── docker.zsh       # d, dps, dc...
│   │   ├── npm.zsh          # ni, nd, nb...
│   │   ├── pnpm.zsh         # p, pi, pa...
│   │   ├── bun.zsh          # b, bi, ba...
│   │   ├── rust.zsh         # c, cb, cr...
│   │   └── nextjs.zsh       # nxt, next-dev...
│   │
│   └── utils/          # ✅ Fonctions utilitaires
│       ├── mkcd.zsh         # Créer + entrer dossier
│       ├── myip.zsh         # Infos IP
│       ├── backup.zsh       # Backup horodaté
│       ├── trash.zsh        # Corbeille sécurisée
│       ├── copy.zsh         # Copier au clipboard
│       ├── json.zsh         # Formater JSON
│       ├── qr.zsh           # Générer QR code
│       ├── gitignore.zsh    # Générer .gitignore
│       ├── extract.zsh      # Décompresser archives
│       ├── serve.zsh        # Serveur HTTP local
│       ├── ports.zsh        # Lister ports ouverts
│       ├── fkill.zsh        # Tuer processus (fzf)
│       └── update.zsh       # Mise à jour système
│
├── local/
│   └── custom.zsh      # 🔥 TON espace perso (ignoré par Git)
│
└── install.sh          # Installateur interactif
```

---

## 🎛️ Configuration des Modules

### Le fichier `config.zsh`

C'est le **seul fichier que tu dois modifier** pour contrôler ta configuration.

```zsh
# config.zsh

typeset -a ZSH_MODULES
ZSH_MODULES=(
    core/omz                    # 🔒 Oh My Zsh (toujours actif)

    # ALIASES
    aliases/navigation          # ls, ll, lt, .., cls, rld
    aliases/search              # grep, find, cat
    aliases/git                 # glog, gundo
    aliases/docker              # d, dps, dc...
    # aliases/npm               # ← DÉSACTIVÉ (commenté)
    aliases/pnpm                # p, pi, pa...
    
    # UTILS
    utils/myip                  # myip
    utils/backup                # bak
    # utils/fkill               # ← DÉSACTIVÉ (commenté)
)
```

### Activer / Désactiver un module

| Action | Comment faire |
|--------|---------------|
| **Désactiver** | Ajoute `#` devant la ligne |
| **Activer** | Retire le `#` devant la ligne |
| **Appliquer** | Tape `rld` ou `exec zsh` |

> [!TIP]
> Tu peux désactiver les modules dont tu n'as pas besoin pour accélérer le démarrage du terminal.

---

## 📋 Commandes Disponibles

### Navigation (aliases/navigation)

| Commande | Action |
|:---------|:-------|
| `ls` | Liste avec icônes (eza) |
| `ll` | Liste détaillée + git status |
| `la` | Liste avec fichiers cachés |
| `lt` | Vue en arbre (2 niveaux) |
| `..` / `...` / `....` | Remonter 1/2/3 niveaux |
| `cls` | Effacer le terminal |
| `rld` | Recharger la configuration |

### Recherche (aliases/search)

| Commande | Action |
|:---------|:-------|
| `grep <pattern>` | Recherche ultra-rapide (ripgrep) |
| `find <pattern>` | Recherche de fichiers (fd) |
| `cat <fichier>` | Affiche avec coloration (bat) |
| <kbd>Ctrl</kbd>+<kbd>R</kbd> | Historique des commandes (fzf) |
| <kbd>Ctrl</kbd>+<kbd>T</kbd> | Recherche de fichiers (fzf) |

### Git (aliases/git)

| Commande | Action |
|:---------|:-------|
| `glog` | Log git graphique coloré |
| `gundo` | Annuler le dernier commit (soft) |

### Docker (aliases/docker)

| Commande | Action |
|:---------|:-------|
| `d` | docker |
| `dps` | docker ps |
| `dpsa` | docker ps -a |
| `dim` | docker images |
| `dc` | docker-compose |
| `dcu` | docker-compose up -d |
| `dcd` | docker-compose down |
| `dcl` | docker-compose logs -f |

### Package Managers

| Alias | NPM | PNPM | Bun |
|:------|:----|:-----|:----|
| install | `ni` | `pi` | `bi` |
| add | — | `pa` | `ba` |
| dev | `nd` | `pd` | `bd` |
| build | `nb` | `pb` | `bb` |
| test | `nt` | `pt` | `bt` |
| run | — | `pr` | `br` |

### Rust (aliases/rust)

| Commande | Action |
|:---------|:-------|
| `c` | cargo |
| `cb` | cargo build |
| `cr` | cargo run |
| `ct` | cargo test |
| `cc` | cargo check |

### Utilitaires

| Commande | Action |
|:---------|:-------|
| `mkcd <dir>` | Créer et entrer dans un dossier |
| `myip` | Afficher IP locale et publique |
| `bak <fichier>` | Créer un backup horodaté |
| `trash <fichier>` | Envoyer à la corbeille (sécurisé) |
| `copy <fichier>` | Copier le contenu au clipboard |
| `json` | Formater du JSON (pipe ou fichier) |
| `qr "texte"` | Générer un QR code ASCII |
| `gi <template>` | Générer un .gitignore |
| `extract <archive>` | Décompresser tout format |
| `serve [port]` | Lancer un serveur HTTP local |
| `ports` | Lister les ports ouverts (interactif) |
| `fkill [pattern]` | Tuer un processus (interactif) |
| `up` | Mise à jour globale du système |

---

## 🛠️ Personnalisation

### Ajouter un alias

1. **Crée** un fichier dans `modules/aliases/`
   ```bash
   touch modules/aliases/monalias.zsh
   ```

2. **Écris** tes aliases
   ```zsh
   # modules/aliases/monalias.zsh
   alias ma="mon-alias"
   ```

3. **Ajoute** le module dans `config.zsh`
   ```zsh
   ZSH_MODULES=(
       ...
       aliases/monalias    # ← Ajoute cette ligne
   )
   ```

4. **Recharge** avec `rld`

---

### Ajouter une fonction

1. **Crée** un fichier dans `modules/utils/`
   ```bash
   touch modules/utils/mafonction.zsh
   ```

2. **Écris** ta fonction
   ```zsh
   # modules/utils/mafonction.zsh
   mafonction() {
       echo "👋 Hello, $1!"
   }
   ```

3. **Ajoute** le module dans `config.zsh`
   ```zsh
   ZSH_MODULES=(
       ...
       utils/mafonction    # ← Ajoute cette ligne
   )
   ```

4. **Recharge** avec `rld`

---

### Tester sans risque

> [!TIP]
> **Utilise `local/custom.zsh` pour tester avant de créer un module officiel.**

```zsh
# local/custom.zsh (ignoré par Git)

# Test d'un alias
alias test_alias="echo 'ça marche!'"

# Test d'une fonction
test_func() {
    echo "Ma super fonction"
}

# Variables secrètes
export GITHUB_TOKEN="ghp_xxxx"
export OPENAI_API_KEY="sk-xxxx"
```

---

## 🚨 Problèmes Fréquents

| Problème | Solution |
|:---------|:---------|
| Icônes cassées `□□□` | Configure **FiraCode Nerd Font** dans ton terminal |
| Commande pas reconnue | Tape `rld` pour recharger |
| Terminal lent | Désactive les modules inutilisés dans `config.zsh` |
| Module introuvable | Vérifie le chemin dans `config.zsh` (sans `.zsh`) |

<details>
<summary><strong>🔧 Réinitialisation Complète</strong></summary>

```bash
# Supprime le cache
rm -rf ~/.zcompdump*

# Relance l'installateur
./install.sh

# Ouvre un nouveau terminal
```

</details>

---

## 📄 Prérequis

| Requis | Version |
|:-------|:--------|
| macOS | 14+ (Sonoma) |
| Zsh | 5.9+ |
| Homebrew | Latest |
| Git | 2.x |

---

## 📜 Licence

Ce projet est sous licence [Apache 2.0](LICENSE).

Tu peux librement :
- ✅ Utiliser, modifier et distribuer
- ✅ Utiliser commercialement
- ✅ Breveter tes modifications

À condition de :
- 📝 Conserver les notices de copyright
- 📝 Indiquer les modifications effectuées

---

<div align="center">

*Made with ❤️ by [@yanix2445](https://github.com/yanix2445)*

🚀 **ZSH Boost** — Booste ton terminal !

</div>
