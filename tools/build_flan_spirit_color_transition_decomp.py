#!/usr/bin/env python3
"""Build the focused retail flan/Spirit color-transition evidence bundle."""

from __future__ import annotations

import csv
import hashlib
import re
import shutil
import struct
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / "outputs" / "flan-spirit-color-transition-decomp-20260831"
CLIENT = Path(r"C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV")

SOURCES = {
    "retail_executable": (
        ROOT / ".tmp" / "ffxivgame-ifrit.exe",
        "9341f2b4567440b310a4d494f5cc5599ca334ba51c8042247317ff466492f2e9",
    ),
    "m049_bid": (
        CLIENT / "client/chara/mon/m049/act/emp_emp/bid/base/0000",
        "cdc066b3af9f107eecbd39db3bd6457531f430420861ff80313aa00da8110c96",
    ),
    "m049_top_tex1": (
        CLIENT / "client/chara/mon/m049/equ/e001/top_tex1/0000",
        "0faadc602d3dad517859d0f90d633d1e5206ad683253cf475aa54157e22dfe97",
    ),
    "m508_bid": (
        CLIENT / "client/chara/mon/m508/act/emp_emp/bid/base/0000",
        "07ca77410e589eb4f8901d9bd4935105c68e9787f0abbc7a9176052858b32ee9",
    ),
    "man2g000": (
        CLIENT / "client/cut/man2g000/man2g000",
        "c895ce29d8f28246cfe9f6238e364754c82f1e003c43fd15289ec616f8b7cc19",
    ),
}

SECONDARY_SOURCES = {
    "scheduler_clips": ROOT
    / "outputs/monster-action-scheduler-contract-20260810/scheduler_clips.csv",
    "scheduler_resource_edges": ROOT
    / "outputs/monster-action-scheduler-contract-20260810/scheduler_resource_edges.csv",
    "m508_scenario_report": ROOT
    / "tmp/retail-m508-appearance-selector-20260822/README.md",
    "m508_asset_report": ROOT
    / "tmp/asset-m508-colorfade-agent/m508_appearance_effect_report.md",
    "m508_color_runs": ROOT
    / "tmp/asset-m508-colorfade-agent/m508_color_runs.csv",
    "man2g000_actor24_decomp": ROOT / "tmp/man2g000_actor24_decomp.txt",
}


