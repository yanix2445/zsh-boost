<h1 align="center">
  <img src="https://bashlogo.com/img/symbol/png/full_colored_light.png" alt="Zsh" height="60"/>
  <br/>
  ZSH Boost
  <br/>
  <sub>Configuration ZSH moderne pour développeurs macOS</sub>
</h1>

<p align="center">
  <a href="#-installation"><img src="https://img.shields.io/badge/Installation-1min-brightgreen?style=for-the-badge" alt="Installation 1min"/></a>
  <a href="https://github.com/yanix2445/zsh-boost"><img src="https://img.shields.io/badge/macOS-14+-000000?style=for-the-badge&logo=apple&logoColor=white" alt="macOS 14+"/></a>
  <a href="https://www.zsh.org/"><img src="https://img.shields.io/badge/ZSH-5.9+-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white" alt="ZSH 5.9+"/></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-Apache%202.0-blue?style=for-the-badge" alt="Apache 2.0"/></a>
</p>

<p align="center">
  <strong>⚡ Démarrage < 200ms</strong> · <strong>🎨 Icônes & Couleurs</strong> · <strong>🧩 100% Modulaire</strong>
</p>

---

## 📚 Table des Matières

<details open>
<summary><strong>Cliquez pour afficher/masquer</strong></summary>

