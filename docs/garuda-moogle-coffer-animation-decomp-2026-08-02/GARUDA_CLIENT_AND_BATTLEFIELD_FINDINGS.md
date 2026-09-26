# Garuda client, battlefield, rock, and animation decomp findings

Generated: 2026-08-02  
Client examined: FINAL FANTASY XIV `2012.09.19.0001`  
Server/source examined: `C:\Users\drime\source\repos\AuroraFlare\FF14-Memory`  
Installed client root: `C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV`

## Scope and safety

This is a read-only research report. No client DAT, server data, SQL, scripts, models, effects, animations, or encounter logic were changed. The only write made for this work is this Markdown file.

The audit covers:

- Garuda's direct model/action bank (`m851`), including every direct WSS container.
- Feather/plume action banks (`m527`).
- Stone-tower/rock action banks (`m526`).
- The current Garuda encounter script and its animation selectors.
- Rock destruction, gradual rock damage, and player shelter behavior.
- Garuda's apparent jump/warp assets versus the behavior currently implemented.
- The Howling Eye weather/battlefield layout and its referenced resources.
- Garuda-related cinematic banks, kept separate from combat animation evidence.
- Evidence gaps that require a packet/runtime capture before exact retail mechanic-to-WSS names can be asserted.

## Executive findings

1. **The missing Garuda jump is present in the client asset bank but not selected by the current encounter.** Based on their root curves, `m851` WSS12 is a high-confidence takeoff/ascend motion, while WSS13 and WSS14 share a high-confidence descend/landing motion. The current script moves Garuda with `SetPositionUpdate` and never selects WSS12-14.

2. **The current command table collapses almost the entire Garuda fight onto WSS1.** Skills 23989–23999 all use model animation 1 except Mistral Shriek (23993), which uses model animation 2. This includes distinct attacks such as Wicked Wheel, Slipstream, Downburst, Mistral Song, Aerial Blast, Eye of Storm, and Great Whirlwind. Feather Lance and Thermal Tumult also both select `m527` WSS1. The client has many more authored packages.

3. **The rocks have four authored staged destruction effects, and none is invoked by the current encounter.** `m526` WSS1 references `rock_top01`, WSS2 references `rock_mdl01`, WSS3 references `rock_low01`, and WSS4 references `rock_all01`. The current script instead changes appearance 2209509 → 2209508 → 2209507 and then despawns the actor. Those three appearance rows all use the same `m526` model and differ by actor size (4 → 3 → 2), not by a different rock model or WSS.

4. **Rock shelter is implemented as server-side geometry, not as client collision or a visibility test.** For each alive player, the server projects the rock position onto the boss-to-player line. A surviving rock shelters the player if it lies between 10% and 95% along that line and is within 4.5 yalms of it. Only exposed players receive the private Mistral command. This explains “players not getting hurt hiding behind the rocks,” but the installed assets alone do not prove how retail performed the check.

5. **Plumes have multiple unused action packages.** `m527` contains WSS1, WSS2, WSS3, a WSS4 scheduler/control shell, and a separate skill04 caster effect embedded in BID. Current Feather Lance and Thermal Tumult both select WSS1, leaving WSS2, WSS3, and the skill04 package unused by those commands.

6. **The battlefield weather contains atmosphere, not a complete boss-mechanic implementation.** The native Garuda weather resource contains wind, sky/cloud/light/fog timelines, summon VFX, mist textures, and Garuda ambience. It does not prove the selector for Garuda's combat WSS, rock shelter, or rock damage.

7. **There is a large Garuda cinematic bank, but it must not be confused with combat WSS.** `sum6g000` binds `m851`, `m527`, and `m526` and contains hundreds of event-motion paths plus tornado, sonic, landing, feather, impact, rock-hit, and ground-hit VFX. The current encounter starts scene `"none"`, so these event assets are not automatically used by the fight.

## Confidence language used below

- **Proven current wiring:** directly selected by the current Lua/SQL path.
- **Proven client asset:** directly present and decoded in the installed client.
- **High-confidence interpretation:** supported by filenames, motion root curves, timing, and effect contents, but not by a recovered retail selector.
- **Unproven mapping:** a plausible retail mechanic association that still requires runtime/packet evidence.

## Current encounter identities

### Arena and boss

| Item | Current value |
|---|---:|
| Zone | 239 |
| Arena center | `(1492, 302, -245)` |
| Arena radius | 45 yalms |
| Boss cardinal position radius | 34 yalms |
| Stone-tower radius | 14 yalms |
| Garuda actor appearance | 2209501 |
| Garuda mob type | 3041 |
| Garuda model root | `client/chara/mon/m851` |

### Current command-to-animation wiring

All rows below use animation type 19, effect animation 0, and duration 3 in `Data/sql/server_battle_commands.sql`.

| Skill ID | Name | Current model animation | Battle-animation value | Expected caster model in this encounter | Wiring result |
|---:|---|---:|---:|---|---|
| 23989 | Wicked Wheel | WSS1 | 318771200 | `m851` | Shares Garuda WSS1 |
| 23990 | Slipstream | WSS1 | 318771200 | `m851` | Shares Garuda WSS1 |
| 23991 | Downburst | WSS1 | 318771200 | `m851` | Shares Garuda WSS1 |
| 23992 | Mistral Song Sheltered | WSS1 | 318771200 | `m851` | Shares Garuda WSS1 |
| 23993 | Mistral Shriek | WSS2 | 318775296 | `m851` / mirages | Only current WSS2 selector in this group |
| 23994 | Mistral Song | WSS1 | 318771200 | `m851` | Shares Garuda WSS1 |
| 23995 | Feather Lance | WSS1 | 318771200 | `m527` | Uses plume WSS1 |
| 23996 | Aerial Blast | WSS1 | 318771200 | `m851` | Shares Garuda WSS1 |
| 23997 | Eye of Storm | WSS1 | 318771200 | `m851` | Shares Garuda WSS1 |
| 23998 | Great Whirlwind | WSS1 | 318771200 | `m851` | Shares Garuda WSS1 |
| 23999 | Thermal Tumult | WSS1 | 318771200 | `m527` | Uses plume WSS1 |

This is the central integration gap: the presence of named server abilities does not mean their distinct client animation packages are being selected.

### Earlier/legacy Garuda command evidence

The older private/legacy tables contain:

| Skill/row | Name | Model animation in that row | Comment/name association |
|---:|---|---:|---|
| 23487 | second_wind | 1 | `garuda_wind` |
| 23488 | fists_of_wind | 2 | wind family |
| 23489 | whirlwind | 3 | wind family |
| 23537 | downburst | 1 | comment says `bomb_boss` |
| 23539 | slipstream | 1 | Garuda |
| 23544 | plumage | 1 | Garuda |
| 23552 | thermal_tumult | 1 | Garuda |
| 23556 | great_whirlwind | 1 | `garuda_wind` |

`server_battlenpc_skill_list.sql` skill list 30 contains only 23539 Slipstream and 23544 Plumage for Garuda. These legacy names are useful provenance, but they are not an authoritative retail WSS-to-ability dictionary.

## Actor and model matrix

| Appearance | Model/base | Size | Current or inferred role |
|---:|---|---:|---|
| 2209501 | `m851` / base 10851 | 2 | Garuda boss |
| 2209502 | `m527` / base 10527 | 2 | feather/plume family |
| 2209503 | `m526` / base 10526 | 2 | rock/tower family |
| 2209504 | `m851` | 2 | Garuda-family appearance |
| 2209505 | `m851` | 2 | Garuda-family appearance |
| 2209506 | `m526` | 1 | small rock variant |
| 2209507 | `m526` | 2 | lowest surviving tower tier |
| 2209508 | `m526` | 3 | middle tower tier |
| 2209509 | `m526` | 4 | full tower tier |
| 2209510 | `m527`, head 1024/body 1024 | 2 | Bristle Plume appearance |
| 2209511 | `m527`, head 1024/body 1024 | 2 | related plume appearance |
| 2209512 | `m527`, head 2048/body 1024 | 2 | Silky Plume appearance |
| 2209513 | `m527`, head 2048/body 1024 | 2 | related plume appearance |
| 2209514 | `m851` | 1 | Suparna |
| 2209515 | `m851` | 1 | Chirada |
| 2209516 | base 1255, head 3072 | 2 | helper/invisible-like appearance |
| 2209517 | base 1255, head 3072 | 2 | helper/invisible-like appearance |
| 2209518 | `m527`, head 3072/body 1024 | 2 | additional plume variant |
| 2209519 | `m527`, head 3072/body 1024 | 2 | additional plume variant |

Mob-type associations used by the current encounter:

| Mob type | Name |
|---:|---|
| 3041 | Garuda |
| 3090 | Bristle Plume / Razor Plume family |
| 32704 | Silky Plume |
| 32705 | Suparna |
| 32706 | Chirada |

## Garuda `m851` direct action inventory

The direct model root contains 25 files: 20 action containers, four equipment/model resources, and one skeleton. The 20 action containers are BID, BTL, four MGC files, and WSS1–WSS14.

### Base/BID motions

The BID container exposes the following principal motion identifiers:

- `cbbm_id0` — base idle.
- `cbbm_01f_lp0`, `cbbm_02f_lp0` — forward/combat locomotion loops.
- `cbbm_activ`, `cbbm_deact` — activation/deactivation.
- `cbbm_ded` — death.
- `cbbm_wekid_2lp` — weakened/alternate idle loop.
- `cbbm_abl_2lp` — ability loop.
- `cbbm_sp_a_2lp`, `cbbm_sp_b_2lp` — special loops.
- `cbbm_abl_3` also appears as an ability-motion reference.
- Directional transition and hit-turn scheduler identifiers include `cbbm_01f_bl`, `01f_br`, `01f_f_ls`, `01f_f_rs`, `01f_l`, `01f_r`, `01f_stp_ls`; corresponding `02f_*` and `03f_*`; `cbbm_trn_bl/br/l/r`; and `cbbm_hitrn_bl/br/l/r`.

The BID contains 17 MTB entries, 17 MCB entries, and 13 SCB entries in total. The list above separates recognizable motion identities from scheduler/transition identities; it does not invent retail names for them.

### BTL and magic motions

- BTL contains `cbbm_big_atk_f1`, `cbbm_big_atk_l`, and `cbbm_big_atk_r`, with `cbbm_id0` as an idle reference.
- MGC1–MGC4 are byte-identical generic magic wrappers, each using `cbbm_abl_3` and referring to the ability loop.
- Because the four MGC files are identical, they do not provide four distinct Garuda-specific spell visuals.

### Every Garuda WSS package

Durations below come from decoded motion timing at 30 frames per second. Effect names are the nested client effect packages, not server skill names.

| WSS | Motion | Frames | Duration | Nested effect evidence | Current encounter selector |
|---:|---|---:|---:|---|---|
| 1 | `cbbm_throw` | 50 | 1.667 s | `m851sk1c`, `m851sk1mt`, `m851sk1t` | Yes: most current Garuda commands |
| 2 | `cbbm_sp_a01` | 60 | 2.000 s | `m851sk2c1`, `m851sk2t1` | Yes: Mistral Shriek only |
| 3 | `cbbm_sp_a02` | 80 | 2.667 s | `m851sk3c1`, `m851sk3t1`; one SCB contains typo-like token `m581_0003` | No current selector found |
| 4 | `cbbm_sp_b01` | 70 | 2.333 s | `m851sk4c1`, `m851sk4t` | No current selector found |
| 5 | `cbbm_sp_b02` | 65 | 2.167 s | `skl05cas01m`, `skl05tar01m`; camera shake/filter evidence | No current selector found |
| 6 | `cbbm_sp_b03` | 52 | 1.733 s | `skl06cas01m`, `skl06tar01m`; camera shake/filter evidence | No current selector found |
| 7 | `cbbm_sp_01` | 80 | 2.667 s | `m851sk7c0c` | No current selector found |
| 8 | `cbbm_sp_02` | 90 | 3.000 s | `m851sk8c0c` | No current selector found |
| 9 | `cbbm_sp_03` | 71 | 2.367 s | `m851sk9c0c` | No current selector found |
| 10 | `cbbm_sp_04` | 79 | 2.633 s | Motion/control only; no nested effect package | No current selector found |
| 11 | `cbbm_sp_b04` | 90 | 3.000 s | `m851skl11m_c1`, `_c2`, `_t1`; largest package, camera shake, draw/filter and SceneTexture evidence | No current selector found |
| 12 | `cbbm_sp_05` | 20 | 0.667 s | `m851sk12c0c` | No current selector found |
| 13 | `cbbm_sp_06` | 11 | 0.367 s | `m851sk13c0c` | No current selector found |
| 14 | `cbbm_sp_06` | 11 | 0.367 s | `m851sk14c0c`, `m851sk14c1c`; same motion as WSS13, different effects | No current selector found |

