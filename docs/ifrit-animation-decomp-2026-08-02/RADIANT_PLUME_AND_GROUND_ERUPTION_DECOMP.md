# Radiant Plume floor design and ground Eruption decomp

Audited read-only on 2026-08-02 through 21:38:45 -04:00.

## Result

The missing visual layer is real, and it is not the same thing as the server's damage geometry.

Radiant Plume and Eruption are each split across four independent pieces:

1. server damage geometry;
2. the source and target actors sent to the client;
3. the selected WSS effect bank and its caster/target branches;
4. any authored floor pattern or stationary world anchor.

The current implementation has the first three pieces in partial form. It does not have a recovered fourth-piece join that proves the expected retail ground presentation.

- Eruption freezes an eight-yalm damage circle at the selected player's cast-start position, but that world coordinate is never serialized to the client. The current target-side effect is bound to an actor, not the frozen point.
- Radiant Plume computes a circle or donut around one source/target actor. It does not send a radial list of plume positions, a floor-cell array, or a 16/22/50-yalm visual scale to the client.
- Hard mode supplies one helper actor at the center or at Ifrit's current position. That can be an origin for an internally authored effect, but it is not a set of individual plume placements.
- No recovered Bowl map-object scheduler owns Eruption or Radiant Plume. The persistent arena fire ring is a separate battlefield object.

The concise diagnosis is:

> Eruption is missing a client-known owner at its frozen ground point. Radiant Plume is missing a proved authored floor-pattern owner. Both may also be affected by the helper's base-model/WSS compatibility and by locally guessed presentation donors.

No source, SQL, DAT, executable, game data, or runtime state was changed during this decomp. This report is documentation only.

## Four-layer ownership model

| Layer | Eruption | Radiant Plume | Current status |
|---|---|---|---|
| Gameplay geometry | Frozen target-origin circle, radius 8 | Target- or source-origin circle/donut, radii 16, 8-22, or 8-50 | Implemented server-side |
| Network owner | Source actor plus result target actor IDs | Source actor plus result target actor IDs | Implemented, but actor-only |
| Effect package | WSS1/WSS2 by current mode; other candidate banks installed | WSS1-WSS4 by current mode; WSS12-WSS14 remain unproved candidates | Partially joined |
| Ground presentation | Stationary actor or coordinate-bearing placement at frozen point | Internally authored radial pattern or multiple placed owners | Not recovered/proved |

The damage radius does not automatically scale a client effect. The X01/X10/X18 battle-result packets do not contain the server's radius, inner radius, frozen X/Y/Z, or a plume coordinate list.

## Current Eruption runtime matrix

| Mode / phase | Actual caster | Private command | Canonical presentation | Server geometry | Visual ownership consequence |
|---|---|---:|---|---|---|
| Normal | Real Ifrit | 23983 | 23364 / WSS2 | Selected-player cast-start point, circle radius 8 | Target effect receives an actor ID, not the frozen point |
| Hard, first train | Real Ifrit | 23983 | 23364 / WSS2 | Three one-second pulses, each frozen at that pulse's selected-player snapshot | Ifrit is not located at the remote snapshot |
| Hard, later train | Helper 2207310 at fixed arena center | 23983 | 23364 / WSS2 | Three one-second pulses at remote player snapshots | Helper remains at center and is never moved to a snapshot |
| Hard Nail window | Real Ifrit through one-train volley | 23983 | 23364 / WSS2 | Same frozen radius-8 path | Same missing world anchor |
| Extreme | Real Ifrit; no Eruption helper | 23983 | 23582 / WSS1 | Alternating five-cast or three-by-three queued groups; each cast snapshots its chosen player | Actor-bound presentation still receives no snapshot coordinate |

Relevant current encounter behavior:

- Data/scripts/directors/InstanceRaid/IfritEncounter.lua lines 907-934 create the Hard trains.
- Lines 918-919 place every extra Eruption helper at the constant arena center.
- Lines 953-955 read the selected player's X/Y/Z only for the local snapshot/log path.
- Line 956 calls ForceScriptedMobSkill with the selected player's actor ID.
- Nothing spawns, warps, or moves a client-known helper to snapshotX/snapshotY/snapshotZ.

MobSkillState.cs independently preserves the gameplay point:

- lines 100-105 snapshot target.GetPosAsVector3 and rotation;
- lines 207-214 resolve the effect with FindWithinAreaAtPosition;
- line 158 still publishes a CommandResult addressed to target.Id.

