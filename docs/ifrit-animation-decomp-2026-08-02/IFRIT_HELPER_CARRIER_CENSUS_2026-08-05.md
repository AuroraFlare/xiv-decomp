# Ifrit helper/carrier census

Audit date: 2026-08-05

## Result

The recovered actor-class and appearance tables contain **no Ifrit-class actor
whose appearance loads base 10999 / m999**.

This closes an important ambiguity in the Plume and Eruption work:

- `2207310 IfritHotAir` is a named Ifrit helper, but its appearance uses shared
  base `1255`, HEAD `1024`, BODY `0`. There is no installed `m255` model
  directory, and no recovered selector proves that base `1255` aliases m999.
- `2207304`, `2207305`, and `2207312 IfritDummy` use the same base-1255 shape.
- `2207314 IfritDummy` is not invisible m999. It is full `m852` Ifrit with
  HEAD `2048`, BODY `1024`.
- `2207306`, `2207307`, `2207313`, and `2207315 IfritAnchor` are the `m524`
  Infernal Nail family, not generic effect anchors.
- Appearance `1001481` is an exact m999/e001-compatible carrier—base `10999`,
  size `2`, HEAD `0`, BODY `1024`—but its actor-class path is blank. It is a
  valid visual donor/probe appearance, not a statically proved retail Ifrit
  helper.

Therefore the static data supports two separate statements:

1. An exact m999/e001 carrier can render the recovered Plume/Eruption states.
2. The exact actor class Square Enix spawned or reused during the retail Ifrit
   fight remains unproved by the recovered class tables.

Those statements must not be collapsed into “IfritHotAir is m999.”

## 1. Exhaustive join

The census parses all 7,831 appearance records and all 7,984 recovered
actor-class records, then joins every actor whose class path contains
`/Monster/Ifrit/`.

| actor family | count | base / equipment |
| --- | ---: | --- |
| old and current Ifrit body rows | 10 | base `10852` / m852; either HEAD `0` or `2048`, BODY `1024` |
| named Dummy/HotAir helper rows | 4 | base `1255`, HEAD `1024`, BODY `0` |
| Infernal Nail/Anchor rows | 4 | base `10524` / m524, HEAD `2048`, BODY `1024` |
| Ifrit-class m999 rows | **0** | none |

The 18 exact joined records are in `ifrit_actor_family.csv`.

### Ifrit-class rows by role

| ID(s) | class | appearance conclusion |
| --- | --- | --- |
| `2107301`, `2107302`, `2207301..3`, `2207308`, `2207309`, `2207311` | `IfritNormal` | m852 Ifrit |
| `2107303` | `IfritAnchor` | m852 Ifrit, not a Nail in the older ID set |
| `2207304`, `2207305`, `2207312` | `IfritDummy` | shared base 1255 helper shape |
| `2207310` | `IfritHotAir` | shared base 1255 helper shape |
| `2207314` | `IfritDummy` | full m852 Ifrit |
| `2207306`, `2207307`, `2207313`, `2207315` | `IfritAnchor` | m524/e002 Infernal Nail |

## 2. Base 10999 is generic, not Ifrit-named

The installed appearance table contains 715 base-10999 rows:

- 708 have the exact m999/e001 shape: size `2`, HEAD `0`, BODY `1024`;
- 550 of those exact-shape rows have a blank class path;
- 158 exact-shape rows have a nonempty class path;
- **zero** nonempty class paths belong to the Ifrit monster family.

The nonempty rows are dominated by generic populace and invisible object/event
roles. The largest groups include 101 `PopulaceStandard` rows and 21
`ObjectEventDoor` rows. That population is consistent with m999 being a
generic invisible/resource carrier. It does not identify a unique Eruption or
Plume owner.

Seven base-10999 rows use other equipment shapes; none is an Ifrit class.

## 3. What the recovered retail Lua does—and does not—prove

The decompiled client actor scripts add no combat scheduler selection:

```text
IfritDummy   -> subclass IfritBaseClass; map marker hidden
IfritHotAir  -> subclass IfritBaseClass; map marker hidden
IfritAnchor  -> subclass only
IfritNormal  -> subclass only
IfritBaseClass -> MonsterBaseClass
```

