# Mor Dhona ordinary additions — 2026-09-12

Zone 190 now has **156 additional ordinary enemies**, 13 of each of twelve
types missing outside Castrum. The previous 111 outdoor ordinary placements,
Dodore and his three minions remain unchanged. Castrum retains all 133 posts,
profiles, linked encounters, drops and coffers. These are project data changes;
no live database import, server restart or client validation was performed.

## Roster and evidence

The [requested Mor Dhona archive](https://web.archive.org/web/20130425034306/http://ffxiv.gamerescape.com/wiki/Mor_Dhona)
lists these species. Individual archived pages and research limitations are
recorded in [research.json](../Data/mobplacements/evidence/mor-dhona-20260912/research.json).

| Added type | Profile | Level | Evidence scope |
| --- | --- | --- | --- |
| Evil Eye | 39900 | 50–59 | Species range; local range blank |
| Hunter Kalong | 39901 | 50–54 | Only listed location: Mor Dhona |
| Widowmaker | 39902 | 75–79 | Only listed location: Mor Dhona |
| Saltspray Pteroc | 39903 | 25–34 | Provisional species range; other-zone ranges conflict |
| Fallen Captain | 39904 | 75–79 | Species range; local range blank |
| Puroboros | 39905 | 75–79 | Species range; local range blank |
| Qiqirn Scrambler | 39906 | 50–54 | Species range; local range blank |
| Imperial War Hound | 39907 | 54 | Explicit Mor Dhona range |
| VIIth Legion Secutor | 39908 | 54 | Public Mor Dhona entry, Pugilist |
| VIIth Legion Laquearius | 39909 | 54 | Public Mor Dhona entry, Marauder |
| VIIth Legion Medicus | 39910 | 54 | Public Mor Dhona entry, Conjurer |
| VIIth Legion Signifer | 39911 | 54 | Public Mor Dhona entry, Thaumaturge |

The Legion detail pages distinguish public level 54 from level 55 in Castrum's
United We Stand battlefield. Available VIIth Legion native appearances for
Laquearius, Medicus and Signifer are also referenced by event data; only their
appearance/class is reused, with new ordinary level-54 profiles. No event
profile, director, transmitter, generator or F-I is imported. Deepvoid, Atomos,
guildleve, Futures Perfect and Return of the King actors are excluded.

Period videos were sampled: [Pseudopsia Kite's zone recording](https://www.youtube.com/watch?v=EKUynGGV7Dk),
[Ryligh Kell's saved footage](https://www.youtube.com/watch?v=cxVGV-bnGlg), and
[Mor Dhona Journey Part 1](https://www.youtube.com/watch?v=Riem_H8aew4).
They supplied terrain context and visible evidence of the existing Truffle Hog
population, but did not establish exact positions for the missing species.
No sampled frame is represented as a coordinate survey.

## Ground and authored habitats

Native MapNavi 3500 uses base X=1280, Z=1344 and 100 world units per grid cell.
The independent frozen snapshot contains 9,279 nodes. Historical integer cells
are squares; uncertain historical cells are not treated as precise anchors.
The 2,682-node premerge snapshot was checked separately and is not merged.

All additions use exact recorded XYZ, pinned source-local node identities and
support. Captured edges and nearby recorded samples are distinct; the latter
create no runtime links. New posts are stationary (`roams=0`). There are at
least 20 horizontal yalms between new posts and existing public enemies on
nearby elevations, 70 around camps, 35 around aetheryte gates, and 50 around
Dodore's existing anchor. The full Castrum rectangle X=-920…-580, Z=-365…35 is
excluded at every elevation.

Southern Legion additions extend the existing public troop neighborhood.
Other habitats are authored regional choices. The archive's underground Evil
Eye note contradicts itself about northwest versus upper-right entrances.
The chosen northwestern low paths are **not a verified retail cave assignment**.
Recorded elevation supports individual positions; it does not establish that
an entire map polygon is walkable or belongs to a single floor.

Exact donor profiles, native appearances, initializers and combat lists are
pinned. Ahriman and Diremite ranged-attack flags are carried into the scoped
profiles. Widowmaker uses its native female appearance. Fallen Captain uses
the archive's Lancer job and the existing Livingdead donor's family combat;
this is not a reconstruction of a unique retail script. Shared profiles remain
untouched. Hunter Kalong, Fallen Captain and War Hound receive documented
common items at an authored 10% chance each. Bat Wing is ordinary item 10009506,
not the identically named quest dummy. Other unverified drop pools remain empty.

## Rebuild and import

```powershell
python -B tools/mobspawns/mor_dhona.py plan
python -B tools/mobspawns/mor_dhona.py build
python -B tools/mobspawns/mor_dhona.py check
python -B tools/mobspawns/mor_dhona.py render
python -B -m unittest discover -s tools/mobspawns -p test_mor_dhona.py
```

The [manifest](../Data/mobplacements/mor_dhona.json) pins all 156 points and
catalog IDs 966000–966155. The [full additive migration](../Data/sql/live%20migrations/mor_dhona_ordinary_20260912.sql)
adds profiles, drops and placements and can be rerun. UID collisions, conflicting
profiles, private actors and customized drop chances survive. Later shared
speed/detection tuning does not disable its native identity guards. Use this
migration for an existing database; do not reload the destructive full spawn
seed or use the old counter-based converter on the isolated CSV.

The [interactive preview](maps/mor-dhona-population-20260912/index.html) includes
recorded samples/edges, species filters and teleport commands. Gray background
dots are previous placements; colored circles are additions. A sample is:

```text
!pos 190 -391.100 -28.260 -509.285
```

Seven focused tests execute generated SQL in isolated SQLite, adapting only
MySQL transaction/string syntax. They cover ground, native profiles, public
levels/jobs, item types, repeat imports, conflicts and Castrum/Dodore protection.
Combined validation: **53 tests pass** across Mor Dhona (7), Zahar/Natalan (10),
Natalan (8), Castrum (10) and map coordinates (18). The Mor Dhona, Zahar/Natalan
and Castrum generation checks pass. Live MySQL/client review remains unperformed.