This is why damage can stay on the cast-start floor while the art follows a character, appears at the caster, or fails to establish a stationary eruption.

### Empty-snapshot result edge

If the selected player leaves the frozen circle and no actor remains inside it, the current result path can produce a self-targeted failure result. That can address a target-side visual back to the caster instead of to the frozen location. This is separate from damage correctness and further weakens any assumption that a target effect will mark the ground point.

## Current Radiant Plume runtime matrix

| Mode / layout | Actual caster/origin | Private command | Canonical presentation | Damage geometry | What is not sent |
|---|---|---:|---|---|---|
| Normal | Real Ifrit; selected-player origin | 23985 | 23367 / WSS1 | Circle radius 16 | No fixed floor center or radial layout |
| Hard center | One helper at arena center | 23987 | 23376 / WSS3 | Self-origin circle radius 16 | No plume positions and no visual radius |
| Hard outer | One helper at arena center | 23988 | 23404 / WSS1 | Self-origin donut, inner 8 / outer 22 | No donut parameter or floor-cell list |
| Hard final | One helper at Ifrit's current position | 23988 | 23404 / WSS1 | Execution-copy donut, inner 8 / outer 50 | No full-floor visual scale or floor-cell list |
| Extreme center | Moving real Ifrit, not a center helper | 23987 | 23593 / WSS2 | Self-origin circle radius 16 around Ifrit | No arena-center placement |
| Extreme outer | Moving real Ifrit, not a center helper | 23988 | 23595 / WSS4 | Self-origin donut, inner 8 / outer 22 around Ifrit | No arena-center placement |
| Extreme ordinary | Real Ifrit; selected-player origin | 23985 | 23583 / WSS2 | Target-origin circle radius 16, repeated two or six times by phase | No authored multi-plume array |

Hard startPlume is at IfritEncounter.lua lines 981-1000:

- center and outer create exactly one helper at the arena center;
- final creates exactly one helper at Ifrit's current X/Y/Z;
- final sets ifrit.plume.full_floor;
- monster_tp.lua lines 132-140 expands the final execution copy to inner 8 / outer 50.

There is no PLUME_POSITIONS table, coordinate ring, per-cell helper loop, PlayBGAnimation call, PlayMapObjAnimation call, RunMapObjScheduler call, or separate VFX call in the current encounter. The only encounter arrays of comparable form are Nail positions and Cyclone lanes.

Therefore a recognizable circle/donut of ground plumes can appear only if the selected WSS internally expands from its source or target actor. Server geometry alone cannot draw it.

## Packet boundary: actors, not ground coordinates

At cast start, MobSkillState sends the canonical presentation command with a source actor and selected target actor. At completion, Character.cs selects the canonical donor row and serializes one or more actor results.

| Envelope | Opcode | Result capacity | Spatial payload |
|---|---:|---:|---|
| CommandResultX01Packet | 0x0139 | 1 | None |
| CommandResultX10Packet | 0x013A | 2-9 | None |
| CommandResultX18Packet | 0x013B | 10+ | None |

The packet builders write sourceActorId, animationId, action count, commandId, targetActorId or target result arrays, amount, text, effect, parameter, and hit fields. They do not write:

- world X/Y/Z;
- Eruption's frozen point;
- Plume inner/outer radius;
- a layout identifier;
- a radial position array.

The only recovered coordinate-bearing mechanism relevant to this boundary is ordinary actor spawn/position/movement. That mechanism works only when a client-known actor is actually instantiated at the desired point.

## Eruption client-effect ownership

### Current WSS2 target art

WSS2 is the current Normal/Hard Eruption donor. It has a real target scheduler; a body-only playback omits that layer.

| Component | Evidence |
|---|---|
| Outer file | 515,904 bytes; SHA-256 5f832618e64f086be4ae33d75ea4552c92876e7ed4e01b6cd31cea0ac15af45e |
| Target scheduler | Actor role TARGET with BindActorClip and damage-action selection |
| Target timing | Approximately 0.45 seconds / 4 scheduled entries |
| Target effect | 1v3rVuift_sklt2, 25,100 bytes |
| Target models | pl0glo03, rg0fire06, rg0fire05, rg0snc02 |
| Visible vocabulary | Compact fire rings, glow, sonic/distortion; no recovered rock |

This proves that flames are present in the installed current donor. It does not prove that the donor can remain at a cast-start coordinate, and it does not supply the rocky eruption expected from reference footage.

### WSS10 and WSS22 rock correction

