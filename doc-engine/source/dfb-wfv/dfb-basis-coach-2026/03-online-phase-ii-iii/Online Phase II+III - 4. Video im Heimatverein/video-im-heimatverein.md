# Video im Heimatverein

## Überblick

**Aufgabe:** DFB Basis-Coach – Online Phase II+III – Aufgabe 4: Video im Heimatverein\
**Trainingseinheit:** Do 02.07.2026 – D-Jugend (Jg. 2013/14) – Thema: Flanken und Boxbesetzung\
**Kamera:** VEO Vereinskamera (automatische Highlight-Clips, ~25 s/Clip)\
**Rohschnitt-Ordner:** `d-jugend-training-videos/do-02.07.2026-flanken-boxbesetzung/`

---

## Abweichung von der Vorlage

Gemäß Aufgabenstellung ist eine "Vorlage Trainingsplanung" einzureichen. Die Trainingsplanung und
Kurzreflexion sind jedoch bereits öffentlich online dokumentiert – dort wird stattdessen referenziert:

- **Trainingsplan:**
  <https://mweitner.github.io/jugend-fussball/trainingseinheiten/d-jugend-2026/sportplatz-02.07.2026-flanken-boxbesetzung.html>
- **Trainingsprotokoll (Retrospektive):**
  <https://mweitner.github.io/jugend-fussball/trainingseinheiten/d-jugend-2026/sportplatz-02.07.2026-flanken-boxbesetzung-protokoll.html>

Im WFV-Portal wird in den Kommentarfeldern auf diese URLs verwiesen. Optional kann die Seite als
PDF-Export angehängt werden (Browser → Drucken → Als PDF speichern).

---

## Video-Material (VEO Highlights)

Die VEO-Kamera erstellt automatisch kurze Event-Clips (~25 s) für Abschlüsse und Tore.
33 Clips gesamt, Gesamtdauer ca. 13:45 min → muss auf **max. 10 min** gekürzt werden.

| Clip # | Dateiname                    | Typ       |
|--------|------------------------------|-----------|
|  1     | 01 002354_-_Abschluss.mp4    | Abschluss |
|  2     | 02 002410_-_Abschluss.mp4    | Abschluss |
|  3     | 03 002423_-_Abschluss.mp4    | Abschluss |
|  4     | 04 002441_-_Abschluss.mp4    | Abschluss |
|  5     | 05 002638_-_Abschluss.mp4    | Abschluss |
|  6     | 06 002654_-_Abschluss.mp4    | Abschluss |
|  7     | 07 002800_-_Abschluss.mp4    | Abschluss |
|  8     | 08 003011_-_Abschluss.mp4    | Abschluss |
|  9     | 09 003052_-_Abschluss.mp4    | Abschluss |
| 10     | 10 004445_-_Abschluss.mp4    | Abschluss |
| 11     | 11 004446_-_Tor.mp4          | **Tor**   |
| 12     | 12 005331_-_Abschluss.mp4    | Abschluss |
| 13     | 13 005332_-_Tor.mp4          | **Tor**   |
| 14     | 14 005449_-_Abschluss.mp4    | Abschluss |
| 15     | 15 005521_-_Abschluss.mp4    | Abschluss |
| 16     | 16 005643_-_Abschluss.mp4    | Abschluss |
| 17     | 17 005913_-_Abschluss.mp4    | Abschluss |
| 18     | 18 005931_-_Abschluss.mp4    | Abschluss |
| 19     | 19 010004_-_Abschluss.mp4    | Abschluss |
| 20     | 20 010023_-_Abschluss.mp4    | Abschluss |
| 21     | 21 010043_-_Abschluss.mp4    | Abschluss |
| 22     | 22 011300_-_Abschluss.mp4    | Abschluss |
| 23     | 23 011301_-_Tor.mp4          | **Tor**   |
| 24     | 24 011428_-_Abschluss.mp4    | Abschluss |
| 25     | 25 011508_-_Abschluss.mp4    | Abschluss |
| 26     | 26 011509_-_Tor.mp4          | **Tor**   |
| 27     | 27 011938_-_Abschluss.mp4    | Abschluss |
| 28     | 28 012516_-_Tor.mp4          | **Tor**   |
| 29     | 29 012516_-_Abschluss.mp4    | Abschluss |
| 30     | 30 012559_-_Abschluss.mp4    | Abschluss |
| 31     | 31 012947_-_Abschluss.mp4    | Abschluss |
| 32     | 32 013133_-_Tor.mp4          | **Tor**   |
| 33     | 33 013216_-_Abschluss.mp4    | Abschluss |

