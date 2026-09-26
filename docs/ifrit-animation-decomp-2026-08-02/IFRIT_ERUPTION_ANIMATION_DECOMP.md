# Ifrit Eruption animation decomp

Snapshot: **2026-08-02, current-point audit at 20:39 -04:00**  
Installed client: **`2012.09.19.0001` (FFXIV 1.23b)**  
Policy: **read/decompile and Markdown only**. No source, SQL, validator, client DAT, executable, build artifact, capture, or gameplay data was changed for this report.

## Result

The installed client contains the Eruption presentation layers. The strongest current problem is the join between server damage geometry and client visual ownership:

- Normal/Hard private Eruption `23983` currently resolves its result presentation through canonical command `23364`, Ifrit WSS `0002`.
- WSS2 is not just a body pose. It has distinct caster and target schedulers, and its target package contains a compact fire-ring/glow/sonic effect.
- The server freezes damage to the selected target's cast-start point, but the X01 action-result packet contains source and target actor IDs only. It has no arbitrary world X/Y/Z field.
- The extra Hard Eruption helper is an action source at arena center, not a stationary effect anchor at the frozen point.
- Therefore server damage can remain fixed while target-bound VFX follows an actor, renders at the wrong owner, renders with the wrong visual scale, or does not establish the expected ground eruption at all.

The earlier description of WSS `0010` as the strongest general Eruption solution needs correction. WSS10 has the clearest rock/fire burst vocabulary, but it is **caster-only**: no target scheduler, no target VEFF, and no `m852_0010_tar`. It can produce a burst centered on its caster; it cannot by itself explain a remotely placed target-ground Eruption.

Effect-only WSS `0022` is the stronger remote rock/fire comparison because it has explicit Kuroko caster and target branches, rock geometry, fire rings, glow, distortion, motion emission, and camera shake. No current encounter selector invokes it, so it remains a probe candidate rather than a safe numeric substitution.

## Disposition by evidence class

| Question | Finding | Confidence |
|---|---|---|
| Are Eruption-like client assets missing? | No. WSS1/2/3/4/10/21/22 all contain relevant authored content | Confirmed installed capability |
| Which bank is selected for current Normal/Hard results? | Canonical `23364`, WSS2 | Confirmed current source/SQL mapping |
| Does WSS2 include ground-side flames? | Yes. It has an explicit target scheduler and compact ring/fire/glow/sonic package | Confirmed client decomp |
| Is WSS10 a remote ground effect? | No. It is caster-only | Confirmed topology |
| Does the server freeze Eruption damage? | Yes, to cast-start X/Z geometry | Confirmed current source |
| Does the client packet receive that frozen coordinate? | No X/Y/Z field exists in the current X01 result envelope | Confirmed packet structure |
| Does the current helper anchor VFX at the snapshot? | No. It remains at arena center and targets an actor | Confirmed current source |
| Is WSS2 the retail-correct radius-eight visual? | Unproved; the selected named row is the compact/no-rock variant and has range `1` | Open |
| Is WSS22 the retail selector? | Unproved; content makes it a strong comparison only | Open |
| Did current source visibly render in the latest audit? | No fresh capture; no Map Server process was running at the final source point | Open |

## Named Eruption command surface

The locally tagged command rows connect the name `eruption` to WSS1, WSS2, and WSS3. That is stronger evidence than texture semantics alone, but command names do not make each bank exclusive to Eruption; the same banks are reused by other Ifrit actions.

| Command | Name | Selected WSS | Row range | Interpretation boundary |
|---:|---|---:|---:|---|
| `23364` | Eruption | `0002` | `1` | Current Normal/Hard presentation donor; compact target fire ring, no recovered rock |
| `23374` | Eruption | `0001` | `7.5` | Radius-sized named donor with caster/target branches |
| `23375` | Eruption | `0002` | `1` | Second named WSS2 variant |
| `23582` | Eruption | `0001` | `8` | Current Extreme presentation donor |
| `23592` | Eruption | `0001` | `1` | Compact named WSS1 variant |
| `23594` | Eruption | `0003` | `8` | Radius-sized named donor with caster/target branches |