The Garuda-specific effect roots are under `vfx/mon/m851_garuda/skillNN`.

### Garuda jump, landing, dash, and warp evidence

The strongest evidence comes from decoded root translation:

| WSS | Root behavior | Interpretation |
|---:|---|---|
| 7 | Starts/ends near Y 2.730, peaks at Y 9.164 | Self-contained high vertical attack arc; jump-like but exact mechanic unproven |
| 8 | Peaks at Y 7.331 | High vertical attack arc; exact mechanic unproven |
| 9 | Peaks at Y 5.664 | Moderate/high vertical attack arc; exact mechanic unproven |
| 10 | Peaks at Y 4.385; no nested effect | Effectless movement/transition candidate; exact dash or warp association unproven |
| 11 | Y 3.157 → 2.730, peak Y 7.534 | Large vertical attack/cinematic arc with the most elaborate VFX package |
| 12 | Y 2.7301 → 10.0000; delta +7.2699. Z -0.0111 → -0.4164 | **High-confidence takeoff/ascend animation** |
| 13 | Y 9.9697 → 2.3953; delta -7.5744. Z -1.5954 → -1.0383 | **High-confidence descend/landing animation** |
| 14 | Same landing motion as WSS13, different effect package | **Second high-confidence landing variant** |

Important distinction:

- **Proven current behavior:** pre-blast Mistral Song moves Garuda to a cardinal point with `SetPositionUpdate`; Mistral Shriek moves her to center the same way; later transitions move her to another cardinal point or eight yalms behind a target with `SetPositionUpdate`.
- **Proven current selector:** only WSS1 and WSS2 are selected by the present Garuda skill rows.
- **Proven client assets and root curves; high-confidence motion interpretation:** WSS12 is consistent with takeoff/ascend, and WSS13/14 with landing/descend.
- **Not proven:** which retail phase or named retail ability selected WSS7–14, and whether any one of them was called “dash,” “jump,” or “warp” by the original server.

Therefore the reported “missing jump” is real at the integration level: the installed client has suitable authored assets, while the current encounter relocates the actor by ordinary coordinate/movement update and does not play them. WSS10 is worth testing as a transition/dash candidate because it is motion-only, but a retail trace is required before binding it to the named dash.

## Feather and plume `m527` animation inventory

### Base/BID motions and appearances

The plume BID exposes:

- `cbbm_id0`.
- `cbbm_01f_lp0`, `cbbm_02f_lp0`.
- `cbbm_activ`, `cbbm_deact`.
- `cbbm_dedpose`, `cbbm_ft_ded_3`.
- `cbbm_wekid_2lp`.
- `cbbp_1_msb4_1`.
- Directional movement/turn scheduler identifiers for forward, backward, left, and right transitions.
- A separate BID-embedded skill04 caster package: `vfx/mon/m527_feather/skill04/m527_skl4m.veffbin`, scheduled through `skl4cas`.

The equipment variants are meaningful:

- `e001` has `met_mdl`, `top_mdl`, sound, and two top textures.
- `e002` has a distinct `met_mdl`.
- `e003` has a distinct `met_mdl`.
- Actor appearances choose head/body values 1024, 2048, or 3072, giving distinct plume variants without requiring a different skeleton/action root.

### Every plume WSS package

| WSS | Motion | Frames | Duration | Root movement | Effect evidence | Current use |
|---:|---|---:|---:|---|---|---|
| 1 | `cbbm_sp_01` | 40 | 1.333 s | Static | caster/target `m527sk1c`, `m527sk1t` | Feather Lance and Thermal Tumult both select this |
| 2 | `cbbm_sp_02` | 40 | 1.333 s | Static | `m527sk2c0c`, `m527sk2t0c`; mon-main reference also points at `cbbm_sp_01` | Unused by current 23995/23999 rows |
| 3 | `cbbm_sp_03` | 40 | 1.333 s | Static | `m527sk3c0c`, `m527sk3t0c` | Unused by current 23995/23999 rows |
| 4 | No skeletal MTB/MCB | — | — | — | Two SCB/control records; no nested VFX payload in this tiny 3,248-byte container | Scheduler/control shell; no current selector found |

Consequences for the present fight:

- Bristle Plume actors use appearance 2209510 and mob type 3090.
- Silky Plume uses appearance 2209512, mob type 32704, and the alternate 2048 head equipment.
- Current Bristle/Razor-style detonation uses Feather Lance 23995, which selects `m527` WSS1.
- Current Silky Plume uses Thermal Tumult 23999, which also selects `m527` WSS1.
- Distinct WSS2, WSS3, and the BID skill04 effect exist but are not selected by those two current command rows.

This is the likely source of “nails/plumes feel like they are missing animations” in the Garuda encounter: the models and packages exist, but the current server-side animation selector is not differentiating the behaviors.

## Stone tower and rock `m526` animation inventory

### Base/BID motions

The rock BID contains:

- `cbbm_id0`.
- `cbbm_activ`, `cbbm_deact`.
- `cbbm_ded`, `cbbm_dedpose`.
- `cbbm_wekid_2lp`.
- `cbbm_msb4_1`, `cbbm_msb5_1`, `cbbm_msb6_1`, `cbbm_msb7_1`.
- Movement/stop/turn/hit-turn scheduler identifiers, even though the encounter's rocks are stationary.

### Every rock WSS package

All five WSS containers use the same static 50-frame `cbbm_sp_01` motion (1.667 seconds). Their authored effects differ:

| WSS | Nested effect | Embedded semantic tokens | Scheduler activity | High-confidence meaning | Current encounter use |
|---:|---|---|---:|---|---|
| 1 | `rock_top01.veffbin` | `rock_hit01`, `rock_top0`, `m_rock01`, `rock_01m`, `rock_02m` | about 0.60 s | Top-section hit/break stage | **Never invoked** |
| 2 | `rock_mdl01.veffbin` | `mdl_rock`, `rock_mdl0` | about 0.75 s | Middle-section hit/break stage | **Never invoked** |
| 3 | `rock_low01.veffbin` | `low_rock`, `rock_low0` | about 0.75 s | Low-section hit/break stage | **Never invoked** |
| 4 | `rock_all01.veffbin` | `rock_all0` | about 0.85 s | Whole-rock/full-collapse effect | **Never invoked** |
| 5 | None | motion/scheduler only | — | Effectless control variant | **Never invoked** |

