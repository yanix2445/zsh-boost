<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=16a085&height=200&section=header&text=ZSH%20BOOST&fontSize=80&fontColor=ffffff&fontAlignY=40&animation=fadeIn" width="100%"/>

[![macOS](https://img.shields.io/badge/OS-macOS%20Tahoe-000000?style=for-the-badge&logo=apple&logoColor=white)](https://github.com/yanix2445/zsh-boost)
[![License](https://img.shields.io/badge/License-Apache%202.0-27ae60?style=for-the-badge)](LICENSE)
[![Author](https://img.shields.io/badge/Author-@yanix2445-16a085?style=for-the-badge&logo=github&logoColor=white)](https://github.com/yanis)

</div>

<br/>

<div align="center">

| | Section | Description |
|:---:|:---|:---|
| ⚡ | [**Installation**](#-installation) | Prêt en 1 minute |
| 🏗️ | [**Architecture**](#-architecture) | Structure du projet |
| 🎛️ | [**Configuration**](#-configuration) | Activer/désactiver les modules |
| 🛠️ | [**Personnalisation**](#-personnalisation) | Créer tes propres outils |
| 🚨 | [**Dépannage**](#-dépannage) | Résoudre les problèmes |
| 📜 | [**Licence**](#-licence) | Apache 2.0 |

</div>

<br/>

---

<br/>

## ⚡ Installation

<table>
<tr>
<td>

```zsh
git clone https://github.com/yanix2445/zsh-boost.git
cd zsh-boost && ./install.sh
```

</td>
<td width="50%">

**L'installateur configure tout :**

- ✅ Homebrew (si manquant)
- ✅ Outils CLI modernes
- ✅ Police Nerd Font
- ✅ Symlink `.zshrc`

</td>
</tr>
</table>

<br/>

## 🏗️ Architecture

<div align="center">

```mermaid
flowchart LR
    %% Nodes
    Main((".zshrc"))
    Config("config.zsh")
    Modules{"Modules"}
    Local("local/custom.zsh")
    
    Aliases["aliases/"]
    Utils["utils/"]

    %% Flow
    Main --> Config
    Config --> Modules
    Main --> Local
    
    Modules --> Aliases
    Modules --> Utils

    %% Styles
    style Main fill:#16a085,stroke:#fff,color:#fff,stroke-width:2px
    style Config fill:#3498db,stroke:#fff,color:#fff,stroke-width:2px
    style Local fill:#f39c12,stroke:#fff,color:#fff,stroke-width:2px
    style Modules fill:#2c3e50,stroke:#fff,color:#fff,stroke-width:2px
    
    style Aliases fill:#95a5a6,stroke:#fff,color:#fff,stroke-width:1px
    style Utils fill:#95a5a6,stroke:#fff,color:#fff,stroke-width:1px

    linkStyle default stroke:#bdc3c7,stroke-width:2px
```

</div>

<br/>

<div align="center">

| Fichier | Accès | Rôle |
|:--------|:-----:|:-----|
| `.zshrc` | ⛔ | Point d'entrée — **ne pas modifier** |
| `config.zsh` | 🎛️ | **Ta configuration** — modules, thème, plugins |
| `modules/` | ✏️ | Aliases et utils activables |
| `local/custom.zsh` | 🔥 | **Ton espace** — ignoré par Git |

</div>

<br/>

---

<br/>

## 🎛️ Configuration

Modifie `config.zsh` pour activer ou désactiver les modules :

```zsh
ZSH_MODULES=(
    core/omz              # 🔒 Oh My Zsh
    aliases/navigation    # ✅ Actif
    # aliases/docker      # ❌ Désactivé
    utils/myip            # ✅ Actif
)
```

<br/>

### 🔥 Top Features

<div align="center">

<table>
<tr>
<td>

### 🛠️ Utils

| Commande | Description |
|:---------|:------------|
| `myip` | IP locale/publique |
| `mkcd` | Créer + entrer dossier |
| `bak` | Backup horodaté |
| `trash` | Corbeille sécurisée |
| `ports` | Ports ouverts |
| `up` | Mise à jour système |

</td>
<td>

### 🔀 Aliases

| Commande | Description |
|:---------|:------------|
| `ll` | Liste avec icônes |
| `grep` | Recherche (ripgrep) |
| `cat` | Affichage coloré |
| `rld` | Recharger la config |
| `..` | Remonter d'un niveau |
| `cls` | Effacer le terminal |

</td>
</tr>
</table>

</div>

<br/>

---

<br/>

## 🛠️ Personnalisation

<div align="center">

<i>Choisis ton approche pour étendre ZSH Boost</i>

<br/>

```mermaid
flowchart TD
    %% Nodes
    New(("💡 Nouvelle Idée"))
    Labo(["🧪 Labo (Privé)"])
    Module(["🧱 Module (Public)"])

    %% Styles
    style New fill:#2c3e50,stroke:#fff,color:#fff,stroke-width:2px
    style Labo fill:#f39c12,stroke:#fff,color:#fff,stroke-width:2px
    style Module fill:#16a085,stroke:#fff,color:#fff,stroke-width:2px

    %% Paths
    New -.->| Test rapide | Labo
    New ==>| Feature solide | Module
    
    %% Semantic Link Styles
    linkStyle 0 stroke:#f39c12,stroke-width:2px,stroke-dasharray: 5 5
    linkStyle 1 stroke:#16a085,stroke-width:3px
```

<br/>

<table>
<tr>
<td width="50%" valign="top">

### 🧪 Le Labo
**Pour tes secrets & tests**

Tout ce que tu mets dans `local/custom.zsh` reste sur ta machine (GitIgnored).

<br/>

> **Parfait pour :**
> - 🔑 Tokens & Clés API
> - 🗑️ Alias jetables
> - 🚧 Tests en vrac

</td>
<td width="50%" valign="top">

### 🧱 L'Atelier
**Pour tes outils durables**

Crée un module propre dans `modules/` et active-le dans `config.zsh`.

<br/>

> **Workflow :**
> 1. 📝 Créer `modules/aliases/mon-outil.zsh`
> 2. 🔌 Ajouter `aliases/mon-outil` dans `config.zsh`
> 3. ♻️ Lancer `rld`

</td>
</tr>
</table>

</div>

<br/>

---

<br/>

## 🚨 Dépannage

| Problème | Solution |
|:---------|:---------|
| Icônes `□□□` | Installer **FiraCode Nerd Font** |
| Commande introuvable | Vérifier `config.zsh` puis `rld` |
| Terminal lent | Désactiver les modules inutilisés |

<br/>

<details>
<summary><strong>🔧 Réinitialisation</strong></summary>

```bash
rm -rf ~/.zcompdump* && exec zsh
```

</details>

<br/>

---

<br/>

<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=16a085&height=100&section=footer" width="100%"/>

**Made with 💚 by [@yanix2445](https://github.com/yanix2445)**

</div>
