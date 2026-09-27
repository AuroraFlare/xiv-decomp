# Nanawa Mines ordinary population

Added **62 ordinary mobs across ten species** on exact recorded ground in
**zone 176**, alongside 24 existing static mobs and two existing NMs. See the
[map overlay](maps/nanawa-mines-20260912/index.html). This populates the recorded
main routes and chambers with open entrance space and breaks between habitats;
it does not claim every branch is covered or reproduce exact retail spawns.

## Ground coverage and map

Nanawa has **1,234 recorded XYZ samples and 549 captured links**. The live file
matches the already frozen
`Data/guildleveplacements/individual-evidence/zone_176.tsv`, SHA-256
`ded406e1ca60fe3c67c34a075401e41bd0ef7965a26ffc23ce667dcecaf9718a`.
The quest-evidence copy is identical. The required premerge snapshot has no
additional zone-176 recording. No copies were merged or modified.

Its recorded elevation range is approximately **163.24–184.66**, much smaller
than Copperbell's combined floors. Every new spawn nevertheless retains its
own recorded elevation. Flat-looking artwork is not used to invent heights.

The native map is MapNavi **1600**, region/layout **104/412**, piece **1126**,
zone/place **176/3101**, scale **2**, base X/Z **544/1888**. The native texture is
2560 × 2048; the overview is 1280 × 1024. Its companion frame converts pixels
with `X = pixelX - 544`, `Z = pixelY - 1888`; the header obscures pixels above
Y 190. The outdoor map registry and confirmed calibration records are unchanged.
This is the same Nanawa-specific transform reviewed for the prior leve work,
now with the extracted native artwork. Live grid confirmation remains pending.

The existing warning that some depicted passages are blocked is retained.
Unrecorded passages are unavailable for authoring. Historical cell **7,4** has
zero samples, so the Balloon/Molting Miteling habitat listed there remains
unpopulated; those species use other recorded, map-reviewed portions of their
ranges. No links across undotted passages or nearby separate trails are inferred.

Each chosen node has a captured neighbor no farther than eight horizontal and
three vertical units away. New mobs have at least 21 units of clearance from
each other and retained static mobs, habitat spacing 23–27, 55 units around the
gate/battlewarden, 13 around doors, and 35 around the two NM anchors. The map
was visually inspected. Collision-safe roaming beyond captured routes and the
final density feel still need an in-game walkthrough.

## Roster and exclusions

The [April 2013 Nanawa roster](https://web.archive.org/web/20130430150647/http://ffxiv.gamerescape.com/wiki/Nanawa_Mines)
supplies these level ranges and historical integer grid-cell references:

| Added species | Level | New count |
| --- | --- | ---: |
| Balloon | 28–30 | 8 |
| Cellar Puk | 28–30 | 7 |
| Goblin Thug | 35–39 | 7 |
| Iron Coblyn | 28–30 | 10 |
| Jumping Djigga | 28–30 | 2 |
| Magicked Bones | 31–34 | 3 |
| Maidenbug | 28–30 | 6 |
| Molting Miteling | 28–29 | 4 |
| Skeleton Swordbearer | 28–30 | 3 |
| Will-o'-the Wykes | 29–30 | 12 |

Excluded leve species: Antling Worker, Bog Yarzon, Darkwing Devilet, Deepground
Puk, Loverly Ladybird, Rubyscale Pteroc and Wandering Wisp. No guildleve
encounter layouts or scripts were changed.

The existing six Bomb Embers and six Cursed Eyes already support quests and
cover those roster entries; no additional copies were added. Their rows and
profiles remain unchanged. Bardi and Kokoroon Quickfingers retain their exact
existing spawn statements and profiles. Six pre-existing Yarzon Bleeders,
which are absent from this archive's roster, are preserved without expansion.

The six existing Nanawa Iron Coblyns used shared profile 1071 at levels 30–33.
Only their profile references change to Nanawa profile 39323 at levels 28–30;
their IDs, positions, rotations and other fields are preserved. Profile 1071
and its outdoor uses are unchanged. The migration checks the named zone-176
rows, original profile and recorded catalog XYZ before rebinding them.

Period [solo-farming footage](https://www.youtube.com/watch?v=tuoDo9Uf1fs)
was inspected at 0:02: two Iron Coblyns are visible in a mining chamber. Its
minimap is contextual, not a calibrated coordinate source. An
[April 2011 player report](https://forum.square-enix.com/ffxiv/showthread.php?p=94326)
also describes Coblyns in the back near bomb quest mobs; that supports the
northern mining-loop habitat. Player ranks/SP rates were not interpreted as
monster levels. Other distributions are authored from archive cells, native
artwork and recorded routes, not a recovered retail spawn census.

## Reproducibility and import

The [manifest](../Data/mobplacements/nanawa_mines.json) pins exact donor profiles,
named client actors, source hash, node selections, original rows and protected
NM statements. Profiles **39320–39329** reuse reviewed combat lists from the
same actor class. Same-name variants keep their loot lists; newly named
Balloon, Cellar Puk, Jumping Djigga, Skeleton Swordbearer and Will-o'-the Wykes
have loot list 0 pending a separate historical loot review.

The builder uses the saved map planner's stable IDs, full-precision JSON and
three-decimal capture CSV/SQL. Canonical added spawn IDs are **960173–960234**.
The additive migration preserves occupied profile IDs and does not attach
new spawns to conflicting profiles. Tiny tolerances accommodate MySQL FLOAT
storage rounding in floating profile fields and existing XYZ comparisons;
integer identity and level fields remain exact. The same fractional-profile
guard correction was applied to the prepared Copperbell migration, without
changing its mobs or positions.

```powershell
python -B tools/mobspawns/nanawa_mines.py build
python -B tools/mobspawns/nanawa_mines.py check
python -B tools/mobspawns/nanawa_mines.py render
python -B -m unittest discover -s tools/mobspawns -p test_nanawa_mines.py
```

Six Nanawa tests verify source XYZ/captured edges, levels/exclusions, spacing,
native coordinate conversion, canonical output, preservation of existing
content, repeat imports, profile conflicts and binary32 storage rounding.
The Copperbell regression suite also passes with its shared SQL guard update.
SQL reruns are tested using an isolated SQLite fixture, including simulated
MySQL FLOAT values; no live MySQL import is claimed.

Changes are prepared in the checkout. The running server and database were
not changed. Import
[`nanawa_mines_20260912.sql`](../Data/sql/live%20migrations/nanawa_mines_20260912.sql)
into the intended server schema, then reload/restart its mob population to
activate it. This pass requires no recording replacement, new zone IDs or
additional seamless boundary changes. Continue using the pending Copperbell
server fix from that separate update.

An exact recorded northern test point is
`!pos 176 51.376 167.911 -1594.469`. It is not a newly user-confirmed calibration.
