# Moonfire hanabi executable-body datamine (2026-07-12)

## Result

Gridania's missing expanded `time_vfx_hanabi*_vtp1..5` names do **not** mean
that its compiled firework scheduler layer is absent. Every city root contains
eight hanabi-bearing `SEDBSCB` scheduler bodies: four for the `hanabi1..4` bank
and four for the `hanabi5..9` bank, **24**
chunks total.

All three cities have the exact size fingerprint
`928 | 1024 | 1024 | 1152 | 1184 | 1184 | 1216 | 1232`, the exact controlled
actor-count fingerprint `1 | 2 | 2 | 4 | 4 | 4 | 4 | 5`, and the same internal
`SEDBSCB -> @CRST -> ... -> @CTRK -> ... -> RIDTBL` marker grammar. The raw and
ASCII-normalized hashes remain city-specific, so these are structurally
isomorphic but locally authored payloads, not one duplicated generic blob.

The corrected Gridania gap is therefore the expanded timeline-name/lookup
metadata, not the compiled low-level scheduler bodies or the VFX assets.

## Recovered timing choreography

Each compiled primitive contains two `@CBLK` records with fixed fields
`9,000,000` and `6,000,000`. Their scale and the embedded 100,000-unit steps are
consistent with microseconds: a nine-second envelope and a six-second active
firework block. The native scheduler bridge separately proves that Lua-facing
midstream offsets use seconds and are converted to client ticks.

More importantly, all eight corresponding primitives have **exactly identical**
timing fingerprints across Gridania, Limsa, and Ul'dah. The active-block entry
counts are `3 | 5 | 5 | 6` for bank one and `7 | 7 | 8 | 7` for bank two.
Placement/resource bytes vary by city, but the authored burst choreography is
shared.

There are four compiled `sdef` primitives per bank but five `vtp` runtime keys.
The relationship cannot be one-to-one. The higher timeline layer must select or
compose these primitives; the exact `vtp1..5 -> sdef a..d` mapping remains the
next unresolved object-graph edge.

For live probes, wait at least nine seconds between `vtp` calls. Sending keys
faster can overlap scheduler envelopes and make bank or variant attribution
ambiguous.

## String-pool correction

Each root stores each short key `vtp1..vtp5` exactly once even where multiple
timeline families reuse it. Limsa and Ul'dah first define `vtp1` beside older
lighthouse/light scheduler groups, while both hanabi families later reference
that same pooled value. Printable string adjacency therefore identifies a
string's first serialized definition, not every object that references it.

This does not invalidate the six `isgrp` owner candidates: those owner labels
and bank markers are unique and retain the exact 13-byte bracketing pattern. It
does mean the prior neighborhood token column must not be read as a complete
membership list; the atlas now labels it `serialized_neighborhood_tokens`.

## Owner-key transform records

Limsa and Ul'dah expose a second, independent owner link in strict 0x20-byte
transform records. Their final word encodes
`(owner_instance_id << 8) | slot`. Decoding candidate owners 199, 222, 251,
and 265 produces **82** transform
records. This raises those four tuples above string-only adjacency: the binary
placement layer itself carries their instance IDs.

Gridania uses a different record representation in this section. Its compiled
scheduler bodies and structural owners remain proven, but bank transforms are
left unassigned rather than forcing the Limsa/Ul'dah decoder onto incompatible
records.

## Reproduction

```powershell
python tools/build_moonfire_hanabi_owner_atlas.py
python tools/build_moonfire_hanabi_executable_atlas.py
```

Outputs:

- `outputs\moonfire-hanabi-executable-atlas-20260712\hanabi_sedb_scheduler_chunks.csv`
- `outputs\moonfire-hanabi-executable-atlas-20260712\hanabi_sedb_structure_summary.csv`
- `outputs\moonfire-hanabi-executable-atlas-20260712\hanabi_cross_city_choreography.csv`
- `outputs\moonfire-hanabi-executable-atlas-20260712\hanabi_short_key_string_reuse.csv`
- `outputs\moonfire-hanabi-executable-atlas-20260712\hanabi_owner_transform_records.csv`
- `outputs\moonfire-hanabi-executable-atlas-20260712\hanabi_owner_transform_summary.csv`
- `outputs\moonfire-hanabi-executable-atlas-20260712\contract_summary.json`
