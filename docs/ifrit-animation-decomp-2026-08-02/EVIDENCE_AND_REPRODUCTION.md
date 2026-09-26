# Ifrit animation decomp: evidence and reproduction

## Scope and evidence boundary

This is a read-only research record for the 2026-08-02 Ifrit animation pass.
No installed-client DAT, server source, SQL, parser source, capture, or build
artifact was modified to obtain these results.

## Current reconciliation and companion manifests

The live sequence table immediately below is historical through Lua SHA `1d55423f...`. The final current-state audit is [LIVE_IMPLEMENTATION_SNAPSHOT_2026-08-02.md](LIVE_IMPLEMENTATION_SNAPSHOT_2026-08-02.md), pinned to current Lua SHA `f868e997...` unless that report explicitly records later drift. At that snapshot, Hard selects WSS `0007`, `0018`, `0019`, and one-time WSS `0015`; WSS `0008` is absent; post-Hellfire Cyclone is one simultaneous three-body triangle crossing; Hard uses managed class-`2207310` Eruption/Plume helpers through canonical WSS2/WSS3/WSS1 command donors; and Nail spawn selects `m524` WSS `0001` plus an ordinary four-second `DEAD`/fade and permanent one-shot removal lifecycle.

[EXHAUSTIVE_CLIENT_ASSET_COVERAGE.md](EXHAUSTIVE_CLIENT_ASSET_COVERAGE.md) expands the action-bank inventory to every installed model-root support file and all 251 live outer action-resource entries. [EXHAUSTIVE_BATTLEFIELD_RESOURCE_COVERAGE.md](EXHAUSTIVE_BATTLEFIELD_RESOURCE_COVERAGE.md) adds the exact Bowl fire-ring layout timelines, weather schedulers, and dependency graph. Those direct recoveries supersede this earlier report wherever it describes the ring as unidentified or the entire SCB surface as globally unresolved.

The shared repository was live and IfritEncounter.lua changed while the pass was
being documented. The hashes below are therefore time-bounded observations, not
a claim that the working tree was frozen:

| Observation | Local time | SHA-256 |
|---|---|---|
| Initial supplied IfritEncounter.lua snapshot | 2026-08-02 15:18:28 -04:00 | 87360bbe370a78b79c112a3b98d0d3e9f0166085f0ee1aeb447a1f7c071e0112 |
| Intermediate IfritEncounter.lua (WSS7 before movement) | 2026-08-02 15:37:44 -04:00 | ba369568b9e155bca48592579de921fff986b3aba131dd027bfb2e570fc13c6b |
| Historical documentation snapshot (movement before WSS7) | 2026-08-02 15:59:51 -04:00 | 1d55423fcf86d5421e23e0289fff84ea9f2a323da740e950191fbbfe1d807d87 |
| Hard helper/Nail lifecycle integration | 2026-08-02 17:13:38 -04:00 | bf848b75c5a6598ce5c539879a020c4d87074d38b08e7f59ebfe34b6c70e9401 |
| Current simultaneous-three-body Cyclone snapshot | 2026-08-02 17:35:21 -04:00 | f868e997dd6e2f81b6003ff8988259d1e8d3e43c2bb1d23cece26d1e2a70f320 |

The intermediate version added explicit Crimson Cyclone WSS7/WSS8 presentation.
That historical documentation snapshot retained both banks but moved the active
`0x00CF` endpoint packet before WSS7 so the movement pose would not replace the
authored fire-rush scheduler. Conclusions based on server ordering should name
their snapshot. Client-resource measurements and recovered command names do not
depend on that Lua drift.

## Installed client manifest

| Item | Local path/value |
|---|---|
| Install root | C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV |
| Version file | C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV\game.ver |
| Installed version | 2012.09.19.0001 |
| Ifrit model root | client/chara/mon/m852 |
| Ifrit WSS root | client/chara/mon/m852/act/emp_emp/wss/base |
| Infernal Nail model root | client/chara/mon/m524 |
| Nail WSS root | client/chara/mon/m524/act/emp_emp/wss/base |
| Command descriptor | data\0B\45\00\17.DAT |
| English command strings | data\0B\45\06\94.DAT |
| Command enable map | data\0B\45\06\95.DAT |
| Supplemental cutscene roots | client/cut/man30850/man30850; client/cut/man30880/man30880; client/cut/man40640/man40640; client/cut/sum6a000/sum6a000 |

Appearance base 10852 resolves to m852, base 10524 resolves to m524, and base
1255 is the helper/invisible appearance used by several Ifrit-family classes.

## Server source and SQL manifest

