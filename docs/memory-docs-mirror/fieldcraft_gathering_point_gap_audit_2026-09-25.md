# Fieldcraft gathering-point gap audit — 2026-09-25

This is the evidence boundary for ordinary Miner/Botanist nodes used by the
all-range fieldcraft leves. It is intentionally separate from the reviewed
guildleve circle/marker manifest: a yellow objective circle is not proof that a
server gathering actor exists at that location.

## Current result

The fieldcraft catalog has 198 Miner/Botanist marker slots and 90 Fisher
named-water anchors. The checked-in main SQL now covers **150/198** land slots.
The remaining 48 slots are 12 each in:

| Camp | Zone / place | Native map page | Grade |
| --- | --- | ---: | ---: |
| Bloodshore | 130 / 1008 | 300 | 3 |
| Cedarwood | 128 / 1015 | 100 | 4 |
| Iron Lake | 135 / 1009 | 400 | 5 |
| Tranquil Paths | 154 / 2016 | 2400 | 3 |

Treespeak is now covered by the frozen point-level supplement described below;
the other four camps remain unresolved. The map pages above were selected
through the shared map registry. Their
recordings are quicknavmesh walking samples, not gathering actor captures, so
they are useful for floor/context review but cannot be promoted as node XYZ.
The archived Disciples-of-the-Land map layer is also only parent-map pixels;
it has no actor height or native world-coordinate binding and is not used to
invent rows.

The runtime circle-follow repair now relocates empty Miner/Botanist circles to
available ordinary nodes of the same camp, zone, job and grade, copying their
exact XYZ. The 150/198 figure above still measures coverage of the stored seeds,
not runtime circle positions. No suitable ordinary rows exist for these four
camps, so relocation cannot fill their data gap: empty pending circles are hidden
without progress until usable nodes become available. No node or height is
fabricated. See `fieldcraft_guildleves_2026-09-10.md` for refresh, reservation and
client-validation details.

## Promoted supplement

Humblehearth was the first missing camp with a defensible point-level source:

- source: `C:\serverdata\gathering_points.pre-camp-fix-20260714.csv`
- source SHA-256: `4772b38b78c13395d02110c1308db132f2eef5a01dc1a87c1cb3eda5f4d7df45`
- checked-in subset: `Data/guildleveplacements/evidence/humblehearth-gathering-points-20260714.csv`
- checked-in subset: 166 rows, zone 150, place 2020, canonical grade 4
- imported runtime rows: 56 Harvest, 41 Log, 38 Mine, 22 Quarry, 9 Spearfish
- deterministic Truth-only rows: 23
- land marker coverage after import: 12/12 Humblehearth slots

Treespeak has the same treatment from a separate frozen snapshot:

- source: `C:\serverdata\gathering_points.before-emerald-moss-fix-20260714-123303.csv`
- source SHA-256: `53e4ec07ca97daf9f4e6fd419f87b911793953cd1de47ccd9412fb2f0837d43`
- checked-in subset: `Data/guildleveplacements/evidence/treespeak-gathering-points-20260714.csv`
- checked-in subset: 230 rows, explicit place 2028, grade 5; stale source label corrected to Treespeak
- imported runtime rows: 64 Mine, 31 Quarry, 43 Log, 76 Harvest
- deterministic Truth-only rows: 25
- land marker coverage after import: 12/12 Treespeak slots

The subset is passed through `tools/gatheringpoints/import_gathering_points.py`
with `--supplement`; the generated rows are present in the main
`Data/sql/server_gathering_points_import.sql`, not only in a migration. The
coordinates are captured/authored positions with individual Y values. They
are not being represented as recovered retail actor XYZ or live-client
acceptance.

## Reproduction

```powershell
python -B tools/mobspawns/map_coordinates.py maps --zone 128
python -B tools/mobspawns/map_coordinates.py maps --zone 130
python -B tools/mobspawns/map_coordinates.py maps --zone 135
python -B tools/mobspawns/map_coordinates.py maps --zone 150
python -B tools/mobspawns/map_coordinates.py maps --zone 152
python -B tools/mobspawns/map_coordinates.py maps --zone 154

python -B tools/gatheringpoints/import_gathering_points.py `
  --input C:\serverdata\gathering_points.csv `
  --supplement Data\guildleveplacements\evidence\humblehearth-gathering-points-20260714.csv `
  --supplement Data\guildleveplacements\evidence\treespeak-gathering-points-20260714.csv `
  --output Data\sql\server_gathering_points_import.sql `
  --replace

python -B tools/validate_local_and_fieldcraft_guildleves.py
python -B tools/validate_local_and_fieldcraft_guildleves.py --require-complete-land-nodes
```

The last command is expected to remain red until point-level captures for the
four uncovered camps are supplied. Do not use a camp aetheryte, navmesh center,
parent-map pixel, or a synthetic `GLGP` actor as a substitute. When new
captures arrive, freeze the exact source file/hash, select its zone/page with
the map workflow, preserve the recorded Y, and regenerate the main SQL with
the supplement option.