WSS10 remains a strong actor-centered rock/fire burst:

- 312,128 bytes;
- SHA-256 9de9b7d1cfe0329e5f863ad348c553ce12ef32bfe7ad00af9d578b5932e2cf0d;
- rock_u04, fire, glow, sonic, distortion, camera shake;
- caster scheduler only.

It cannot place rocks remotely unless its caster is itself positioned at the ground point.

WSS22 requires a correction to earlier wording. It has caster and target branches, but its rocks are not in the target branch.

| WSS22 branch | Exact content |
|---|---|
| Caster VEFF 0l2srIift_sklbb | rock_f11, rock_u03, bx0roc01, cylindrical fire, muzzle, distortion, glow |
| Target VEFF 4nEJXiift_skltb | fire rings rg0fire05/06/07, pl0glo03, sonic, distortion, fire textures; no rock |

WSS22 outer file:

- 740,448 bytes;
- SHA-256 035e5346203e2d9a715b8c89cee14d8f0001fc38d7b43bc1bf74c44db24e78e3.

Caster VEFF:

- 38,188 bytes;
- SHA-256 e4675cd6d2105aaa91f293f81b76ed651ad9fc1c87c8afa5b943db41328286fa.

Target VEFF:

- 32,556 bytes;
- SHA-256 d719652e0edb0f08ab95840665afe79f3c264d4f2041680bc1c8d403a4eedb23.

The corrected conclusion is:

> WSS22 can put fire-ring art on its target, but its rock burst stays on the Kuroko caster. A stationary compatible caster at the frozen Eruption point would still be required for remote rocks.

This report supersedes any earlier phrase that described WSS22 as supplying target-side or remotely target-owned rocks. It does not prove WSS22 is the retail Eruption selector.

### No arbitrary-ground asset owner recovered

WSS1, WSS2, WSS3, WSS21, and WSS22 target schedulers bind to actor role TARGET. Their common outer action scheduler binds ProxyActor_0011 as CASTER. No decoded position/translation/world-coordinate clip was recovered from those schedulers.

WSS10 is caster-only. WSS22's rocks are caster-only. No installed bank independently creates a network-visible actor at an arbitrary world point.

The strongest Eruption finding is therefore an ownership gap, not missing art:

1. the server knows the frozen point;
2. the packet loses that point;
3. the current target flames bind to an actor;
4. the recovered rocks bind to a caster;
5. no compatible caster is placed at the frozen point.

## Radiant Plume client-bank correction

### WSS12-WSS14 are not proved Plume banks

The defensible label for WSS12-WSS14 is:

> Large Ifrit fire-impact family; possible Plume/Hellfire variants; exact mechanic unresolved.

No recovered command row, retail selector, actor Lua, battlefield scheduler, or current encounter path names or selects these banks as Radiant Plume.

All three contain:

- generic action scheduler main;
- Ifrit caster scheduler mon_main;
- separate result-target scheduler;
- shared cbbm_sp_b03 body motion, 130 frames / 4.333 seconds;
- one caster effect;
- one second bom-named effect branch;
- one result-target effect;
- actor-relative ring, plane, fire, glow, sonic, distortion, and camera content.

| Bank | Installed file | Caster / bom / target effect lengths | Attachment pattern |
|---|---:|---|---|
| WSS12 | 1,015,088 bytes; SHA-256 e3072750c0d82ed77932c93ad620e65f66b931a7f584a9d5e2b74da83d8713d2 | 131 / 111 / 56 frames | caster EID_BODY_DYN; bom EID_CURRENT; target EID_V03 |
| WSS13 | 1,040,224 bytes; SHA-256 6361322e500c5292ae93c05468fa3eb6d01ffa3744cb6f7be10b2b45c9079629 | 131 / 111 / 56 frames | caster EID_BODY_DYN; bom EID_CURRENT; target EID_V03 |
| WSS14 | 1,204,256 bytes; SHA-256 46f750379dafa78f65360de3f9aca5034c94ea968d39d422bd4ed1539dfca3e4 | 66 / 61 / 47 frames | caster EID_BODY_DYN; bom EID_CURRENT; target EID_CURRENT |

Their caster graphs contain literal compiled model tokens such as:

- rg0fire01 through rg0fire06;
- pl0glo01, pl0glo02, pl0glo03, and pl1glo08;
- sp0fire01 through sp0fire03;
- ds0fire02;
- ge0mon01 and ge0mon02.

