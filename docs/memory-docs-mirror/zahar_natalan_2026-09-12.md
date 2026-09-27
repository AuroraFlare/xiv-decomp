# Zahar'ak population and Zahar'ak/Natalan coffers — 2026-09-12

**Current override:** the [September 13 reduction](population_reduction_2026-09-13.md)
leaves **44** actors: 25 ordinary beastmen, thirteen unchanged drakes and six
special actors. The 97/58 counts below describe earlier frozen passes.

The original pass below contained **97 public Zahar'ak enemies in zone 174**, seven
Zahar'ak coffers, and eight Natalan coffers in zone 143. Natalan's existing
91 actors, including Lozol and his two Headsman's Axe guards, retain their
original profiles, placement IDs and positions. This report describes project
data and offline validation; the migration has not been imported into a running
map database and these new placements have not been tested in the client.

The later [ordinary-beastman reduction](zahar_beastmen_reduction_2026-09-12.md)
supersedes this report's counts: current exports contain **58** enemies, with
78 ordinary beastmen halved to 39 and all 13 drakes retained. The original
manifest and evidence remain frozen.

## Evidence and population

The [requested Zahar'ak archive](https://web.archive.org/web/20130510101715/http://ffxiv.gamerescape.com/wiki/Zahar%27ak)
establishes the public roster and level ranges. The
[Natalan archive](https://web.archive.org/web/20130510120500/http://ffxiv.gamerescape.com/wiki/Natalan)
still lists Lozol as its named NM; he was already implemented in the
[earlier Natalan pass](natalan_2026-09-12.md).

| Zahar'ak enemy | Level | Count | Profile |
| --- | --- | --- | --- |
| Battle Drake | 52–57 | 13 | 39800 |
| Zahar'ak Chandler | 50–54 | 13 | 39801 |
| Zahar'ak Drubber | 50–53 | 13 | 39802 |
| Zahar'ak Halberdier | 54–57 | 13 | 39803 |
| Zahar'ak Illuminator | 55 | 13 | 39804 |
| Zahar'ak Ostiary | 55–57 | 13 | 39805 |
| Zahar'ak Sniper | 52–55 | 13 | 39806 |
| Zahar'ak Feretrar | 55 | 1 | 39807 |
| Zahar'ak Scriniary | 55 | 1 | 39808 |
| Ranig'oh | 56 | 1 | 39809 |
| Burned Brother | 55 | 2 | 39810 |
| Flamefist Ahlygg Roh | 59 | 1 | Existing 3052 |

The archive categorizes Flamefist as the NM. Ranig'oh's native class is
`ScalelizardFireNM`; this unique Silver key bearer also uses the server NM flag.
No quest, guildleve or Ifrit battlefield enemies are added.

The [Burned Brother subpage](https://web.archive.org/web/20130509125637/http://ffxiv.gamerescape.com/wiki/Burned_Brother)
explicitly identifies him as Flamefist's assistant. In
[nei's Flamefist recording](https://www.youtube.com/watch?v=kIt8uFDn_So), sampled
frames at 0:49 and 1:06 show a targeted Burned Brother beside the fort wall and
Flamefist in the combat log. This supports the association, not exact home
coordinates or guard count. Two guards are authored composition. All three use
`linkGroup=zahar_flamefist`, with empty `spawnGroup` so they spawn together.

Native actor IDs and appearance rows are pinned alongside byte-matching native
initializers and complete reviewed donor profiles. Pugilist, Archer, Lancer and
Thaumaturge troops use the existing role kits 86, 87, 88 and 89; casters use the
reviewed Fire/Thunder spell list 2. Drakes use family list 5020 and its ranged
attack setting. Flamefist's legacy generic Dragoon list 15 is corrected to
Pugilist list 86. A custom alternative skill list is preserved. His existing
Fire element is retained; Burned Brother's archived Fire alignment is explicit.
The kits are reusable server combat behavior, not a complete recovered retail
Flamefist encounter script.

## Recorded ground and density

The manifest is `Data/mobplacements/zahar_natalan.json`. It freezes the new
6,491-node zone-174 recording independently and reuses Natalan's already frozen
8,247-node recording. Native transforms are MapNavi 1000 for Zahar'ak and 3000
for Natalan. Source hashes, local node IDs, captured edges and nearby-sample
support remain distinct. The live recording files are unchanged.

Every new enemy and chest uses an exact captured XYZ, rounded to three decimals
only in the SQL export. No terrain heights, interpolated nodes or cross-source
edges are invented. Reviewed placement IDs occupy **965000–965096** in the
canonical seed. The migration uses stable unique IDs and database-assigned
numeric IDs to avoid colliding with existing live rows.

The combined migration and final loot block guard native actor, job, levels,
combat lists and drop ownership independently of speed/detection statistics.
This allows both strongholds' keys and missing posts to install after shared
seed enrichment changes those statistics. Conflicting native roles or combat
lists remain protected; existing tuned statistics are retained.

The 91 ordinary Zahar'ak enemies use a minimum 7.5-yalm separation. The linked
boss group uses at least 9 yalms. Posts are static to keep them on verified
ground. Gates/interaction anchors retain at least 8 yalms; mobs stay at least
10 yalms from coffers on the same floor. Separate nearby coffers have at least
6 yalms between their anchors. Recorded entrance and gate gaps provide breaks
between packs. These density and clearance choices are authored tuning.

Flamefist and his guards are just north of the sixth gate, with the Gold chests
in the final recorded room. **Door 15834 stays permanently closed**. New Zahar'ak
posts exclude the recorded southeast exit corridor beyond it. The northwest
Gold chest uses nearby recorded ground in cell 50,40 instead of the historical
50,41 square; the other six Zahar'ak chests match their historical grid cells.

Natalan cells 43,19 and 44,20 have no recorded ground in either the live snapshot
or checked premerge backups. Other historical chest cells also conflict with
the native gate layout or existing mob clearance. Seven Natalan chest positions
are therefore authored near the matching native gates/key bearers and recorded
floors; Mythril matches cell 43,22. The three Gold chests sit on Lozol's upper
floor, ordered west/center/east. Do not describe these as recovered retail XYZ.
Each manifest entry retains the historical cell and its separate placement note.

## Keys, drops and rewards

All **ten key sources** are usable after import:

| Stronghold | Key | Drop owner |
| --- | --- | --- |
| Zahar'ak | Brass | Feretrar 39807 |
| Zahar'ak | Copper | Scriniary 39808 |
| Zahar'ak | Silver | Ranig'oh 39809 |
| Zahar'ak | Gold | Flamefist 3052 |
| Natalan | Brass | Gladiator sentry 39601 |
| Natalan | Copper | Marauder sentry 39602 |
| Natalan | Silver | Lancer sentry 39603 |
| Natalan | Steel | Scarred Watchwolf 39605 |
| Natalan | Mythril | Conjurer sentry 39604 |
| Natalan | Gold | Lozol 3119 |

The Natalan Conjurer/Mythril mapping preserves the earlier native-class and
stronghold-guide resolution of conflicting archive labels. Each key opens only
its associated lock family. All 15 physical chest definitions remain separate,
including two Zahar'ak Silver chests and three Gold chests per stronghold.
Their distinct equipment rewards are listed in the
[saved stronghold source matrix](open_world_coffer_stronghold_sources.md).
That matrix is frozen evidence for the earlier Natalan manifest; its old
implementation TODO paragraphs are superseded by this report.

Zahar'ak ordinary troops receive the archive's Bronze Amalj'ok, Buffalo Sirloin,
Inferno Taper, Sagolii Sage and Thanalan Tea Leaves; Snipers also drop Cobalt
Arrows. Both drakes drop Drake Scales. Burned Brothers drop Inferno Tapers.
Flamefist retains Darksteel Amalj'ok, Gold key, Inferno Lamp, taper and food drops.
Lozol retains his Gold key, Ixali Willowknot, Vortex Headdress and crystal drops.
The combined import restores missing Lozol loot rows as well as his population.

New keys reuse the existing provisional 3% server policy; ordinary food/material
drops use 5%, with Bronze Amalj'ok at 3%. Existing drop probabilities are never
overwritten by this migration. Flamefist's existing 100% Inferno Lamp drop is
retained; quest-specific eligibility is not reconstructed. The source does not
publish complete stronghold common pools, gil or rare-equipment probabilities:
the already-seeded named equipment remains a **provisional sole coffer reward**.
Each coffer has one active position, no location reroll and the existing refill
behavior. The shared runtime checks the key and reward capacity before consuming
the key, reserves simultaneous openings, and refills the chest.

Respawns are authored: ordinary/key troops 60 seconds, Flamefist and Ranig'oh
300 seconds. Missing Flamefist HP defaults to 25,000; Ranig'oh uses 14,000.
Existing custom boss HP/timers survive. Natalan tuning remains as previously
reviewed. Retail patrols, defeat/gate scripts and reset rules remain unresolved.

## Rebuild, import and review

```powershell
python -B tools/mobspawns/zahar_natalan.py plan
python -B tools/mobspawns/zahar_natalan.py build
python -B tools/mobspawns/zahar_natalan.py check
python -B tools/mobspawns/zahar_natalan.py render
python -B -m unittest discover -s tools/mobspawns -p test_zahar_natalan.py
```

`plan` writes review images, provenance JSON, capture CSV and placement-only
additive SQL without changing the canonical catalogs. Use the full
[combined migration](../Data/sql/live%20migrations/zahar_natalan_20260912.sql)
for an existing database. It includes the existing Natalan migration, restores
missing scoped definitions/reward pools, and adds the new Zahar'ak population
and all 15 chest positions in one transaction. Current combat tables and the
three existing open-world coffer tables are prerequisites. The import preserves
existing GM chest positions, custom reward pools, custom probabilities and
unrelated public/private rows. Do not reload the full destructive spawn seed or
convert the isolated CSV with the old counter-based converter.

After importing, restart the map server to load enemy placements. Coffers can
also be refreshed with `!owcoffer reload` and inspected with
`!owcoffer status zahar` / `!owcoffer status natalan`.

Interactive reviews under `docs/maps/zahar-natalan-20260912/174/` and `143/`
show the recorded samples/edges, filtered enemies and Gold chest diamonds.
Click an enemy or chest for its exact `!pos` command. Example boss anchors:

```text
!pos 174 2371.210 296.280 997.691
!pos 174 2357.331 296.552 888.042
!pos 143 565.818 301.763 10.868
```

Nine focused tests exercise complete rosters, the ten key sources, all distinct
chest rewards, exact recorded floors, the locked-exit boundary, linked guards,
repeat imports, custom-data protection and late NM seed enrichment. Tests run
the generated additive SQL against an isolated SQLite schema with only MySQL
transaction/string syntax adapted. They do not substitute for a live MySQL
import or client combat/appearance review.

Validation completed: all **45 tests** in the focused stronghold (9), existing
Natalan (8), Castrum (10) and map-coordinate (18) suites pass. The three
population generators' `check` commands and `git diff --check` pass as well.