- [✨ Fonctionnalités](#-fonctionnalités)
- [⚡ Installation](#-installation)
- [�️ Architecture](#️-architecture)
- [�️ Configuration](#️-configuration)
  - [Activer/Désactiver un module](#-activerdésactiver-un-module)
  - [Changer le thème](#-changer-le-thème)
  - [Ajouter des plugins](#-ajouter-des-plugins)
- [📋 Référence des Commandes](#-référence-des-commandes)
  - [Navigation](#-navigation)
  - [Recherche](#-recherche)
  - [Git](#-git)
  - [Docker](#-docker)
  - [Package Managers](#-package-managers)
  - [Utilitaires](#-utilitaires)
- [🛠️ Personnalisation](#️-personnalisation)
- [🚨 Dépannage](#-dépannage)
- [📜 Licence](#-licence)

</details>

---

## ✨ Fonctionnalités

<table>
<tr>
<td width="50%">

### 🚀 Performance
- [x] Démarrage **< 200ms**
- [x] Lazy-loading des modules
- [x] Cache de complétion optimisé

</td>
<td width="50%">

### 🎨 Expérience
- [x] Icônes Nerd Font partout
- [x] Coloration syntaxique
- [x] Autocomplétion intelligente (fzf)

</td>
</tr>
<tr>
<td>

### 🧩 Modularité
- [x] Activer/désactiver chaque module
- [x] Fichier de config unique
- [x] Espace perso `local/custom.zsh`

</td>
<td>

### 🔧 Outils Modernes
- [x] `eza` → ls avec icônes
- [x] `bat` → cat avec couleurs
- [x] `fd` → find ultra-rapide
- [x] `rg` → grep ultra-rapide
- [x] `fzf` → fuzzy finder
- [x] `zoxide` → cd intelligent

</td>
</tr>
</table>

---

## ⚡ Installation

### Installation rapide (recommandée)

```bash
git clone https://github.com/yanix2445/zsh-boost.git ~/.config/zsh-boost
cd ~/.config/zsh-boost && ./install.sh
```

> [!TIP]
> L'installateur est **interactif** et s'occupe de tout :
> 1. ✅ Installe Homebrew (si manquant)
> 2. ✅ Installe les outils CLI modernes
> 3. ✅ Installe la police FiraCode Nerd Font
> 4. ✅ Configure le symlink `~/.zshrc`
> 5. ✅ Lance un nouveau shell configuré

### Installation manuelle

<details>
<summary><strong>Afficher les étapes manuelles</strong></summary>

1. **Cloner le repo**
   ```bash
   git clone https://github.com/yanix2445/zsh-boost.git ~/.config/zsh-boost
   ```

2. **Installer les dépendances**
   ```bash
   brew install eza bat fd ripgrep fzf zoxide gum
   brew install --cask font-fira-code-nerd-font
   ```

3. **Créer le symlink**
   ```bash
   ln -sf ~/.config/zsh-boost/.zshrc ~/.zshrc
   ```

4. **Redémarrer le terminal**
   ```bash
   exec zsh
   ```

</details>

### Prérequis

| Requis | Version | Vérifier |
|:-------|:--------|:---------|
| macOS | 14+ (Sonoma) | `sw_vers` |
| Zsh | 5.9+ | `zsh --version` |
| Homebrew | Latest | `brew --version` |
| Git | 2.x+ | `git --version` |

---

## 🏗️ Architecture

```
zsh-boost/
│
├── 📄 .zshrc                 # Point d'entrée (NE PAS MODIFIER)
├── 📄 config.zsh             # 🎛️ CONFIGURATION (seul fichier à modifier)
│
├── 📁 core/                  # 🔒 Système (variables, PATH)
│
├── 📁 modules/
│   │
│   ├── 📁 core/
│   │   └── omz.zsh           # Oh My Zsh + plugins
│   │
│   ├── 📁 aliases/           # Raccourcis de commandes
│   │   ├── navigation.zsh    #   ls, ll, .., cls, rld
│   │   ├── search.zsh        #   grep, find, cat
│   │   ├── git.zsh           #   glog, gundo
│   │   ├── docker.zsh        #   d, dc, dps...
│   │   ├── npm.zsh           #   ni, nd, nb...
│   │   ├── pnpm.zsh          #   p, pi, pd...
│   │   ├── bun.zsh           #   b, bi, bd...
│   │   ├── rust.zsh          #   c, cb, cr...
│   │   └── nextjs.zsh        #   nxt, next-dev...
│   │
│   └── 📁 utils/             # Fonctions utilitaires
│       ├── mkcd.zsh          #   Créer + entrer dossier
│       ├── myip.zsh          #   Infos IP locale/publique
│       ├── backup.zsh        #   Backup horodaté
│       ├── trash.zsh         #   Corbeille sécurisée
│       ├── copy.zsh          #   Copier vers clipboard
│       ├── json.zsh          #   Formater JSON
│       ├── qr.zsh            #   Générer QR code
│       ├── gitignore.zsh     #   Générer .gitignore
│       ├── extract.zsh       #   Décompresser archives
│       ├── serve.zsh         #   Serveur HTTP local
│       ├── ports.zsh         #   Lister ports ouverts
│       ├── fkill.zsh         #   Tuer processus (fzf)
│       └── update.zsh        #   Mise à jour système
│
├── 📁 local/
│   └── custom.zsh            # 🔥 TON espace (ignoré par Git)
│
└── 📄 install.sh             # Installateur interactif
```

> [!IMPORTANT]
> **Règle d'or :** Ne modifie que `config.zsh` et `local/custom.zsh`.
> Tous les autres fichiers sont gérés automatiquement.

---

## 🎛️ Configuration

Le fichier `config.zsh` est le **centre de contrôle** de ZSH Boost.

### 🔘 Activer/Désactiver un module

Ouvre `config.zsh` et modifie le tableau `ZSH_MODULES` :

```zsh
typeset -a ZSH_MODULES
ZSH_MODULES=(
    # 🔒 CORE (ne pas désactiver)
    core/omz

    # 🔀 ALIASES
    aliases/navigation          # ✅ Actif
    aliases/search              # ✅ Actif
    # aliases/docker            # ❌ Désactivé (commenté avec #)
    
    # 🛠️ UTILS
    utils/myip                  # ✅ Actif
    # utils/fkill               # ❌ Désactivé
)
```

| Action | Comment faire |
|:-------|:--------------|
| ✅ Activer | Retirer le `#` devant la ligne |
| ❌ Désactiver | Ajouter `#` devant la ligne |
| 🔄 Appliquer | Taper `rld` ou `exec zsh` |

> [!TIP]
> **Optimisation :** Désactive les modules que tu n'utilises pas pour accélérer le démarrage.

### 🎨 Changer le thème

```zsh
# config.zsh
export ZSH_THEME="robbyrussell"    # Thème par défaut
# export ZSH_THEME="agnoster"      # Thème avec infos git
# export ZSH_THEME="powerlevel10k" # Thème ultra-personnalisable
```

📖 [Liste complète des thèmes](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes)

### 🧩 Ajouter des plugins

```zsh
# config.zsh
export ZSH_PLUGINS=(
    git                         # Alias git intégrés
    z                           # Navigation intelligente
    fzf                         # Intégration fuzzy finder
    zsh-autosuggestions         # Suggestions grisées
    zsh-syntax-highlighting     # Coloration des commandes
    fzf-tab                     # Tab-completion avec fzf
)
```

📖 [Liste complète des plugins](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins)

> [!NOTE]
> Les plugins externes (`zsh-autosuggestions`, `zsh-syntax-highlighting`, `fzf-tab`) 
> doivent être installés dans `~/.oh-my-zsh/custom/plugins/`.

---

## 📋 Référence des Commandes

### 🧭 Navigation

> Module : `aliases/navigation`

| Commande | Description | Exemple |
|:---------|:------------|:--------|
| `ls` | Liste avec icônes | `ls ~/Documents` |
| `ll` | Liste détaillée + git status | `ll` |
| `la` | Liste avec fichiers cachés | `la` |
| `lt` | Vue arborescence (2 niveaux) | `lt src/` |
| `..` | Remonter d'1 niveau | `..` |
| `...` | Remonter de 2 niveaux | `...` |
| `....` | Remonter de 3 niveaux | `....` |
| `cls` | Effacer le terminal | `cls` |
| `rld` | Recharger la config | `rld` |

### 🔍 Recherche

> Module : `aliases/search`

| Commande | Description | Exemple |
|:---------|:------------|:--------|
| `grep <pattern>` | Recherche dans fichiers (ripgrep) | `grep "TODO" src/` |
| `find <pattern>` | Recherche de fichiers (fd) | `find "*.js"` |
| `cat <fichier>` | Affiche avec coloration (bat) | `cat package.json` |
| <kbd>Ctrl</kbd>+<kbd>R</kbd> | Historique des commandes | — |
| <kbd>Ctrl</kbd>+<kbd>T</kbd> | Recherche de fichiers | — |
| <kbd>Tab</kbd> | Autocomplétion fuzzy (fzf-tab) | — |

### 🌿 Git

> Module : `aliases/git`

| Commande | Description | Équivalent |
|:---------|:------------|:-----------|
| `glog` | Log graphique coloré | `git log --graph --pretty=...` |
| `gundo` | Annuler dernier commit | `git reset --soft HEAD~1` |

> [!NOTE]
> Les alias git standard (`gst`, `ga`, `gc`, `gp`, `gd`...) viennent du plugin Oh My Zsh `git`.

### 🐳 Docker

> Module : `aliases/docker`

| Commande | Équivalent |
|:---------|:-----------|
| `d` | `docker` |
| `dps` | `docker ps` |
| `dpsa` | `docker ps -a` |
| `dim` | `docker images` |
| `drm` | `docker rm` |
| `drmi` | `docker rmi` |
| `dc` | `docker-compose` |
| `dcu` | `docker-compose up -d` |
| `dcd` | `docker-compose down` |
| `dcl` | `docker-compose logs -f` |
| `dcex` | `docker-compose exec` |

### 📦 Package Managers

| Action | npm | pnpm | bun | cargo |
|:-------|:----|:-----|:----|:------|
| **Commande** | `aliases/npm` | `aliases/pnpm` | `aliases/bun` | `aliases/rust` |
| run | — | `p` | `b` | `c` |
| install | `ni` | `pi` | `bi` | — |
| add | — | `pa` | `ba` | — |
| dev | `nd` | `pd` | `bd` | — |
| build | `nb` | `pb` | `bb` | `cb` |
| test | `nt` | `pt` | `bt` | `ct` |
| run script | — | `pr` | `br` | `cr` |
| check | — | — | — | `cc` |
| update | — | `pu` | — | `cu` |
| new project | — | — | — | `cn` |
| clean | `nclean`[^1] | `pstore`[^2] | — | — |

[^1]: `nclean` = `rm -rf node_modules package-lock.json && npm install`
[^2]: `pstore` = `pnpm store prune`

### 🛠️ Utilitaires

| Commande | Module | Description | Exemple |
|:---------|:-------|:------------|:--------|
| `mkcd <dir>` | `utils/mkcd` | Créer et entrer dans un dossier | `mkcd mon-projet` |
| `myip` | `utils/myip` | Afficher IP locale et publique | `myip` |
| `bak <fichier>` | `utils/backup` | Créer backup horodaté | `bak config.json` |
| `trash <fichier>` | `utils/trash` | Envoyer à la corbeille | `trash old-file.txt` |
| `copy <fichier>` | `utils/copy` | Copier contenu au clipboard | `copy ~/.ssh/id_ed25519.pub` |
| `json` | `utils/json` | Formater JSON | `echo '{"a":1}' \| json` |
| `qr "texte"` | `utils/qr` | Générer QR code ASCII | `qr "https://github.com"` |
| `gi <template>` | `utils/gitignore` | Générer .gitignore | `gi node,macos` |
| `extract <archive>` | `utils/extract` | Décompresser tout format | `extract fichier.tar.gz` |
| `serve [port]` | `utils/serve` | Serveur HTTP local | `serve 3000` |
| `ports` | `utils/ports` | Lister ports ouverts (interactif) | `ports` |
| `fkill [pattern]` | `utils/fkill` | Tuer processus (interactif) | `fkill node` |
| `up` | `utils/update` | Mise à jour complète du système | `up` |

---

## 🛠️ Personnalisation

### Ajouter un alias personnalisé

<details open>
<summary><strong>Méthode 1 : Fichier temporaire (recommandé pour tester)</strong></summary>

Édite `local/custom.zsh` (ignoré par Git) :

```zsh
# local/custom.zsh
alias monalias="ma-commande"
```

Recharge : `rld`

</details>

<details>
<summary><strong>Méthode 2 : Module permanent</strong></summary>

1. **Crée le fichier**
   ```bash
   touch modules/aliases/custom.zsh
   ```

2. **Écris tes alias**
   ```zsh
   # modules/aliases/custom.zsh
   alias monalias="ma-commande"
   ```

3. **Ajoute dans `config.zsh`**
   ```zsh
   ZSH_MODULES=(
       ...
       aliases/custom    # ← Ajoute cette ligne
   )
   ```

4. **Recharge** : `rld`

</details>

### Ajouter une fonction personnalisée

<details>
<summary><strong>Afficher les instructions</strong></summary>

1. **Crée le fichier**
   ```bash
   touch modules/utils/mafonction.zsh
   ```

2. **Écris ta fonction**
   ```zsh
   # modules/utils/mafonction.zsh
   mafonction() {
       local name="${1:-World}"
       echo "👋 Hello, $name!"
   }
   ```

3. **Ajoute dans `config.zsh`**
   ```zsh
   ZSH_MODULES=(
       ...
       utils/mafonction    # ← Ajoute cette ligne
   )
   ```

4. **Recharge** : `rld`

5. **Teste** : `mafonction "Yanis"`

</details>

### Stocker des secrets

> [!CAUTION]
> **Ne jamais commit de secrets !** Utilise `local/custom.zsh` qui est ignoré par Git.

```zsh
# local/custom.zsh

# Tokens API
export GITHUB_TOKEN="ghp_xxxxxxxxxxxx"
export OPENAI_API_KEY="sk-xxxxxxxxxxxx"

# Configuration perso
export EDITOR="code"
```

---

## 🚨 Dépannage

### Problèmes courants

| Symptôme | Cause probable | Solution |
|:---------|:---------------|:---------|
| Icônes cassées `□□□` | Police non installée | Installer **FiraCode Nerd Font** dans les préférences du terminal |
| Commande introuvable | Module désactivé | Vérifier `config.zsh` et taper `rld` |
| `⚠️ Module introuvable` | Chemin incorrect | Le chemin ne doit pas inclure `.zsh` |
| Terminal lent au démarrage | Trop de modules | Désactiver les modules inutilisés |
| Complétion ne marche pas | Cache corrompu | Supprimer `~/.zcompdump*` et relancer |

### Réinitialisation complète

<details>
<summary><strong>🔧 Afficher les étapes</strong></summary>

```bash
# 1. Supprimer le cache de complétion
rm -rf ~/.zcompdump*

# 2. Supprimer le cache Oh My Zsh
rm -rf ~/.oh-my-zsh/cache/*

# 3. Relancer l'installateur
cd ~/.config/zsh-boost && ./install.sh

# 4. Ouvrir un nouveau terminal
exec zsh
```

</details>

### Obtenir de l'aide

1. � Consulter ce README
2. 🔍 Chercher dans les [Issues](https://github.com/yanix2445/zsh-boost/issues)
3. 💬 Ouvrir une nouvelle Issue avec :
   - Version macOS (`sw_vers`)
   - Version Zsh (`zsh --version`)
   - Message d'erreur complet

---

## 📜 Licence

Ce projet est distribué sous la licence **[Apache 2.0](LICENSE)**.

<table>
<tr>
<td>

### ✅ Tu peux

- Utiliser librement
- Modifier le code
- Distribuer
- Utiliser commercialement
- Breveter tes modifications

</td>
<td>

### 📝 À condition de

- Conserver les notices de copyright
- Indiquer les modifications effectuées
- Inclure la licence Apache 2.0

</td>
</tr>
</table>

> [!NOTE]
> La licence Apache 2.0 inclut une **protection anti-brevet** : 
> si quelqu'un te poursuit pour violation de brevet sur ce code, 
> il perd automatiquement sa licence d'utilisation.

---

<div align="center">

### ⭐ Si ce projet t'a aidé, laisse une étoile !

[![Star](https://img.shields.io/github/stars/yanix2445/zsh-boost?style=social)](https://github.com/yanix2445/zsh-boost)

---

*Made with ❤️ by [@yanix2445](https://github.com/yanix2445)*

**🚀 ZSH Boost** — *Booste ton terminal !*

</div>
