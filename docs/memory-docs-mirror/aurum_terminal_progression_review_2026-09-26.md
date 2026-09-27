# Aurum terminal progression review

The five existing circle homes were copied from native **barrier** markers. Those XYZ are real, but their assignment to charging terminals is not recovered. The supplied guide visibly separates two C terminals from the C barrier, corroborating the archived two-terminal description. Nine floor-supported circle candidates are now frozen for review; no active manifest, SQL or runtime is changed by this evidence work.

## Source scope and concrete correction

The [eLeMeN Aurum archive](http://elemen.sakura.ne.jp/ff14_dated_archives/gamecontents/InstancedRaids/AurumVale.html) describes kill-enabled terminals, with two for Field III and three for Field V, plus a large summon terminal for each boss. Its patch 1.21 date is the dungeon's introduction date, not a revision date for every strategy detail. Treat the page as unversioned 1.x evidence. No ARR source is used.

The user-provided guide independently shows black A/B markers, **two black C markers**, one black E marker, and says Barrier D opens after Coincounter dies. Its single E glyph does not recover all three E homes. No new video frames were viewed: browsers remain unavailable and web image opens failed. No remote media was downloaded.

| Progression | Exact existing mandatory pack | Proposed behavior |
|---|---|---|
| A / Field I | `entry-wasp-1..4` | Enable south terminal after these four die. |
| B / Field II | `golden-wasp-1..4` | Enable north terminal after these four die. |
| C / Field III | `stage2a-wasp-1..4`; separately `stage2a-eftstool-1..4` | Each pack enables its own terminal; both activations open C. |
| E / Field V | `stage2b-vale-eft-1..2`; `stage2b-eftstool-1..4`; `stage2b-wasp-1..4` | Three independently enabled terminals; all activations open E. |
| Coincounter | Existing C completion | Separate pre-fight summon circle. Death opens D without another charging circle. |
| Miser | Existing Stage 3 approach requirement | Separate pre-fight summon circle. |

All required actors already exist. Add scoped kill tags or equivalent exact-ID requirements; broad room-clear requirements would incorrectly force optional slugs, Lilies or imperials. Preserve their separate coffer/reward objectives. Retire a room and its timed coffers only after its **whole terminal group** completes. Keep one group member named `miner` and one `bile` so the existing conditions keep their meaning. Replace the removed `coin` circle's consumers with `kill:coincounter`; preserve portal pair identities.

## Door evidence

`native-door-proof.json` preserves all five `ipomk_barrier01..05` markers and nearby `sgrp_bg_d4_door_b1` unit trees from native layout 214, including root translation and DAT hash. Main SQL rows 910–914 are corresponding field actors. This spatial corroboration supports retaining the physical door SQL unchanged. It does not establish that every terminal must be far from its door: B may be nearby, while C is demonstrably separate.

Native b936 presentation supports powered/completion variants, not recovered Aurum placement, player count or charge duration. Adjacent appearance rows 1200323/324 use e004, but blank class bindings do not identify them as boss circles. Coincounter/Miser introduction casts contain no terminal actor. The existing four-player/e007 choice and 1.5-second hold remain authored; “large” is not a recovered numeric scale or headcount.

## Grounded candidate homes

| Candidate / runtime ID | XYZ | Horizontal basis |
|---|---|---|
| south | -675, 175.729507, 1360 | A glyph, one yalm adjustment inside marker footprint |
| north | -734.5, 173.300003, 1234.5 | B glyph, two yalms toward approach |
| miner-wasp / miner | -960, 196.776886, 1424 | Lower C glyph |
| miner-eftstool | -958.5, 196.899994, 1350.5 | Upper C glyph, three yalms into endcap |
| bile-wasp / bile | -1149.5, 188.756699, 1170 | Sole E glyph; Wasp assignment is spatial inference |
| bile-eftstool | -1154, 184.703827, 1137 | Authored center of approved Eftstool pack |
| bile-eft | -1097.5, 179.609192, 1168.5 | Authored center of approved Eft pair |
| coincounter-summon | -1057, 192.646896, 1265 | Authored approved arena-entry home |
| miser-summon | -865.5, 180.201385, 1586.5 | Authored approved arena-entry home |

The coordinate workflow was followed: `maps --zone 245`, own native pages 5500/5502/5503, separate frozen recording, per-point `locate`, three native renders with frame files, and visual inspection. Guide registration reuses the previously reviewed exact crop offsets `(747,544)`, `(798,549)` and `(771,538)`, scale 1; the plan records conversion rules and original landmark pixels. Marker centers remain empirical choices.

Every selected Y comes from a containing walkable polygon at the **final exact X/Z**. All candidate floors remain in the audit. Only one floor per candidate connects to its independently evidenced seed: native entry/barrier02 for A/B, native stop09 for C, exact frozen nodes 1432/1420/1402 for E, node1195 for Coincounter and native bug08 for Miser. Miser's unrelated upper floor is retained and rejected by that evidence. No nearest-node Y was copied. The first candidate grid and rejected seed1431 remain available; a missing polygon there was not silently replaced by a nearest point.

The final plan is [`terminal-plan.json`](../Data/raidroutes/evidence/aurum-terminal-progression-20260926/terminal-plan.json), SHA `fe02f13d311e5407dee97914e04f0747d9b078dc0fdd11e9dfe857fd4f679697`. Its `runtime_proposed` rows encode the agreed group/death schema; descriptive query IDs remain separate. The frozen 102-entry baseline, exact native ground report, topology paths, seed identities and source hashes are in the same directory. Mesh support establishes floor plausibility, not recovered retail actor XYZ, complete walkability or live client acceptance.
