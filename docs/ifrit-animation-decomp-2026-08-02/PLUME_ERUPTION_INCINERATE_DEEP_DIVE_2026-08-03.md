# Ifrit Radiant Plume, Eruption, and Incinerate deep decomp

Date: 2026-08-03 (America/New_York)

## Scope and safety boundary

This is a read-only supplemental decomp for the remaining Ifrit presentation problems:

- Radiant Plume's recognizable ground design;
- Eruption's ground fire/rocks and fixed-position ownership;
- Incinerate, the frontal breath move.

Infernal Nails are intentionally out of scope for this pass at the user's request. No game DAT, server source, SQL, script, executable, log, or other data file was changed. The only produced artifact is this Markdown report. Candidate rankings below are investigative findings, not authorization to substitute animation banks or alter encounter data.

## Bottom line

1. **Incinerate has a strong content-based identification: WSS1.** The current private command `23982` maps to canonical Incinerate `23363` or `23579`, both selecting packed animation `0x13001000` / WSS1. More importantly, WSS1's caster effect contains three large forward flame/line/distortion meshes approximately `17.1` units wide and `8.2-8.5` units deep. That shape closely matches the current ten-yalm, 90-degree server cone. WSS1 also has one 61-frame caster effect curve and three staggerable 21-frame kick curves. These are the breath flames; playing only Ifrit's body motion will omit them.
2. **The current Hard Plume donors are structurally poor matches for the expected radial floor design.** Center Plume selects WSS3 and outer/final Plume selects WSS1. Neither bank contains a `ManyGenerate*` radial/emission controller. WSS1's dominant caster geometry is the Incinerate-like forward wedge, while its target branch only contains small local rings. WSS3 likewise contains local fire/ring pieces rather than a decoded 16-yalm floor pattern. The server sends damage radii but does not serialize those radii into the animation packet.
3. **WSS21 is the strongest unproved Plume-pattern candidate in the inspected set.** It is effect-only, uses generic Kuroko/helper ownership instead of an outer Ifrit body motion, and both its caster and target VEFF graphs contain `ManyGenerateUnitTime`, `FormSphere`, `MotionEmission`, and `DrawLine`. WSS12-WSS14 also have generated caster and target layouts, but they carry Ifrit's 130-frame / 4.333-second `cbbm_sp_b03` body special and may instead be Hellfire or another major fire-impact family. No recovered selector proves any of these banks is retail Radiant Plume.
4. **Current Eruption WSS2 has real target-side fire-ring art but no rocks.** Its largest raw target ring mesh is about `6.883 x 6.661` local units. The expected rocks exist in WSS10 and WSS22, but they are caster-owned. WSS10 has no target branch at all. WSS22's target branch generates fire rings, while its rock meshes remain in the Kuroko caster branch. A compatible caster therefore has to exist at the frozen ground point for either rock package to erupt there.
5. **The decisive Eruption failure is coordinate transport/ownership.** The server freezes the selected player's X/Y/Z and evaluates damage at that point. The result packet addresses actors and carries no arbitrary world coordinate. Train one is cast by Ifrit; later Hard train two is cast by a helper at arena center. Neither caster is moved to the frozen point. Correct damage can therefore coexist with flames or rocks appearing on a character, at Ifrit/center, or not appearing in a recognizable fixed ground burst.

## Evidence pins

### Installed client

| Input | Value |
|---|---|
| Install root | `C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV` |
| Client version | `2012.09.19.0001` |
| `game.ver` SHA-256 | `3dbeed87ae1f2805bec69d63137e3deca9dd444ad5caa3ea5dedb68b8a50bfef` |
| Ifrit action root | `client/chara/mon/m852/act/emp_emp/wss/base` |

### Current server/source snapshot

