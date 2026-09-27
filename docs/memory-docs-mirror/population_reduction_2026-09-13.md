# Population reduction — 2026-09-13

The latest request supersedes the earlier 60%/30% request: reduce Castrum
ordinary enemies by **40%**, Zahar'ak ordinary beastmen by **35%**, Mistbeard
by **25%**, and Coerthas Central Lowlands by **25%**, relative to the preceding
populations. Special encounters are excluded from the percentage calculations.
The earlier preference to retain Zahar'ak's drakes still applies.

| Area | Eligible before → after | Protected actors retained | Total before → after |
| --- | ---: | ---: | ---: |
| Castrum Novum, zone 190 | 123 → 74 (39.8% removed) | 10 | 133 → 84 |
| Zahar'ak, zone 174 | 39 → 25 (35.9% removed) | 19 | 58 → 44 |
| Mistbeard Cove, zone 131 | 154 → 116 (24.7% removed) | — | 154 → 116 |
| Coerthas Central Lowlands, zone 147 | 261 → 196 (24.9% removed) | — | 261 → 196 |

This removes **166 ordinary public placements**. All ordinary species remain.
Castrum retains its three H-I key bearers and seven linked Elite guards.
Zahar'ak retains all thirteen Battle Drakes, Flamefist, both Burned Brothers,
Ranig'oh, Feretrar and Scriniary. Natalan, coffers, loot, profiles, weather,
closed door 15834, quest/private actors and all other zones are unchanged.
Mistbeard's two previously removed Water Elementals remain absent.

## Selection and evidence

`Data/mobplacements/population_reduction_20260913.json` pins the preceding
606 rows, retained identities, 166 exact removed rows and preceding plan
fingerprints. Per-species counts use proportional allocation with largest
remainders. Selection first favors unrepresented authored habitats, then
distance from retained posts. Small Zahar'ak populations cannot retain every
old one-post habitat, but all six ordinary beastman roles remain represented.

All survivors retain their exact recorded XYZ, source-local node/support
evidence, profile ID, unique ID and catalog ID. No new positions or navmesh
edges were created. Earlier manifests, earlier reductions and the expansion's
original 539-point `plans.json` remain frozen. Current exporters apply this
filter after those historical validations. Mor Dhona's baseline validator and
the five-dungeon boost audit allow only the exact reviewed missing rows;
altered or substituted rows still fail validation.

## Import and regeneration

The canonical spawn seed, current CSV/JSON/SQL exports and current previews
contain only survivors. The combined live migration is:

`Data/sql/live migrations/population_reduction_20260913.sql`

It is idempotent and targets UID, zone, profile, name and original XYZ within
0.001, requiring empty private/link/spawn groups. It deliberately does not
match the numeric catalog ID because additive live imports allocate their own
IDs. Custom moved or reassigned versions of a removed UID are preserved.
The current area migrations also include their scoped reduction. The earlier
Lowlands half-density migration remains a separate prerequisite for databases
still containing the original 522 placements.

Use `python -B tools/mobspawns/population_reduction_20260913.py build|check`
for the combined migration, and the four existing area's `build|check|render`
commands for their exports. Use `render_mistbeard_copperbell_update.py` for the
focused Mistbeard preview. The `author` command refuses to overwrite this
pinned reduction; do not rerun it against an already reduced catalog.

## Validation and review

**105 tests passed** across the new reduction, Castrum, Zahar/Natalan,
Lowlands, expansion, density boost, Mor Dhona, Natalan, map-coordinate,
Copperbell and Nanawa suites. Tests cover repeat imports with independently
allocated live IDs, exact survivors, protected encounters, all original
species, custom/private/moved actors and provenance corruption.

The older U'Ghamaro, Mun-Tuy and Shposhae suites still stop during setup on
pre-existing protected-file hash mismatches. Their protected content is
unchanged in this pass; these checks were not bypassed or rebaselined.

Updated rendered maps were inspected. This is an offline project/data change:
**no live database import, server restart or in-game test was performed**.

- [Castrum interactive map](maps/castrum-novum-20260912/index.html)
- [Zahar'ak interactive map](maps/zahar-natalan-20260912/174/index.html)
- [Mistbeard and Copperbell maps](maps/mistbeard-copperbell-20260912/index.html)
- [Central Lowlands interactive map](maps/coerthas-central-lowlands-20260912/index.html)
- [Four-area overview](maps/population-reduction-review-20260913.jpg)
