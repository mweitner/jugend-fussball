# Trainingstandorte und Spielfelder

Diese Seite definiert ein einheitliches Standort- und Feldschema, damit
Trainingseinheiten im Team ohne Rueckfragen vorbereitet und durchgefuehrt werden
koennen.

## Ziel

- Klare Referenz auf den Trainingstandort je Einheit.
- Nachvollziehbarer Feldaufbau mit festen Bezeichnungen.
- Uebergabefaehige Planung, auch wenn der Autor der Einheit fehlt.

## Standortkatalog (aktuell TSV Erbach)

| Standort-ID | Standortname | Status | Typische Nutzung |
| --- | --- | --- | --- |
| TSV-SPORTHEIM | Sportplatz TSV Erbach am Sportheim | aktiv | Kleinfeldaufbau, D-/C-Jugend Training |
| TSV-FLUTLICHT | Sportplatz TSV Erbach Flutlichtplatz | aktiv | Abendtraining, dunkle Jahreszeit |
| TSV-STADION | Sportplatz TSV Erbach Stadion | aktiv | Grossfeld, Abschlussspiel, Events |

## Erweiterbare SG-Standorte (bei Bedarf)

| Standort-ID | Standortname | Status |
| --- | --- | --- |
| SVR-P1 | SV Ringingen Platz 1 | optional |
| SVR-P2 | SV Ringingen Platz 2 | optional |
| PAP-P1 | Pappelau/Beiningen Platz 1 | optional |
| PAP-P2 | Pappelau/Beiningen Platz 2 | optional |

## Lageplan TSV Erbach

- Quelle: spaethmedia-CUP Lageplan 2026
- Datei: [TSV Erbach Lageplan (PDF)](/_static/organisatorisches/tsv-erbach-lageplan-spaethmedia-cup-2026.pdf)

## Spielfeldbezeichnungen (aus Lageplan)

Der Lageplan weist vier Spielfelder aus. Fuer die Trainingsdokumentation werden
folgende Feld-IDs verwendet:

| Feld-ID | Lageplan-Name | Platzbereich |
| --- | --- | --- |
| FELD-1 | Feld 1 | Sportheimbereich |
| FELD-2 | Feld 2 | Sportheimbereich |
| FELD-3 | Feld 3 | Flutlicht-/Nebenplatzbereich |
| FELD-4 | Feld 4 | Flutlicht-/Nebenplatzbereich |

## Pflichtangaben fuer neue Trainingseinheiten

Jede neue Einheit sollte im Abschnitt Plan mindestens diese Angaben enthalten:

- Standort-ID
- Feld-ID(s)
- Aufbaucode
- Orientierung (z. B. quer ueber das Feld)
- Feldmasse
- Zonierung
- Tor-Setup

## Aufbaucode-Konvention

Empfohlener Aufbaucode:

`<jahrgang>-<anzahl-felder>KF-<breite>x<laenge>-<zonen>`

Beispiele:

- `D-2KF-28x30-6-9-M-9-6`
- `D-2KF-28x36-9-9-M-9-9`

## Beispiel fuer einen klaren Feldaufbau

- Standort-ID: TSV-SPORTHEIM
- Feld-IDs: FELD-1 + FELD-2
- Aufbaucode: D-2KF-28x30-6-9-M-9-6
- Orientierung: zwei Kleinfelder quer ueber den Platz
- Tore: pro Kleinfeld 2 D-Jugend-Tore und 4 Mini-Tore

Damit ist die Durchfuehrung auch durch ein anderes Trainerteam reproduzierbar.