The decompiled `InstanceRaidNormalIfrit` and `InstanceRaidHyperIfrit` director
classes are also empty subclasses. `InstanceRaidLesserIfrit` only adds the
`GC010105` start cutscene. Consequently, neither the class scripts nor these
thin client director classes supply a hidden Plume coordinate array, Eruption
target snapshot, state mask, or m999 appearance substitution.

This agrees with the independent structural scan of the Bowl layout: the
arena tile has no placed Plume array, Eruption rig, or Nail marker set.

## 4. Two render-capable paths remain

### Native m999/e001 donor path—best visibility probe

Use exact appearance `1001481`, or explicitly reproduce its packet appearance:

```text
base 10999
size 2
HEAD 0
BODY 1024
```

Then use opcode `0x0144` **mode**, followed by a genuine SubStatusKick:

| effect | mode edge | committed state |
| --- | --- | --- |
| one localized Radiant Plume | `0 -> 0x10` | m999 `init_msb4_1 -> msb4` |
| Eruption pre-impact formation | `0 -> 0x20` | m999 `init_msb5_1 -> msb5` |

Mapped command `23595` / WSS4 contains the required generic
`RaptureActionSubStatusSchKickClip`. Clearing mode to zero and kicking again
runs the corresponding off scheduler.

This path is **confirmed resource-compatible**, but appearance `1001481` is
not statically identified as the retail Ifrit helper.

### Canonical m852 import path—real Ifrit-class candidate

The full m852 package imports byte-identical Kuroko art:

| effect | m852 mode | imported resource |
| --- | ---: | --- |
| Eruption warning | `0x20` | `init_msb5_*`, byte-identical to native m999 |
| Radiant Plume | `0x80` | `init_msb7_*`, whose payload is byte-identical to native m999 state 4 |

Actor `2207314` gives a recovered Ifrit-class owner with that canonical m852
appearance. It is therefore a real static-data candidate for retail ownership,
but it carries the visible Ifrit body. A live actor-create/state capture is
still required to prove whether retail hid, culled, or otherwise used such a
proxy at the target coordinate.

## 5. Implementation consequence

For the next visibility test, do not use `2207310`'s default appearance and do
not send another standalone `!playanimation` request. The test must create an
owner with a compatible model-resource root, send the state through the
opcode-`0x0144` `mode` field, and execute the SubStatusKick that commits it.

The lowest-risk sequence remains:

```text
Plume:
spawn exact m999/e001 owner at one plume origin
-> mode 0x10
-> command 23595 / WSS4 kick
-> hold for mechanic window
-> mode 0 + WSS4 kick

Eruption:
snapshot target coordinate
-> spawn exact m999/e001 owner there
-> mode 0x20
-> command 23595 / WSS4 kick
-> hold for the roughly 3-second cast
-> mode 0 + WSS4 kick
-> m999 WSS3 / command 23594 impact at the same frozen coordinate
```

Neither path requires the player to target Ifrit. Ownership and world position
come from the helper actor.

## 6. What remains unconfirmed

Only dynamic evidence can now close the retail-owner identity:

- an actor-create packet for a stationary helper during Eruption or Plume;
- an appearance/equipment update that changes an existing Ifrit-class actor's
  active model-resource root;
- or an opcode-`0x0144` state edge on an already-present hidden proxy.

The decisive capture window is still 500 ms before cast begin through one
second after WSS3 impact, logging actor create/delete, opcode `0x0144`, active
resource root, requested `init_msb*` name, scheduler owner, and world transform.

## Reproduction artifacts

Generator:

`tools/build_ifrit_helper_carrier_census.py`

Outputs:

- `tools/outputs/ifrit-helper-carrier-census-20260805/ifrit_actor_family.csv`
- `tools/outputs/ifrit-helper-carrier-census-20260805/selected_base_carriers.csv`
- `tools/outputs/ifrit-helper-carrier-census-20260805/m999_candidate_rows.csv`
- `tools/outputs/ifrit-helper-carrier-census-20260805/base_model_census.csv`
- `tools/outputs/ifrit-helper-carrier-census-20260805/summary.json`

Input SHA-256:

- `Data/sql/gamedata_actor_appearance.sql`:
  `bf46cc9438b1a2ea1850b0b856519a952b00058973661453a30e06028e21c015`
- `Data/sql/gamedata_actor_class.sql`:
  `a981149eb3f00997b7c4df09dc60cba59e76685d6a732367bae9b82c14c489c5`