| File | Bytes | SHA-256 |
|---|---:|---|
| `Data/scripts/directors/InstanceRaid/IfritEncounter.lua` | 74,393 | `0545bbcfafd29023b0fbc9337fca4bbfb15de4fccaf50bab2bcfc7c669fc9a83` |
| `Data/scripts/monster_tp.lua` | 39,007 | `fc9394f55734e92e9bb9fd8b53e194d2f9c39330b81d07274d937f7316ec9269` |
| `Map Server/Actors/Chara/Ai/BattleCommand.cs` | 20,678 | `273e24860aa9d2d3ce0795e7a1d88ef39db646bd65268528537b87f74e6cdb30` |
| `Map Server/Actors/Chara/Character.cs` | 175,551 | `e7a436a774911831b1f48f30385068d111340ccfa35b5b555b7ad581a5a6220b` |
| `Map Server/Actors/Chara/Ai/State/MobSkillState.cs` | 11,847 | `fc03f519877d0aac45dfb24f84165dab9a762a3f4c3abd71ce50530f8bcb3240` |
| `Map Server/Actors/Chara/Ai/Helpers/TargetFind.cs` | 25,192 | `8ee8838812f3a1c5a204e5f62518fe3dea2da8068254c3c39dd9894a6a8f28e5` |
| `Map Server/Actors/Chara/Ai/Controllers/BattleNpcController.cs` | 90,613 | `2d21314eb01d6819eaa37da1ec1e1a763dc09b5c0fc1bb67233b9e4de05b3f1c` |
| `Data/sql/server_battle_commands.sql` | 576,173 | `f384837334acdf9dafa9bd0bfb750a15dcb814ba12578b797534dac2b092bc96` |
| `Data/sql/live migrations/ifrit_encounter_family.sql` | 5,979 | `c3ab720e2ca5f777c74e14cadadbc7c771f95e39832467823bb83e8a83bcfb28` |
| `Data/sql/gamedata_actor_class.sql` | 1,628,685 | `a981149eb3f00997b7c4df09dc60cba59e76685d6a732367bae9b82c14c489c5` |
| `Data/sql/gamedata_actor_appearance.sql` | 1,216,707 | `bf46cc9438b1a2ea1850b0b856519a952b00058973661453a30e06028e21c015` |

The live Lua and validator were changing during the wider Ifrit investigation. Invocation conclusions in this report apply to the exact Lua hash above; older bundle hashes are historical snapshots.

### Runtime log snapshot

`Map Server/bin/Release/Logging/2026-08-03/map.log` was snapshotted for read-only analysis at:

- length `1,908,514` bytes;
- modified `2026-08-03T10:12:07.8135787-04:00`;
- SHA-256 `d1dcba53f75f0f48fc98bb82d3db99e72e19bc9991d488d314fc8cca01e4228a`.

It is an active log, so later bytes do not invalidate the explicitly pinned snapshot.

## Command and presentation matrix

`BattleCommand.GetClientPresentationId` maps the private geometry commands to canonical client-presentation rows. `Character` then loads that presentation row, obtains its packed animation, and sends the result action under the canonical presentation ID.

| Mechanic | Private command | Normal/Hard canonical row | Extreme canonical row | Current packed WSS |
|---|---:|---:|---:|---|
| Incinerate | `23982` | `23363` | `23579` | WSS1 in both cases |
| Eruption | `23983` | `23364` | `23582` | WSS2 Normal/Hard; WSS1 Extreme |
| Center Plume | `23987` | `23376` | `23593` | WSS3 Normal/Hard; WSS2 Extreme |
| Outer/final Plume | `23988` | `23404` | `23595` | WSS1 Normal/Hard; WSS4 Extreme |

These SQL mappings describe the current implementation. The repository's hydrated command generation is heuristic, and the same low WSS banks are reused for unrelated names. The rows are not proof of the exact retail 1.23b selector.

## Incinerate / Ifrit breath

### Server shape

Private Incinerate row `23982` has:

- AOE type `2`, a cone;
- range `10`;
- cone angle `1.5708` radians, approximately 90 degrees;
- source/caster origin;
- canonical presentation `23363` or `23579`;
- packed animation `318771200` = `0x13001000` = WSS1.