The bom-named branches contain pl0fir01, sp2fir01, sp2fir02, ge0mon03, and camera shake. The target branches contain fire rings, glow planes, sonic rings, distortion, and texture planes. WSS14 adds smoke, additional ring/plane layers, and two fire cylinders.

The shared body motion also has a large local vertical rise. That is compatible with a major special/impact family and prevents safely classifying these three solely from their fire-heavy appearance.

What these banks do not provide in the decoded topology:

- no named Radiant Plume selector;
- no world-coordinate array;
- no radial cell list;
- no recovered 16/22/50-yalm scale input;
- no proof that the helper base model can invoke them.

They are useful comparison banks, not a retail rename list.

### Current Plume donors are WSS1-WSS4

The current canonical mappings select WSS1-WSS4, not WSS12-WSS14. WSS1-WSS4 target packages contain the most direct floor-like vocabulary in the currently selected path: pl0 plane meshes, rg0fire rings, glow, line, sonic, fire, and distortion layers.

That still does not prove the correct retail design:

- the same banks are reused across different named Ifrit abilities;
- server geometry is not serialized into them;
- the current helper/model compatibility is open;
- no packet-synchronized visible Plume capture exists in the audited log.

## Why the SQL name-to-WSS rows are not retail proof

The repository contains AI Scripts/hydrate.py and its generated missing_abilities_hydrated.sql path. The script explicitly describes its method as a semantic clustering heuristic and says that it must guess.

Its relevant algorithm:

1. classify each command name with get_theme;
2. reset model_anim to 1 whenever the semantic theme changes;
3. increment model_anim while consecutive names retain the theme;
4. calculate battleAnimation as (19 << 24) OR (model_anim << 12) OR effect_anim.

This produces the familiar local sequences in which Eruption and Plume receive WSS1, WSS2, WSS3, or WSS4 according to nearby row order and theme resets. The current SQL values numerically match that hydrated command surface.

Therefore these rows prove which donors the current implementation selects. They do not prove which banks retail 1.23b selected.

The recovered static command bridge establishes command classes, not WSS banks:

| Command | Name | Recovered route |
|---:|---|---|
| 23364 | Eruption | /Command/Game/Basic/MonsterOthers |
| 23367 | Radiant Plume | /Command/Game/Basic/MonsterOthers |
| 23374 | Eruption | /Command/Game/WeaponSkill/MonsterSubStatWeaponSkill |
| 23375 | Eruption | /Command/Game/Basic/MonsterSubStatOthers |
| 23376 | Radiant Plume | /Command/Game/WeaponSkill/MonsterSubStatWeaponSkill |
| 23404 | Radiant Plume | /Command/Game/Basic/MonsterSubStatOthers |
| 23582 / 23583 | Eruption / Plume | /Command/Game/WeaponSkill/MonsterSubStatWeaponSkill |
| 23592 / 23593 | Eruption / Plume | /Command/Game/Basic/MonsterSubStatOthers |
| 23594 / 23595 | Eruption / Plume | /Command/Game/WeaponSkill/MonsterSubStatWeaponSkill |

Recovered MonsterSubStatWeaponSkill.lua explicitly special-cases commands 23374 and 23376 with the same decompiled tuple. The queried branch exposes only one returned tuple field and does not expose an animation bank selector or floor-layout scheduler. It is command-envelope evidence, not authorization to label a WSS as retail Eruption or Plume.

## Helper actor compatibility gap

The current helper is created with:

- class/appearance ID 2207310;
- actor-class name IfritHotAir;
- actor-class display 3207302;
- appearance base model 1255;
- the encounter profile's Ifrit battle-NPC ID;
- presentation instantiated for ready players;
- nameplate/name and targetability suppressed.

Appearance base 1255 is not the Ifrit m852 / base 10852 model. No static join proves that a WSS1/WSS3 Ifrit bank selected by the command can be resolved when the source actor's base model is 1255.

This creates two distinct risks:

1. Eruption: even the extra helper is at arena center rather than at the frozen point.
2. Plume: the helper is at the desired center, but its source model may not be compatible with the selected Ifrit effect bank.

SetEncounterCombatPresentationVisible(false, false) hides combat UI/name presentation. It does not create a ground-effect bind and does not prove that the 3D source/effect resource is compatible.

The active map log repeatedly contains actorMismatch warnings for helper 2207310. The spawning code treats the mismatch as a warning and continues. That proves the helper reaches the actor path; it does not prove the client renders the desired WSS effect.

