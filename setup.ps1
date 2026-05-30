#!/usr/bin/env pwsh
<#
.SYNOPSIS
    Setup script for Antivirus Maison (Windows PowerShell)
    
.DESCRIPTION
    Initializes the antivirus project for development

.EXAMPLE
    .\setup.ps1
#>

param(
    [switch]$NoTests = $false
)

Write-Host "
╔══════════════════════════════════════════════════════════════╗
║   🛡️  ANTIVIRUS MAISON - Setup Script                      ║
║   Windows Development Environment                           ║
╚══════════════════════════════════════════════════════════════╝
" -ForegroundColor Cyan

# Colors for output
$Success = "Green"
$Error = "Red"
$Info = "Yellow"

# 1. Check Python
Write-Host "`n[*] Checking Python..." -ForegroundColor $Info
$pythonVersion = python --version 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Python found: $pythonVersion" -ForegroundColor $Success
} else {
    Write-Host "✗ Python not found! Install from https://www.python.org/" -ForegroundColor $Error
    exit 1
}

# 2. Create venv if not exists
if (-Not (Test-Path "venv")) {
    Write-Host "`n[*] Creating Python virtual environment..." -ForegroundColor $Info
    python -m venv venv
    Write-Host "✓ Virtual environment created" -ForegroundColor $Success
} else {
    Write-Host "`n[*] Virtual environment already exists" -ForegroundColor $Info
}

# 3. Activate venv
Write-Host "`n[*] Activating virtual environment..." -ForegroundColor $Info
& ".\venv\Scripts\Activate.ps1"
if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Virtual environment activated" -ForegroundColor $Success
}

# 4. Install dependencies
Write-Host "`n[*] Installing Python dependencies..." -ForegroundColor $Info
pip install -r requirements.txt
if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Dependencies installed" -ForegroundColor $Success
} else {
    Write-Host "✗ Failed to install dependencies" -ForegroundColor $Error
    exit 1
}

# 5. Install package in editable mode
Write-Host "`n[*] Installing package in editable mode..." -ForegroundColor $Info
pip install -e .
if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Package installed" -ForegroundColor $Success
}

# 6. Run tests if requested
if (-Not $NoTests) {
    Write-Host "`n[*] Running tests..." -ForegroundColor $Info
    pytest tests/unit -v
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✓ All tests passed" -ForegroundColor $Success
    } else {
        Write-Host "⚠️  Some tests failed" -ForegroundColor $Error
    }
}

# 7. Summary
Write-Host "
╔══════════════════════════════════════════════════════════════╗
║   ✅ SETUP COMPLETED SUCCESSFULLY!                          ║
╚══════════════════════════════════════════════════════════════╝

📝 Next steps:

1. ✓ Python environment ready
2. ⏳ Install CMake from https://cmake.org/download/
3. ⏳ Compile C modules:
     mkdir build
     cd build
     cmake .. -G 'Visual Studio 17 2022'
     cmake --build . --config Release

4. ✓ Try the CLI:
     python -m orchestrator.main --apps
     python -m orchestrator.main --suspicious

5. ✓ Run tests:
     pytest tests/ -v

6. 📚 Read documentation:
     - README.md (overview)
     - docs/QUICKSTART.md (quick start)
     - docs/PEDAGOGIE.md (learning guide)

" -ForegroundColor Cyan

Write-Host "
Your Python environment is ready!

To deactivate:
    deactivate

To reactivate:
    .\\venv\\Scripts\\Activate.ps1
" -ForegroundColor Yellow