Private command `23983` is a target-origin circle with radius `8`, range `50`, vertical height `10`, potency `100`, cast type `11`, cast time `3000 ms`, animation duration `3 s`, and fire property `9`. Its own private row contains packed WSS1, but `BattleCommand.GetClientPresentationId` overrides the result donor to:

- `23364` / WSS2 for Normal and Hard.
- `23582` / WSS1 for Extreme actor class `32701`.

That produces a material Normal/Hard question: radius-eight server geometry is being presented through a named row whose range is `1`, while named radius-like Eruptions use WSS1 or WSS3. The range column is not proven to be the rendered VFX radius, so this is a selector/scale mismatch candidate, not proof that `23364` is wrong.

## Installed Eruption comparison banks

| WSS | Bytes / SHA-256 | Body motion | Caster/target topology | Decoded presentation vocabulary | Current assessment |
|---:|---|---|---|---|---|
| `0001` | 423,680 / `10b6aac9583319ddde403800df8b0939ab535440cb5c9178c53a72452576c32b` | `cbbm_sp_01`, 60f / 2.000 s | Ifrit caster + target + three kick controllers | Fire `u04/u16/u33`, glow, sonic, fire-ring geometry; no camera shake | Canonical named Eruption donor; current Extreme donor |
| `0002` | 515,904 / `5f832618e64f086be4ae33d75ea4552c92876e7ed4e01b6cd31cea0ac15af45e` | `cbbm_sp_02`, 30f / 1.000 s | Ifrit caster + explicit target | Compact target rings, fire, glow, sonic; caster smoke/aura/fire/distortion; no rock/camera shake | Current Normal/Hard donor; target-side package is the decisive missing layer |
| `0003` | 768,448 / `9b99c9ac481c0036fb6e66fec69b479599c99c4b9e3df401d97bb2127268e7b9` | `cbbm_sp_a01`, 80f / 2.667 s | Ifrit caster + explicit target | Fire, aura, smoke, glow, sonic, distortion, camera shake; no recovered rock | Canonical named radius-eight Eruption donor |
| `0004` | 862,880 / `581822c4e5419d02d3ba3c6e2804a58879484528351c2f6247fcc80af99416c9` | `cbbm_sp_a02`, 80f / 2.667 s | Ifrit caster + moving-fire controller + target | Fire/aura/glow/sonic/distortion and explicit motion emission; no `rock_u04` | Strong target-capable moving-fire comparison, not currently selected |
| `0010` | 312,128 / `9de9b7d1cfe0329e5f863ad348c553ce12ef32bfe7ad00af9d578b5932e2cf0d` | `cbbm_abl_3`, 70f / 2.333 s | **Caster-only** | Unique `rock_u04`, fire, glow, sonic, distortion, camera shake | Strong actor-centered rock burst; cannot remotely anchor target ground |
| `0021` | 788,480 / `d365c2f62241323971e73880bddd3b1908bfa8ffea269d17fa3dd158f25ecd34` | No outer Ifrit body motion | Kuroko caster + target | Bomb/fire/smoke caster; target fire rings/glow/sonic/distortion; camera shake and motion emission; no recovered rock | Effect-only helper comparison, not selected |
| `0022` | 740,448 / `035e5346203e2d9a715b8c89cee14d8f0001fc38d7b43bc1bf74c44db24e78e3` | No outer Ifrit body motion | Kuroko caster + target | Cylindrical fire, box/rock geometry, `rock_f11`, `rock_u03`, fire rings, glow, sonic, distortion, camera shake, motion emission | Strongest remote rock/fire comparison, not selected |

## Exact WSS2 target-side package

WSS2 is the current Normal/Hard donor, so its target branch is the first package that must be proved or disproved in-client.

