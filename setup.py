#!/usr/bin/env python3
"""
Setup pour Antivirus Maison - Couche Python
"""

from setuptools import setup, find_packages

setup(
    name="antivirusse-maison",
    version="0.1.0",
    description="Antivirus open source éducatif en C/Python",
    author="Développeur",
    packages=find_packages(where="python"),
    package_dir={"": "python"},
    python_requires=">=3.8",
    install_requires=[
        "pycryptodome>=3.15.0",  # Hachage SHA256
        "watchdog>=2.3.0",        # Monitoring fichiers
        "psutil>=5.9.0",          # Infos processus
    ],
    extras_require={
        "dev": [
            "pytest>=7.0.0",
            "pytest-cov>=4.0.0",
            "black>=22.0.0",
            "pylint>=2.15.0",
        ],
    },
    entry_points={
        "console_scripts": [
            "antivirusse-maison=orchestrator.main:main",
        ],
    },
    classifiers=[
        "Development Status :: 3 - Alpha",
        "Intended Audience :: Developers",
        "Topic :: System :: Monitoring",
        "Topic :: Security",
        "Programming Language :: Python :: 3.8",
        "Programming Language :: Python :: 3.9",
        "Programming Language :: Python :: 3.10",
        "Programming Language :: Python :: 3.11",
    ],
)