Repository root:
C:\Users\drime\source\repos\AuroraFlare\FF14-Memory

| Purpose | Repository-relative path |
|---|---|
| Encounter logic | Data\scripts\directors\InstanceRaid\IfritEncounter.lua |
| Battlefield content/weather | Data\scripts\content\BowlOfEmbers.lua |
| Instance creation and lifecycle | Map Server\Primals\IfritManager.cs |
| Command rows and schema | Data\sql\server_battle_commands.sql |
| Live/idempotent Ifrit seed | Data\sql\live migrations\ifrit_encounter_family.sql |
| Zone identities | Data\sql\server_zones.sql |
| Actor classes | Data\sql\gamedata_actor_class.sql |
| Actor appearances | Data\sql\gamedata_actor_appearance.sql |
| B/NPC type and encounter rows | Data\sql\server_battlenpc_mob_types_loot.sql |
| Static B/NPC spawns | Data\sql\server_battlenpc_spawn_locations.sql |
| Static event-NPC spawns | Data\sql\server_eventnpc_spawn_locations.sql |
| Map-object bindings | Data\sql\server_eventnpc_mapobj.sql |
| BG animation packet | Map Server\Packets\Send\Actor\PlayBGAnimation.cs |
| Map-object caller | Map Server\Actors\Chara\Npc\Npc.cs |
| Recovered Lesser Ifrit director | tools\outputs\lpb\raid_keyword_all\director\instanceraid\instanceraidlesserifrit.lua |
| Alternate recovered director copy | tools\outputs\lpb\decomp_more_20260617\lua\director\instanceraid\instanceraidlesserifrit.lua |
| Prior opcode contract evidence | docs\airship_ferry_decomp_open_questions_2026-06-21.md |
| Prior object-animation boundary | docs\recoverable_object_actor_animation_findings_2026-07-21.md |

The static-spawn review used the declared zoneId columns, not arbitrary numeric
matches inside coordinates or primary keys. No Ifrit-family spawn or zone-aware
map-object row provides a client-authored Eruption/Plume ground anchor for zones
240 or 265.

## Source snapshot hashes

| File/snapshot | SHA-256 |
|---|---|
| Initial IfritEncounter.lua | 87360bbe370a78b79c112a3b98d0d3e9f0166085f0ee1aeb447a1f7c071e0112 |
| Intermediate IfritEncounter.lua | ba369568b9e155bca48592579de921fff986b3aba131dd027bfb2e570fc13c6b |
| Historical documentation snapshot of IfritEncounter.lua | 1d55423fcf86d5421e23e0289fff84ea9f2a323da740e950191fbbfe1d807d87 |
| Historical documentation snapshot of tools\validate_ifrit_family.ps1 | 34bab73c15d90b9a741ff8b3ac60bad7d30d971ef9b1f192f047693da989f54b |
| Map Server\Primals\IfritManager.cs | d6605e8e88c9acb860a50a4a11871aba4e0953c636286585f2d19396bdf7466c |
| Data\scripts\content\BowlOfEmbers.lua | 5cbf4305426259fc15ffb0ac4746910f011e08738cfc036e055d80baf3a64075 |
| Data\sql\server_battle_commands.sql | f384837334acdf9dafa9bd0bfb750a15dcb814ba12578b797534dac2b092bc96 |
| Data\sql\live migrations\ifrit_encounter_family.sql | 453209ab80ffde5beea07712484d1ee9fd3fb681cd9dec24f2660194135b9f45 |
| Data\sql\server_zones.sql | c44aa3a7ac83130f04050061212db50a1bda0ba924f5cdf295a883f97a01d446 |

Supplemental compiled snapshots are useful for reconstructing the code state,
but they do not prove client-animation linkage:

| Artifact | SHA-256 |
|---|---|
| C:\tmp\ff14-ifrit-build-debug-20260802\bin\Map Server\debug\Map Server.dll | 8a8209d592b170511f94d89b8e5bcceb53c809be6e5eca9e305590742413cb3b |
| Debug Map Server.pdb | c8cf4ae5b02d093df195c5dfae217c03a5b29110de92c9738f61ffd1f0d45559 |
| C:\tmp\ff14-ifrit-build-release-20260802\bin\Map Server\release\Map Server.dll | 6f51663bd8395274c20a9aeabd34d108426db72bd78d4456d2af60a66c6c4b91 |
| Release Map Server.pdb | 944d357a7a591836a79184003461d024a12ceb8c1c7ebd233d7535c9b4e14358 |

## Research output and capture manifest

