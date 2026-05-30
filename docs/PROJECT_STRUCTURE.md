📁 ANTIVIRUS MAISON - Structure Complète
═════════════════════════════════════════════════════════════

antivirusse-maison/
│
├─ 📄 README.md                     ← Lire d'abord ! (Vue d'ensemble)
├─ 📄 INSTALLATION.md               ← Checklist installation
├─ 📄 CMakeLists.txt                ← Configuration C (CMake)
├─ 📄 setup.py                      ← Configuration Python (setuptools)
├─ 📄 requirements.txt              ← Dépendances Python
├─ 📄 .gitignore                    ← Fichiers ignorés Git
│
├─ 🔧 install.bat                   ← Script installation Windows
├─ 🔧 install.sh                    ← Script installation Linux/Mac
│
├─ 📁 core/                         ← Code C bas-niveau
│   ├─ scanner/
│   │  ├─ CMakeLists.txt            ← Config CMake scanner
│   │  ├─ scanner.h                 ← Interface public
│   │  ├─ scanner.c                 ← Implémentation
│   │  └─ test_scanner.c            ← Tests unitaires C
│   │
│   └─ firewall/
│      ├─ CMakeLists.txt            ← Config CMake firewall
│      ├─ firewall.h                ← Interface public
│      └─ firewall.c                ← Stub implémentation
│
├─ 📁 python/                       ← Code Python haut-niveau
│   ├─ __init__.py                  ← Package init
│   │
│   ├─ threat_db/
│   │  ├─ __init__.py               ← Package public API
│   │  └─ signature_manager.py      ← Gestion signatures
│   │
│   ├─ app_manager/
│   │  ├─ __init__.py               ← Package public API
│   │  └─ app_cleaner.py            ← Gestion applications
│   │
│   └─ orchestrator/
│      ├─ __init__.py               ← Package public API
│      └─ main.py                   ← Point d'entrée CLI
│
├─ 📁 tests/                        ← Suite de tests
│   ├─ CMakeLists.txt               ← Config tests C
│   │
│   ├─ unit/
│   │  └─ test_scanner.py           ← Tests Python
│   │
│   └─ integration/                 ← Tests intégration (futur)
│
├─ 📁 config/                       ← Fichiers configuration
│   ├─ signatures.json              ← Base signatures malware
│   └─ config.json                  ← Configuration globale
│
├─ 📁 docs/                         ← Documentation
│   ├─ ARCHITECTURE.md              ← Architecture détaillée
│   ├─ QUICKSTART.md                ← Démarrage rapide
│   ├─ PEDAGOGIE.md                 ← Guide enseignant (leçons)
│   ├─ PROJECT_STRUCTURE.md         ← Ce fichier
│   └─ [futures docs]
│
├─ 📁 build/                        ← Artefacts compilés (ignoré Git)
│   ├─ Release/                     ← Binaires Release
│   │  ├─ scanner.dll               ← DLL Scanner compilée
│   │  ├─ firewall.dll              ← DLL Firewall compilée
│   │  └─ test_scanner.exe          ← Executable test
│   └─ [fichiers CMake]
│
├─ 📁 quarantine/                   ← Fichiers mis en quarantaine
│
└─ 📁 venv/                         ← Environnement Python (local)
   ├─ Scripts/                      ← Executables
   │  ├─ Activate.ps1              ← Activation PowerShell
   │  └─ python.exe                ← Python de ce venv
   ├─ Lib/                         ← Packages Python installés
   └─ [autres répertoires]

═════════════════════════════════════════════════════════════

✅ FICHIERS CRÉÉS: 25+
✅ LIGNES DE CODE: ~1500+
✅ TESTS: 2+ passants
✅ DÉPENDANCES: 10+ installées

═════════════════════════════════════════════════════════════

📖 LIRE EN PREMIER:
1. README.md                 (Compréhension générale)
2. docs/QUICKSTART.md        (Démarrage rapide)
3. docs/PEDAGOGIE.md         (Mode enseignant)
4. INSTALLATION.md           (Checklist complète)

═════════════════════════════════════════════════════════════

🚀 COMMANDES CLÉS:

Activation venv:
  .\venv\Scripts\Activate.ps1

Tester Python:
  python -m orchestrator.main --apps

Compiler C (après CMake):
  mkdir build
  cd build
  cmake .. -G "Visual Studio 17 2022"
  cmake --build . --config Release

Tester:
  pytest tests/ -v

═════════════════════════════════════════════════════════════
