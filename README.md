<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=16a085&height=250&section=header&text=ZSH%20BOOST&fontSize=80&animation=fadeIn&fontAlignY=35&reClue=true&logo=gnubash&logoColor=white&logoSize=60" width="100%"/>

<br/>



[![macOS](https://img.shields.io/badge/OS-macOS%20Tahoe-000000?style=for-the-badge&logo=apple&logoColor=white)](https://github.com/yanix2445/zsh-boost)
[![License](https://img.shields.io/badge/License-Apache%202.0-27ae60?style=for-the-badge&logo=apache-software-foundation&logoColor=white)](LICENSE)
[![Creator](https://img.shields.io/badge/Author-@yanix2445-16a085?style=for-the-badge&logo=github&logoColor=white)](https://github.com/yanis)

<br/>

### 🚀 L'expérience ultime du terminal macOS

</div>

---

## 📚 Table des Matières
- [⚡ Installation](#-installation)
- [🏗️ Architecture](#️-architecture)
- [🎛️ Configuration](#️-configuration)
- [🛠️ Personnalisation](#️-personnalisation)
- [🚨 Dépannage](#-dépannage)
- [📜 Licence](#-licence)

---

## ⚡ Installation

Une seule commande pour transformer votre terminal :

```zsh
git clone https://github.com/yanix2445/zsh-boost.git && cd zsh-boost && ./install.sh
```

> [!TIP]
> **Zsh Boost** installe automatiquement vos dépendances via Homebrew (eza, bat, fd, rg, fzf, zoxide) et configure la police Nerd Font pour un affichage optimal.

---

## 🏗️ Architecture Smart

Le projet est conçu pour être à la fois **robuste** (core protégé) et **flexible** (modules interchangeables).

```mermaid
graph TD
    A[".zshrc"] --> B{"Config Loader"}
    B --> C["Core (Read Only)"]
    B --> D["Modules (Auto-load)"]
    B --> E["Local (Custom)"]
    
    subgraph "Modules Layer"
    D --> D1["Aliases"]
    D --> D2["Utils"]
    end
    
    style A fill:#0ea5e9,stroke:#fff,stroke-width:2px,color:#fff
    style C fill:#64748b,stroke:#fff,color:#fff
    style E fill:#f59e0b,stroke:#fff,color:#fff
```

---

## 🎛️ Configuration Granulaire

Le fichier `config.zsh` est votre centre de contrôle. Activez ou désactivez les fonctionnalités en une seule ligne.

### 🔥 Le Top 10 des Features (Confondu)

| Type | Commande | Description |
| :--- | :--- | :--- |
| 🐚 | `ll` | Liste enrichie (eza) avec icônes et git status |
| 🔍 | `grep` | Recherche ultra-rapide via Ripgrep |
| 📦 | `up` | Mise à jour globale (System, Brew, OMZ) |
| 🌐 | `myip` | Affiche instantanément vos IPs (Local/Public) |
| 📁 | `mkcd` | Crée un dossier et s'y déplace immédiatement |
| 🧹 | `trash` | Suppression sécurisée vers la corbeille macOS |
| 📄 | `cat` | Lecture avec coloration syntaxique (bat) |
| 🛠️ | `ports` | Visualisation interactive des ports occupés |
| 💾 | `bak` | Création de backup horodaté en un clic |
| 🔄 | `rld` | Rechargement à chaud de votre configuration |

---

## 🛠️ Personnalisation

Le système respecte votre flux de travail :

1.  **Tests Rapides** : Utilisez `local/custom.zsh` pour vos expérimentations (ignoré par Git).
2.  **Modules Dédiés** : Ajoutez vos fichiers `.zsh` dans `modules/aliases/` ou `modules/utils/`.
3.  **Activation** : Déclarez-les simplement dans le tableau `ZSH_MODULES` de votre `config.zsh`.

> [!IMPORTANT]
> Ne modifiez jamais le dossier `core/` pour garantir la compatibilité avec les futures mises à jour du moteur.

---

## 🚨 Dépannage

| Symptôme | Solution |
| :--- | :--- |
| **Icônes manquantes** | Assurez-vous d'utiliser une **Nerd Font** (FiraCode recommandée). |
| **Commandes non trouvées** | Vérifiez que le module est bien décommenté dans `config.zsh`. |
| **Lenteur** | Lancez `up` pour optimiser les caches de complétion. |

---

## 📜 Licence

Distribué sous la licence **Apache 2.0**. Voir le fichier [LICENSE](LICENSE) pour plus de détails.

<div align="center">

**[ZSH Boost](https://github.com/yanix2445/zsh-boost) — Propulsé par la passion du code.**

</div>