## Bowl battlefield ring is separate

The only exact radial battlefield layout recovered is the persistent arena boundary:

| Field | Value |
|---|---|
| Layout group | isgrp_016280 |
| Position | 2526.596924, 248.343002, 2208.061035 |
| Unit | sgrp_vfx_ifring |
| Timelines | show, hide, vtp1, sho1, hid1 |

It contains no Plume or Eruption attribution. RunMapObjScheduler and PlayMapObjAnimation address already instantiated map-object actors; they do not accept an arbitrary Eruption coordinate. No Ifrit encounter call binds this boundary object to either mechanic.

The arena boundary must not be reported as the Radiant Plume floor design.

## Separate Plume damage-selection finding

There is a gameplay-selection issue separate from the missing visuals.

For self-origin Plume, TargetFind correctly sets the geometry center to the owner/helper. Its candidate enumeration first gathers actors around the selected player, then filters those candidates around the owner. Valid actors on the opposite side of the owner can be omitted before the final geometry filter.

This can under-select targets for the source-centered radius-16 circle or 8-22/8-50 donut. It does not create or remove floor art, and it does not explain the missing pattern by itself.

Eruption's FindWithinAreaAtPosition path iterates actors against the frozen world point and does not use that same candidate-enumeration path.

## Runtime evidence boundary

At the audit timestamp:

- Map Server PID 59984 was active;
- its executable had been built at 21:14:20 and had SHA-256 54808331...;
- the active log contained WSS2 player/anchor probes;
- it contained WSS22 target probes around 21:00 and WSS21 target probes around 21:18;
- the active log contained zero plume or radiant_plume text entries.

Those entries prove scheduling and X01-family transport. They do not prove visible rendering, correct effect center, correct scale, fixed-ground behavior, or helper/model compatibility. No new probe was executed for this documentation pass.

This supersedes older snapshot wording that said no Map Server process was running. It does not supersede the older client asset hashes.

## Confirmed, inferred, and still open

| Finding | Confidence |
|---|---|
| Eruption gameplay damage is frozen at cast-start X/Y/Z | Confirmed current source |
| The frozen coordinate is absent from X01/X10/X18 | Confirmed packet structure |
| Current Hard extra Eruption helper remains at arena center | Confirmed current source |
| WSS2 has target-side flame-ring art but no recovered rocks | Confirmed client decomp |
| WSS10 and WSS22 rock geometry is caster-owned | Confirmed client decomp |
| No arbitrary-ground anchor asset/packet was recovered | Confirmed within inspected corpus |
| Plume gameplay geometry is 16, 8-22, or 8-50 | Confirmed current SQL/Lua |
| No Plume coordinate array or map-object choreography exists in the current encounter | Confirmed current source |
| WSS12-WSS14 are large actor-relative fire-impact packages | Confirmed client decomp |
| WSS12-WSS14 are Radiant Plume | Unproved; prior label corrected |
| Current helper base 1255 can resolve m852 WSS art | Unproved |
| Current WSS1/WSS3 internally draws the expected Hard center/outer floor design | Unproved |
| Retail command-to-WSS mapping | Unrecovered |
| Static substitution of another WSS would fix the issue | Not justified |

## Concrete missing joins

### Eruption

1. Frozen server coordinate to a client-known stationary owner.
2. Compatible caster at that owner if rocky WSS10/WSS22 caster content is required.
3. Correct retail presentation-bank selector.
4. Packet-synchronized confirmation of flame, rock, scale, timing, and follow behavior.

### Radiant Plume

1. Exact retail bank for center, outer, and full-floor variants.
2. Proof that the chosen bank internally authors the floor design from one actor origin, or evidence for multiple placed owners.
3. A compatible visible/effect owner at arena center or Ifrit origin.
4. Packet-synchronized confirmation of ring/donut center, scale, cells, timing, and cleanup.

No static finding supports a source/data change by itself.

## Current source and evidence pins