At a distance of ten units, a 90-degree cone has a theoretical full width of twenty units. The WSS1 caster's raw forward sheets are approximately seventeen units wide before internal VEFF transforms. That agreement is much stronger semantic evidence than the command name alone.

### WSS1 action topology

Installed WSS1:

- path `client/chara/mon/m852/act/emp_emp/wss/base/0001`;
- `423,680` bytes;
- SHA-256 `10b6aac9583319ddde403800df8b0939ab535440cb5c9178c53a72452576c32b`;
- body motion `cbbm_sp_01`, `60` frames at 30 fps = `2.000 s`;
- caster scheduler `mon_main`, `1,760` bytes, SHA `e62669ce36d7ffc8ede2330f5faa56de98e6fe9ed051913e2517a776eb6e03cf`;
- target scheduler `m852_0001`, `1,136` bytes, SHA `9d0892b7a2d696ebd48e968b2e52b5739378b8d578de80b1eaf705a7cb6d3fc1`;
- effect package `skill01`, `183,843` bytes, SHA `3fe48cc8389d3acfbc8066324b1dd4c82c51476ce0c26c878b52e422907e653c`.

The caster scheduler references the Ifrit body motion, caster effect, and three separate kick controllers. The target scheduler uses damage-result selection and a separate target effect.

| Branch | Resource | Bytes | SHA-256 / timing |
|---|---|---:|---|
| Caster VEFF | `4hxifNift_sklc1` / `ift_sklc1y` | 31,388 | `98d42313755b4b6fc5aa77286fecd79362232e8acda8c3ce04b14fa9ece906f7` |
| Kick VEFF | `3ETEayift_sklk1` / `ift_sklk1y` | 5,916 | `63438ee9b57ba99b832913b6ec807c159d0b96af7a96e19789cb1443c1b15f66` |
| Target VEFF | `3T5RIOift_sklt1` / `ift_sklt1y` | 27,868 | `0d570f6e0ff406ad83c703b75e77d1985ad1b61004cc680e3574eac70e1417e5` |
| Caster ACB | `m852_0001_cas` | 1,016 | 61 frames; `4e1b3f279d884befb1968bb406525d0e16a5e65ffd44472528f56e32e8cebac2` |
| Kick ACB 1 | `m852_0001_ksk1` | 1,016 | 21 frames; `cca15e6a081eca0eeeaa5c4e3795d048846b8847c0fb3bf7090ee060690577c9` |
| Kick ACB 2 | `m852_0001_ksk2` | 1,016 | 21 frames; `2f16dce5618eda82ac0520d52f97291dab711cbc2c42a162b7f366ec6618273a` |
| Kick ACB 3 | `m852_0001_ksk3` | 1,016 | 21 frames; `fe5a5f2eac0be91b7f38d590266d12b8646c87a9e2d8724d4122351e667ab786` |
| Target ACB | `m852_0001_tar` | 1,016 | 61 frames; `79c063fc4cd05ee2ea358f8e83966ca401df33dd45d4093cb5e55def519f6cb1` |

### Raw caster geometry

The embedded `SEDBvmdl` bounds below are model-local source bounds before VEFF node transforms, scaling, or emission. They should not be treated as final world-space dimensions.

| WSS1 model | Local minimum | Local maximum | Extent |
|---|---|---|---|
| `cy0fir01y` | `(-8.414, -1.428, -0.171)` | `(8.722, 2.690, 8.030)` | `(17.136, 4.118, 8.201)` |
| `ds0dis01y` | `(-8.504, -0.431, -0.010)` | `(8.508, 0.429, 8.482)` | `(17.012, 0.860, 8.492)` |
| `ds0lin01y` | `(-8.238, -0.231, approximately 0)` | `(8.242, 0.229, 8.210)` | `(16.480, 0.461, 8.210)` |

These three similarly shaped, forward-offset meshes are the strongest evidence that WSS1 is the Incinerate/breath package. The target branch's largest ring, `rg0fire06y`, is only `(6.883, 6.661, 0.081)` in its own local orientation.