| Collection/output | Local path | Snapshot count or role |
|---|---|---|
| Hard-mode source videos | C:\tmp\ifrit-video-research\hard | 21 MP4 |
| General source videos | C:\tmp\ifrit-videos | 14 MP4 |
| Combined source videos | the two directories above | 35 MP4 |
| Selected extracted frames | C:\tmp\ifrit-frames | 137 images in the handoff snapshot |
| Parser checkout | C:\tmp\ffxivmodelviewer-codex-b936 | format-reference source |
| Debug build snapshot | C:\tmp\ff14-ifrit-build-debug-20260802 | supplemental binary/PDB output |
| Release build snapshot | C:\tmp\ff14-ifrit-build-release-20260802 | supplemental binary/PDB output |
| Documentation staging | C:\tmp\ifrit-animation-decomp-2026-08-02 | Markdown research handoff |
| Final repository destination | docs\ifrit-animation-decomp-2026-08-02 | six Markdown reports |

The capture count is deliberately recorded as the 35-video/137-frame research
handoff snapshot. These directories are shared and may grow later; a later
directory count must not silently rewrite this evidence snapshot.

Reviewed frame sequences:

| Sequence | Observation retained |
|---|---|
| hardcyclone_254 through hardcyclone_272 | perimeter disappearance/fade, glow and copies, followed by a bright fiery dash and impact |
| hardlong_416 through hardlong_428 | Nail begins as ember/thin rise, becomes a tall burning spike, then persists/pulses |
| normal_245 | tall glowing Nail |
| hyper_152 and hyper_154 | tall glowing Nail |
| hyper_212 and hyper_214 | multiple lava/fire patches on the ground; mechanic attribution remains medium confidence |

Frames were compared visually in sequence. A visible ground patch is direct
capture evidence; assigning it specifically to Eruption or Radiant Plume is an
interpretation and was not promoted above medium confidence.

## Parser provenance

Reference checkout:
C:\tmp\ffxivmodelviewer-codex-b936

Upstream:
nohbdy/ffxivmodelviewer

Pinned commit:
50790a88509957f19c2d2dc829771a7797c26ad9

Format behavior was cross-checked against these files:

- src\DatDigger\Sections\Resource\ResourceSection.cs
- src\DatDigger\Sections\Animation\MtbSection.cs
- src\DatDigger\Sections\Animation\SpuCurveLoader.cs
- src\DatDigger\Sections\Animation\CibmSection.cs
- src\ModelViewer\Renderer\AnimatedSkeleton.cs
- src\DatDigger\Sections\Animation\ScbSection.cs

ScbSection.cs is empty. That missing implementation still prevents a complete
ordered command-to-event-to-effect graph for actor action banks. The later
exhaustive passes nevertheless enumerate every outer action resource and
directly decode Bowl `TimeLine` node pointers to six ring SCBs and thirteen
weather SCBs; those narrower byte-level mappings are recovered.

## Resource decoding method

The inspection used ephemeral, read-only inline Python. No new parser script or
extracted client resource was saved.

1. Read PWIB/SEDBRES resource tables as little-endian structures.
2. Enumerate outer MTB identifiers, table entries, and offsets.
3. Decode MTB headers, FPS, frame counts, referenced motions/effects, and
   emission-control records.
4. Decode SPU curve samples as big-endian values.
5. Compare curve endpoints, extrema, durations, and embedded VFX strings across
   the Ifrit and Nail WSS banks.
6. Keep content-based labels separate from proven command linkage.

Retained measurements and identifiers:

| Asset | Decoded evidence |
|---|---|
| m852 WSS0007 | sp_b02, 5 frames; local-center Z delta +8.916153247; m852_0007_fire and motion-driven emission |
| m852 WSS0008 | sp_b04, 32 frames; local-center Z delta +9.989366869; fade/footstep content |
| m852 WSS0018 | sp05, 5 frames; local-center Y delta +11.423778534 |
| m852 WSS0019 | sp06, 30 frames; local-center Y delta -10.913191682 |
| m852 WSS0004 | sp_a02, 80 frames / 2.667 s; m852_0004_fire and motion-emission controls |
| m852 WSS0010 | abl_3, 70 frames / 2.333 s; rock_u04 plus fire/glow/distortion |
| m852 WSS0012-0014 | sp_b03, 130 frames / 4.333 s each; three distinct large fire layouts |
| m852 WSS0021-0022 | no outer Ifrit MTB; kuroko_999/skill02-03 helper VFX with fire/rock |
| m524 WSS0001 | sp_01, 90 frames / 3.0 s; vfx/mon/anchor_524/skill01, anc_sklc1y.veff, fire/rock/glow/distortion/muzzle |