| Component | Bytes | SHA-256 | Decoded role |
|---|---:|---|---|
| Outer WSS2 container | 515,904 | `5f832618e64f086be4ae33d75ea4552c92876e7ed4e01b6cd31cea0ac15af45e` | Complete motion/effect/sound bank |
| `cbbm_sp_02` MTB | 24,119 | `9a89221657c4301457ebdd074cb397df06837eb67d69e6aa3f268fbd12a00817` | 30-frame Ifrit body motion |
| Caster `mon_main` SCB | 1,584 | `e142b06e9fdeca177731fcd9bde8dc9ac7712df670de0afe3eb8ec20d80e269a` | 0.65 s / 9 active entries |
| Target `m852_0002` SCB | 1,136 | `60543e77989ebe7a78657e13c257f7c4087ed2ac29fa618a03b9dc79d53b6a5f` | 0.45 s / 4 active entries |
| `skill02` RES | 190,421 | `a0eb875156df81dc60624fd66041c52661821de9644eaab2c7929cdecbc96a70` | Nested effect package |
| Caster VEFF `1TuSshift_sklc2` | 24,620 | `1bf11da4feafbabb0d24af77f10dbbca5b6fd2115016716002c3a0dcadf64590` | Caster smoke/aura/glow/fire/distortion |
| Caster ACB `m852_0002_cas` | 1,016 | `9d4fbf1d026b12249cae613c93f11c13a82eb649663416162fbddfdd6c60ca16` | 56-frame effect curve at 30 fps |
| Target VEFF `1v3rVuift_sklt2` | 25,100 | `094b11c4bd129af077bb7e57292bda840f2679f6c111d26a24b61632f242f3f4` | Target ring/fire/glow/sonic visual |
| Target ACB `m852_0002_tar` | 1,016 | `c2217ac703c5f92ab0da9061f5645a2ba98b7f244e7afef76985a609ea99957c` | 56-frame target effect curve at 30 fps |

The target scheduler explicitly contains target/proxy binding, action selection, sound, and damage-selection clip classes. Target-side textures include `glow_f03`, `fire_u33`, `fire_u04`, and `snic_u03`; target models include `pl0glo03`, `rg0fire06`, `rg0fire05`, and `rg0snc02`. There is one caster sound clip and one target sound clip, but semantic cue names remain undecoded.

No `rock_*` texture or camera shake was recovered from WSS2. A reconstruction that only plays `cbbm_sp_02` omits the target fire ring. Conversely, a correct WSS2 render may still look too small or too flame-ring-like to match the expected rock eruption.

## Canonical WSS1 and WSS3 topology

### WSS1

| Component | Evidence |
|---|---|
| Body | `cbbm_sp_01`, 60f / 2.000 s; MTB SHA `d32a84d60c4b0fc2e81ee329ca84838513eb145ae2dbaee032e72f2cd4d328c3` |
| Caster scheduler | `mon_main`, 1,760 bytes, SHA `e62669ce36d7ffc8ede2330f5faa56de98e6fe9ed051913e2517a776eb6e03cf`, 0.80 s / 12 |
| Target scheduler | `m852_0001`, 1,136 bytes, SHA `9d0892b7a2d696ebd48e968b2e52b5739378b8d578de80b1eaf705a7cb6d3fc1`, 0.37 s / 4 |
| Effect package | `skill01`, 183,843 bytes, SHA `3fe48cc8389d3acfbc8066324b1dd4c82c51476ce0c26c878b52e422907e653c` |
| Caster/target curves | `m852_0001_cas` 61f; three 21f kick curves; `m852_0001_tar` 61f |
| Target VEFF | `3T5RIOift_sklt1`, 27,868 bytes, SHA `0d570f6e0ff406ad83c703b75e77d1985ad1b61004cc680e3574eac70e1417e5` |

WSS1 is a canonical named Eruption donor and the current Extreme donor. It has both caster and target ownership, so it can address a remote target actor. Static assets still do not supply an arbitrary frozen point.

### WSS3

