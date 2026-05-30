
        print("\n" + "="*60)
        print("📊 RAPPORT DE SCAN")
        print("="*60)

        threats_found = sum(1 for r in self.scan_results if r["is_threat"])
        total_scanned = len(self.scan_results)

        print(f"\n✓ Fichiers scanifiés: {total_scanned}")
        print(f"⚠️  Menaces détectées: {threats_found}")
        print(f"📊 Processus actifs: {len(self.app_manager.get_running_apps())}")

        if threats_found > 0:
            print("\n🚨 Menaces:")
            for result in self.scan_results:
                if result["is_threat"]:
                    print(f"   - {result['file']}")


def main():
    """Point d'entrée CLI"""
    parser = argparse.ArgumentParser(description="Antivirus Maison 🏠🛡️")
    parser.add_argument("--scan", type=str, help="Scanner un dossier")
    parser.add_argument("--file", type=str, help="Scanner un fichier")
    parser.add_argument("--apps", action="store_true", help="Lister les apps actives")
    parser.add_argument("--suspicious", action="store_true", help="Détecter comportements suspects")

    args = parser.parse_args()

    av = AntivirusOrchestrator()
    av.initialize()

    if args.scan:
        av.scan_directory(args.scan)
        av.show_report()

    elif args.file:
        is_threat = av.scan_file(args.file)
        sys.exit(1 if is_threat else 0)

    elif args.apps:
        av.show_running_apps()

    elif args.suspicious:
        av.show_suspicious_behavior()

    else:
        # Mode interactif par défaut
        av.show_running_apps()
        av.show_suspicious_behavior()
        av.show_report()


if __name__ == "__main__":
    main()
