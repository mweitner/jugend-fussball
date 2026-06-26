# Trainingstandorte und Spielfelder

Diese Seite definiert ein einheitliches Standort- und Feldschema, damit
Trainingseinheiten im Team ohne Rueckfragen vorbereitet und durchgefuehrt werden
koennen.

## Ziel

- Klare Referenz auf den Trainingstandort je Einheit.
- Nachvollziehbarer Feldaufbau mit festen Bezeichnungen.
- Uebergabefaehige Planung, auch wenn der Autor der Einheit fehlt.

## Planungsstand 2026/27

- Die C-Jugend wird eigenstaendig gemeldet (keine SGM mit
 Ringingen/Pappelau/Beiningen).
- Fuer die operative Planung werden daher ausschliesslich TSV-Erbach-Standorte
 verwendet.
- Der Hauptstandort der C-Jugend fuer Training und Spiele ist das TSV Stadion.

## Standortkatalog (TSV Erbach)

| Standort-ID | Standortname | Status | Typische Nutzung |
| --- | --- | --- | --- |
| TSV-SPORTHEIM | Sportplatz TSV Erbach am Sportheim | aktiv | Kleinfeldaufbau, D-Jugend Training |
| TSV-FLUTLICHT | Sportplatz TSV Erbach Flutlichtplatz | aktiv | Abendtraining, dunkle Jahreszeit |
| TSV-STADION | Sportplatz TSV Erbach Stadion | aktiv | C-Jugend Training/Spiele, Grossfeld |

Hinweis: Ehemalige SG-Standorte werden nicht mehr als aktive Planungsstandorte
gefuehrt.

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

## Stadion-Aufteilung fuer C-Jugend (TSV-STADION)

Das TSV Stadion kann je nach Trainingsziel in Teilbereiche aufgeteilt werden.
Fuer die Dokumentation werden folgende Bereichs-IDs verwendet:

| Bereich-ID | Nutzung | Beschreibung |
| --- | --- | --- |
| STADION-GESAMT | 11 gegen 11 / Abschlussspiel | gesamtes Feld |
| STADION-HALB-A | Technik/Taktik in Gruppen | erste Platzhaelfte |
| STADION-HALB-B | Parallelgruppe/Belastungssteuerung | zweite Platzhaelfte |
| STADION-QUER-1 | Kleinfeldspielformen | quer aufgebautes Feld 1 |
| STADION-QUER-2 | Kleinfeldspielformen | quer aufgebautes Feld 2 |

Empfehlung fuer die Planangabe im Trainingsdokument:

- Standort-ID: TSV-STADION
- Bereich-ID: STADION-GESAMT oder konkrete Teilflaeche
- Orientierung: laengs oder quer

## Orientierung (Google Maps)

- Externe Kartenreferenz:
 [TSV Erbach Stadion - Google Maps](https://www.google.com/maps/search/?api=1&query=TSV+Erbach+Stadion)
- Fuer Protokolle/Trainingseinheiten reicht in der Regel die Bereich-ID aus.
- Optional kann je Einheit ein Screenshot aus Google Maps intern beigefuegt
 werden, falls eine visuelle Einweisung noetig ist.

## Pflichtangaben fuer neue Trainingseinheiten

Jede neue Einheit sollte im Abschnitt Plan mindestens diese Angaben enthalten:

- Standort-ID
- Bereich-ID (bei TSV-STADION)
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