| Component | Evidence |
|---|---|
| Body | `cbbm_sp_a01`, 80f / 2.667 s; MTB SHA `163caf017d10e2f76ee5d7880a814b107e1fa4a4ce003ef9d945a82e33e27d2a` |
| Caster scheduler | `mon_main`, 1,584 bytes, SHA `8db5bbaf85fb7d1625fe1cf821c0c395f829cff9be788ebf6afd022820be8787`, 0.80 s / 9 |
| Target scheduler | `m852_0003`, 1,136 bytes, SHA `9b21a85eefdeb835e22e774b1fba490f3cf82364f8c1a5a2b346183c74a181f8`, 0.44 s / 4 |
| Effect package | `skill03`, 291,725 bytes, SHA `5e4a438b2459100a08ba05abd40d10672b8e446f3ca5be77b8909d47b6f48aca` |
| Target VEFF / ACB | `1EGptsift_sklt3`, SHA `a7831375...`; `m852_0003_tar`, 45f, SHA `ed3d82db...` |
| Extra vocabulary | Fire/aura/smoke/glow/sonic/distortion and one camera shake; no recovered rock texture |

WSS3 is selected by named radius-eight Eruption `23594`. The current private mapping does not select it for any difficulty.

## Caster-centered and helper comparisons

### WSS10 correction

WSS10 contains `rock_u04`, `fire_u04`, `fire_u16`, `glow_f01`, sonic, distortion, one sound, and one camera shake. Its only actor-specific scheduler is caster `mon_main` (1,456 bytes, SHA `7cb30284...`) with caster ACB `m852_0010_cas` (47f, SHA `c2605e22...`). There is no target SCB, target VEFF, or target ACB.

Correct interpretation: **strong caster-centered rock burst candidate**, not a general remote Eruption bank.

### WSS21 and WSS22

Both are installed under `m852/wss` but contain no outer Ifrit skeletal motion. Their effect schedulers reference generic Kuroko `m999` resources.

| Component | WSS21 | WSS22 |
|---|---|---|
| Kuroko caster SCB | `mon_main`, SHA `b6c2e388...`, 0.81 s / 6 | `mon_main`, SHA `6767a419...`, 0.63 s / 6 |
| Target SCB | `m999_0002`, SHA `c644a10d...`, 0.50 s / 4 | `m999_0003`, SHA `e63a64cf...`, 0.50 s / 4 |
| Effect RES | `skill02`, 269,933 bytes, SHA `377dec9d...` | `skill03`, 271,029 bytes, SHA `acc9b276...` |
| Target VEFF | `02ukO8ift_sklt6`, 32,556 bytes, SHA `23268536...` | `4nEJXiift_skltb`, 32,556 bytes, SHA `d719652e...` |
| Target ACB | `m999_0002_tar`, 56f, SHA `ce701e32...` | `m999_0003_tar`, 56f, SHA `597c09c1...` |
| Rock content | None recovered | `rock_f11`, `rock_u03`, box/rock geometry |

WSS22 has the topology needed for a remote rock/fire comparison, but no recovered selector joins the live `2207310` helper or command `23983` to `m999_0003`. It must remain a controlled probe, not a claimed retail mapping.

## Current server pipeline

### Geometry

The current Eruption pipeline snapshots the selected target's world position at cast start and evaluates a radius-eight X/Z circle later. The selected player can evade by moving outside the frozen circle; another valid actor remaining inside can be hit. The vertical predicate compares against caster Y rather than snapshot Y, a detail that matters on uneven floors but not enough to create a client visual anchor.

### Hard scheduling

- Every custom Hard train has three pulses.
- Train one uses the real Ifrit as source.
- Post-Hellfire train two uses an immobile class-`2207310` helper spawned at arena center.
- The nominal pulse increment is one encounter second, but the three-second cast and `CanChangeState` gate produce the effective cadence.
- Normal uses a direct generic Eruption in its ordinary rotation.
- Extreme uses its generic sequential and grouped Eruption queues, including Nail-wave schedules.

The helper is hidden, combat-inert, invulnerable, and cleaned up correctly. Those properties establish a safe action source, not ground placement. For the extra train, the helper stays at center while its selected target and frozen damage point are elsewhere.

### Packet ownership versus damage ownership