### Hinweis zu den VEO-Clips

Die Clips zeigen Spielsituationen (Abschlüsse/Tore) aus dem Training, aber **keine** Traineransprache
oder Erklärung der Trainingsform. Möglichkeiten:

1. **Empfohlen:** Kurze Einleitung per Handy filmen (2–3 min, Trainer erklärt die Trainingsform
   am Spielfeld), dann mit den besten VEO-Clips zusammenschneiden → zeigt Erklärung + Umsetzung.
2. **Minimal:** Nur VEO-Clips (max. 24 Stück = 10 min), Erklärung im Videokommentar im WFV-Portal
   ergänzen. Akzeptabel, aber Trainercoaching ist weniger sichtbar.

---

## Workflow: Video schneiden (ffmpeg)

Skript: `do-02.07.2026-flanken-boxbesetzung/schnitt.sh`

```bash
# Einzelnen Clip ansehen (ffplay)
ffplay "01 002354_-_Abschluss.mp4"

# Alle ausgewählten Clips zusammenführen → Weitner_Onlinephase_II_III_Aufgabe_04.mp4
bash schnitt.sh
```

Das Skript erstellt eine `concat.txt` aus den in `SELECTED_CLIPS` definierten Nummern und ruft
`ffmpeg -f concat` auf. Ausgabedatei direkt hochladebereit (<= 10 min).

---

## Hochladen ins WFV-Portal

**Dateiname-Konvention laut Aufgabe:** `Weitner_Onlinephase II+III_Aufgabe 04`

Schritte:

1. `Weitner_Onlinephase_II_III_Aufgabe_04.mp4` hochladen (rechts unten „+"-Button)
2. Video ansehen und **mindestens 3 Videokommentare** erstellen an relevanten Stellen
3. Trainingsplanung: URL in Kommentarfeld einfügen **oder** PDF anhängen
4. Einverständniserklärung (bereits signiert, liegt als PDF vor) hochladen:
   - Pfad im Repo:
     `dfb-wfv/dfb-basis-coach-2026/03-online-phase-ii-iii/einverstaendnis-videoaufnahmen-d-jugend-2013-14.pdf`

---

## Vorgeschlagene Videokommentare

Mindestens 3 Kommentare für Teil 3 der Aufgabe:

1. **Lernziel getroffen?** – Beim ersten erkennbaren Flanken-Anlauf eines Spielers: „Spieler läuft
   auf den 2. Pfosten – Wenn-Dann-Regel sichtbar umgesetzt."
2. **Coaching-Moment** – Bei einer Situation wo Coaching sichtbar ist oder wäre: „Kurze
   Korrektur (Timing des Anlaufs) – Nettospielzeit wurde dabei bewusst hochgehalten."
3. **Verbesserungspotenzial** – Bei einem nicht besetzten Strafraum: „Zentraler Stürmer läuft
   vor den Torsteher statt hinter ihn – Boxbesetzung noch nicht automatisiert."
4. **(Optional) Positiver Abschluss** – Bei einem Tor per Flanke: „Flanke + Boxbesetzung führt
   zu Tor – Lernziel der Einheit erreicht."

---

## Videos teilen (Eltern / Trainerteam)

Videos werden **nicht** auf der öffentlichen Web-Seite veröffentlicht. Teilen per:

- Google Drive (Link mit eingeschränktem Zugriff) → Link in Spond oder per E-Mail an Eltern/Trainer
- Zugang nur für Personen mit Link (kein öffentlicher Index)