### Attachment result

WSS1 contains scheduler/effect attachment strings `root` and `005_n_hara`. It contains no mouth, jaw, or head attachment token. This does not mean the flame is intended to start at Ifrit's pelvis: the VEFF's large source meshes are themselves forward-authored. Placement is therefore a combination of actor-root/hara binding and local mesh/effect transforms, not a mouth-bone bind.

The caster VEFF uses root-position controls and has no `GenerateMaster` or `ManyGenerate*` controller. Its large forward volume is authored directly rather than generated as a radial floor field.

### Breath verdict

Confidence is **high for WSS1 as the current and content-compatible Incinerate presentation**, but not exclusive retail proof because the current SQL reuses WSS1 for other names.

If Ifrit performs a body action but the breath flames are missing, the missing layer is not another body animation. The likely missing consumption is WSS1's nested caster VEFF and/or the three kick effect controllers. A body-only `cbbm_sp_01` playback cannot produce the flame wedge.

## Radiant Plume ground design

### Current Hard choreography

Current `startPlume` creates exactly one helper:

- center: class `2207310` at the arena center;
- outer: class `2207310` at the arena center;
- final: class `2207310` at Ifrit's current position.

Center uses private `23987`; outer/final use `23988`. The final helper receives `ifrit.plume.full_floor`, and `monster_tp.lua` changes only that execution copy to an inner radius of `8` and outer radius of `50`. Ordinary outer is `8-22`; center is radius `16`.

No current encounter code sends:

- a Plume floor-cell coordinate list;
- one helper per plume;
- a radial position array;
- the radius or donut parameters to the client animation;
- a map-object Plume scheduler;
- an arbitrary VFX-at-world-coordinate packet.

One selected WSS must therefore generate the entire recognizable layout relative to its source/target actor, or the layout will not appear.

### Why selected Hard WSS1/WSS3 do not explain the expected design

Hard center resolves to WSS3; outer/final resolve to WSS1.

| Selected bank | Relevant decoded structure | Raw largest floor-like piece | Plume problem |
|---|---|---|---|
| WSS1 outer/final | Caster + three kick + target; no `ManyGenerate*` | target `rg0fire06y`, extent `(6.883, 6.661, 0.081)` | Dominant caster geometry is the forward breath wedge, not a circle/donut; no decoded repetition mechanism for `8-22` or `8-50` |
| WSS3 center | Caster + target; no `GenerateMaster` or `ManyGenerate*` | target `rg0fire06y`, extent `(6.883, 6.661, 0.081)` | Local rings/fire are far smaller than a raw 32-unit-diameter center danger field and no decoded radial repetition is present |

This does not mathematically prove that an internal static VEFF node cannot scale a mesh. It does prove that:

- the wrapper-level transforms are identity;
- there is no raw 16/22/50-yalm circular or donut mesh;
- WSS1/WSS3 expose no decoded multi-generation controller;
- WSS1's only very large authored caster geometry is frontal and breath-shaped.

The current donor reuse is therefore a concrete explanation for the observed symptom: a bank that fits Incinerate is also asked to represent outer/final Plume.

### Wrapper FCurve result

Every embedded effect FCurve resource in WSS1, WSS2, WSS3, WSS4, WSS10, WSS12-WSS14, WSS21, and WSS22 was parsed. Counts are:

| Bank | Embedded effect FCurve resources |
|---:|---:|
| WSS1 | 5 |
| WSS2 | 2 |
| WSS3 | 2 |
| WSS4 | 3 |
| WSS10 | 1 |
| WSS12 / WSS13 / WSS14 | 3 each |
| WSS21 / WSS22 | 2 each |

Every resource has the same nine-channel constant `TransForm` value:

`translation (0,0,0), rotation (0,0,0), scale (1,1,1)`.

Each also contains an animated `MoveRatio` curve. The identity wrapper transform means the gameplay radii are not being injected as an outer translation/rotation/scale curve. Any broad pattern must come from internal VEFF controls/static node transforms, generated repetition, or multiple actor placements.

