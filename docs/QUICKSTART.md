# 🚀 Guide Démarrage Rapide

## Installation (Windows)

### 1. Prérequis

```powershell
# Vérifier Python
python --version  # 3.8+

# Installer CMake (si absent)
choco install cmake
# ou télécharger: https://cmake.org/download/

# Installer Visual Studio Build Tools (pour compiler C)
# Télécharger: https://visualstudio.microsoft.com/downloads/
# Cocher: "Desktop development with C++"
```

### 2. Configuration Initiale

```powershell
cd "c:\Users\amson\Documents\dev\antivirusse maison"

# Créer venv Python
python -m venv venv
.\venv\Scripts\Activate.ps1

# Installer dépendances
pip install -r requirements.txt
```

### 3. Compiler le C

```powershell
mkdir build
cd build
cmake .. -G "Visual Studio 17 2022"
cmake --build . --config Release
cd ..
```

### 4. Test Rapide

```powershell
# Test Python
python -m orchestrator.main --apps

# Sortie attendue:
# 🔍 Processus actifs
# ────────────────────────────
#   • python.exe                (PID: 1234)
#   • explorer.exe             (PID: 5678)
#   ...
```

## Utilisation CLI

### Scanner un dossier

```powershell
python -m orchestrator.main --scan C:\temp
```

### Afficher les processus actifs

```powershell
python -m orchestrator.main --apps
```

### Détecter comportements suspects

```powershell
python -m orchestrator.main --suspicious
```

### Scanner un fichier spécifique

```powershell
python -m orchestrator.main --file C:\fichier.exe
```

## Prochaines Étapes

1. **Semaine 1** : Étudier `core/scanner/scanner.c`
2. **Semaine 2** : Lire `python/threat_db/signature_manager.py`
3. **Semaine 3** : Implémenter une liaison ctypes
4. **Semaine 4** : Ajouter détection heuristique

## Structure Principale à Retenir

```
antivirus-maison/
├── core/           ← Code C bas-niveau
├── python/         ← Logique haut-niveau
├── tests/          ← Tests
├── config/         ← Fichiers config
└── docs/           ← Documentation
```

---

**C'est parti ! 🛡️**
