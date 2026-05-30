🛡️ ANTIVIRUS MAISON - INDEX DE NAVIGATION
════════════════════════════════════════════════════════════════

👤 POUR LES UTILISATEURS
════════════════════════════════════════════════════════════════
├─ README.md              ← Lire en premier !
├─ RESUME_EXECUTIF.md     ← Résumé du projet et status
└─ docs/QUICKSTART.md     ← Démarrage en 5 minutes

🎓 POUR LES ÉTUDIANTS / APPRENANTS
════════════════════════════════════════════════════════════════
├─ docs/PEDAGOGIE.md          ← 🎯 LIRE EN PRIORITÉ (mode prof)
├─ docs/ARCHITECTURE.md        ← Architecture + flux de données
├─ docs/PROJECT_STRUCTURE.md   ← Arborescence du projet
├─ INSTALLATION.md             ← Checklist complète installation
└─ docs/QUICKSTART.md          ← Démarrage rapide

💻 POUR LES DÉVELOPPEURS
════════════════════════════════════════════════════════════════
├─ CMakeLists.txt              ← Configuration build C
├─ setup.py                    ← Configuration Python
├─ core/scanner/scanner.h      ← Interface C Scanner
├─ core/scanner/scanner.c      ← Implémentation C Scanner
├─ python/threat_db/           ← Module signatures
├─ python/app_manager/         ← Module apps
├─ python/orchestrator/main.py ← Point d'entrée
└─ tests/                      ← Suite de tests

🔨 POUR LES INSTALLEURS / DEVOPS
════════════════════════════════════════════════════════════════
├─ setup.ps1        ← Setup automatique (PowerShell)
├─ install.bat      ← Setup automatique (Batch)
├─ install.sh       ← Setup automatique (Bash)
├─ requirements.txt ← Dépendances Python
└─ CMakeLists.txt   ← Configuration CMake C

════════════════════════════════════════════════════════════════

📚 GUIDE DE LECTURE PAR PROFIL
════════════════════════════════════════════════════════════════

🟢 JE VIENS DE DÉCOUVRIR LE PROJET
   └─ Lire: README.md (5 min)
      Puis: RESUME_EXECUTIF.md (10 min)

🟡 JE VEUX COMPRENDRE L'ARCHITECTURE
   └─ Lire: docs/ARCHITECTURE.md
      Puis: docs/PROJECT_STRUCTURE.md

🔵 JE VEUX APPRENDRE (MODE ENSEIGNANT)
   └─ Lire: docs/PEDAGOGIE.md (25 min)
      Étudier: core/scanner/scanner.c
      Comprendre: python/threat_db/signature_manager.py

🟣 JE VEUX INSTALLER ET CONTRIBUER
   └─ Suivre: INSTALLATION.md (checklist)
      Compiler: CMakeLists.txt
      Tester: pytest tests/ -v

════════════════════════════════════════════════════════════════

🚀 COMMANDES RAPIDES
════════════════════════════════════════════════════════════════

Activation:
  .\venv\Scripts\Activate.ps1

Test Python:
  python -m orchestrator.main --apps

Test dans tous les modes:
  .\setup.ps1                  # Setup auto
  pytest tests/ -v             # Tests
  python -m pylint python/     # Linting

Compilation C (après CMake):
  mkdir build
  cd build
  cmake .. -G "Visual Studio 17 2022"
  cmake --build . --config Release

════════════════════════════════════════════════════════════════

📊 STATUS DU PROJET (30 mai 2026)
════════════════════════════════════════════════════════════════

✅ FAIT
  • Architecture complète
  • Modules Python (threat_db, app_manager, orchestrator)
  • Module Scanner C (structure + tests)
  • Documentation (6 fichiers)
  • Tests unitaires (2 tests passants)
  • Dépendances installées
  • venv Python créé

⏳ À FAIRE EN PRIORITÉ
  • Installer CMake
  • Compiler le C
  • Implémenter SHA256 complet
  • Créer bindings ctypes

⏸️  FUTUR
  • Interface GUI
  • Pare-feu complet
  • Tests d'intégration
  • Packaging .exe

════════════════════════════════════════════════════════════════

🆘 BESOIN D'AIDE ?
════════════════════════════════════════════════════════════════

❓ "Comment ça marche ?"
   → Lire: README.md + docs/ARCHITECTURE.md

❓ "Par où commencer ?"
   → Lire: INSTALLATION.md + docs/QUICKSTART.md

❓ "Pourquoi C et Python ?"
   → Lire: docs/PEDAGOGIE.md (section Architecture)

❓ "Comment compiler ?"
   → Lire: INSTALLATION.md (section Phase 1 - CMake)

❓ "Quel est le status du projet ?"
   → Lire: RESUME_EXECUTIF.md

❓ "Je veux contribuer"
   → Lire: docs/PEDAGOGIE.md (section Défis)

════════════════════════════════════════════════════════════════

✍️ NOTES IMPORTANTES
════════════════════════════════════════════════════════════════

⚠️  Installer CMake AVANT de compiler le C

⚠️  Ce projet est ÉDUCATIF, pas production-ready

⚠️  Nécessite Visual Studio Build Tools ou MinGW pour compiler C

⚠️  Windows 10+ ou Linux/Mac avec Python 3.8+

════════════════════════════════════════════════════════════════

Version: 0.1.0
Status: Alpha - Structure + Python modules
Dernière mise à jour: 30 mai 2026
Prochaine étape: Compiler le C avec CMake

════════════════════════════════════════════════════════════════
