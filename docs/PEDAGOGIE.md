% Antivirus Maison - Guide Pédagogique Complet
% Approche Professionnelle pour Apprendre C/Python
% 2026

# 🎓 GUIDE PÉDAGOGIQUE - Mode Enseignant

## Objectifs Éducatifs

Ce projet vous enseigne :

- **Architecture logicielle** : Séparation des responsabilités
- **Bindings C/Python** : Communication entre langages
- **Bas niveau** : Parcours fichiers, gestion mémoire en C
- **Haut niveau** : Orchestration, patterns Python
- **Testing** : Tests unitaires et d'intégration
- **Déploiement** : Build système (CMake), packaging (setuptools)

---

## 🏛️ Architecture Pédagogique

```
┌────────────────────────────────┐
│   CLI / Interface Utilisateur   │  ← Apprentissage : argparse, CLI design
└──────────────────┬─────────────┘
                   │
    ┌──────────────┼──────────────┐
    │              │              │
    ▼              ▼              ▼
┌─────────┐ ┌──────────┐ ┌─────────┐
│Threat   │ │App Mgr   │ │Firewall │
│ (Logic) │ │(Osutils) │ │ (Stubs) │
└─────────┘ └──────────┘ └─────────┘
    │              │              │
    └──────────────┼──────────────┘
                   │
                   ▼
         ┌──────────────────┐
         │ Scanner (C DLL)  │  ← Apprentissage : C bas-niveau
         │ (File traversal) │
         └──────────────────┘
```

**Chaque couche enseigne des concepts différents**

---

## 📚 Concepts Clés Par Leçon

### Leçon 1 : Structures de Données (Semaine 1)

**Fichier :** `core/scanner/scanner.h` + `scanner.c`

**Concepts :**
- Structures C (typedef)
- Allocation dynamique (malloc/realloc)
- Tableaux dynamiques
- Itération sur structures

**Exercice :** 
```c
/* Dans scanner.h, vous trouverez:
   struct ScanResult { ... }  ← Définir vos propres structs
   struct ScanResults { ... } ← Gérer un tableau dynamique
*/
```

**Objectif :** Comprendre comment passer des données entre C et Python.

---

### Leçon 2 : Récursion et Arborescence (Semaine 2)

**Fichier :** `core/scanner/scanner.c` - fonction `scan_directory()`

**Concepts :**
- Récursion sur dossiers
- Vérification type fichier (S_ISDIR, S_ISREG)
- Chaînes de caractères C
- I/O fichiers

**Exercice :**
```c
/* Trace ce code à la main:
   scan_directory(".")
     ├── "file1.txt" → ajouter résultat
     ├── "subfolder/"
     │    ├── "file2.c" → ajouter résultat
     │    └── "nested/"
     │         └── "file3.h" → ajouter résultat
     └── ...
*/
```

**Challenge :** Modifier le code pour filtrer par extension (.exe, .dll, etc.)

---

### Leçon 3 : Hachage & Sécurité (Semaine 3)

**Fichier :** `python/threat_db/signature_manager.py`

**Concepts :**
- Hachage cryptographique (SHA256)
- Dictionnaires pour lookup O(1)
- Sérialisation JSON
- Persistance données

**Exercice :**
```python
from Crypto.Hash import SHA256
import hashlib

# Comparez les performances:
# - hashlib.sha256() (Python natif)
# - pycryptodome SHA256
# - md5 vs sha256
```

**Challenge :** Implémenter un système de cache pour les hashes calculés.

---

### Leçon 4 : Bindings C/Python - ctypes (Semaine 4)

**Fichier :** À créer - `python/threat_db/scanner_binding.py`

**Concepts :**
- ctypes : charger DLLs
- Conversion types C ↔ Python
- Pointeurs en Python
- Gestion mémoire partagée

**Exercice :**
```python
import ctypes

# Charger la DLL scanner compilée
scanner_dll = ctypes.CDLL('./build/Release/scanner.dll')

# Appeler une fonction C depuis Python
# ATTENTION: Typage strict requis!
```

**Challenge :** Créer un wrapper Python complet autour du Scanner C.

---

### Leçon 5 : Énumération Processus (Semaine 5)

**Fichier :** `python/app_manager/app_cleaner.py`

**Concepts :**
- Library psutil
- Énumération système
- Accès aux métadonnées processus
- Gestion exceptions