### Generated-layout candidates

#### WSS21: strongest helper-pattern candidate

WSS21 is installed at `788,480` bytes with SHA-256 `d365c2f62241323971e73880bddd3b1908bfa8ffea269d17fa3dd158f25ecd34`.

It has no outer Ifrit skeletal motion. Its schedulers reference Kuroko `m999`:

- caster `mon_main`, SHA `b6c2e38807d63d26638c2edf528391e3d2b61489fd780c26e9efbc738fe140cf`;
- target `m999_0002`, SHA `c644a10d737b28422c310a3d116ee48d69925b0adfea02a6c5827315b6237d0d`;
- caster VEFF `ift_sklc6`, `58,460` bytes, SHA `82b14539ad17047e7a5b31ace490a175fa0d08be6f7028dfc3ae5cd19caac6f0`;
- target VEFF `ift_sklt6`, `32,556` bytes, SHA `23268536d46a33916e9279add8719b927800b0cad2f1d0454af7a808c3c24021`.

Both VEFF branches contain:

- `ManyGenerateUnitTime`;
- `ManyGenerateFormSphere`;
- `ManyGenerateMotionEmission`;
- `ManyGenerateDrawLine`;
- root and local position controls.

The caster additionally has `GenerateMaster`. Its raw source pieces remain local: `rg0frb03y` is approximately `(2.562, 0, 2.505)`, while the target's `rg0fire06y` is `(6.883, 6.661, 0.081)`. Thus a broad final layout, if present, would come from generator placement/emission rather than one giant source mesh.

This topology makes WSS21 the strongest static candidate for a helper-authored distributed fire-floor design. It remains **unproved** because no recovered command, retail bridge, or current encounter selector joins Plume to WSS21.

#### WSS12-WSS14: generated major-special family

WSS12-WSS14 each contain three effect branches: caster, `bom`, and target.

- caster branch: `GenerateMaster` plus the full `ManyGenerate*` sphere/emission family;
- `bom` branch: `GenerateMaster`;
- target branch: the full `ManyGenerate*` family; WSS13/WSS14 target also contain `GenerateMaster`.

Their largest raw ring source is `rg0fire04y`, extent `(7.771, 6.661, 0.081)`. Their sphere/fire pieces are about `2.3-2.5` units across. As with WSS21, any large pattern must be constructed by the generators and internal transforms.

However, all three also carry the same Ifrit body motion `cbbm_sp_b03`, 130 frames / 4.333 seconds, with a large local vertical rise. They are best labeled **large generated Ifrit fire-impact variants; possible Plume/Hellfire; exact mechanic unresolved**.

#### WSS4: lower Plume candidate

WSS4's target VEFF has the full `ManyGenerate*` family, but its extra `bom` branch includes `pl0obj01y`, a large forward plane with extent `(17.321, 0, 9.899)`. That is evidence for a generated target effect plus a large directional object, not a clean static donut identification. It remains a lower comparison bank.

### Plume candidate ranking

| Rank | Bank | Static reason | Boundary |
|---:|---|---|---|
| 1 | WSS21 | Effect-only Kuroko/helper bank; generated caster and target layouts; no Ifrit body motion | No Plume selector recovered |
| 2 | WSS12-WSS14 | Generated caster and target layouts; substantial fire/ring family | 130-frame body special may be Hellfire/other major attack |
| 3 | WSS4 | Generated target branch and large authored fire/object plane | Directional geometry; not a proved radial Plume |
| Current but poor fit | WSS3 / WSS1 | Actually selected by Hard center / outer-final | No generated radial layout; WSS1 is dominated by breath geometry |

## Eruption ground fire and rocks

### Current server choreography

`startEruptionVolley` creates three pulses per train:

- train 1 caster: real Ifrit;
- train 2 caster, when present: class-`2207310` helper at arena center;
- each pulse snapshots the current selected player's X/Y/Z before starting private `23983`;
- the state waits for `CanChangeState`, so the nominal one-second next-pulse request is gated by the three-second action/cast state.

