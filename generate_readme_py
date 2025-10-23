import json

# Chemin vers le fichier JSON généré par Trivy
TRIVY_JSON = "scan-results/trivy-report.json"
README_FILE = "README.md"

# Charger le JSON
with open(TRIVY_JSON, "r") as f:
    data = json.load(f)

# Préparer le contenu Markdown
markdown = "# Security Scan Report\n\n"
markdown += "Ce rapport montre uniquement les vulnérabilités **HIGH** et **CRITICAL** détectées par Trivy.\n\n"
markdown += "| Gravité | Package | Version | CVE | Description |\n"
markdown += "|---------|--------|---------|-----|-------------|\n"

# Parcourir les résultats
for result in data.get("Results", []):
    target = result.get("Target")
    vulns = result.get("Vulnerabilities") or []
    for v in vulns:
        if v["Severity"] in ["HIGH", "CRITICAL"]:
            pkg = v.get("PkgName", "")
            version = v.get("InstalledVersion", "")
            cve = v.get("VulnerabilityID", "")
            severity = v.get("Severity", "")
            desc = v.get("Description", "").replace("\n", " ").replace("|", "/")  # éviter problème tableau
            markdown += f"| {severity} | {pkg} | {version} | {cve} | {desc} |\n"

# Si aucune vulnérabilité critique, ajouter un message
if markdown.strip().endswith("|-------------|"):
    markdown += "| Aucun problème HIGH/CRITICAL détecté | - | - | - | - |\n"

# Écrire le README.md
with open(README_FILE, "w", encoding="utf-8") as f:
    f.write(markdown)

print(f"README.md généré avec succès !")
