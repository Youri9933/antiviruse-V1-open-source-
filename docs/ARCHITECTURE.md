# 📖 Documentation - Antivirus Maison

## 1. Architecture Globale

### Flux de données

```
┌─────────────────────────────────────────┐
│   Orchestrator (Python - Point d'entrée)│
└──────────────────┬──────────────────────┘
                   │
       ┌───────────┼───────────┐
       ▼           ▼           ▼
┌──────────┐ ┌──────────┐ ┌──────────┐
│ThreatDB  │ │App Mgr   │ │Firewall  │
│(Signatures)  │(Process) │ │(Network) │
└──────────┘ └──────────┘ └──────────┘
       │           │           │
       └───────────┼───────────┘
                   ▼
          ┌─────────────────┐
          │ Scanner (C DLL) │
          │ (Hash + Parcours)│
          └─────────────────┘
```

## 2. Modules Détaillés

### 2.1 Scanner (C)

**Responsabilités:**
- Parcours récursif des dossiers
- Calcul SHA256 des fichiers
- Export des résultats

**Fichiers clés:**
- `core/scanner/scanner.h` - Interface C
- `core/scanner/scanner.c` - Implémentation
- `core/scanner/test_scanner.c` - Tests unitaires C

**Phase 2:** Intégration OpenSSL pour SHA256 réel

### 2.2 Threat DB (Python)

**Responsabilités:**
- Gestion JSON des signatures
- Lookup malware par hash
- Mise à jour base signatures

**Classes:**
- `ThreatSignature` - Une signature malware
- `SignatureManager` - Gestionnaire persistant

**Format JSON:**
```json
{
  "hash": "abc123...",
  "type": "sha256",
  "threat": "Trojan.Generic",
  "description": "...",
  "date_added": "2026-05-30T..."
}
```

### 2.3 App Manager (Python)

**Responsabilités:**
- Enumération processus (psutil)
- Détection comportements suspects
- Quarantaine propre

**Classes:**
- `Application` - Données processus
- `ApplicationManager` - Gestion apps

**Critères de suspicion:**
- Exécution depuis TEMP
- Binaires dans AppData non-standard

### 2.4 Firewall (C)

**Responsabilités:**
- Enumération connexions réseau
- Blocage/déblocage IPs

**À implémenter:**
- WinDivert (Windows)
- netfilter (Linux)

**Attention:** Nécessite droits admin

### 2.5 Orchestrator (Python)

**Chef d'orchestre:**
- Coordonne tous les modules
- Fournit interface CLI
- Génère rapports

**CLI disponible:**
```bash
python -m orchestrator.main --scan C:\dossier
python -m orchestrator.main --apps
python -m orchestrator.main --suspicious
python -m orchestrator.main --file C:\fichier.exe
```

## 3. Guide de Compilation

### Compiler le C (CMake)

```powershell
# Configuration
cd build
cmake .. -G "Visual Studio 17 2022"

# Compilation
cmake --build . --config Release

# Voilà! Les DLL sont dans build/Release/
```

### Tester le Scanner C

```powershell
cd build
cmake --build . --config Release --target test_scanner
ctest
```

## 4. Tests

### Tests Python

```bash
pytest tests/unit -v
pytest tests/unit --cov=python
```

### Tests C

```powershell
cd build
ctest --verbose
```

## 5. Flux d'Utilisation Typique

```
1. Lancer Orchestrator
   ↓
2. Charger signatures (JSON)
   ↓
3. Enumérer apps/processus
   ↓
4. Scanner fichiers suspects
   ↓
5. Comparer hashes vs Threat DB
   ↓
6. Quarantaine si menace
   ↓
7. Générer rapport
```

## 6. Points Clés Pédagogiques

### Semaine 1-2 : Scanner
- ✓ Récursion C
- ✓ Structure de données
- ✓ I/O fichiers

### Semaine 3-4 : Intégration
- ✓ Bindings C/Python (ctypes)
- ✓ JSON storage
- ✓ Signatures

### Semaine 5-6 : App Manager
- ✓ Énumération processus
- ✓ Heuristique basique
- ✓ Suppression sécurisée

### Semaine 7-8 : Pare-feu
- ✓ APIs Windows
- ✓ Network capture
- ✓ Bloking rules

## 7. Sécurité & Limitations

⚠️ **Ceci est ÉDUCATIF, pas production-ready!**

**Limitations:**
- Pas de chiffrement des logs
- Pas d'authentification
- Heuristiques basiques
- Pas de polymorphisme détecté

**À améliorer:**
- OpenSSL pour SHA256
- Machine learning pour détection
- Sandboxing des apps
- Analyse heuristique avancée

## 8. Débogage

### Logs verbeux

```python
import logging
logging.basicConfig(level=logging.DEBUG)
```

### CMake verbose

```powershell
cmake --build . --verbose
```

### Python profiling

```bash
python -m cProfile orchestrator/main.py --scan ...
```

---

**Bon développement ! 🚀**