| File | Bytes | SHA-256 |
|---|---:|---|
| Data/scripts/directors/InstanceRaid/IfritEncounter.lua | 73,084 | 086300ae812c2896ac32c634a56052f843d65f0646b69a71fde53ad4fda67931 |
| Data/scripts/monster_tp.lua | 39,007 | fc9394f55734e92e9bb9fd8b53e194d2f9c39330b81d07274d937f7316ec9269 |
| Map Server/Primals/IfritManager.cs | 68,804 | 53d3e232e8e09fcb79f04437bcea8c7fb357f522e62f82562969ee716f9da7fd |
| Map Server/Actors/Chara/Ai/BattleCommand.cs | 20,678 | 273e24860aa9d2d3ce0795e7a1d88ef39db646bd65268528537b87f74e6cdb30 |
| Map Server/Actors/Chara/Ai/Controllers/BattleNpcController.cs | 90,613 | 2d21314eb01d6819eaa37da1ec1e1a763dc09b5c0fc1bb67233b9e4de05b3f1c |
| Map Server/Actors/Chara/Ai/State/MobSkillState.cs | 11,847 | fc03f519877d0aac45dfb24f84165dab9a762a3f4c3abd71ce50530f8bcb3240 |
| Map Server/Actors/Chara/Ai/Helpers/TargetFind.cs | 25,192 | 8ee8838812f3a1c5a204e5f62518fe3dea2da8068254c3c39dd9894a6a8f28e5 |
| Map Server/Actors/Chara/Npc/BattleNpc.cs | 196,423 | a98598cd9d64d495d93e6ae3e66db23080788109b072f60acf0791becb2ed769 |
| Map Server/Actors/Chara/Character.cs | 175,551 | e7a436a774911831b1f48f30385068d111340ccfa35b5b555b7ad581a5a6220b |
| Map Server/Packets/Send/Actor/Battle/CommandResultX01Packet.cs | 2,648 | 67a4ad972c25d036969fa702abb7e407604da2d670627ee9c32f5c84c956cb23 |
| Map Server/Packets/Send/Actor/Battle/CommandResultX10Packet.cs | 6,105 | 4c1a4c1142865726561172e0d0fec9b7dcdd454a8da62d86959482c762d685d9 |
| Map Server/Packets/Send/Actor/Battle/CommandResultX18Packet.cs | 6,069 | aed282789d81217e4e762286ee99881e0db6256d7109e000392b23e57ac395e0 |
| Data/sql/server_battle_commands.sql | 576,173 | f384837334acdf9dafa9bd0bfb750a15dcb814ba12578b797534dac2b092bc96 |
| AI Scripts/hydrate.py | 11,281 | c0a82d2ce2d953e125c6c60257e8cc2aa77c8de5a8751115ab451d52dcb58248 |
| AI Scripts/missing_abilities_hydrated.sql | 156,523 | 12f5145a0f569073921feff31eb0a19e42ef0442b5d3a23fbf16358027ebbf34 |
| static_actor_command_matrix.csv | 193,833 | 2cf1d8b7edeaddd77fcb2cf3099699571901ceecde21de89b3c206ab57d14552 |
| recovered MonsterSubStatWeaponSkill.lua | 4,370 | 610c48945bad04845bc3ae25a64954046ce3f9460094f4dd0560621a150b15c9 |

## Related reports

- [IFRIT_ERUPTION_ANIMATION_DECOMP.md](IFRIT_ERUPTION_ANIMATION_DECOMP.md) contains the broader Eruption bank and packet inventory. Use this report's WSS22 branch correction.
- [BATTLEFIELD_ERUPTION_AND_PLUMES.md](BATTLEFIELD_ERUPTION_AND_PLUMES.md) contains the earlier battlefield and candidate-bank survey. Use this report's corrected WSS12-WSS14 classification and current source pin.
- [IFRIT_CLIENT_ANIMATION_BANKS.md](IFRIT_CLIENT_ANIMATION_BANKS.md) inventories all installed Ifrit WSS containers.
- [EXHAUSTIVE_CLIENT_ASSET_COVERAGE.md](EXHAUSTIVE_CLIENT_ASSET_COVERAGE.md) lists nested client resources and exact package hashes.
- [CURRENT_ERUPTION_AND_NAIL_FINDINGS.md](CURRENT_ERUPTION_AND_NAIL_FINDINGS.md) is the concise Eruption/Nail entry point.
- [INFERNAL_NAIL_RUNTIME_PROBLEM_DECOMP.md](INFERNAL_NAIL_RUNTIME_PROBLEM_DECOMP.md) covers the separate Nail presentation problem.

## Documentation-only audit statement

This pass performed reads, hashes, source inspection, binary-resource inspection, and log inspection only. It did not:

- edit encounter Lua;
- edit C#;
- edit SQL;
- edit DAT/client assets;
- rebuild or restart a server;
- run a live VFX probe;
- alter actors, packets, commands, Nail state, or battlefield data.

The only intended artifact from this pass is this Markdown report.