The top/middle/low/all meanings are high-confidence interpretations of explicit internal filenames. A runtime capture is still needed to prove the original retail trigger order and whether the sections were played cumulatively or selected according to remaining health.

### Exact answer: does the current fight invoke any rock WSS?

**No.** In `GarudaEncounter.lua`:

- `spawnTowers` creates each tower as appearance 2209509 with three logical segments.
- `towerAppearanceForSegments` returns 2209509 for three segments, 2209508 for two, and 2209507 for one.
- `damageTower` subtracts logical segments, calls `ChangeNpcAppearance(...)` while segments remain, and calls `DespawnActor(...)` at zero.
- `destroyAllTowers` sets all logical segments to zero and despawns every remaining tower.
- No tower actor calls `ForceScriptedMobSkill`, no tower WSS ID is selected, and no direct WSS scheduler is invoked on this path.

Relevant source anchors:

- Tower appearance selection: `Data/scripts/directors/InstanceRaid/GarudaEncounter.lua:273-280`.
- Tower creation: lines 282-300.
- Staged damage and appearance swap: lines 310-325.
- Destruction of all towers: lines 328-336.

The visual sequence currently implemented is therefore:

`2209509 (m526 size 4)` → `2209508 (m526 size 3)` → `2209507 (m526 size 2)` → despawn.

It is not:

`m526 WSS1 rock_top01` → `m526 WSS2 rock_mdl01` → `m526 WSS3 rock_low01` → `m526 WSS4 rock_all01`.

This closes both missing rock behaviors named in the request:

- **“Breaking the rocks slowly”** has authored top/middle/low effects, but the current encounter only scales/swaps the actor appearance.
- **“Destroying the rocks”** has an authored `rock_all01` full-collapse effect, but the current encounter despawns the actor without selecting it.

## Rock shelter and damage logic

### How shelter currently works

`isShieldedByTower` performs an XZ-plane line test:

1. Build the line segment from Garuda to the player.
2. If that segment's squared length is `<= 0.01`, return unshielded before testing any tower.
3. For each tower with at least one logical segment, project its center onto that line.
4. Require the projection to be greater than 0.10 and less than 0.95, so the tower is meaningfully between boss and player.
5. Find the closest point on the boss-to-player line.
6. Shelter the player when that point is within 4.5 yalms of the tower center.

Relevant source anchor: `GarudaEncounter.lua:338-364`.

This check does **not** inspect:

- the rendered tower mesh;
- ray-traced visibility;
- physical collision;
- which size tier is displayed, beyond requiring `segments > 0`;
- player height/Y position.

### Which attacks respect shelter

- Pre-blast Mistral Song queues skill 23992 only for players who fail the shelter test, then removes one segment from the associated tower.
- Pre-blast Mistral Shriek checks players within 22 yalms and excludes those sheltered by a surviving tower, then damages two adjacent tower records by one segment each.
- Once towers are destroyed, they no longer shelter because their segment count is zero and their actors are removed.

This is proven current behavior, not proof of the exact 1.x retail calculation.

## Current fight flow and visual calls

### Pre-Aerial Blast phase

- Garuda is repositioned among four cardinal boss points, each 34 yalms from arena center.
- Four towers sit at cardinal points 14 yalms from center.
- Mistral Song moves Garuda to a cardinal point with `SetPositionUpdate`, checks shelter, queues the private sheltered command only to exposed players, and damages one tower tier.
- Mistral Shriek moves Garuda to center with `SetPositionUpdate`, checks a 22-yalm radius plus shelter, and damages two adjacent tower tiers.
- These position changes are not accompanied by selection of the takeoff/landing WSS banks.

### Plume waves

- Bristle Plumes use appearance 2209510 and mob type 3090.
- Pre-blast plumes are held near towers.
- A plume wave eventually detonates through Feather Lance 23995.
- Pre-blast plume behavior also removes a logical tier from the associated tower.
- Pending or completed plume actors are despawned by the script; their actor removal is distinct from playing every available `m527` action package.

### Aerial Blast

- The preparation wave contains 12 plumes on normal and 18 on hard.
- The detonation delay is 25 seconds.
- Garuda is moved to center with `SetPositionUpdate`.
- Current damage is `2000 + floor(((12 - remainingSegments) / 12) * 7999)`, clamped to 2000–9999.
- After resolution, all towers are forcibly despawned.
- Aerial Blast 23996 selects Garuda WSS1 in the present command table; it does not select the large unused WSS11 package or any jump transition.

### Post-blast basics and movement

- Basic rotation cycles Wicked Wheel, Slipstream, and Downburst.
- The script can reposition Garuda to another cardinal point or eight yalms behind a target with `SetPositionUpdate`.
- Again, this is actor-coordinate movement, not proof of a dash animation being played.

### Hard-mode additions

- Suparna: appearance 2209514, mob type 32705, `m851` at size 1.
- Chirada: appearance 2209515, mob type 32706, `m851` at size 1.
- They use the basic attack set and later converge for Mistral Shriek after `SetPositionUpdate`.
- Silky Plume: appearance 2209512, mob type 32704, `m527` with the 2048 head variant; uses Thermal Tumult 23999.
- West-wind logic applies Eye of Storm to players at radius 30 or greater.
- South-wind logic creates fixed or rotating nine-yalm Great Whirlwind danger zones.

## Native Garuda battlefield/weather resource

### Selector and files

The native regional weather record is:

| Item | Value |
|---|---|
| Weather token | `wtr_smmn` |
| Native weather ID | 8028 |
| Resource key | `0x28D90015` |
| Flags | 0 |
| Count/type field | `0x102` |
| Region table | `client/data/03/C0/00/00.DAT` |
| Binary layout | `client/data/28/D9/00/15.DAT` |
| Textual FileSet | `client/data/28/DD/00/14.DAT` |

The ordinary `roc_r0_fld02` weather is ID 202 and maps to key `0x28D90002`; it is not the Garuda trial weather.

The current server uses additive weather ID 8072. Its overlay builder maps 8072 to the native 8028 payload/key and labels it `wtr_garuda_af`. Therefore:

- **8028** is the native installed-client Garuda weather selector/resource.
- **8072** is the current custom/additive selector that reuses that native payload.

