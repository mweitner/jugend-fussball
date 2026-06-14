# Jugend Fußball TSV Erbach

[![Docs Pages](https://github.com/USERNAME/jugend-fussball/actions/workflows/docs-pages.yml/badge.svg)](https://github.com/USERNAME/jugend-fussball/actions/workflows/docs-pages.yml)

**Repository zur Verwaltung und zum Austausch von Trainingskonzepten und Trainingseinheiten
für die Jugendabteilung des TSV Erbach.**

Das Ziel dieses Repositories ist die **systematische, regelmäßige, zielgerichtete und
regelmäßige Trainingsarbeit** nach DFB/WFV-Richtlinien, basierend auf der Basis Coach
Schulung (aktuell bis Juli 2026).

## 🎯 Inhalte

- **Trainingskonzepte**: Allgemeine Trainingsphilosophie und Richtlinien
- **Trainingseinheiten**: Konkrete Trainingsplanungen nach Trainingsschwerpunkten
  - Passen, Finte, Dribbeln, Schuss, Kopfballspiel, Defensiv, Spielsysteme
- **Dokumentation**: Organisatorische Hinweise und Archivierung

## 📖 Online-Dokumentation

Die komplette Dokumentation ist verfügbar unter:

**[https://USERNAME.github.io/jugend-fussball/](https://USERNAME.github.io/jugend-fussball/)**

Die Seite wird automatisch aktualisiert, wenn Änderungen in den `main`-Branch gepusht werden.

## 👥 Zielgruppe

- Trainer der TSV Erbach Jugendabteilung
- Jugendleitung
- Interessierte Eltern und Spieler

Die Website ist **öffentlich lesbar** und dient als primärer Austauschkanal mit Trainerkollegen,
die keinen GitHub-Account oder keine Entwicklerkenntnisse haben.

## 🚀 Lokal entwickeln

### Voraussetzungen

- Python 3.11+
- Sphinx und abhängige Pakete (siehe `doc-engine/requirements.txt`)

### Dokumentation lokal bauen

```bash
cd doc-engine
pip install -r requirements.txt
make -C source html
```

Die fertige HTML-Dokumentation findet sich dann unter `doc-engine/source/_build/html/`.

### Mit Docker

```bash
docker build -f doc-engine/source/Dockerfile.sphinx -t jugend-fussball-docs:latest .
docker run --rm -v $(pwd)/doc-engine:/docs jugend-fussball-docs:latest make html
```

## 📝 Lizenz

Diese Dokumentation ist Eigentum des TSV Erbach und dient der internen Nutzung.
