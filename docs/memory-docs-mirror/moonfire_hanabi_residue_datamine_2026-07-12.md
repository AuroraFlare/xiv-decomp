# Moonfire hanabi-residue datamine (2026-07-12)

## Result

The final client retains a complete, symmetric **asset layer** for city
fireworks: every capital root has nine `vfx_hanabi1..9` groups,
**27** groups total. Each city contributes 104
serialized component entries and 40 unique dependency DATs, for
**312** entries and
**120** city-local dependencies.

This is strong positive evidence that an all-city authored hanabi/firework pack
survives alongside `8029/wtr_smmr`. It is not yet proof of a complete current
Moonfire activation path.

## Scheduler residue and controller gap

Limsa and Ul'dah each retain ten `time_vfx_hanabi*_vtp1..5` timelines;
Gridania retains the nine VFX groups but no matching timeline definitions.
An exact scan of every installed DAT finds this family only in those two city
roots: **2** DATs and
**20** unique DAT/token rows.
Across **2517** recovered Lua files, there
are **17** generic BG-scheduler callers
but zero `vtp1..5` literals. The only seasonal fireworks-named caller,
`MapObjFireworks`, emits Hatching-tide `v_l#/v_c#/v_r#` tokens instead.
The original **2517** compiled Lua files
independently produce the same result: 17 scheduler callers, zero `vtp1..5`,
zero `hanabi`, and zero `smmr` literals. This is not a decompiler omission.

The strongest reconstruction is therefore:

- `8029` owns the all-city Moonfire atmosphere.
- All three roots retain city-specific hanabi assets.
- Limsa/Ul'dah retain `vtp` timeline metadata; Gridania does not retain matching
  metadata anywhere in the installed DAT corpus.
- No client Lua controller survives. That does not imply a missing client
  capability: `ffxivgame.exe` retains the native `_runBgScheduler` and
  `_runBgSchedulerFromMidstream` event-function bridges.

## Native timeline and server-dispatch boundary

MSVC RTTI reconstructs both `RaptureTimeLineBaseObject` and its engine base,
each with a 32-entry primary vtable. The Rapture map-layout class overrides four
slots (0, 10, 18, and 19). This confirms that the resident `time_vfx_*` records
are executable client timeline objects, not passive labels.

The remaining trigger can legitimately be server-side. Server-to-client opcode
`0x0130` carries an owner actor, an arbitrary function name, and Lua parameters.
The local packet-shaped probe already uses it to call
`_runBgSchedulerFromMidstream` with the scheduler token supplied as packet data.
Retail could therefore have sent `vtp1..5` without those strings ever existing
in client Lua.

The corrected gap is the **retail-authenticated owner binding and orchestration
schedule**, not the Limsa/Ul'dah client playback capability. A native automatic
trigger is also not formally excluded, but server-supplied dispatch is now a
directly proven architectural path.

The root string structure now narrows the owner gap to six concrete DAT
candidates. Both hanabi banks in every city begin exactly 13 bytes after a
serialized `isgrp`: Gridania root layout 103 has instances 41 and 62, Limsa
root layout 101 has 199 and 222, and Ul'dah root layout 104 has 251 and 265.
The next `isgrp` consistently follows the completed bank definition. These are
high-confidence structural owners, but not authenticated retail spawn rows.

The ten Limsa/Ul'dah full timeline names also reduce to a five-variant-by-two-bank
contract: both bank-local families share suffixes `vtp1..vtp5`. This does not
prove that one owner call globally launches both banks; the separate owner
candidates make same-suffix dispatch to two owners equally viable. Gridania
retains all five short keys and both banks despite lacking the expanded timeline
names.

No local SQL map-object row binds root layouts 101, 103, or 104. A scan of all
287 validated installed `MapLayoutResourceData` files also finds zero embedded
little-endian references to actor classes 5900036-5900038. The placement record
is genuinely absent from the installed/local-server corpus. See
`docs/moonfire_hanabi_owner_datamine_2026-07-12.md`.

The executable-body pass corrects the Gridania gap further. Every root contains
eight hanabi-bearing compiled `SEDBSCB` scheduler bodies—four per bank—with the
same size fingerprint, controlled-actor-count fingerprint, and internal marker
grammar. All 24 raw and ASCII-normalized hashes are city-specific. Gridania
therefore retains locally authored compiled scheduler bodies; it is the expanded
`time_vfx_*` naming/lookup layer that is absent.