`MobSkillState` retains the immutable ground point. At resolution, `TargetFind.FindWithinAreaAtPosition` scans actors against that point. Damage is therefore genuinely ground-snapshotted on the server.

The client result envelope does not contain that point. It contains a source actor ID, canonical command/animation, and result target actor IDs. X01/X10/X18 do not serialize the frozen X/Y/Z. The client can bind target art to a character and caster art to Ifrit/helper, but it is never directly told to bind either branch to the frozen coordinate.

### Current WSS2 presentation

Normal/Hard Eruption resolves to canonical row `23364` and WSS2.

- installed size `515,904`;
- SHA-256 `5f832618e64f086be4ae33d75ea4552c92876e7ed4e01b6cd31cea0ac15af45e`;
- body `cbbm_sp_02`, 30 frames / 1.000 s;
- caster VEFF `ift_sklc2`, `24,620` bytes, caster smoke/aura/glow/fire/distortion;
- target VEFF `ift_sklt2`, `25,100` bytes, target fire rings/glow/sonic;
- both branches contain `GenerateMaster`, but neither contains `ManyGenerate*`;
- no recovered `rock_*` texture or rock model.

Representative raw bounds:

| Model | Branch/use | Extent |
|---|---|---|
| `rg0fire06y` | target fire ring | `(6.883, 6.661, 0.081)` |
| `rg0fire05y` | target fire ring | `(2.390, 2.390, approximately 0)` |
| `pl0smk01y` | caster smoke plane | `(5.894, 5.894, approximately 0)` |
| `sp0dis02y` | caster distortion sphere | `(3.046, 2.340, 2.000)` |

WSS2 can explain a compact flame ring. It cannot explain the expected rocky eruption because the rock assets are absent from this bank.

### Rock candidates and ownership

#### WSS10

WSS10 is `312,128` bytes, SHA `9de9b7d1cfe0329e5f863ad348c553ce12ef32bfe7ad00af9d578b5932e2cf0d`. It contains `rock_u04`, fire, glow, sonic, distortion, sound, and camera shake. Its only actor-specific effect branch is caster `mon_main` / `m852_0010_cas`; it has no target scheduler, target VEFF, or target ACB.

Its largest decoded rock/distortion sheet, `ds0jwr02y`, has extent `(3.255, 0.258, 3.255)`. WSS10 is therefore a strong **caster-centered rock burst**, not a remote target-ground package.

#### WSS22

WSS22 is effect-only Kuroko content:

- installed size `740,448`;
- SHA `035e5346203e2d9a715b8c89cee14d8f0001fc38d7b43bc1bf74c44db24e78e3`;
- caster VEFF `ift_sklbb`, `38,188` bytes, SHA `e4675cd6d2105aaa91f293f81b76ed651ad9fc1c87c8afa5b943db41328286fa`;
- target VEFF `ift_skltb`, `32,556` bytes, SHA `d719652e0edb0f08ab95840665afe79f3c264d4f2041680bc1c8d403a4eedb23`.

The branch split is decisive:

| WSS22 branch | Controls/content | Ownership implication |
|---|---|---|
| Kuroko caster | `GenerateMaster`; `rock_f11`, `rock_u03`, `bx0roc01y`, rock/distortion sheet, cylindrical fire, glow | Rocks remain centered on the caster/helper |
| Target | full `ManyGenerate*` sphere/emission family; fire rings, glow, sonic, distortion; no rock | Can generate target-side fire layout, but not target-side rocks |

Representative raw caster bounds:

- `ds0jwr01y`: `(3.255, 0.258, 3.255)`;
- `bx0roc01y`: `(0.471, 0.813, 0.522)`;
- fire cylinders: approximately `2.0-2.6` wide by `4.0` in their long local axis.

The small rock pieces are intended to be assembled into an effect, not used as one giant authored ground mesh. But the assembly still belongs to the caster branch. WSS22 can only put the rocky burst at the frozen point if a compatible stationary caster is located there.