**Exercice :**
```python
import psutil

# Énumération simple:
for proc in psutil.process_iter(['pid', 'name', 'exe']):
    print(proc.info['name'])

# Challenge: Trouver tous les processus qui utilisent > 100MB RAM
```

---

### Leçon 6 : Heuristiques de Détection (Semaine 6)

**Fichier :** `python/app_manager/app_cleaner.py` - `scan_suspicious_behavior()`

**Concepts :**
- Détection basée sur heuristiques
- Scoring de menaces
- Patterns d'identification
- False positives vs vraies menaces

**Exercice :**
```python
# Critères simples de suspicion:
suspicious_dirs = [
    "temp",
    "appdata/local/temp",
    "%windir%/temp"
]

# À explorer: Quels autres critères ?
# - Peu de ressources utilisées?
# - Connections réseau non autorisées?
```

---

### Leçon 7 : Pattern CLI & Argparse (Semaine 7)

**Fichier :** `python/orchestrator/main.py`

**Concepts :**
- argparse : parsing arguments
- Sous-commandes
- Logging formaté
- Interface utilisateur CLI

**Exercice :**
```bash
# Tester différents modes:
python -m orchestrator.main --apps
python -m orchestrator.main --scan C:\dossier
python -m orchestrator.main --suspicious
```

**Challenge :** Ajouter des sous-commandes (update, config, logs, etc.)

---

### Leçon 8 : Architecture & Design (Semaine 8)

**Fichier :** Tous les fichiers

**Concepts :**
- Séparation responsabilités (SRP)
- Dépendances minimales
- Testabilité
- Maintenabilité

**Exercice :**
```
Analyse de architecture:

1. Pourquoi Scanner est en C ?
2. Pourquoi Orchestrator en Python ?
3. Comment découpler les modules ?
4. Comment tester chaque module ?
```

---

## 🧪 Plan de Testing Pédagogique

### Tests Unitaires Python

```python
# tests/unit/test_scanner.py
def test_scanner_module_exists():
    """Vérifier que le module existe"""
    from threat_db import signature_manager
    assert signature_manager is not None

def test_add_signature():
    """Tester ajout signature"""
    db = get_threat_db()
    db.add_signature("abc123", "TestMalware")
    assert db.is_malware("abc123") is not None
```

**À comprendre :** Qu'est-ce qu'un bon test unitaire ?

---

### Tests d'Intégration

```bash
# tests/integration/
# Tester les modules ensemble:
# Scanner + Threat DB
# App Manager + Heuristiques
```

---

## 💡 Défis Progressifs

### Défi 1 (Facile) : Affichage Amélioré
Modifier le output pour être plus coloré / lisible

### Défi 2 (Moyen) : Filtres
Ajouter des filtres au scanner (par extension, par date, etc.)

### Défi 3 (Difficile) : Caching
Implémenter un cache de hashes pour éviter de recalculer

### Défi 4 (Très difficile) : Machine Learning
Entraîner un modèle basique pour détecter malwares inconnus

---

## 🎯 Résultats d'Apprentissage Attendus

À la fin de ce projet, vous saurez:

- ✓ Écrire du code C sécurisé
- ✓ Créer des bindings C/Python
- ✓ Architecturer un projet modular
- ✓ Utiliser CMake et setuptools
- ✓ Tester efficacement
- ✓ Intégrer plusieurs langages

---

## 📖 Ressources d'Apprentissage

### C
- [K&R C Book](https://en.wikipedia.org/wiki/The_C_Programming_Language)
- [cppreference](https://en.cppreference.com/w/c)

### Python
- [Real Python Guides](https://realpython.com/)
- [Fluent Python](https://www.oreilly.com/library/view/fluent-python-2nd/9781492126249/)

### Sécurité
- [OWASP Top 10](https://owasp.org/www-project-top-ten/)
- [CWE/SANS Top 25](https://cwe.mitre.org/top25/)

### CMake
- [Official CMake Tutorial](https://cmake.org/cmake/help/latest/guide/tutorial/)

---

## 🏆 Étapes Suivantes (Après Cette Structure)

1. **Implémentation SHA256 complet** en C avec OpenSSL
2. **Bindings ctypes** complets
3. **Interface GUI** (tkinter ou Electron)
4. **Déploiement** en executable (.exe)
5. **Publication** en open source

---

**🎓 Bonne chance avec votre apprentissage ! Ce projet vous prépare à l'ingénierie logicielle professionnelle. 🚀**
