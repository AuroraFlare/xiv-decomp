# Garuda rock client inventory and tower ground check, 2026-09-20

Scope: original FFXIV 1.x Howling Eye stone towers. Sources are the installed
1.23b client at `C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV`, main-SQL
appearance/class rows, `Data/scripts/directors/InstanceRaid/GarudaEncounter.lua`
and `Data/quicknavmesh/zone_239.tsv`. No server, client, SQL or encounter file
was modified by this pass.

## 1. Installed m526 file inventory

`client/chara/mon/m526` holds 11 resource files (extensionless, as shipped):

| Resource | Bytes | SHA-256 |
|---|---:|---|
| `act/emp_emp/bid/base/0000` | 44448 | `23E5A6FA702023A5F9D94DE5D96C12AB5335E8ACA2C39F44DA6F61274DE50A7A` |
| `act/emp_emp/wss/base/0001` | 250512 | not rehashed (covered by action-timeline decomp) |
| `act/emp_emp/wss/base/0002` | 250512 | same as above |
| `act/emp_emp/wss/base/0003` | 250640 | same as above |
| `act/emp_emp/wss/base/0004` | 292368 | same as above |
| `act/emp_emp/wss/base/0005` | 6496 | `DFD08D3610574A733C90B2D008551F9A4B9C0DE9FE1553D753261781B6D4B3DC` |
| `equ/e001/top_mdl/0001` | 148240 | `EB9723B10763B589E06C17EF03EEDFC3C7CDAFFF4CFC909C968CAE7FCAA5FC9D` |
| `equ/e001/top_snd/0000` | 940 | not rehashed |
| `equ/e001/top_tex1/0000` | 656272 | not rehashed |
| `equ/e001/top_tex2/0000` | 2622352 | not rehashed |
| `skl/0001` | 7968 | `CA39C9664C29DA2FB1DA3AF64E9E329AF4E6BDE56090E2C355FC26223EA134AC` |

The `top_mdl/0001` hash is byte-identical to the model source pinned in
`garuda-rock-state-followup-2026-09-07.md`, so this is the same client build
that the section-state decomp was audited against. WSS banks 0001-0004 carry
the `rock_top01/mdl01/low01/all01` break effects; the small 0005 bank
(6,496 bytes) is recorded here without a role claim.

## 2. Appearance chain re-confirmed from main SQL

`gamedata_actor_appearance` resolves all three rock rungs to base model 10526
(`m526`; compare Garuda 10851 = `m851`, plume 10527 = `m527`):

| Appearance ID | Base model | Size |
|---:|---|---:|
| 2209509 (spawn rung) | 10526 | 4 |
| 2209508 | 10526 | 3 |
| 2209507 | 10526 | 2 |

`spawnTowers` spawns actor class 2209509, whose same-ID appearance row therefore
renders the full-size rock. The actor-class row's script path is
`/Chara/Npc/Monster/Garuda/GarudaLesser`; the separate 32xxxxx display field
is not on this runtime path (see the appearance-ID note of 2026-08-02). The
spawn train includes the appearance packet plus a neutral SubState, and the
per-viewer model-state publisher only sends once a break sets a presentation
animation. No static spawn defect was found: this pass does not explain
invisible rocks from code alone.

## 3. Tower ground support from the zone-239 recording

`Data/quicknavmesh/zone_239.tsv` currently holds 186 nodes. Towers spawn at
`CENTER_Y = 302.0`; nearest recorded samples agree within 0.15 vertically for
three towers, with consistent heights throughout:

| Tower | Script X/Z | Nearest node | Horizontal gap | Node Y | 302.0 minus node Y |
|---|---|---|---:|---:|---:|
| 1 north | 1492, -259 | 74 | 0.41 | 302.122 | -0.122 |
| 2 east | 1506, -245 | 24 | 1.20 | 302.140 | -0.140 |
| 3 south | 1492, -231 | 9 | 1.91 | 302.110 | -0.110 |
| 4 west | 1478, -245 | 30 | 8.11 | 302.054 | -0.054 |

Node Y values are recorded player positions, not a collision raycast, and
tower 4 sits 8+ yalms from the nearest sample. Spawn height is therefore
plausible but not floor-proven; no Y change was made.

## 4. Collision and safe spots: what is and is not established

- Pillar body: six MDL section AABBs and offsets remain those pinned in
  `outputs/garuda-rock-state-followup-20260907/model_groups.json` (upper
  ~2.46-5.14, middle ~1.31-2.96, base ~-0.29-1.76 local Y). They are render
  bounds, not a movement-blocking footprint.
- Server shelter (`isShieldedByTower`) is line-of-sight projection with a
  4.5-yalm radius, an authored rule, not a decompiled collision box.
- The baked map collision / safe-spot geometry for layout `roc0Field02a` was
  not recovered: the zone-239 layout DAT key is unresolved, so no bg collision
  mesh was extracted and no movement blocking was wired. That decomp remains
  open work, not a silent assumption.

## 5. Incidental placement flag (unchanged)

Tower 1 spawns at (1492, -259), 0.37 yalms from the shared player entry anchor
(1492.302, -259.210). Party members materialize inside the tower's shelter
radius. Both coordinates are long-standing (tower ring) and user-supplied
(entry anchor), so neither was moved here; confirm whether retail entry
overlaps the north tower before touching either.

## 6. Live questions for the rock-visibility report

Static evidence cannot close this; the next live run should record:

1. Do rocks appear after the first tower break (i.e. only the neutral spawn is
   missing, implicating initial bind/lead rather than the model)?
2. Do wind helpers and plumes render in the same run (isolating Npc-spawn vs
   encounter-wide visibility)?
3. Server log lines for `garuda_stone_tower_*` spawn failures or
   appearance-fallback warnings at fight start.