### Eruption runtime trace

At the pinned log snapshot:

- 109 Eruption pulse-start lines were retained;
- train 1: 25 pulse-1, 24 pulse-2, 24 pulse-3 lines;
- train 2: 12 complete three-pulse sets;
- 16 exact snapshot coordinate triples occurred;
- 71 uninterrupted pulse intervals under ten seconds ranged `3.043-4.104 s`, median `3.104 s`, mean `3.197 s`;
- all retained sample target IDs were actor `1`;
- 24 class-`2207310` helper spawn warnings reported `actorMismatch`, `bnpc=3057`, `mobTypeActor=2207302`.

The trace proves that the scripted three-pulse cadence and second-train helper path execute. It does not prove visible Eruption art, correct fixed anchoring, rock ownership, or successful model/effect compatibility.

### Helper compatibility problem

The current helper actor class is:

- class `2207310`;
- path `/Chara/Npc/Monster/Ifrit/IfritHotAir`;
- actor-class display `3207302`;
- appearance base model `1255`, size `2`.

Base model `1255` is not Ifrit base `10852` / `m852`, nor generic Kuroko base `10999` / `m999`. The encounter passes the profile's Ifrit battle-NPC ID while using actor class/appearance `2207310`; the log records the resulting actor/mob-type mismatch. Reaching the spawn path does not prove that this actor can consume an `m852` or `m999` bank correctly.

For Plume, the helper is at the intended layout center but compatibility is open. For Eruption, compatibility is open **and** the helper is at arena center rather than at the frozen snapshot.

### Eruption candidate ranking

| Rank/use | Bank | What it can supply | What remains missing |
|---|---|---|---|
| Current flame donor | WSS2 | Compact target-side fire rings/glow/sonic | No rocks; no fixed coordinate owner |
| Strong remote-helper comparison | WSS22 | Kuroko caster rocks/fire plus generated target fire rings | Rocks are caster-owned; no live selector; caster must be at snapshot |
| Strong caster burst comparison | WSS10 | Rock/fire/glow/distortion/camera burst | Caster-only; no target branch; no live selector |
| Secondary moving-fire comparison | WSS4 | Generated target fire plus large extra fire/object plane | No recovered rocks; exact mechanic unresolved |

## Static parser notes and reproducibility

All binary operations were reads against installed extensionless action files.

### VEFF controls

For each `SEDBveff` object:

1. locate the `SEDBveff` signature;
2. read its little-endian object size from `+0x10`;
3. restrict token/control inspection to that exact object range;
4. count class strings such as `GenerateMaster`, `ManyGenerateUnitTime`, `ManyGenerateFormSphere`, `ManyGenerateMotionEmission`, and `ManyGenerateDrawLine`.

This exact-range scan is what separates WSS21's generated caster **and** target graphs from WSS22's simple rock caster and generated fire-ring target.

### VMDL local bounds

For each embedded `SEDBvmdl` object:

1. locate the object's record block;
2. find the aligned record with `kind=14`, `size=68`, `live=1`;
3. read six little-endian floats at record `+0x14` as local minimum XYZ and maximum XYZ;
4. subtract minimum from maximum for extents.

These values are raw model-local bounds. VEFF node transforms, scale, emission, actor scale/orientation, and world placement can change the rendered result. The bounds are still decisive for distinguishing WSS1's unusually large forward sheets from the small source pieces used by generated radial candidates.

### Embedded effect FCurves

For each `FCurve####.fcr` resource:

1. use the wrapper size at resource `+0x10`;
2. enter the embedded `SEDBmtb` object at wrapper `+0x20`;
3. decode the three offset tables beginning at `SEDBmtb + 0x40`;
4. pair property names with property entries;
5. decode channel count from the low byte of the property type;
6. read constant channel values or animated key records.

All inspected action-effect wrappers use identity `TransForm`; their `MoveRatio` property is animated. No file was patched to obtain this result.

## Proven, inferred, and open