| Stage | Server data | Client-visible address |
|---|---|---|
| Cast start | Selected target actor; snapshot X/Y/Z saved server-side | X01 cast envelope with source and selected target actor |
| Damage resolution | Immutable radius-eight point used for target scan | One or more actor result targets |
| Animation selection | Private `23983` resolves to canonical donor | Packed WSS animation from `23364` or `23582` |
| Result presentation | Source actor and result target actor(s) | X01 has no arbitrary ground coordinate |

`CommandResultX01Packet` serializes source actor, animation, action count, command, target actor, amount, text, effect, parameter, and hit fields. It has no X/Y/Z. Thus the current network contract cannot directly say "play this target VFX at the frozen point."

This is the most important Eruption distinction:

- **Damage point:** fixed server coordinate.
- **Caster owner:** Ifrit or a center helper.
- **Target owner:** a character actor in the result packet.
- **Missing join:** a stationary client-known actor or other placement mechanism at the fixed coordinate.

## Current diagnostic surfaces

Diagnostics are useful for isolating ownership; they are not encounter calls and cannot establish retail selection.

| Diagnostic | What it sends | Question isolated |
|---|---|---|
| `eruptionprobe player` | Live Ifrit, command `23364`, WSS2, explicit player target | Can the current donor's target package render on a character? |
| `eruptionprobe anchor` | Stationary class-`2207310` actor at the player point, self-targeted WSS2 | Can WSS2 remain fixed when source and target are the same stationary actor? |
| Eruption VFX comparison | Banks `4`, `10`, or `22`; commands `23364`, `23374`, or `23375`; `magic` or `anim` result modes; invisible base-model `10999` anchor at player point | Which bank/owner/result combination creates the expected ground burst? |
| General ground/bank probe | Banks `2`, `3`, `4`, `10`, `12`, `13`, `14`, `21`, `22` on scoped helper/dummy actors | Broad installed-bank render comparison |

Current comparison code does **not** set the older described skill03 graphic `3072` or equipment slots `12`-`17`; that claim is stale.

The actual encounter never references WSS4, WSS10, WSS21, WSS22, commands `23374`/`23375`, base model `10999`, or class `2207314`. A successful diagnostic render would therefore identify a missing presentation edge, not prove that the live encounter already uses it.

## Persisted log evidence

The `2026-08-02` release map log contains:

- Repeated three-pulse Hard Eruption train entries with recorded cast-start snapshots.
- Simultaneous post-Hellfire train-one/train-two entries.
- WSS2 player probes at `19:54:11`, `19:54:26`, and `19:54:36`.
- Transport summaries around those requests containing X01 (`0x0139`) traffic.

Those entries prove that an earlier build reached the action scheduling and packet-queue path. They do not prove visible rendering, fixed placement, or the latest current-source build. At the final audit point no Map Server process was running, so the newest WSS/Nail changes have no fresh runtime capture.

## Battlefield boundary

The installed Bowl layout contains the persistent arena boundary ring:

- group `sgrp_vfx_ifring`;
- layout instance `isgrp_016280`;
- VFX `vfx_ifuring1_001`;
- show/hide/VFX timelines and collision.

No Bowl layout or weather resource in the scanned surface contains a literal Eruption, Plume, Hellfire, Nail, Kuroko, or Ifrit skill scheduler. The persistent arena ring is therefore separate evidence and must not be relabeled as the missing combat Eruption.

## Most likely failure classes

1. **World-anchor gap:** fixed damage coordinates never become a client-known stationary target at that point.
2. **Target ownership gap:** WSS2's target package binds to an actor and may move with, or depend on, that actor instead of remaining at cast-start ground.
3. **Variant/scale mismatch:** Normal/Hard radius-eight damage currently uses compact WSS2/row-range-1 presentation while radius-like named rows select WSS1 or WSS3.
4. **Missing effect layer in a body-only test:** playing `cbbm_sp_02` without its target SCB/VEFF/ACB omits the fire ring entirely.
5. **Helper/model compatibility:** extra-train class `2207310` is a hidden source, not a proved renderer for every Ifrit donor layer.
6. **Expected-rock mismatch:** WSS2 has fire/glow/sonic but no recovered rock; the visible effect may be functioning yet still not resemble the expected eruption.

