# Moonfire hanabi owner datamine (2026-07-12)

## Result

The root-layout string structure supplies a reproducible owner candidate for
both resident hanabi banks in every city. In all **6**
cases, the bank marker begins exactly 13 bytes after a serialized `isgrp` name;
the next `isgrp` follows the complete bank definition. The candidate tuples are:

| city | root layout | bank 1 | bank 2 |
| --- | ---: | ---: | ---: |
| Gridania | 103 | 41 | 62 |
| Limsa Lominsa | 101 | 199 | 222 |
| Ul'dah | 104 | 251 | 265 |

These are high-confidence **DAT structural owners**, not authenticated retail
spawn rows. The local `server_eventnpc_mapobj` table has zero bindings for root
layouts 101, 103, or 104, and none of the three `MapObjFireworks` actor classes
has a local spawn row.

## Five-key, two-bank contract

The Limsa and Ul'dah timeline inventory is ten full names per city but only five
runtime suffixes: `vtp1..vtp5`. Every suffix is replicated in
`time_vfx_hanabi_vtp#` and `time_vfx_hanabi2_vtp#`. This proves a
five-variant-by-two-bank contract; it does **not** prove that one call on one
owner globally launches both banks. The six distinct structural owners instead
make same-suffix dispatch to two bank-local owners a viable reconstruction.

Gridania retains the same five short keys and both VFX banks, but its ten
expanded `time_vfx_*` names are absent from the entire installed DAT corpus.
That makes Gridania an especially useful negative/compatibility probe: the bank
data survives, but full-name timeline metadata does not.

## Placement and controller closure

All **287** validated installed
`MapLayoutResourceData` files were scanned for little-endian actor-class IDs
5900036, 5900037, and 5900038. There are **0**
hits. This closes the idea that a surviving installed layout directly embeds
the missing Fireworks actor placement.

The three actor classes all map to the same `MapObjFireworks` Lua class and the
script never branches on actor-class ID. They are behaviorally equivalent in
the recovered code. More importantly, that script is a Hatching-tide controller:
it emits `v_l#`, `v_c#`, and `v_r#` at night, not Moonfire `vtp#`. It can serve
as an experimental scheduler-owning actor, but it is not evidence for the
retail Moonfire controller.

## Probe interpretation

The candidate queue deliberately uses actor class 5900036 because all three
class IDs share one code path. Bind a temporary object to the root layout and
candidate instance, target it, then send `vtp1..vtp5`. A visible result proves
the tuple can own and execute that bank on this client. It does **not** prove
the same actor class, timing, or instance was used by retail.

Run the probes outside the Hatching night loop when possible: `MapObjFireworks`
will independently emit egg schedulers at night, which can confound observation.

## Reproduction

```powershell
python tools/build_moonfire_hanabi_owner_atlas.py
```

Outputs:

- `outputs\moonfire-hanabi-owner-atlas-20260712\hanabi_group_owner_neighborhoods.csv`
- `outputs\moonfire-hanabi-owner-atlas-20260712\hanabi_runtime_token_fanout.csv`
- `outputs\moonfire-hanabi-owner-atlas-20260712\root_layout_binding_gap.csv`
- `outputs\moonfire-hanabi-owner-atlas-20260712\mapobj_fireworks_class_equivalence.csv`
- `outputs\moonfire-hanabi-owner-atlas-20260712\maplayout_actor_class_scan.csv`
- `outputs\moonfire-hanabi-owner-atlas-20260712\owner_probe_candidates.csv`
- `outputs\moonfire-hanabi-owner-atlas-20260712\contract_summary.json`