| Finding | Status |
|---|---|
| Current Incinerate selects WSS1 | Proven current source/SQL |
| WSS1 contains large forward fire/line/distortion geometry matching a cone | Proven client decomp |
| WSS1 is the exact exclusive retail Incinerate bank | Strongly inferred; not exclusive retail proof |
| Missing breath flames live in WSS1's caster/kick controllers rather than another body motion | Strong content-based conclusion |
| Current Hard center Plume selects WSS3; outer/final selects WSS1 | Proven current source/SQL |
| WSS1/WSS3 have no decoded `ManyGenerate*` radial controller | Proven client decomp |
| WSS1's dominant caster geometry is a breath-like forward wedge | Proven raw geometry |
| WSS21 has generated effect-only caster and target layouts | Proven client decomp |
| WSS21 is retail Radiant Plume | Open; candidate only |
| WSS12-WSS14 are generated major Ifrit fire-impact variants | Proven client decomp |
| WSS12-WSS14 are Plume rather than Hellfire/another special | Open |
| Current Eruption damage uses a frozen server coordinate | Proven current source |
| The frozen coordinate is absent from action-result packets | Proven packet structure |
| Current WSS2 contains target fire rings but no rocks | Proven client decomp |
| WSS10 and WSS22 contain rocks | Proven client decomp |
| WSS10/WSS22 rocks are caster-owned | Proven scheduler/VEFF topology |
| Current helper is a compatible renderer for the selected `m852`/candidate `m999` art | Open; actor/base-model mismatch remains |
| Substituting a candidate bank will fix either mechanic | Not justified by static decomp |

## Documentation-only closing capture matrix

No probe was run during this report. These are the minimum observations that would close the remaining static boundaries without first changing encounter data:

| Question | Controlled observation needed |
|---|---|
| Does current Incinerate execute all WSS1 layers? | Packet-synchronized video showing private `23982` -> canonical `23363/23579`, Ifrit body, caster VEFF, and three kick layers |
| Can WSS3 draw a 16-yalm center field from one actor? | Stationary compatible Ifrit-model anchor at known coordinate, WSS3, overhead scale reference |
| Is WSS21 the recognizable Plume pattern? | Compatible `m999` anchor, caster/target branches captured separately and together, overhead frame with measured arena reference |
| Are WSS12-WSS14 Plume or Hellfire variants? | Same Ifrit actor and facing, one capture per bank, full 4.333-second body/effect tail |
| Can WSS2 stay at a frozen point? | Stationary anchor self-target WSS2 versus moving-player target WSS2 |
| Do WSS22 rocks follow caster while rings follow target? | Separate caster and target positions with large spacing, record both simultaneously |
| Can rocks appear at the Eruption snapshot? | Compatible caster physically placed at the captured point, WSS10 and WSS22 caster branch A/B |
| Does class `2207310` consume the art? | Same bank on `2207310`, `m852`-compatible actor, and `m999`-compatible actor with identical coordinates |

## Relationship to prior Ifrit reports

This report supplements, and where more specific supersedes, these earlier Markdown files:

- `RADIANT_PLUME_AND_GROUND_ERUPTION_DECOMP.md` for the server/packet ownership model;
- `IFRIT_ERUPTION_ANIMATION_DECOMP.md` for WSS2/WSS10/WSS22 resource topology;
- `IFRIT_CLIENT_ANIMATION_BANKS.md` and `EXHAUSTIVE_CLIENT_ASSET_COVERAGE.md` for the installed-bank census and nested resource hashes.

The new contributions here are:

- the WSS1 raw mesh proof tying its caster package to Incinerate's forward cone;
- the explicit absence of mouth/head binding and the root/hara plus forward-mesh placement explanation;
- exact VEFF generator-class comparison across selected and candidate Plume/Eruption banks;
- exact embedded effect-FCurve identity transforms;
- raw source-mesh bounds for the selected and candidate floor effects;
- a current 2026-08-03 runtime cadence/helper-warning snapshot;
- a consolidated, user-narrowed ranking that excludes Nails and makes no data-change recommendation.