The placement binary also independently carries four of the candidate owners.
Limsa instances 199/222 and Ul'dah instances 251/265 decode from 82 strict
0x20-byte transform records whose final word is `(owner_instance << 8) | slot`.
Gridania uses a different record encoding and is deliberately left unresolved.
See `docs/moonfire_hanabi_executable_datamine_2026-07-12.md`.

The compiled bodies also recover the shared choreography. All eight primitives
use a 9,000,000-unit envelope and 6,000,000-unit active block, consistent with
nine and six seconds respectively. Every corresponding timing-word sequence is
identical across all three cities. Bank-one entry counts are `3/5/5/6`; bank-two
counts are `7/7/8/7`. Four primitives per bank cannot map one-to-one onto five
`vtp` keys, so the missing higher timeline layer must select or compose them.

Repository history does not supply the missing historical patch either. There
is only **1** committed
`MapObjFireworks` version. A header-validated scan of
**12530** unreachable Git blobs finds zero
alternate controller source, compiled Lua controller, or
`MapLayoutResourceData` artifact carrying `vtp`. Textual hits are generated
reports/tools from this investigation, not archived game payloads.

There are zero `8029` selector masks in the root layouts, so the hanabi layer is
not weather-switched directly. Retail orchestration coordinated weather with a
separate timeline/controller lane, but this snapshot does not establish whether
that trigger was server-supplied, native/automatic, or entirely removed.

## Reproduction

```powershell
python tools/build_moonfire_hanabi_residue_atlas.py
```

Outputs:

- `outputs/moonfire-hanabi-residue-atlas-20260712/moonfire_hanabi_city_root_summary.csv`
- `outputs/moonfire-hanabi-residue-atlas-20260712/moonfire_hanabi_component_entries.csv`
- `outputs/moonfire-hanabi-residue-atlas-20260712/moonfire_hanabi_scheduler_tokens.csv`
- `outputs/moonfire-hanabi-residue-atlas-20260712/installed_hanabi_scheduler_locations.csv`
- `outputs/moonfire-hanabi-residue-atlas-20260712/moonfire_hanabi_controller_gap.csv`
- `outputs/moonfire-hanabi-residue-atlas-20260712/native_timeline_rtti.csv`
- `outputs/moonfire-hanabi-residue-atlas-20260712/native_timeline_vtable_overrides.csv`
- `outputs/moonfire-hanabi-residue-atlas-20260712/moonfire_dispatch_boundary.csv`
- `outputs/moonfire-hanabi-residue-atlas-20260712/moonfire_git_history_gap.csv`
- `outputs/moonfire-hanabi-residue-atlas-20260712/moonfire_activation_lanes.csv`
- `outputs/moonfire-hanabi-residue-atlas-20260712/contract_summary.json`
- `outputs/moonfire-hanabi-owner-atlas-20260712/hanabi_group_owner_neighborhoods.csv`
- `outputs/moonfire-hanabi-owner-atlas-20260712/hanabi_runtime_token_fanout.csv`
- `outputs/moonfire-hanabi-owner-atlas-20260712/root_layout_binding_gap.csv`
- `outputs/moonfire-hanabi-owner-atlas-20260712/mapobj_fireworks_class_equivalence.csv`
- `outputs/moonfire-hanabi-owner-atlas-20260712/maplayout_actor_class_scan.csv`
- `outputs/moonfire-hanabi-owner-atlas-20260712/owner_probe_candidates.csv`
- `outputs/moonfire-hanabi-owner-atlas-20260712/contract_summary.json`
- `outputs/moonfire-hanabi-executable-atlas-20260712/hanabi_sedb_scheduler_chunks.csv`
- `outputs/moonfire-hanabi-executable-atlas-20260712/hanabi_sedb_structure_summary.csv`
- `outputs/moonfire-hanabi-executable-atlas-20260712/hanabi_cross_city_choreography.csv`
- `outputs/moonfire-hanabi-executable-atlas-20260712/hanabi_short_key_string_reuse.csv`
- `outputs/moonfire-hanabi-executable-atlas-20260712/hanabi_owner_transform_records.csv`
- `outputs/moonfire-hanabi-executable-atlas-20260712/hanabi_owner_transform_summary.csv`
- `outputs/moonfire-hanabi-executable-atlas-20260712/contract_summary.json`