### Layout identity

`client/data/28/D9/00/15.DAT`:

- Size: 87,024 bytes.
- SHA-256: `db13649451a75054235319e93bc9bfd3c236eb776bdd45c6df12e96e49e2a383`.
- Type/version: MapLayoutResourceData 1.1.0.
- Table size: `0x400`.
- Active dependency records: 30, with two tail slots also present.
- Payload/layout base: physical `0x430`; payload data begins at `0x440`.
- The first layout word at physical `0x440` is a node-pointer table byte size of `0x344`, meaning 209 node pointers. It is not a node count of 836.

`client/data/28/DD/00/14.DAT`:

- Size: 2,236 bytes.
- SHA-256: `fa18c3973ed92e5fb75a52e9a51d6127e537bbbabe9aaa502ace072be5b601c3`.
- It names `mountainm_garuda_loop_4ch.win32.scd`, `mountainm_garuda_spot.win32.scd`, and the `vfx_smn01` file set with its textures, models, effect, and camera resources.

### Decoded environment nodes

Recognized exact nodes include:

- `wind_00_0000`.
- `vfx_smn01`.
- `cbind_cam`.
- `time_sky_00`.
- `time_wtr_00`.
- `time_dwev_se`.
- the full family of `time_dwev_*` environment timelines.
- `time_sqnc_24`.

UnitTree groups:

| Group | Members/targets |
|---|---|
| `sgrp_wtr_24` | `time_sqnc_24_001` → `time_sqnc_24` |
| `sgrp_dwev_se` | `time_fine_se`, `sdef_garuda_loop`, `sdef_garuda_spot` → `time_dwev_se` |
| `sgrp_dwev_sky` | main sky light, sub sky light, `time_dwev_sky` |
| `sgrp_dwev_cld` | main/sub/ambient cloud lights, `time_dwev_cld` |
| `sgrp_dwev_00` | main/sub/ambient lights, `time_dwev_00` |
| `sgrp_dwev_10` | main/sub/ambient lights, `time_dwev_10` |
| `sgrp_dwev_20` | main/sub/ambient lights, `time_dwev_20` |
| `sgrp_dwev_11` | main/sub/ambient lights, `time_dwev_11` |
| `sgrp_dwev_21` | main/sub/ambient lights, `time_dwev_21` |
| `sgrp_dwev_12` | main/sub/ambient lights, `time_dwev_12` |
| `sgrp_dwev_22` | main/sub/ambient lights, `time_dwev_22` |
| `sgrp_dwev_13` | main/sub/ambient lights, `time_dwev_13` |

Instance aliases `isgrp_000004` through `isgrp_000008` and `isgrp_000014` through `isgrp_000020` reference these groups at the origin. They are environment-group instances, not proven combat triggers.

### What the battlefield resource proves

It proves the installed client has Garuda-specific:

- wind behavior;
- sky, cloud, fog, mist, and lighting timelines;
- ambience and spot sounds;
- a summon-oriented `vfx_smn01` package;
- camera binding for that environment effect.

It does not by itself prove:

- which Garuda WSS corresponds to Slipstream, Downburst, or Aerial Blast;
- which WSS was used for retail jump/warp behavior;
- when rock top/middle/low/all packages were triggered;
- retail shelter collision/line-of-sight logic.

## Battlefield dependency table

Record 0 is the layout marker. Active dependency records 1–29 are:

| Row | Key | Size | SHA-256 | Interpreted type/note |
|---:|---:|---:|---|---|
| 1 | `0x5CE5000D` | 10,167 | `9f94e7bf00716fa94c0f569639796a4f9fa888b9fef53c611a128fb4dd7a89bf` | environment dependency |
| 2 | `0x5CE60005` | 1,067 | `b5f6613a8393b190d5662b1254e053cb64620f68db2f0132d943d67b14baa7bd` | wind MTB |
| 3 | `0x5CE60006` | 1,067 | `e7bf9df28cd96a8a23e3698dcc20a80ddba0ba4a56ddf4aea726ec871e32d16a` | wind MTB |
| 4 | `0x5CE60007` | 1,115 | `1bdde43806972b0296040b1ac7be7eb2e6517e70f116657c900d93e56dd3c4b7` | wind MTB |
| 5 | `0x5CE60008` | 1,099 | `a8ddd685fb6216867430a4a1f128811caed850cacdb7f197a09a598f37aa20bd` | wind MTB |
| 6 | `0x615F0000` | 98,464 | `c53a89c6a2cbd3ef4e1942ec2078531ee4e30e870c874e1ff7e3a12d40fb4721` | environment texture |
| 7 | `0x89A000FC` | 524,836 | `e09957c25f72b850fc177994985fe228d362d21d99033ab9439626d90e496b3c` | fine-weather texture |
| 8 | `0x615F0004` | 98,464 | `04e3eb5888c0583a66fd01d3b6fead603cc61eed8b8541ad2bbf5e4d3eb9dee9` | environment texture 20 |
| 9 | `0x89A00039` | 524,836 | `007d7e3a0abccd1a0181c934f2c9d2c473cfe4e4914fd47fcaa5d49c92da079c` | `r0d11` texture |
| 10 | `0x615F0005` | 98,464 | `04e3eb5888c0583a66fd01d3b6fead603cc61eed8b8541ad2bbf5e4d3eb9dee9` | duplicate payload of row 8 |
| 11 | `0x89A0003A` | 524,836 | `c3db628367e4a70bf5a7de299d757dea70fe4288567225728b806aea57f1549e` | environment texture |
| 12 | `0x615F0006` | 98,464 | `04e3eb5888c0583a66fd01d3b6fead603cc61eed8b8541ad2bbf5e4d3eb9dee9` | duplicate payload of rows 8/10 |
| 13 | `0x89A00102` | 524,836 | `1df128d61ce461b7827aafc0a1ad0ccd13ce4a2382ec08ef45f20327d2ec4973` | mist texture |
| 14 | `0x89A00103` | 524,836 | `8e83267c2b2cb9002a6a3162630cce57a3f1d13a9042e8bfb475342a6715fe95` | mist texture |
| 15 | `0x89A00104` | 524,836 | `e5601ee51f806f86164b5b3534f7e88f074a045663e13fb7b0795f5096fa5dc5` | mist texture |
| 16 | `0x89A00105` | 524,836 | `730cc7aa8b75b45d91a84608d186a9d1d0c0b78c2af28f86a93f17032c8a3232` | mist texture |
| 17 | `0x89A00106` | 524,836 | `5125d8c2998d6a36221d8556804a919934183145e0a14e7773d36ccf390f137d` | mist texture |
| 18 | `0x89A00107` | 524,836 | `95aa4422253fecaaae9af012d0d9f0c1f82807731b9bbd2f032281fb954c0b29` | mist texture |
| 19 | `0x89A0003B` | 524,836 | `6359f9a84408c897184fe4ce7db15bb9ea8ddc88436c7b5f3bd49336357f8a12` | environment texture |
| 20 | `0x899C0059` | 1,550,881 | `6dfbb2566962886ade01e29dfa9ab5f1b647aaabb380090ea22ee27566db081a` | SSCF sound container |
| 21 | `0x899C005A` | 2,597,888 | `7a48c1fe5f3698146216cb1bbc3c0efb22f9da0f21098a736214c68561c5d19c` | SSCF sound container |
| 22 | — | — | — | VFX marker |
| 23 | `0x89960067` | 16,564 | `dbbe0b50ea939be7494eeb86a5bb3012bf04a146f514c7570a8fe521fde98b9b` | VFX texture |
| 24 | `0x89960066` | 4,276 | `5de76d0f43b106a1ee7f60837aee54ff71c5c798618c8653cec112719ae39712` | VFX texture |
| 25 | `0x899700A5` | 10,192 | `bce304f8b88630653298334a1f9126731e5b461ebbcaefd276170d0d0f3cc998` | VFX model |
| 26 | `0x899700A6` | 9,172 | `e43b9e88aff5a31b7ab0ac78ec3f85fed06093c4bb06b7e0814686af5b93a89c` | VFX model |
| 27 | `0x899A0014` | 12,608 | `6912e2de161b809cb9381eca54426e05b9152eec97e25528f7624c9a44f51090` | VFX effect |
| 28 | `0x8998000B` | 809 | `0fbea063471264cce31a32482f04de4bcedc699f289a614883b82ee9dafc30d9` | VFX leaf |
| 29 | `0x89990012` | 1,120 | `7554d3a623f2538bec724466012fe4e3045fbf0dd40944d49a930101352d000e` | VFX instance |