For Nail base motions, BID entries activ, deact, and ded are 30 frames. id0,
dedpose, msb4_1, and the normal static entries are one-frame/static. This
supports an activation/deactivation presentation, but does not prove the
runtime transition that selects it.

## Command-sheet decoding method

The descriptor, English block, and enable map listed above were decoded by:

1. Porting the descriptor shuffle behavior from ShuffleString.cs.
2. Parsing the decoded XML descriptor and enable runs.
3. Decoding command strings with the XOR 0x73 encoding described by
   DataType.cs.
4. Comparing the recovered IDs/names with server_battle_commands.sql.

This recovered canonical/private name families at 23360-23378,
23404/23408/23409, 23577-23583, and 23592-23595. The command sheet supplies
names, not the missing command-to-WSS/SCB edge. Current server banks in the
companion report come from SQL modelAnimation/battleAnimation fields and must
not be represented as a retail lookup.

## Opcode and recovered-scene checks

PlayBGAnimation.cs establishes opcode 0x00D9 and allocates an eight-byte body.
Its ASCII write is capped at eight characters. Npc.PlayMapObjAnimation only
queues that packet. Therefore long logical WSS/effect paths cannot be sent as BG
scheduler names, and bytes 4-7 cannot safely be reinterpreted as an offset.

Recovered InstanceRaidLesserIfrit.processStartEvent contains:

    executeCutScene("GC010105", owner, true, 0, arg)

The latest/current encounter replay supplies scene "none". GC010105 is therefore
a recovered Lesser-director scene lead and a current parity gap, but it is not
combat animation ownership evidence.

## Minimal independent reproduction

1. Read game.ver and confirm version 2012.09.19.0001.
2. Hash the listed repository files with Get-FileHash -Algorithm SHA256 and
   record the observation time, especially for IfritEncounter.lua.
3. Query server_zones.sql for IDs 240 and 265; verify region 104 and
   wil0Field05a. Inspect IfritManager.cs for zone 240, music 23, private-area
   construction, boundary 22, and shell-director replacement.
4. Query actor IDs 2207301-2207315 in gamedata_actor_class.sql and join the same
   IDs to gamedata_actor_appearance.sql.
5. Query canonical IDs 23360-23378, 23404, 23408-23409, 23577-23583, and
   23592-23595, plus private IDs 23980-23988, in
   server_battle_commands.sql. Read modelAnimation and battleAnimation by the
   declared table schema.
6. Inspect the zoneId columns in the static spawn tables and the separate
   map-object binding table. Do not count unrelated numeric matches in IDs or
   coordinates as zone evidence.
7. Decode m852/m524 WSS resources using the PWIB/SEDBRES to MTB to SPU sequence
   above and compare the retained timings, strings, and displacement values.
8. Inspect PlayBGAnimation.cs and Npc.cs to verify the eight-character 0x00D9
   transport boundary.
9. Review the named frame sequences in order and keep direct visual observation
   separate from mechanic attribution.
10. Compare the recovered Lesser director's GC010105 call with the current
    scene "none" path.

## Limitations and unresolved linkage

- Full ordered actor-action SCB parsing remains unresolved, so no exact retail
  command-to-event-to-effect-to-WSS graph was recovered. This does not negate
  the complete outer-resource catalog or the directly mapped Bowl layout and
  weather timeline SCBs in the companion exhaustive reports.
- Current Hard source proves that Ifrit owns its first Eruption train and class
  `2207310` IfritHotAir owns every Plume plus a second post-Hellfire Eruption
  train. No packet/runtime capture yet proves which actor-bound client resource
  renders, whether it appears at the damage snapshot, or that this is retail
  ownership; Normal and Extreme do not use the managed helper path.
- No zone-aware spawn or map-object row supplies a client-authored ground
  coordinate anchor for these attacks.
- WSS0012-0014 may be Plume patterns or Hellfire variants; their shared motion
  and vertical curve prevent a high-confidence label from strings alone.
- WSS0004 and WSS0010 are content-based Eruption candidates, not confirmed
  command bindings.
- Cinematic effects under man30850/man30880/man40640/sum6a000 are supplemental
  visual clues only and cannot be substituted for combat banks.
- Opcode `0x00D9` cannot carry the long resource/effect names found here.
  Current `Npc.RunMapObjScheduler`/opcode `0x0130` can carry 1-64-character
  timeline names, but it still requires a proven live map-object owner/binding
  instantiated for the receiving player.
- The exact retail use of GC010105 across normal, hard, and extreme start
  arguments remains server-driven even though the Lesser director literal is
  recovered.
- Capture imagery establishes appearance and sequence, not the internal packet,
  actor, SCB, or WSS that produced it.