These are ordered decomp findings, not authorization to change selectors or data.

## Capture matrix needed to close Eruption

| Test | Owner/target | Bank | Decisive result |
|---|---|---:|---|
| Current live donor | Ifrit -> stationary player | `0002` | Confirms whether target ring renders at all |
| Movement test | Ifrit -> player who exits cast-start point | `0002` | Shows whether VFX follows actor or remains fixed |
| Fixed self-anchor | Stationary helper at point -> itself | `0002` | Isolates world stability from actor binding |
| Canonical radius donors | Correct Ifrit source -> stationary anchor | `0001`, `0003` | Compares named radius-like variants to WSS2 |
| Moving-fire comparison | Ifrit/helper -> anchor | `0004` | Confirms target and motion-emission layers |
| Caster rock comparison | Stationary caster at point | `0010` | Confirms WSS10 can work only as caster-centered burst |
| Helper rock comparison | Kuroko-compatible source/target anchor | `0022` | Confirms remote rock/fire helper package |

For every capture, record command ID, packed animation, source/target actor IDs, source/target world transform, result effect/hit fields, cast-start snapshot, packet time, first visible frame, last visible frame, effect center, follow behavior, scale, rock/fire layers, sound, camera shake, and cleanup.

## Source pins

The working tree changed during the investigation. These claims are time-bounded to:

| Input | SHA-256 at 2026-08-02 20:39 -04:00 |
|---|---|
| `Data/scripts/directors/InstanceRaid/IfritEncounter.lua` | `7a421e1e589ecde284ee062f46a3f39f651f477d30be6d6971d4ffe46d0b4749` |
| `Map Server/Primals/IfritManager.cs` | `6ad2c0d2fac92beafbd8ab95dffc7f4dc503ca92275b8bc0cf24985fa0fb9c4f` |
| `Map Server/WorldManager.cs` | `5b67b1acf80b5dcc228e0d81c6ac809690d1d64454c70fc14bf1863c1946ad2b` |
| `Data/scripts/commands/gm/testifrit.lua` | `ca6fc7f72c78e72040597340e7fbc9b90d53f39a6762c81ce8115ee3e6a3b692` |
| `Map Server/Actors/Chara/Ai/BattleCommand.cs` | `273e24860aa9d2d3ce0795e7a1d88ef39db646bd65268528537b87f74e6cdb30` |
| `Map Server/Actors/Chara/Ai/State/MobSkillState.cs` | `fc03f519877d0aac45dfb24f84165dab9a762a3f4c3abd71ce50530f8bcb3240` |
| `Map Server/Actors/Chara/Character.cs` | `e7a436a774911831b1f48f30385068d111340ccfa35b5b555b7ad581a5a6220b` |
| `Map Server/Packets/Send/Actor/Battle/CommandResultX01Packet.cs` | `67a4ad972c25d036969fa702abb7e407604da2d670627ee9c32f5c84c956cb23` |
| `Data/sql/server_battle_commands.sql` | `f384837334acdf9dafa9bd0bfb750a15dcb814ba12578b797534dac2b092bc96` |

Both the Eruption snapshot validator and the full Ifrit family validator passed at this source point. They prove expected source structure and server geometry, not client visual placement.

## Final conclusion

Eruption is not blocked by absent client art. The current Normal/Hard donor, WSS2, already has the target-side fire-ring presentation that a body-only reconstruction misses. The unresolved—and likely decisive—edge is that server damage is frozen to a coordinate while the result packet addresses actors only. WSS10 cannot solve that remotely because it is caster-only. WSS22 has a stronger remote rock/fire topology but no live selector. WSS1 and WSS3 are canonical named Eruption donors and must be compared, especially because the current radius-eight mechanic maps to the compact WSS2 variant.

No selector or data change is justified by static decomp alone. The next closing evidence is a packet-synchronized A/B capture that separates WSS2 target rendering, fixed-anchor behavior, and WSS1/WSS3/WSS22 visual identity.