## Garuda cinematic/event banks

An exact literal sweep for `m851`, `m527`, and `m526` under `client/cut` found five authoritative Garuda-bound event bundles.

| Bundle | Size | SHA-256 | Evidence |
|---|---:|---|---|
| `gc010410/gc010410` | 2,847,872 | `b85515a0f7eb54071288091bd4869208eec4ee3d0de629212e041dc7f568d539` | Binds `m851` and `m527`; 20 event-motion paths / 10 unique leaves |
| `gc010420/gc010420` | 3,896,960 | `738b8ddcde950d06b5898ffb27a3daf50340f5bbf14fa991c59b41a4670cd091` | Garuda/feather event actors; Garuda death VFX family |
| `gc010430/gc010430` | 3,897,488 | `7c7b149d6c3b79ad127e207ff5c2edef5a2cdb83c2a23fc7bd84ad24089dfe48` | Garuda/feather event actors; Garuda death VFX family |
| `gc010440/gc010440` | 3,894,512 | `419f9383ef9533b83dd58c92e2e68632f3aafe046ec5a2c25a6686a86da8ef35` | Garuda/feather event actors; Garuda death VFX family |
| `sum6g000/sum6g000` | 10,626,512 | `c0bdcb72ac50d712642e56d29df4ef00403717f433c3fdcd553e5de0eb071e74` | Binds all `m851`, `m527`, `m526`; 428 event-motion paths / 206 unique leaves |

`gc010410` unique motion leaves:

- `eb_gc010410a01x`
- `eb_gc010410a20x`
- `eb_gc010410a21x`
- `eb_gc010410a22x`
- `eb_gc010410a23x`
- `eb_gc010410a25x`
- `eb_gc010410a26x`
- `eb_gc010410a27x`
- `eb_gc010410b22x`
- `eb_gc010410b23x`

Its VFX tokens include `toppu`, `wall01_b`, `wall01_f`, `g_sonic`, `c16_vanish`, `stone_b`, `stone_f`, and `hane_glow`. Actor tokens include `m851a0_garuda_m`, `m851b0_garuda_s`, `m527a0_008`, and `m527b0_009`.

The `gc010420`/`430`/`440` set reuses `eb_gc010420a01x` and `eb_gc010420a04x`, uses `m851a0`/`m851b0` plus multiple `m527` variants, and contains `grd_dead_a` through `grd_dead_f` VFX families.

`sum6g000` includes actor and skeleton bindings for all three model roots. Recognizable VFX tokens include:

- `gal_land`
- `gal_sonic`
- `gal_sprl`
- `torne_in`, `torne_lop`, `torne_rot`, `torne_st`
- `god_ray`
- `impact`
- `iwa_hit`
- `jimen_hit`
- `hane_glow`
- `bg_wall`
- `f0galup1o`
- `f0grd_wid`

These are valuable references for visual reconstruction, especially wind, tornado, land/impact, feather glow, and rock/ground hits. They are still cinematic/event assets, not proof that a combat WSS selector should point at them.

The current encounter invokes start event scene `"none"`, so no Garuda cutscene is selected at encounter start.

Three additional raw binary matches occurred in `man0u010/man0u010`, `man2g000/DataSet/10000_c004`, and `man2g090/man2g090`. They had no corresponding Garuda paths or skeleton bindings and are treated as compressed/noisy false positives, not Garuda asset evidence.

## Direct client file manifest and hashes

### `m851` Garuda

