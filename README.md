# Jugendfussball D- und C-Jugend

[![Docs Pages](https://github.com/mweitner/jugend-fussball/actions/workflows/docs-pages.yml/badge.svg?branch=main)](https://github.com/mweitner/jugend-fussball/actions/workflows/docs-pages.yml)

**Persoenliches Arbeits- und Austausch-Repository fuer Trainingskonzepte und
Trainingseinheiten im Jugendfussball (Schwerpunkt D- und C-Jugend).**

Ich bin Trainer in der D- und perspektivisch C-Jugend beim TSV Erbach und nutze dieses Repo,
um Unterlagen strukturiert mit Trainerkollegen sowie interessierten Spielern und Eltern zu teilen.

Das Ziel ist eine **systematische, regelmaessige und zielgerichtete Trainingsarbeit** nach
DFB/WFV-Richtlinien, basierend auf der Basis-Coach-Schulung (aktuell bis Juli 2026).

## 🎯 Inhalte

- **Trainingskonzepte**: Allgemeine Trainingsphilosophie und Richtlinien
- **Trainingseinheiten**: Konkrete Trainingsplanungen nach Trainingsschwerpunkten
  - Passen, Finte, Dribbeln, Schuss, Kopfballspiel, Defensiv, Spielsysteme
- **Dokumentation**: Organisatorische Hinweise und Archivierung

## 📖 Online-Dokumentation

Die komplette Dokumentation ist verfügbar unter:

**[https://mweitner.github.io/jugend-fussball/](https://mweitner.github.io/jugend-fussball/)**

Die Seite wird automatisch aktualisiert, wenn Änderungen in den `main`-Branch gepusht werden.

## 👥 Zielgruppe

- Trainerkollegen (insbesondere D- und C-Jugend)
- Interessierte Spieler und Eltern
- Weitere Trainer im Jugendfussball-Umfeld

Die Website ist **oeffentlich lesbar** und dient als primarer Austauschkanal fuer Personen,
die keinen GitHub-Account oder keine Entwicklerkenntnisse haben.

## 🚀 Lokal entwickeln

### Voraussetzungen

- Python 3.11+
- uv

### Dokumentation lokal bauen

```bash
uv sync
make -C doc-engine html
```

Die fertige HTML-Dokumentation findet sich dann unter `doc-engine/build/html/`.

### PDF-Ausgabe lokal bauen

Wenn du statt der Browser-Druckfunktion eine sauberere PDF-Variante willst, nutze
den Sphinx-LaTeX-Workflow:

```bash
uv sync
make -C doc-engine latexpdf
make -C doc-engine pdf
```

Die PDF-Datei liegt danach im LaTeX-Buildverzeichnis unter `doc-engine/build/latex/`.

### Mit Docker

```bash
docker build -f doc-engine/source/Dockerfile.sphinx -t jugend-fussball-docs:latest .
docker run --rm -v $(pwd)/doc-engine/build:/docs/doc-engine/build jugend-fussball-docs:latest
```

Die HTML-Ausgabe wird ins lokale `doc-engine/build/html/` gemountet. Für PDF kannst du
denselben Container mit dem Makefile-Target nutzen:

```bash
docker run --rm -v $(pwd)/doc-engine/build:/docs/doc-engine/build \
  jugend-fussball-docs:latest make pdf
```

Das setzt auf denselben LaTeX-Bausteinen wie der lokale `latexpdf`-Workflow und erzeugt
eine deutlich bessere PDF-Ausgabe als der Browser-Druck.

### Lokal vs. Docker — Wann was verwenden?

| Aspekt | Lokal mit uv | Docker |
|--------|--------------|--------|
| **Setup** | Python 3.11 + uv erforderlich | Nur Docker erforderlich |
| **Performance** | Schneller (kein Overhead) | Langsamer (Container-Start) |
| **Reproduzierbarkeit** | ✅ via `uv.lock` | ✅ Zusätzlich isolierte OS-Umgebung |
| **Betriebssystem** | Linux/Mac/Windows möglich | Überall identisch |
| **Ideal für** | Entwickler mit lokalem Setup | Teams mit gemischten Systemen |

**Empfehlung:** Nutze lokal mit `uv` für iterative Entwicklung. Docker ist optional für Kollegen,
die kein Python installiert haben oder unterschiedliche Betriebssysteme nutzen.

## 📝 Hinweis

Dieses Repo wird persoenlich gepflegt. Inhalte mit Bezug zum TSV Erbach dienen als
Training- und Austauschkontext fuer die D- und C-Jugend.
