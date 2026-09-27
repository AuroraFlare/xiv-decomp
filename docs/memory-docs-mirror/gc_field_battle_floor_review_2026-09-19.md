# Grand Company field-battle floor review — 2026-09-19

This review finalizes the offline trigger and enemy floor heights for Engineering
Victory (`com0l4`), The Mail Must Get Through (`com0g4`) and Arms Race (`com0u4`).
It does not enable the quests, deploy SQL, restart a server or establish client
combat/playthrough acceptance.

The trigger rows retain their native X/Z. Limsa and Gridania use user-standing
captures at the exact native X/Z. Ul'dah uses the accepted capture Y from a point
0.826080 yalms away and applies it at the retained native X/Z; it is nearby floor
support rather than an exact-marker capture.

| Route | Trigger XYZ in main SQL | Capture relationship |
| --- | --- | --- |
| `com0l4` / 111404 | 983.919983, 64.456551, -1566.650024 | Exact native X/Z capture |
| `com0g4` / 111604 | -636.609985, 18.128950, -2031.650024 | Exact native X/Z capture |
| `com0u4` / 111804 | 1152.500000, 311.773834, -952.159973 | Capture Y transferred 0.826080 yalms to native X/Z |

The five actors reuse three authored formation slots: left `(-3,+5)`, right
`(+3,+5)` and center `(0,+6)` relative to the trigger. X/Z and the wave roster
remain unchanged. Each target now has an explicit Y selected from the nearest
eligible node in a frozen walking recording. The selected node supplies only Y;
its X/Z does not replace the authored formation X/Z.

| Route | Left Y / node / distance | Right Y / node / distance | Center Y / node / distance |
| --- | --- | --- | --- |
| `com0l4` | 64.617250 / 3940 / 2.147201 | 64.442100 / 3943 / 1.744769 | 64.250015 / 4002 / 0.906554 |
| `com0g4` | 19.397987 / 1514 / 1.358206 | 18.796751 / 5675 / 2.283825 | 19.036030 / 1515 / 1.028427 |
| `com0u4` | 311.642270 / 11124 / 2.955584 | 312.036300 / 11125 / 2.344728 | 312.036300 / 11125 / 1.998450 |

Zone 130 nodes 3935–3937 and zone 171 nodes 11091–11093 are vertical
positioning samples below the settled floor and were excluded. Zone 171 node
11094 is an unconfirmed exact-marker sample and was also excluded in favor of
the accepted capture and later walking nodes. No zone 152 node required
exclusion. The farthest retained formation support is 2.955584 yalms.

The active quicknavmesh files were cleaned after this review: zone 130 nodes
3935–3937 and zone 171 nodes 11091–11093 were removed. None had an incident
edge, so zero edges were removed. The frozen evidence snapshots and their node
IDs remain unchanged for audit reproduction. Current zone 171 node 11094 at
`1152.6742, 311.96854, -952.1562` is retained; it is not one of the six known
bad low samples. A running server caches quicknavmesh graphs, so use
`!quicknavmesh reload` while in each of zones 130 and 171 before relying on the
cleaned active files; this review did not alter the live process.

The user capture rotations are preserved in the evidence record only. Enemy
facing remains the existing authored `math.pi`; the capture rotations are not
imported. These values are supported floor heights at retained authored X/Z,
not recovered retail enemy XYZ or facing.

## Frozen evidence

The complete review is
[`Data/quest_npcs/evidence/gc-field-floor-20260919/review.json`](../Data/quest_npcs/evidence/gc-field-floor-20260919/review.json),
SHA-256 `cf78d26d5842ed52fb20a06c8dfef3164df2b5d0d5586e04df3a695d30b43e90`.
It pins:

- capture excerpt SHA-256 `6ad9e34e6451db0892531d9678116d33093ddd821154af34f722c5beb8f11a28`;
- zone 130 snapshot SHA-256 `0ad6629a2eb2e27f969836edfdf25f7a0eb80c1e9d6dcc03f6a0d9185f17928e`;
- zone 152 snapshot SHA-256 `bc5aa6457a1d8e3be803ba8c1fe6d0ac395273082cb1cbeaf51e01dc19b51e26`;
- zone 171 snapshot SHA-256 `0623e59864a5e5db37f17b18a0ab6273805d10d2a1b037173a377754a596356a`.

The generator verifies these hashes, reproduces the main SQL trigger heights and
generates
[`Data/scripts/quests/com/gc_field_battle_placements.lua`](../Data/scripts/quests/com/gc_field_battle_placements.lua).
The shared quest layer consumes explicit target XYZ for every wave. Regression
coverage sets the entrant Y far from the reviewed target Y and verifies that
waves 1, 2 and 3 use their explicit target values.

## Reproduction

Run from the repository root:

```powershell
python -B tools/build_gc_field_encounters.py check
Push-Location tools
python -B -m unittest test_build_gc_field_encounters.py
Pop-Location
dotnet run --project tools/grand-company-runtime-tests/GrandCompanyRuntimeTests.csproj -c Release --no-restore
dotnet run --project tools/job-gc-lifecycle-tests/JobGcLifecycleTests.csproj -c Release --no-restore
python -B tools/validate_grand_company_quests.py
```

Fresh results: generator check passed; three focused generator tests passed;
Grand Company runtime passed 2,437 assertions; Job/GC lifecycle passed 46 cases
and 1,240 assertions; the static Grand Company audit passed. The lifecycle run
reported only the existing NU1900 advisory-feed warning while offline.