| Relative file | Bytes | SHA-256 |
|---|---:|---|
| `act/emp_emp/bid/base/0000` | 596,944 | `1dd32c05e5afef98243f6cc1f19bec268248b2f1761f9345345f2d0b721f7801` |
| `act/emp_emp/btl/base/0001` | 169,520 | `7a903e4b433af3c91265b3d50f555c421ce521098b730eea7c0d6dc92a0f3585` |
| `act/emp_emp/mgc/base/0001` | 37,008 | `da2e7b0f9e0659941aab2c07c2a3439e9c8655f17582a4ddc0ec307ee0506512` |
| `act/emp_emp/mgc/base/0002` | 37,008 | `da2e7b0f9e0659941aab2c07c2a3439e9c8655f17582a4ddc0ec307ee0506512` |
| `act/emp_emp/mgc/base/0003` | 37,008 | `da2e7b0f9e0659941aab2c07c2a3439e9c8655f17582a4ddc0ec307ee0506512` |
| `act/emp_emp/mgc/base/0004` | 37,008 | `da2e7b0f9e0659941aab2c07c2a3439e9c8655f17582a4ddc0ec307ee0506512` |
| `act/emp_emp/wss/base/0001` | 248,976 | `0c1109b826ab5175fadd55c50c0d89c4d86e222ae9d30d1b13cc48b677f77c60` |
| `act/emp_emp/wss/base/0002` | 343,968 | `43f13111afc29706ffae370a31cc70f3ee1d3cf27570582235af02f413c3dd5a` |
| `act/emp_emp/wss/base/0003` | 306,464 | `821f16e8d47a8ee04c7edd8f5adbc5214e5fb089cc81f1237033e4ed1c7cefb0` |
| `act/emp_emp/wss/base/0004` | 251,424 | `469ec93f18f6e925c83d96d9b23c626cfa42006989a7c74ce47d07d4731a6fe8` |
| `act/emp_emp/wss/base/0005` | 470,832 | `6b70fcdb5dece7deb0999210594e4ae13fd6c82f43d78400c348ad8fe4737f99` |
| `act/emp_emp/wss/base/0006` | 498,304 | `62fa3b9395d1fd0a858930b38afe3ae24871351f42507a3cf753fbe5995dbc40` |
| `act/emp_emp/wss/base/0007` | 416,704 | `c9e88454955f144bb815cb7ba811eb56628818d9692528efc21d573fc462ef53` |
| `act/emp_emp/wss/base/0008` | 230,880 | `e15f9c9133ae655dbbe28b2c08ff09607ce4863b2abd3ce8cc68df84b36cc80e` |
| `act/emp_emp/wss/base/0009` | 258,848 | `ac4eb9c12853a92837095c7ccac8767e22c5642ebb073c9aac82be2dff975d39` |
| `act/emp_emp/wss/base/0010` | 46,768 | `abbe34df5bfcca4611647d7b9a154188b802c350880baf335927ff1ac6c209ec` |
| `act/emp_emp/wss/base/0011` | 619,936 | `e6c5014cb0f7ff131ef40a5e0e7724f3d5c5faa392edeba4957297be415d259e` |
| `act/emp_emp/wss/base/0012` | 182,576 | `c642ec182be8e28d827381f6e23375144ed7a47c4172dbf75a95fe86138b5952` |
| `act/emp_emp/wss/base/0013` | 187,776 | `149fe693b70044ee5bd711f2ad3fc1b507ddf62d9facfa3ad2faca7bed1177f6` |
| `act/emp_emp/wss/base/0014` | 219,888 | `abad398212802f63bda4baae74c93a444496ac2a3ca59f5c783042e0787cfc63` |
| `equ/e001/top_mdl/0001` | 1,116,992 | `c26dc8fe60d53fdbd93c01292d9ce9283deb9f9fa94d00563fe808638d4c5d23` |
| `equ/e001/top_snd/0000` | 940 | `fff7c5e21525e5001d63903e9ce8e20acc6e978cb8c4820a5656d0c512ec7018` |
| `equ/e001/top_tex1/0000` | 987,392 | `43f29fc4650c365d359a917d8e72edc6079b5a31c960c933b1bce5c2bf56c18b` |
| `equ/e001/top_tex2/0000` | 3,936,512 | `42af337871071859d7e56ee17ae2c5bf47b9e1de94f931c6f860c7cd35dd0ca4` |
| `skl/0001` | 27,936 | `c7d94f77a9da202f5de2e0c03c7b2561f74064dbfc420f9752cd1abe95a0c3d8` |

### `m527` feather/plume

| Relative file | Bytes | SHA-256 |
|---|---:|---|
| `act/emp_emp/bid/base/0000` | 169,552 | `a1b9484b5007b08bcb765490507a038e448a4fefe618fcc2838412071ff45dca` |
| `act/emp_emp/wss/base/0001` | 238,880 | `c49a8064a8eda96210dd8e67c553a452042b1acb473b102c268a1a1541c0e3f6` |
| `act/emp_emp/wss/base/0002` | 338,624 | `dac567c097c0383a0545eeb1b25a4b54d90bddf68f03c5f010508fa16f9be51f` |
| `act/emp_emp/wss/base/0003` | 216,208 | `1277b04ca82922d63395ac436de8566f6fd6ce36014fc159884b36f97ae7dc83` |
| `act/emp_emp/wss/base/0004` | 3,248 | `456d2686b678bad01bed87f1af94d42ce6c7f15d0c10980fe73758da4672ff07` |
| `equ/e001/met_mdl/0001` | 208,016 | `f54673086c6e02abc777ec709e34921627f969366433a7c05eaddcfa660c957c` |
| `equ/e001/top_mdl/0001` | 26,720 | `12327af291f94529fc105c54a327a78219aef80a85d77c98e18c9e0ed2dd0c55` |
| `equ/e001/top_snd/0000` | 940 | `b4557dc0a90dd6186e88c66d9121c14aab7257e5e50aa8b49f3aaf0da880ae87` |
| `equ/e001/top_tex1/0000` | 12,928 | `62e0735347eb91eceef0e6ebbc611bd8b377a0b4fe7b95c02cae397f97279217` |
| `equ/e001/top_tex2/0000` | 49,792 | `8f922f46ddba91a43d0db6265a2dd30dadca19dc490a647982a1c1f54886ebf9` |
| `equ/e002/met_mdl/0001` | 208,000 | `e1d4f0e6e04a22b512be9bc9b24966ccdf25a9b6b95827e7b77268ccf5069230` |
| `equ/e003/met_mdl/0001` | 207,136 | `52abe361e335cf926e6d4569b01bdceab40c84aed71ee3f70d0d160fd154a31b` |
| `skl/0001` | 7,872 | `9737b930992db0c29585fb15ec602b2913f12922bd44de95907f6ba3fb0c8a77` |

### `m526` stone tower/rock

