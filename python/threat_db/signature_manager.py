


def get_threat_db(db_path: str = "config/signatures.json") -> SignatureManager:
    """Obtenir l'instance globale du gestionnaire de signatures"""
    global _threat_db
    if _threat_db is None:
        _threat_db = SignatureManager(db_path)
    return _threat_db
