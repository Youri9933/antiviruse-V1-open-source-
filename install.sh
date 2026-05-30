#!/bin/bash
# Installation Script for Antivirus Maison
# Linux/Mac Setup

echo ""
echo "============================================================"
echo "   ANTIVIRUS MAISON - Installation Linux/Mac"
echo "============================================================"
echo ""

# Check Python
python3 --version || { echo "Python 3 not found!"; exit 1; }

# Check CMake
cmake --version || { echo "CMake not found! Install with: brew install cmake"; exit 1; }

# Create venv
echo "[*] Creating Python venv..."
python3 -m venv venv
source venv/bin/activate

# Install dependencies
echo "[*] Installing Python dependencies..."
pip install -r requirements.txt

# Build C modules
echo "[*] Building C modules..."
mkdir -p build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
cmake --build . 
cd ..

echo ""
echo "============================================================"
echo "   [+] Installation completed successfully!"
echo "============================================================"
echo ""
echo "Next steps:"
echo "  1. Activate venv: source venv/bin/activate"
echo "  2. Run tests: pytest tests/ -v"
echo "  3. Test scanner: ./build/test_scanner"
echo ""
