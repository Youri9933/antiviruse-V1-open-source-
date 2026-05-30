# Antivirus Maison 🏠🛡️

**Un antivirus open source éducatif en C et Python**

## 🎯 Objectifs

- **Scanner de fichiers** : détection par hash + signatures
- **Pare-feu** : interception réseau (Windows)
- **App Manager** : gestion et suppression propre d'applications
- **Architecture modulaire** : facile à étendre et comprendre

## 🏗️ Architecture

```
Orchestrateur Python (chef d'orchestre)
    ↓
┌───────────┬──────────────┬──────────────┐
│ Threat DB │ App Manager  │ Firewall     │
└───────────┴──────────────┴──────────────┘
    ↓           ↓                ↓
Scanner.dll  (app cleanup)   (Windows API)
(C)          (Python)        (C/Windows API)
```

## 📁 Structure du Projet

```
antivirusse-maison/
├── core/                    # Code C bas-niveau
│   ├── scanner/            # Scanner de fichiers
│   └── firewall/           # Module pare-feu Windows
├── python/                  # Code Python haut-niveau
│   ├── threat_db/          # Gestion des signatures
│   ├── app_manager/        # Gestion applications
│   └── orchestrator/       # Chef d'orchestre principal
├── tests/                   # Suite de tests
│   ├── unit/               # Tests unitaires
│   └── integration/        # Tests d'intégration
├── config/                 # Fichiers de configuration
├── docs/                   # Documentation
├── CMakeLists.txt          # Configuration CMake (C)
├── setup.py                # Configuration setuptools (Python)
└── requirements.txt        # Dépendances Python
```

## 🚀 Installation Rapide

### Prérequis

- **Windows 10+** (pour le pare-feu)
- **Python 3.8+**
- **CMake 3.15+**
- **Visual Studio Build Tools** ou **MinGW** (pour compiler le C)

### Étapes

#### 1. Cloner et configurer l'environnement

```bash
cd c:\Users\amson\Documents\dev\antivirusse maison
git init
git add .
git commit -m "Initial commit"
```

#### 2. Créer un environnement virtuel Python

```powershell
python -m venv venv
.\venv\Scripts\Activate.ps1
```

#### 3. Installer les dépendances Python

```powershell
pip install -r requirements.txt
pip install -e .
```

#### 4. Compiler le C avec CMake

```powershell
mkdir build
cd build
cmake .. -G "Visual Studio 17 2022"
cmake --build . --config Release
cd ..
```

### 5. Vérifier l'installation

```powershell
pytest tests/unit -v
```

## 📚 Guide Pédagogique

### Phase 1 : Scanner (Semaine 1-2)

**Concepts couverts :**
- Parcours récursif de dossiers (C)
- Hash SHA256 (Python crypto)
- Liaison Python ↔ C via ctypes

**Fichiers clés :**
- `core/scanner/scanner.c` : parcours + hash
- `python/threat_db/signature_manager.py` : gestion signatures

### Phase 2 : Pare-feu (Semaine 3-4)

**Concepts :**
- API Windows (hooks réseau)
- Détection connexions suspectes
- Logging événements

**Note :** Nécessite droits administrateur

### Phase 3 : App Manager (Semaine 5-6)

**Concepts :**
- Énumération processus
- Suppression propre (registre + fichiers)
- Isolation d'applications malveillantes

## 🔧 Commandes Utiles

```bash
# Compiler C seul
cmake --build ./build --config Release

# Tester Python seul
pytest tests/ -v --cov=python

# Générer rapport couverture
pytest tests/ --cov=python --cov-report=html

# Linter Python
pylint python/

# Format code Python
black python/
```

## 📖 Documentation

Voir le dossier `docs/` pour :
- Architecture détaillée
- Guide de contribuer
- Explications des concepts

## ⚠️ Disclaimer

Cet antivirus est **à usage éducatif**. Ne l'utilisez pas comme protection réelle sur un système production !

## 📄 Licence

MIT License - Libre de copier, modifier, distribuer

---

**Commençons l'aventure ! 🚀**