def digest(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            h.update(chunk)
    return h.hexdigest()


def write_text(name: str, text: str) -> None:
    (OUT / name).write_text(text.rstrip() + "\n", encoding="utf-8")


def filter_csv(source: Path, target: str, predicate) -> int:
    with source.open("r", encoding="utf-8-sig", newline="") as handle:
        reader = csv.DictReader(handle)
        rows = [row for row in reader if predicate(row)]
        fields = reader.fieldnames or []
    with (OUT / target).open("w", encoding="utf-8", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields, lineterminator="\n")
        writer.writeheader()
        writer.writerows(rows)
    return len(rows)


def build_flan_resource_manifest() -> int:
    sys.path.insert(0, str(ROOT / "tools"))
    from build_garuda_tornado_decomp import (  # pylint: disable=import-outside-toplevel
        payload_tag,
        scb_clip_classes,
        sha256_bytes,
        walk_pwib_resources,
    )

    bank = SOURCES["m049_bid"][0].read_bytes()
    rows = []
    needles = (
        "msb4",
        "msb5",
        "msb6",
        "msn_004",
        "msn_005",
        "msn_006",
        "pur_mupt",
    )
    for layer, resource in walk_pwib_resources(bank):
        key = f"{layer} {resource.resource_id} {resource.resource_path}".lower()
        if not any(needle in key for needle in needles):
            continue
        control_classes = sorted(
            {
                literal.decode("ascii")
                for literal in re.findall(rb"[ -~]{8,}", resource.payload)
                if b"QixControl/Controls/" in literal
            }
        )
        rows.append(
            {
                "layer": layer,
                "index": resource.index,
                "resource_id": resource.resource_id,
                "resource_path": resource.resource_path,
                "payload_tag": payload_tag(resource.payload),
                "bytes": len(resource.payload),
                "sha256": sha256_bytes(resource.payload),
                "clip_classes": ";".join(scb_clip_classes(resource.payload))
                if resource.payload.startswith(b"SEDBSCB")
                else "",
                "control_classes": ";".join(control_classes),
            }
        )
    fields = list(rows[0])
    with (OUT / "04-flan-state-resource-manifest.csv").open(
        "w", encoding="utf-8", newline=""
    ) as handle:
        writer = csv.DictWriter(handle, fieldnames=fields, lineterminator="\n")
        writer.writeheader()
        writer.writerows(rows)
    return len(rows)


def build_flan_color_controls() -> tuple[int, int]:
    """Extract every serialized 0x402 color record from the three terminal VEFFs."""
    sys.path.insert(0, str(ROOT / "tools"))
    from build_garuda_tornado_decomp import (  # pylint: disable=import-outside-toplevel
        sha256_bytes,
        walk_pwib_resources,
    )

    bank = SOURCES["m049_bid"][0].read_bytes()
    resources = []
    rows = []
    needle = struct.pack("<I", 0x402)
    for layer, resource in walk_pwib_resources(bank):
        key = f"{layer} {resource.resource_id} {resource.resource_path}".lower()
        if not resource.payload.startswith(b"SEDBveff") or "pur_mupt" not in key:
            continue
        payload = resource.payload
        resources.append(resource)
        state = next(
            (value for value in ("pur_mupt1", "pur_mupt2", "pur_mupt3") if value in key),
            "",
        )
        start = 0
        while True:
            offset = payload.find(needle, start)
            if offset < 0:
                break
            if offset + 0x34 <= len(payload):
                floats = struct.unpack_from("<12f", payload, offset + 4)
                raw = payload[offset : offset + 0x34]
                rows.append(
                    {
                        "state": state,
                        "layer": layer,
                        "resource_id": resource.resource_id,
                        "resource_path": resource.resource_path,
                        "veff_sha256": sha256_bytes(payload),
                        "record_offset_hex": f"0x{offset:X}",
                        **{f"f{index:02d}": f"{value:.9g}" for index, value in enumerate(floats)},
                        "record_hex": raw.hex(" "),
                        "record_sha256": sha256_bytes(raw),
                    }
                )
            start = offset + 1

    fields = [
        "state",
        "layer",
        "resource_id",
        "resource_path",
        "veff_sha256",
        "record_offset_hex",
        *(f"f{index:02d}" for index in range(12)),
        "record_hex",
        "record_sha256",
    ]
    with (OUT / "07-flan-vfx-color-controls.csv").open(
        "w", encoding="utf-8", newline=""
    ) as handle:
        writer = csv.DictWriter(handle, fieldnames=fields, lineterminator="\n")
        writer.writeheader()
        writer.writerows(rows)
    return len(resources), len(rows)


def build_flan_material_palette() -> int:
    """Extract m049's six steady material colors and authored fade lengths."""
    sys.path.insert(0, str(ROOT / "tools"))
    from build_legacy_monster_bid_probe import (  # pylint: disable=import-outside-toplevel
        TYPE_MTB,
        parse_pwib,
    )

    _, resources = parse_pwib(SOURCES["m049_top_tex1"][0].read_bytes())
    mtbs = {
        resource.resource_id: resource
        for resource in resources
        if resource.resource_type == TYPE_MTB
    }
    elements = {
        1: "Fire",
        2: "Ice",
        3: "Lightning",
        4: "Wind",
        5: "Earth",
        6: "Water",
    }
    rows = []
    for state, element in elements.items():
        steady = mtbs[f"cbxs_st{state}"]
        transition = mtbs[f"cbxs_st0to{state}"]
        steady_header = struct.unpack_from("<I", steady.payload, 0x44)[0]
        transition_header = struct.unpack_from("<I", transition.payload, 0x44)[0]
        fps = struct.unpack_from("<f", transition.payload, transition_header + 0x10)[0]
        frames = struct.unpack_from("<f", transition.payload, transition_header + 0x14)[0]
        # The steady MTB's fixed material-A table begins at 0x12C. Property
        # ids 17/18/19 (records 13/14/15) are multiDiffuseColor X/Y/Z.
        diffuse = tuple(
            struct.unpack_from("<f", steady.payload, 0x12C + record * 12 + 8)[0]
            for record in (13, 14, 15)
        )
        rows.append(
            {
                "model_state": state,
                "element": element,
                "transition_motion": transition.resource_id,
                "steady_motion": steady.resource_id,
                "fps": f"{fps:.9g}",
                "transition_frames": f"{frames:.9g}",
                "transition_seconds": f"{frames / fps:.9g}",
                "multi_diffuse_r": f"{diffuse[0]:.9g}",
                "multi_diffuse_g": f"{diffuse[1]:.9g}",
                "multi_diffuse_b": f"{diffuse[2]:.9g}",
                "steady_mtb_bytes": len(steady.payload),
                "steady_mtb_sha256": hashlib.sha256(steady.payload).hexdigest(),
            }
        )

    with (OUT / "17-flan-material-state-palette.csv").open(
        "w", encoding="utf-8", newline=""
    ) as handle:
        writer = csv.DictWriter(handle, fieldnames=list(rows[0]), lineterminator="\n")
        writer.writeheader()
        writer.writerows(rows)
    return len(rows)


def build_spirit_color_controls() -> int:
    """Extract all 47 raw 0x402 records (the compact run view selects 45)."""
    sys.path.insert(0, str(ROOT / "tools"))
    from build_monster_action_scheduler_contract import (  # pylint: disable=import-outside-toplevel
        walk_pwib_resources,
    )

    bank = SOURCES["man2g000"][0].read_bytes()
    resource = next(
        resource
        for _, resource in walk_pwib_resources(bank)
        if resource.resource_id == "0J3FJQm508_appe"
    )
    payload = resource.payload
    physical_base = bank.find(payload)
    rows = []
    needle = struct.pack("<I", 0x402)
    start = 0
    while True:
        offset = payload.find(needle, start)
        if offset < 0:
            break
        if offset >= 0x4800 and offset + 0x34 <= len(payload):
            raw = payload[offset : offset + 0x34]
            floats = struct.unpack_from("<12f", payload, offset + 4)
            rows.append(
                {
                    "record_index": len(rows),
                    "resource_id": resource.resource_id,
                    "resource_path": resource.resource_path,
                    "veff_sha256": hashlib.sha256(payload).hexdigest(),
                    "record_offset_hex": f"0x{offset:X}",
                    "physical_offset_hex": f"0x{physical_base + offset:X}",
                    **{f"f{index:02d}": f"{value:.9g}" for index, value in enumerate(floats)},
                    "record_hex": raw.hex(" "),
                    "record_sha256": hashlib.sha256(raw).hexdigest(),
                }
            )
        start = offset + 1

    if len(rows) != 47:
        raise ValueError(f"expected 47 m508 0x402 records, found {len(rows)}")
    fields = [
        "record_index",
        "resource_id",
        "resource_path",
        "veff_sha256",
        "record_offset_hex",
        "physical_offset_hex",
        *(f"f{index:02d}" for index in range(12)),
        "record_hex",
        "record_sha256",
    ]
    with (OUT / "11-spirit-color-control-records.csv").open(
        "w", encoding="utf-8", newline=""
    ) as handle:
        writer = csv.DictWriter(handle, fieldnames=fields, lineterminator="\n")
        writer.writeheader()
        writer.writerows(rows)
    return len(rows)


README = r"""
# Retail flan and Spirit-of-the-Wood color-transition decompilation

## Result

The two effects are not one mechanism.

1. **m049 flans** expose a real model-state material route. Opcode `0x0144`
   byte `+4` carries the state word's low byte; m049 metadata partitions its
   low three bits as the `init_msnNNN` ordinal. An action-time
   `RaptureActionSubStatusSchKickClip` commits the queued state. The installed
   `m049/e001/top_tex1` bank proves the exact steady palette: 1 Fire, 2 Ice,
   3 Lightning, 4 Wind, 5 Earth, and 6 Water. Each neutral-to-element MTB is
   15 frames at 30 fps (0.5 s). This is separate from low-byte state bits
   4/5/6 and their `pur_mupt1/2/3` magic-power-up VEFFs.

2. **Spirit of the Wood (m508)** has no color-fade clip or `init_msn` state
   graph in its installed BID/WSS banks. The scenario presentation is in the
   `man2g000` cutscene package: actor 24 (`m508t0`, class `6000249`) runs an
   ActionClip at 0.44 s that resolves `c_c23_appr01`, then
   `1vgBedm508_appe -> 0J3FJQm508_appe`. Its QIX
   `ColorRGBABlink` graph performs the actual effect-local RGBA interpolation.

3. **BODYGEAR remains atomic.** The known D6/D7 appearance path swaps one
   resource selector and does not blend old/new models. Spirit's m508 element
   BODYGEAR values are genuine retail variants, but the visible authored
   transition is a separate effect. The current WSS7/magic-counter delay is
   emulator presentation code, not the retail color-transition asset.

4. **`RaptureCharaColorFadeClip` is real but is not used by either recovered
   target chain.** Its native runtime is included because it is the obvious
   false lead: it feeds a generic four-channel renderer controller through
   `0x0065EF60`, but neither the m049 state schedulers nor `man2g000` actor 24
   instantiate it.

## Bundle map

- `01-retail-actor-and-trigger-map.md` — identities, live server trigger,
  appearance variants, and evidence boundary.
- `02-flan-model-state-call-graph.md` — complete m049 publish/queue/kick/state
  graph and asset interpretation.
- `03-flan-model-state-native-decomp.txt` — Ghidra decompilation plus raw
  listings for packet handler, queue, drain, selector, and metadata gates.
- `04-flan-state-resource-manifest.csv` — exact nested m049 state resources.
- `05-flan-state-scheduler-clips.csv` — all `init_msn000..006` and
  `init_msb4/5/6` clip rows.
- `06-flan-state-resource-edges.csv` — exact ActionClip -> ACB -> VINS -> leaf
  -> VEFF edges.
- `07-flan-vfx-color-controls.csv` — every serialized 0x402/0x34-byte color
  control record from the three terminal magic-power-up VEFFs.
- `07-flan-state-source-strings.txt` — authored purine/magic-power-up tokens.
- `08-spirit-cutscene-and-qix-report.md` — complete m508 scenario effect report.
- `09-spirit-qix-native-decomp.txt` — ActionClip, ColorRGBALeaf,
  ColorRGBABlink, LeafLife, and LeafLifeEx runtime decompilations/listings.
- `10-spirit-appearance-asset-decomp.md` — physical offsets, hashes, RGBA
  controls, and timing clocks.
- `11-spirit-color-control-records.csv` — all 47 raw 0x402/0x34-byte records.
- `11-spirit-color-control-runs.csv` — compact view of the 15 three-record
  graph runs (the raw table also retains the two records this view omits).
- `12-man2g000-actor24-scb-decomp.txt` — actor-24 scheduler and RIDT evidence.
- `13-generic-chara-colorfade-native-decomp.txt` — complete native false-lead
  closure for `RaptureCharaColorFadeClip`.
- `14-negative-results-and-boundaries.md` — what was disproved and what is
  still capture-dependent.
- `15-implementation-handoff.md` — concrete emulator implications without
  converting inference into retail fact.
- `16-source-manifest.csv` — verified primary-source hashes.
- `17-flan-material-state-palette.csv` — exact m049 state/element mapping,
  transition timing, and steady `multiDiffuseColor` values.

The earlier appearance-dirty bundle remains authoritative for the atomic
D6/D7/BODYGEAR half of the graph and is referenced instead of duplicated.
"""


TRIGGER_MAP = r"""
# Retail actor and trigger map

## m049 flans / Prison Pudding

- Prison Pudding uses BNPC class `2303401`, base model `10049` (`m049`),
  size 2, BODYGEAR 1024.
- The Totorak director now rolls each Prison Pudding independently between
  lightning, wind, and fire, pairing the selected spell/absorption profile
  with m049 model states 3, 4, and 1 respectively.
- Retail m049 BID data exposes model states 0..6, while the installed e001
  `top_tex1` material bank identifies states 1..6 as Fire, Ice, Lightning,
  Wind, Earth, and Water. Toto-Rak can therefore pair its randomized Fire,
  Lightning, and Wind gameplay profiles with states 1, 3, and 4 exactly.

Primary server locations:

- `Data/scripts/directors/Occupancy/TotorakEncounter.lua`
- `Map Server/Actors/Chara/Npc/BattleNpc.cs`
- `Data/sql/gamedata_actor_appearance.sql`

## Spirit of the Wood

- Actor class `2105201` is
  `/Chara/Npc/Monster/Elemental/ElementalScenarioGridaniaLv20`.
- BNPC `1364` is `spirit_of_the_wood`; current skill list `5021` contains
  Aetherial Barrier `23152`.
- The live director starts Wind and rotates Wind -> Earth -> Water every
  30 seconds. The current implementation maps these to BODYGEAR
  `2080 -> 2112 -> 1088`, from neutral/scenario BODYGEAR 1120.
- Retail appearance rows also establish Fire 1024, Lightning 1056,
  Water 1088, scenario 1120, Ice 2048, Wind 2080, and Earth 2112 for m508.

Primary server locations:

- `Data/scripts/directors/Quest/QuestDirectorMan2g001.lua`
- `Data/scripts/quests/man/man2g0.lua`
- `Data/sql/gamedata_actor_class.sql`
- `Data/sql/server_battlenpc_mob_types.sql`
- `Data/sql/server_battlenpc_skill_list.sql`
- `Data/sql/gamedata_actor_appearance.sql`

## Retail evidence boundary

The asset graph proves how each presentation *can* run. It does not prove the
exact live-combat packet train for the Totorak elemental assignment or that
retail Spirit combat issued the same BODYGEAR sequence as the current server.
That final association needs a retail capture. The cutscene package does prove
the authored m508 appearance effect itself and its actor binding.
"""


FLAN_GRAPH = r"""
# m049 flan model-state call graph

```text
opcode 0x0144 / SetActorSubState payload
  +4..+5 = mode/state word
  -> concrete CharaActor packet handler 0x00662D30
     subtype 0x3B @ 0x006638A4
     -> 0x007B4440(actor+0x1110, word)
        queues type 3; does not launch a scheduler yet

action scheduler reaches RaptureActionSubStatusSchKickClip
  -> queue drain 0x007BF2E0 (alternate drain includes 0x007BF5F8)
     -> 0x007A82F0(actor+0xB80, new mask)
        changed = old XOR new
        gate A: 0x0065BE50 -> metadata +0x35 state count
        gate B: 0x0065C550 -> metadata +0x3B supported mask
        for each changed supported bit N:
          set   -> init_msbN_1
          clear -> init_msbN_0
          lookup under active model resource root
          create scheduler and retain handle at component +0x24+4*N
```

Direct call closure also includes the immediate thunk at `0x007ABED0`, reset
path containing callsite `0x007BB8E2`, and alternate drain containing
`0x007BF5F8`. Full bodies and listings are in
`03-flan-model-state-native-decomp.txt`.

## Exact m049 states

| bit | mode mask | on scheduler | off scheduler | on ActionClip target | terminal VEFF |
|---:|---:|---|---|---|---|
| 4 | `0x10` | `init_msb4_1` | `init_msb4_0` | `msn_004_1` | `pur_mupt1` |
| 5 | `0x20` | `init_msb5_1` | `init_msb5_0` | `msn_005_1` | `pur_mupt2` |
| 6 | `0x40` | `init_msb6_1` | `init_msb6_0` | `msn_006_1` | `pur_mupt3` |

Each on scheduler is 80,000 units (0.08 s): ActionClip at 0, chant sync at
0.01 s, then sound/effect-end at 0.02 s. The nested ACB blocks are 0.15 s,
0.18 s, and 0.20 s for `pur_mupt1`, `pur_mupt2`, and `pur_mupt3`
respectively. Each off scheduler is 20,000 units (0.02 s) and cancels
chant/effect state. The terminal authored paths are:

```text
D:/gra_rapture/vfx/mon/purine_m049/0006_mahoryoku_up/pur_mupt1t.veff
D:/gra_rapture/vfx/mon/purine_m049/0007_mahoryoku_up_lv02/pur_mupt2t.veff
D:/gra_rapture/vfx/mon/purine_m049/0008_mahoryoku_up_lv03/pur_mupt3t.veff
```

`mahoryoku_up` means magic-power-up; the three resources are increasing
levels, not self-labeling elemental colors. Do not assign lightning/wind/fire
from their ordinal alone.

The terminal VEFFs instantiate `ColorRGBABlink`, `ColorRGBALeaf`/`LeafEx`,
glow, and spark controls. Those are effect-local VFX controls; they are not a
BODYGEAR dye or a material replacement on the flan model. Their complete raw
0x402 color-control records are in `07-flan-vfx-color-controls.csv`: four for
level 1, eight for level 2, and sixteen for level 3, each laid out contiguously
at the serialized 0x34-byte stride.

## Low-byte elemental material state

Opcode `0x0144` payload byte `+4` carries the state word's low byte. The
model metadata split count partitions its low bits as the `init_msn%03u`
ordinal; m049 uses three ordinal bits and provides
`init_msn000..006`, and the e001 `top_tex1` bank resolves those schedulers to
the following material-transform motions:

| state | element | neutral transition | steady motion | `multiDiffuseColor` |
|---:|---|---|---|---|
| 1 | Fire | `cbxs_st0to1` | `cbxs_st1` | `(0.75, 0.237675, 0.075)` |
| 2 | Ice | `cbxs_st0to2` | `cbxs_st2` | `(1.155, 1.535205, 1.75)` |
| 3 | Lightning | `cbxs_st0to3` | `cbxs_st3` | `(0.626487, 0.441, 0.7)` |
| 4 | Wind | `cbxs_st0to4` | `cbxs_st4` | `(0.15, 0.75, 0.3523)` |
| 5 | Earth | `cbxs_st0to5` | `cbxs_st5` | `(1.1, 0.8426, 0.242)` |
| 6 | Water | `cbxs_st0to6` | `cbxs_st6` | `(0.21, 0.512833, 1.0)` |

Every neutral transition advertises 15 frames at 30 fps, or 0.5 seconds.
These are material animations, despite the historical `cbxs` motion naming.
They are not the low-byte bit-4/5/6 `pur_mupt` packages.

## Required publication semantics

Writing `breakage` at payload byte 0 queues type 2 and cannot reach this
selector. Byte `+4` is the low state byte: metadata divides it between the
`init_msnNNN` ordinal and any remaining `init_msb` flags. Byte `+5` is the
reserved high byte and does not select m049's ordinal. A real action scheduler containing
`RaptureActionSubStatusSchKickClip` must subsequently commit the queued state.
The model must be loaded and advertise the selected state in metadata or the
selector deliberately does nothing.
"""


NEGATIVE = r"""
# Negative results and interpretation boundaries

## Disproved shortcuts

- D6/D7 BODYGEAR does not interpolate. It defers a single requested bank,
  compares one encoded resource selector, invalidates the prior cache, and
  installs the new resource.
- m508 WSS7 is `magic_counter`/Aetherial Barrier. It has no
  `RaptureCharaColorFadeClip` and no m508 appearance VEFF.
- Every installed m508 WSS1..8 and BID scheduler has zero color-fade clips;
  m508 BID also has no `init_msn` model-state family.
- The abandoned `beckon_element_fade` overlay injected a generic color-fade
  clip around WSS7/WSS8, but it was committed as “No Luck” and removed. It
  should remain a recorded negative result, not be restored as retail logic.
- `RaptureCharaColorFadeClip` is globally registered and functional, but no
  recovered m049 or Spirit scheduler instantiates it.
- The m049 `pur_mupt1/2/3` names prove magic-power-up levels, not a
  lightning/wind/fire order. The elemental order comes from the separate
  low-byte `init_msn` material-transform resources.

## Still capture-dependent

- Totorak's exact retail packet/action ordering. The state-to-element mapping
  itself is closed by the installed material bank.
- Spirit's live-combat BODYGEAR publication order. The current server's
  1120/2080/2112/1088 sequence is plausible and asset-backed, but not proven
  as a captured retail packet train.
- The final QIX output-to-specific-render-material setter after
  `ColorRGBABlink self+0x40` / `ColorRGBALeaf self+0x10`. The interpolation
  math and effect binding are proven; this last renderer edge is not named.
- The visible duration of the m508 effect cannot be reduced to one clock:
  SCB start 0.44 s, SCB block 1.95 s, ACB block 2.5 s, repeated VEFF layer
  envelope 300,000 units, and LeafLife's 150,000 interval have distinct
  native roles.
"""


HANDOFF = r"""
# Implementation handoff

## Flans

The native route is the low-byte `SetActorSubState.mode` plus an
action-time SubStatusKick, not BODYGEAR, humanoid COLORINFO, or the low-byte
magic-power-up mode bits.

1. Keep gameplay absorption/spell profiles independent from presentation.
2. Publish state 1 for Fire, 2 Ice, 3 Lightning, 4 Wind, 5 Earth, or 6 Water
   in opcode-0x0144 payload byte `+4`; keep byte `+5` zero.
3. Commit it with m049 WSS5 (`0x13005000`), whose scheduler contains
   `RaptureActionSubStatusSchKickClip`; the command id can remain zero when
   this is presentation-only.
4. Publish the chosen state in the actor's initial substate packet so late
   viewers bind to the same persistent material state.
5. For m049, values 1-6 occupy the metadata-defined low ordinal bits. Other
   models can partition the same byte differently and use remaining bits for
   `init_msb` state, so do not generalize m049's ordinal mapping globally.

## Spirit of the Wood

Keep the atomic BODYGEAR variant selection, but replace the guessed WSS7 cover
with a presentation modeled after the authored scenario chain:

```text
c_c23_appr01 ACB
  -> 3ZjARPvleafinst
  -> 1vgBedm508_appe
  -> 0J3FJQm508_appe
  -> ColorRGBABlink / ColorRGBALeaf / LeafLife
```

If the server cannot request the original scenario ACB directly, emulate it
as a separate effect around the atomic variant change. Preserve the complete
0x34-byte color-control records; they include curve/tangent data and are not
equivalent to a guessed single from/to RGBA pair.

Do not infer a BODYGEAR delay from the cutscene clocks. The appearance packet
and the QIX presentation are separate native systems.

## Reuse

The exact packet handler, queue, selector, QIX math, generic color-fade false
lead, resource hashes, and scheduler edges are now in this bundle. Remaining
work should be runtime capture or server integration, not another broad static
scan of the same binaries.
"""


def main() -> None:
    OUT.mkdir(parents=True, exist_ok=True)
    manifest = []
    for label, (path, expected) in SOURCES.items():
        if not path.is_file():
            raise FileNotFoundError(path)
        actual = digest(path)
        if actual != expected:
            raise ValueError(f"{label} hash mismatch: {actual} != {expected}")
        manifest.append(
            {
                "source": label,
                "path": str(path),
                "bytes": path.stat().st_size,
                "sha256": actual,
            }
        )
    for label, path in SECONDARY_SOURCES.items():
        if not path.is_file():
            raise FileNotFoundError(path)
        manifest.append(
            {
                "source": label,
                "path": str(path),
                "bytes": path.stat().st_size,
                "sha256": digest(path),
            }
        )

    write_text("00-README.md", README)
    write_text("01-retail-actor-and-trigger-map.md", TRIGGER_MAP)
    write_text("02-flan-model-state-call-graph.md", FLAN_GRAPH)
    resource_count = build_flan_resource_manifest()
    color_resources, color_records = build_flan_color_controls()
    material_states = build_flan_material_palette()

    clips = filter_csv(
        ROOT / "outputs/monster-action-scheduler-contract-20260810/scheduler_clips.csv",
        "05-flan-state-scheduler-clips.csv",
        lambda row: row["bank_relative_path"]
        == "mon/m049/act/emp_emp/bid/base/0000"
        and row["scheduler_ordinal"] in {str(value) for value in range(12, 25)},
    )
    edges = filter_csv(
        ROOT
        / "outputs/monster-action-scheduler-contract-20260810/scheduler_resource_edges.csv",
        "06-flan-state-resource-edges.csv",
        lambda row: row["bank_relative_path"]
        == "mon/m049/act/emp_emp/bid/base/0000"
        and row["scheduler_ordinal"] in {"20", "22", "24"},
    )

    write_text(
        "07-flan-state-source-strings.txt",
        """m049 BID SHA-256: cdc066b3af9f107eecbd39db3bd6457531f430420861ff80313aa00da8110c96

D:/gra_rapture/vfx/mon/purine_m049/0006_mahoryoku_up/pur_mupt1t.veffbin
D:/gra_rapture/vfx/mon/purine_m049/0007_mahoryoku_up_lv02/pur_mupt2t.veffbin
D:/gra_rapture/vfx/mon/purine_m049/0008_mahoryoku_up_lv03/pur_mupt3t.veffbin
d:/gra_rapture/vfx/mon/purine_m049/0006_mahoryoku_up/pur_mupt1t.veff
d:/gra_rapture/vfx/mon/purine_m049/0007_mahoryoku_up_lv02/pur_mupt2t.veff
d:/gra_rapture/vfx/mon/purine_m049/0008_mahoryoku_up_lv03/pur_mupt3t.veff

init_msb4_0 init_msb4_1 msn_004_1 pur_mupt1
init_msb5_0 init_msb5_1 msn_005_1 pur_mupt2
init_msb6_0 init_msb6_1 msn_006_1 pur_mupt3
init_msn000 init_msn001 init_msn002 init_msn003 init_msn004 init_msn005 init_msn006
""",
    )

    report_source = SECONDARY_SOURCES["m508_scenario_report"]
    report = report_source.read_text(encoding="utf-8")
    report = report.replace(
        "../asset-m508-colorfade-agent/m508_color_runs.csv",
        "11-spirit-color-control-records.csv",
    ).replace(
        "../asset-m508-colorfade-agent/m508_appearance_effect_report.md",
        "10-spirit-appearance-asset-decomp.md",
    )
    report = report.replace(
        "[m508_color_runs.csv](11-spirit-color-control-records.csv)",
        "[11-spirit-color-control-records.csv](11-spirit-color-control-records.csv)",
    )
    for old in (
        "../qix-colorblink-runtime-agent/REPORT.md",
        "../colorblink-vtable-material-local.md",
        "../native-colorfade-launch-agent/FINAL_NATIVE_COLORFADE_LAUNCH.md",
        "../appearance-dirty-followup-agent/REPORT.md",
        "../m508_colorfade_raw.txt",
        "../scenario-2105201-agent/scenario-trace.md",
    ):
        report = report.replace(old, f"../../tmp/{old[3:]}")
    write_text("08-spirit-cutscene-and-qix-report.md", report)

    spirit_color_records = build_spirit_color_controls()
    copies = (
        (
            SECONDARY_SOURCES["m508_asset_report"],
            "10-spirit-appearance-asset-decomp.md",
        ),
        (SECONDARY_SOURCES["m508_color_runs"], "11-spirit-color-control-runs.csv"),
        (
            SECONDARY_SOURCES["man2g000_actor24_decomp"],
            "12-man2g000-actor24-scb-decomp.txt",
        ),
    )
    for source, target in copies:
        if not source.is_file():
            raise FileNotFoundError(source)
        shutil.copyfile(source, OUT / target)

    write_text("14-negative-results-and-boundaries.md", NEGATIVE)
    write_text("15-implementation-handoff.md", HANDOFF)

    with (OUT / "16-source-manifest.csv").open(
        "w", encoding="utf-8", newline=""
    ) as handle:
        writer = csv.DictWriter(
            handle, fieldnames=["source", "path", "bytes", "sha256"], lineterminator="\n"
        )
        writer.writeheader()
        writer.writerows(manifest)

    print(
        f"wrote {OUT} ({resource_count} flan resources, {clips} clip rows, "
        f"{edges} resource edges, {color_records} color records from "
        f"{color_resources} terminal VEFFs, {spirit_color_records} Spirit "
        f"color records, {material_states} flan material states)"
    )


if __name__ == "__main__":
    main()
