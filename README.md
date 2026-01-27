<h1 align="center">
  <img src="https://bashlogo.com/img/symbol/png/full_colored_light.png" alt="Bash" height="50" align="center"/>
  ZSH Boost
</h1>

<p align="center">
  <strong>Configuration ZSH moderne et performante pour développeurs macOS</strong>
</p>

<p align="center">
  <a href="https://github.com/yanix2445/zsh-boost"><img src="https://img.shields.io/badge/macOS-Tahoe-000000?style=for-the-badge&logo=apple&logoColor=white" alt="macOS Tahoe"/></a>
  <a href="https://www.zsh.org/"><img src="https://img.shields.io/badge/ZSH-5.9+-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white" alt="ZSH 5.9+"/></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-Non--Commercial-red?style=for-the-badge" alt="License"/></a>
  <a href="https://github.com/yanix2445"><img src="https://img.shields.io/badge/by-@yanix2445-0ea5e9?style=for-the-badge&logo=github&logoColor=white" alt="by @yanix2445"/></a>
</p>

<br/>

---

## 📚 Table des Matières

- [⚡ Installation](#-installation)
- [🎯 C'est quoi ce projet ?](#-cest-quoi-ce-projet-)
- [🏗️ Structure du Projet](#️-structure-du-projet)
- [🚦 Niveaux d'Accès](#-niveaux-daccès)
- [🛠️ Comment Personnaliser](#️-comment-personnaliser)
- [📋 Commandes Disponibles](#-commandes-disponibles)
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
> - Installe les outils CLI modernes
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
- ✅ Un installateur interactif

---

## 🏗️ Structure du Projet

```
zsh-boost/
├── .zshrc              # Point d'entrée (charge tout)
├── config.zsh          # 🎛️ TON fichier de config
│
├── core/               # 🔒 Système (env, path, options)
│
├── modules/
│   ├── core/           # 🔒 Plugins Oh My Zsh
│   │   └── omz.zsh
│   │
│   ├── aliases/        # ✅ Tes aliases
│   │   ├── _loader.zsh
│   │   ├── navigation.zsh
│   │   ├── search.zsh
│   │   └── (tes futurs aliases...)
│   │
│   └── utils/          # ✅ Tes fonctions
│       ├── _loader.zsh
│       ├── fkill.zsh
│       ├── ports.zsh
│       ├── myip.zsh
│       └── (tes futures fonctions...)
│
├── local/
│   └── custom.zsh      # 🔥 TON bac à sable (ignoré par Git)
│
└── install.sh          # Installateur interactif
```

---

## 🚦 Niveaux d'Accès

### ⛔ JAMAIS TOUCHER

> [!CAUTION]
> **Ces fichiers sont le MOTEUR du système. Les modifier = tout casser.**

| Fichier | Rôle |
|:--------|:-----|
| `.zshrc` | Point d'entrée, charge tout |
| `core/` | Variables système, PATH, options ZSH |
| `modules/core/omz.zsh` | Configuration Oh My Zsh |
| `modules/*/_loader.zsh` | Auto-chargeurs des modules |

---

### 🟡 RAREMENT (avec précaution)

> [!WARNING]
> **Modifie ces fichiers seulement si tu sais ce que tu fais.**

| Fichier | Quand modifier |
|:--------|:---------------|
| `config.zsh` | Changer le thème, activer/désactiver des modules |
| `install.sh` | Ajouter des dépendances à installer |

---

### 🟢 DE TEMPS EN TEMPS

> [!NOTE]
> **Ces fichiers sont faits pour être modifiés. C'est là que tu personnalises.**

| Fichier | Usage |
|:--------|:------|
| `modules/aliases/*.zsh` | Ajouter/modifier des aliases |
| `modules/utils/*.zsh` | Ajouter/modifier des fonctions |

---

### 🔥 TOUT LE TEMPS

> [!TIP]
> **C'est TON espace. Fais ce que tu veux ici !**

| Fichier | Usage |
|:--------|:------|
| `local/custom.zsh` | Tests, tokens secrets, alias temporaires |

**Ce fichier est ignoré par Git.** Tu peux y mettre :
- Tes clés API (`GITHUB_TOKEN`, `OPENAI_API_KEY`)
- Tes alias expérimentaux
- Tes fonctions en cours de dev

---

## 🛠️ Comment Personnaliser

### Ajouter un alias

1. **Crée** un fichier dans `modules/aliases/`
   ```bash
   touch modules/aliases/docker.zsh
   ```

2. **Écris** tes aliases
   ```zsh
   # modules/aliases/docker.zsh
   alias dc="docker-compose"
   alias dps="docker ps"
   ```

3. **C'est chargé automatiquement !** Tape `rld` pour recharger.

---

### Ajouter une fonction

1. **Crée** un fichier dans `modules/utils/`
   ```bash
   touch modules/utils/hello.zsh
   ```

2. **Écris** ta fonction
   ```zsh
   # modules/utils/hello.zsh
   hello() {
       echo "👋 Hello, $1!"
   }
   ```

3. **C'est chargé automatiquement !** Tape `rld` pour recharger.

---

### Tester sans risque

> [!TIP]
> **Utilise `local/custom.zsh` pour tester avant de créer un fichier officiel.**

```zsh
# local/custom.zsh

# Test d'un alias
alias test_alias="echo 'ça marche!'"

# Test d'une fonction
test_func() {
    echo "Ma super fonction"
}
```

Si ça marche → Crée un fichier dans `aliases/` ou `utils/`.
Si ça casse → Supprime et tape `rld`.

---

## 📋 Commandes Disponibles

### Navigation

| Commande | Action |
|:---------|:-------|
| `cd <dossier>` | Navigation intelligente (fuzzy match) |
| `ll` | Liste détaillée avec icônes |
| `la` | Liste avec fichiers cachés |
| `lt` | Vue en arbre |
| `..` / `...` / `....` | Remonter 1/2/3 niveaux |

### Recherche

| Commande | Action |
|:---------|:-------|
| <kbd>Ctrl</kbd>+<kbd>R</kbd> | Historique des commandes |
| <kbd>Ctrl</kbd>+<kbd>T</kbd> | Recherche de fichiers |
| `grep <pattern>` | Recherche de texte |
| `find <pattern>` | Recherche de fichiers |
| `cat <fichier>` | Affiche avec coloration |

### Utilitaires

| Commande | Action |
|:---------|:-------|
| `fkill` | Tueur de processus interactif |
| `ports` | Gestionnaire de ports |
| `myip` | Infos IP locale/publique |
| `fkill` | Tuer un processus (menu) |
| `ports` | Voir/Tuer ports ouverts |
| `extract` | Dézipper n'importe quoi |
| `mkcd` | Créer + entrer dossier |
| `up` | Mise à jour globale |
| `serve` | Serveur Web instantané |
| `gi` | Générateur .gitignore |
| `bak` | Backup rapide (.bak) |
| `trash` | Suppression safe (corbeille) |
| `qr` | Générateur QR Code |
| `json` | Formateur JSON coloré |
| `copy` | Copie fichier vers clipboard |
| `rld` | Recharge la configuration |

---

## 🚨 Problèmes Fréquents

| Problème | Solution |
|:---------|:---------|
| Icônes cassées `□□□` | Configure **FiraCode Nerd Font** dans ton terminal |
| `rld` introuvable | Lance `./install.sh` → "Configurer Symlink" |
| Terminal lent | Vérifie que Starship est installé |
| Commande pas reconnue | Tape `rld` pour recharger |

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
| macOS | 26+ (Tahoe) |
| Zsh | Latest |
| Homebrew | Latest |
| Git | 2.x |

---

<div align="center">

*Made with ❤️ by [@yanix2445](https://github.com/yanix2445)*

</div>

---
*Configuration propulsée par Zsh Boost 🚀*