| Relative file | Bytes | SHA-256 |
|---|---:|---|
| `act/emp_emp/bid/base/0000` | 44,448 | `23e5a6fa702023a5f9d94de5d96c12ab5335e8aca2c39f44da6f61274de50a7a` |
| `act/emp_emp/wss/base/0001` | 250,512 | `ab399a980e6e1e5bd61548020ea6dbc3dddcddf0272d967f67272bc618272d44` |
| `act/emp_emp/wss/base/0002` | 250,512 | `4e2f5a19102242946850e7c653e54e6535c0ba42149a812c5e3d298f2919a55f` |
| `act/emp_emp/wss/base/0003` | 250,640 | `58adc39a52cc0e323e78802259eaed4ec084f670516141c07ca7af4c0781bad9` |
| `act/emp_emp/wss/base/0004` | 292,368 | `b4508064a25618571a480b066d8a549ea6d3fb0a518f19719d7fdac12db505d9` |
| `act/emp_emp/wss/base/0005` | 6,496 | `dfd08d3610574a733c90b2d008551f9a4b9c0de9fe1553d753261781b6d4b3dc` |
| `equ/e001/top_mdl/0001` | 148,240 | `eb9723b10763b589e06c17ef03eedfc3c7cdafff4cfc909c968cae7fcaa5fc9d` |
| `equ/e001/top_snd/0000` | 940 | `e2bd1c69bcd4e99503291e9695326df7e4facde2833c3b3069a65c3efd26c0bd` |
| `equ/e001/top_tex1/0000` | 656,272 | `0997804795566c03ffea5b2012cfcfedd812b2d743b3962c9a8db327c2c5c5bd` |
| `equ/e001/top_tex2/0000` | 2,622,352 | `1570c843b8bcc974f9d87226897b376a8f8f3d8fbfebb11d1f228849abfbc28a` |
| `skl/0001` | 7,968 | `ca39c9664c29da2fb1da3af64e9e329af4e6bde56090e2c355fc26223ea134ac` |

## Missing/currently unused visual matrix

| Requested behavior | Installed client evidence | Current implementation | Finding |
|---|---|---|---|
| Garuda jump | WSS12 ascend; WSS13/14 descend/landing; WSS7/8/9/11 high arcs | `SetPositionUpdate`; WSS12–14 never selected | Asset exists; integration is missing |
| Garuda dash/warp | WSS10 is effectless transition candidate; several high-arc packages exist | Coordinate update only | Candidate exists; exact retail selector unproven |
| Distinct Slipstream/Downburst/Wicked Wheel | Fourteen Garuda WSS packages with distinct motions/VFX | All three select WSS1 | Distinct current animation selection is missing |
| Aerial Blast presentation | WSS11 is the largest elaborate Garuda package; cinematic banks contain major wind/impact effects | Aerial Blast selects WSS1 | Strong unused candidates; exact retail mapping unproven |
| Gradual rock break | WSS1 `rock_top01`, WSS2 `rock_mdl01`, WSS3 `rock_low01` | Appearance/size swaps | Authored staged effects are unused |
| Full rock destruction | WSS4 `rock_all01` | Despawn | Authored collapse effect is unused |
| Hiding behind rocks | Current server line-projection test | Private damage command only for exposed players | Implemented logically; not driven by mesh collision |
| Distinct plume skills | `m527` WSS1–3 plus BID skill04 | Feather Lance and Thermal Tumult both use WSS1 | Multiple authored packages are unused |
| Battlefield wind/atmosphere | Native weather 8028, wind timelines, mist, sounds, summon VFX | Custom selector 8072 reuses payload | Resource is present and reused |
| Cinematic wind/land/rock impacts | `gc0104xx` and `sum6g000` event banks | Encounter scene is `none` | Useful reference assets, not active combat WSS |

## What is still not safe to claim without runtime evidence

The installed client and current server source do not provide a recovered authoritative retail selector for every named ability. In particular, this report does not assert that:

- WSS11 is definitely Aerial Blast, despite being the largest and most cinematic combat package.
- WSS10 is definitely the dash/warp, despite being an effectless transition candidate.
- WSS12/13/14 belonged to a specific named retail phase, despite their takeoff/landing root curves.
- rock WSS1–4 played in exactly numeric order in retail, despite the explicit top/middle/low/all filenames.
- `m527` WSS2, WSS3, or BID skill04 corresponds to a specific named plume species/ability.

The recovered Lua classes `InstanceRaidNormalGaruda`, its lesser variant, `MonsterDirectorGaruda`, `GarudaAttackWeaponSkill`, `GarudaOthers`, and the Garuda actor classes are stubs and contain no missing retail selection logic.

## Recommended read-only runtime capture targets

For a definitive binding pass, capture or log these fields while replaying authentic packets or a known-good server:

1. Actor model/appearance ID and mob type.
2. Battle command/skill ID.
3. Animation type, model animation index, effect animation index, and battle-animation value.
4. Actor position-update packets immediately before and after the animation.
5. WSS scheduler start time and target/caster effect attachment points.
6. Rock actor animation index at each damage tier and final destruction.
7. Garuda animation index immediately before disappearance, reposition, and reappearance.
8. Plume animation index for spawn, travel/idle, detonation, death, and species-specific ability.

That capture would convert the high-confidence candidates above into exact retail mappings without changing client data.

## Bottom line

The installed 1.x client is not missing the underlying Garuda, plume, or rock assets. The major omissions are in present-day encounter selection and sequencing:

- Garuda's jump/landing banks exist but are bypassed by ordinary coordinate/movement relocations.
- Nearly every Garuda ability points to WSS1.
- Plume abilities collapse onto `m527` WSS1.
- Rock damage/destruction never invokes `m526` WSS1–4.
- Shelter works as server geometry and correctly suppresses damage to players behind surviving rocks.
- The native battlefield/weather and cinematic banks contain additional wind, landing, impact, feather, and rock/ground presentation assets, but they are separate resource layers and require explicit encounter integration.

## 2026-08-05 implementation reconciliation

The inventory, decoded asset facts, and evidence boundaries above remain valid, but its ?current implementation? and ?bottom line? columns describe the 2026-08-02 snapshot. The current director now wires the high-confidence m851 WSS12 takeoff and WSS13 landing banks, the strongest WSS11 Aerial candidate, m526 WSS1-WSS4 staged rock presentation, and helper-owned persistent m999/e003 wind presentation and damage.

Those integrations are documented reconstructions, not newly recovered authoritative retail selectors. Exact WSS bindings for Wicked Wheel, Slipstream, Downburst, Feather Lance, Thermal Tumult, WSS10 relocation, and any unused plume packages still require a retail packet/runtime trace.
