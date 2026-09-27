# Quest 111410 — Imperial Devices (Limsa Lominsa) (Com5l0)

Source: FF14-Memory `Data/scripts/quests/com/com5l0.lua` (2 lines, full body read)
+ shared `Data/scripts/quests/com/totorak_gc_quest.lua` (413 lines, full body read).
Instance: zone 159 The Thousand Maws of Toto-Rak, `Data/scripts/directors/Occupancy/TotorakEncounter.lua`
(1596 lines, full body read), entry `Data/scripts/totorak_entry.lua` (210 lines, full body read),
`Map Server/WorldManager.cs` Toto-Rak admission (lines 5387-5930 read),
`Map Server/WorldManager.GcQuests.cs` (74 lines, full body read).
Registry: `Data/sql/gamedata_quests.sql` row
`(111410, 'Imperial Devices (Limsa Lominsa)', 'Com5l0', 111403, 25)` (inspected).
Offer: enabled in `Data/scripts/quests/quest_availability.lua` (inspected).

Side quest, Lv 25, Maelstrom Grand Company. Prerequisite quest 111403
(Seals for the Whorl). One-time (not repeatable). Quest is the Limsa variant of
the three-city Imperial Devices line (Gridania 111610/Com5g0, Ul'dah 111810/Com5u0).

Guides (fetched 2026-09-27): Gamer Escape
`Imperial Devices (Limsa Lominsa)` + `/Plot Details` (Guincum briefing dialogue,
party 2-4 rank 25+, Zerig petition, Toto-Rak infiltration for ceruleum magitek);
SE forum thread 34461 (4 photocells per terminal, moogles appear after terminal,
second quest active in dungeon need not be completed). YouTube: surviving
period runs catalogued in `docs/totorak_implementation_2026-07-18.md`
(July 2012 quest run shows A-Ruhn-Senna + Pudgy + Teary Moogle trio after first
terminal; July/Aug 2011 full runs; Shaula/Sargas chamber recordings).

## Quest flow (Limsa branch, `handleLimsaTalk`)

```
SEQ_ACCEPT/off  -> Guincum (1500199), processEventGUINCUMStart(0,0); accept => +Stillglade Fane Petition (11000267), goto 5
SEQ 5           -> Zerig (1000510), processEvent_005(0,0); requires petition => +Sealed Urn (11000268), -petition, goto 10
SEQ 10          -> Bloisirant (1001150) at Toto-Rak entrance (zone 154): processEvent_010(0,60) + processEvent_010_01 Yes/No
                   => TotorakTryStartFromNpc (party-aware 60-min instance, zone 159 @ 883.064,-24.571,654.586)
SEQ 15 (inside) -> Moogle (1000327/1000328/1000329/1000407), processEvent_015(routeVariant); requires Sealed Urn
                   => +Blackened Accumulator (11000263), -urn, goto 20. Party members entering advance 10->15.
SEQ 20          -> Bloisirant (outside), processEvent_020(0,0); requires accumulator => goto 25
SEQ 25          -> Guincum, processEvent_025(0); seals-once checkpoint, then EXP + completion, proof item retired
```

Journals: 0->246, 5->247, 10->248, 15->249, 20->250, 25->251. No zone-159
map-marker surface in the recovered marker table: ENPC quest flags are the
authoritative markers (`getJournalMapMarkerList` returns {}).

## Stages (SEQ)

```
SEQ_ACCEPT      offer from Guincum
SEQ 0           accepted, speak to Guincum (sequenceActors {1500199})
SEQ 5           deliver petition to Zerig (Stillglade Fane), receive Sealed Urn
SEQ 10          enter Toto-Rak via Bloisirant (Silent Arbor entrance, zone 154)
SEQ 15          inside: find moogles after Field I/II opens, trade urn for accumulator
SEQ 20          report to Bloisirant with accumulator
SEQ 25 (reward) return to Guincum: 2160 EXP + 1000 Storm Seals
```

## NPCs/Actors

```
GUINCUM          = 1500199  (Maelstrom officer, accept + completion)
ZERIG            = 1000510  (Stillglade Fane intermediary, petition -> urn)
BLOISIRANT       = 1001150  (Toto-Rak entrance guide, zone 154; entry + report)
MOOGLE_FLUFFY?   = 1000327  (moogle actors, inside step; any of the four advances)
MOOGLE_PUDGY     = 1000328  (Field I/II trio member, exact captures below)
MOOGLE_SQUISHY?  = 1000329
TEARY_MOOGLE     = 1000407  (dungeon-specific; Field I/II trio member)
A_RUHN_SENNA     = 1001571  (Field I/II trio member; Gridania seq-20 NPC, Limsa flavor)
```

## Quest items

```
11000267  Stillglade Fane Petition  (accept; consumed at Zerig; retired on seq>=10 after interruption)
11000268  Sealed Urn                (Zerig; consumed at moogle; retired on seq>=20 after interruption)
11000263  Blackened Accumulator     (moogle proof; required for report + completion; retired on completion)
1000201   Storm Seals x1000         (reward currency via GrantGCQuestSealsOnce; rank cap respected)
REWARD_EXP = 2160
```

## Dialogue/interaction edge cases (all handled in shared module)

- Decline at Guincum (choice ~= 1): no accept, stays on offer.
- Zerig without petition (dropped): `HasGCQuestItems` fails, no advance, no dupe urn.
- Moogle without urn, or outside private instance, or dead, or expired/finishing
  instance: `CanUseTotorakQuestNpc` fails, `EndEvent`, no advance.
- Moogle usable at BOTH Field I and Field II trio locations (all six NPCs share
  `totorak_quest_*` unique IDs; Limsa step needs any one).
- Bloisirant re-entry during seq 15: entry dialogue re-offered (insideSequences),
  so a timed-out/kicked party can re-enter while the objective is open.
- Report/completion without accumulator: blocked; completion additionally
  re-checks proof (`HasGCQuestCompletionEvidence`).
- Disconnect during completion dialogue: seals granted BEFORE the client yield
  (`GrantGCQuestSealsOnce` checkpoint); repeat of closing dialogue cannot
  double-pay, including when the seal cap is now full.
- Yielded dialogues re-validated with `CanContinueGrandCompanyQuestDialogue`
  (exact journal instance + data + sequence + live session); abandon/replace
  mid-dialogue cannot advance a stale quest.
- Item retirement on re-talk sweeps orphaned petition (seq 10/15/20/25) and urn
  (seq 20/25) left by an interruption beyond the saved stage.
- Prerequisite break: quest requires 111403 completed for offer; active journals
  survive (standard availability semantics); entry additionally requires a
  Toto-Rak-unlocking GC story step (`hasTotorakGrandCompanyStoryAccess`).
- Mutual exclusivity: retail blocks the other two cities' variants while active;
  enforced at accept by `Player.AcceptQuest` via
  `CanAcceptGrandCompanyOpeningQuest` (`GrandCompanyOpeningQuestRules`: family 1
  = 111410/111610/111810 + company allegiance), with a player-facing refusal
  message. The Lua availability list still shows all three offers, so a player
  may see an offer that accept-time validation then refuses — a minor
  offer-vs-accept presentation gap, not a holding loophole: two variants can
  never be simultaneously active.

## Instance layout/bounds (zone 159, private content copy)

- Landing: `883.064, -24.571, 654.586, rot 1.186`, map (3.39,4.31) cell (3,4).
- Duration 60 min (`ENCOUNTER_LIFETIME_SECONDS`), retry/re-entry lockout via
  `TIMER_TOTORAK` content timer (15-min retail rule; `FormatTotorakTimerMessage`).
- Entry gates (all must pass): at entrance zone 154, party 2-4 (leader starts),
  all members online/same-area/not zoning, combat class (DoW/DoM), true level
  >= 25, no active Toto-Rak timer. Stale-session gate pins the exact Session.
- No level sync (matches retail: min-level gate only; corridor mobs are 32-39).
- Leash: SpawnLeash 125 (X/Z from home), IgnoreSpawnLeash 0; detection 10
  (corridor) / 18 (bosses). Each corridor formation owns a private MonsterParty;
  enemies are director members WITHOUT content-group membership, so packs never
  chain-pull across the dungeon. Leaving bounds: returning home drops hate.
- Death: dead players cannot use quest NPCs (`CanUseTotorakQuestNpc` requires
  alive); party wipe does not end the instance (director lives for re-entry
  tickets); boss-target inheritance only seeds unengaged adds once.
- Disconnect/re-enter: `relogin` director command replays duty widget/timer;
  dynamic actors rebind per-player on visibility (`syncDynamicActorsToPlayers`);
  chamber door `hide` states re-applied on re-entry; quest NPC use requires
  `IsTotorakClientLandingReady`.
- Timeout: `ExpiresAtUtc` blocks quest-NPC use; encounter coroutine ends at 60
  min; `ClearAwaitingVoluntaryExit` holds the copy for looting after boss death
  (no auto-return; leave via chamber porter prompt).
- Abandon: standard quest abandon; instance copy persists for remaining party
  (occupancy-owned); quest items are quest-bound and useless outside.
- Repeats: one-time quest; dungeon re-enterable after timer for other
  quests/loot. Cross-city parties: any entrant with a matching story step
  advances (entry quest table covers 111405/111406/111605/111606/111805 +
  111410/111610/111810).
- NO chocobo companion/trust/allied spawns anywhere in the instance:
  `TotorakEncounter.lua` spawns only enemies, terminals, coffers, and the six
  quest NPCs; no ally/companion API is invoked (verified by full-file read).
  Mounts: content areas do not set `canRideChocobo`.

## Staging/objectives inside (Imperial Devices Limsa)

1. Collect Magitek Photocells (16 total across the dungeon, shared pool).
2. Feed 4 photocells into Field Terminal 1
   (`1103.211, -44.132, 879.967`, map (5.59,6.56) cell (5,6)) to open Field I;
   quest trio appears at Field I trio anchors (below). (Terminal 2 at
   `1135.680, -48.132, 688.103`, cell (5,4), opens Field II -> second trio.)
3. Talk to any moogle with the Sealed Urn -> Blackened Accumulator, seq 20.
4. Boss kill NOT required for this quest (forum-confirmed: only 4 photocells +
   terminal + moogle). The three boss routes (Antares/Sargas/Shaula) are the
   duty's own objective and may be cleared or skipped.

## Quest NPC anchors (live captures, zone 159)

```
Field I trio (requiredFieldLevel 1), map cell (5,6):
  teary_moogle_field1  1000407  1130.173, -45.000, 890.117, -2.917  map 5.86,6.66
  pudgy_moogle_field1  1000328  1131.778, -45.000, 890.086, -2.887  map 5.88,6.66
  a_ruhn_senna_field1  1001571  1128.433, -45.000, 890.672, -2.887  map 5.84,6.67
Field II trio (requiredFieldLevel 2), map cell (6,4):
  teary_moogle_field2  1000407  1163.639, -49.000, 697.774,  2.999  map 6.20,4.74
  pudgy_moogle_field2  1000328  1165.149, -49.000, 698.321,  3.029  map 6.21,4.74
  a_ruhn_senna_field2  1001571  1161.816, -49.000, 697.667,  3.029  map 6.18,4.74
```

Field I trio = rigid transform of exact Field II formation onto live Field I
center `1128.637, -45.000, 887.796` (tool-verified cell (5,6)); footage
confirms the same trio at both fields.

## Bosses + terminals (live captures, zone 159)

```
Antares 38  2301102/3001  hp14000 dmg52  1251.683, -46.946, 929.946  map 7.08,7.06 (7,7)
  terminal 1210.318, -48.132, 912.115  map 6.66,6.88 (6,6) [archive (6,6) OK]
  adds: 3x Horde Mite 39 (2301107/3123, hp2800) infinite, 8s respawn, live offsets
Sargas  38  2301103/3093  hp14000 dmg52  1475.059, -58.909, 636.072  map 9.31,4.12 (9,4)
  terminal 1456.127, -59.200, 679.066  map 9.12,4.55 (9,4) [archive (9,4) OK]
  adds: 3x Horde Mite 39 (2301108/3124, hp2800) infinite, 8s respawn, default triangle
Shaula  40  2301104/3095  hp18000 dmg60  1348.799, -62.943, 542.707  map 8.05,3.19 (8,3)
  terminal 1304.773, -63.122, 559.313  map 7.61,3.35 (7,3) [archive (7,3) OK]
  opening: 3x Bastard Mite 39 (2301105/3121, hp3400); each dead slot converts to
  infinite Widow's Suitor 39 (2301106/3122, hp3400), 8s respawn, joins boss target
```

Boss spawns only after its terminal activates AND the intro cutscene lands
(`IsTotorakBossTerminalActive` + `IsTotorakBossIntroReady`); post-cutscene
landings Antares `1226.210, -47.258, 911.200`, Sargas `1456.439, -59.131,
660.687`, Shaula `1321.581, -63.386, 561.516`. Boss death retires surviving
adds, spawns fixed + earned conditional coffers (5 captured slots/route), opens
the duty-widget close on death-scene return. Diremite actions: Sticky Web,
Deadly Thrust, Shaula Realm Shaker (skill lists 7101/7102).

Conditional Void Flames (reward condition 1), live captures, cell (6,5):
`1231.977, -56.158, 733.011` (map 6.88,5.09) and
`1237.755, -55.340, 753.599` (map 6.94,5.30). Spawn on Field I open.

## Mob roster (46 packs / 99 corridor enemies, live captures)

Families: Prison Pteroc 35 (2300101/3126, sk77), Mun-Tuy Sapling 35
(2302701/3132, sk51), Tainted Louse 32 (2305601/3130, sk75), Mitetrap 32
(2302702/3128, sk51), Prison Pudding 35 (2303401/3129, Thunder/Aero/Fire +
same-element absorb, model states 3/4/1), Gaoler's Lantern 35 (2309901/3131,
sk12/sp1), Cell Mite 39 (2301101/3127, sk78), Void Flame 39 (2301601/3125).
Counts: Pteroc 20, Sapling 13, Louse 18, Mitetrap 13, Pudding 13,
Lantern 14, Cell Mite 5, Void Flame 3.

Per-group centroids + map cells (guide tool, zone 159 page 3600,
base -544/-224; full per-actor XYZ in `mob_roster.csv`):

```
entrance_pterocs  4x pteroc                  (4,4)   961.5,657.8
captured_001      1x sapling                 (4,5)  1005.2,786.1
captured_002      6x louse                   (4,6)  1023.5,876.3
captured_003      2x sapling 1x mitetrap     (5,5)  1101.3,811.9
captured_004      2x pteroc                  (5,5)  1096.9,785.4
captured_005      1x sapling                 (5,5)  1067.5,787.8
captured_006      3x sapling                 (5,5)  1066.6,753.6
captured_007      1x sapling                 (5,4)  1108.4,716.9
captured_008      1x pteroc                  (5,4)  1129.2,719.5
captured_009      2x pteroc 1x sap 1x mite   (5,5)  1138.1,749.3
captured_010      1x pteroc                  (5,5)  1108.8,755.6
captured_011      1x pteroc 1x sapling       (6,5)  1168.6,777.5
captured_012      1x pteroc                  (6,5)  1168.2,800.7
captured_013      1x pteroc 2x mitetrap      (6,4)  1228.9,716.2
captured_014      2x pteroc 2x lantern       (7,5)  1257.4,753.2
captured_015      2x lantern 1x mitetrap     (7,5)  1269.4,776.3
captured_016      2x pudding (lit,wind)      (6,5)  1237.8,818.3
captured_017      1x pudding (fire)          (6,5)  1232.4,796.9
captured_018      1x pudding (lit)           (7,4)  1263.4,683.3
captured_019      1x pudding (wind)          (7,4)  1264.9,666.4
captured_020      1x lantern                 (7,4)  1288.1,686.0
captured_021      1x lantern                 (7,4)  1302.8,694.6
captured_022      1x mitetrap                (7,4)  1330.6,690.3
captured_023      1x pudding (fire)          (8,4)  1355.6,716.1
captured_024      1x pudding (lit)           (7,4)  1339.0,720.7
captured_025      1x pudding (wind) 1x mite  (7,4)  1320.2,718.6
captured_026      2x mitetrap                (8,4)  1398.4,686.6
captured_027      1x lantern                 (8,4)  1419.7,684.2
captured_028      2x pudding (fire,lit)      (8,4)  1439.6,687.1
captured_029      1x lantern                 (8,4)  1387.2,707.9
captured_030      1x lantern 1x pud (wind)   (8,5)  1388.7,732.2
captured_031      6x louse                   (8,5)  1372.5,749.1
captured_032      1x lantern                 (7,5)  1337.1,752.5
captured_033      1x void flame              (6,6)  1160.2,882.3
captured_034      2x void flame              (6,6)  1187.5,879.5
captured_035      2x pteroc 1x mitetrap      (6,6)  1198.8,852.5
captured_036      1x pteroc                  (6,5)  1200.7,821.5
captured_037      2x pteroc 1x sapling       (6,6)  1168.3,854.9
captured_038      6x louse                   (6,3)  1146.3,596.8
captured_039      2x cell mite               (7,4)  1281.8,629.3
captured_040      3x cell mite 2x lantern    (7,3)  1296.8,605.7
captured_041      2x sapling                 (6,3)  1203.6,605.0
captured_042      2x mitetrap                (6,3)  1235.7,600.1
captured_043      1x pudding (fire) 1x mite  (6,4)  1225.3,624.9
captured_044      1x pudding (lit)           (7,4)  1245.5,624.9
captured_045      2x lantern                 (6,4)  1242.5,663.3
```

All groups `requiredFieldLevel = 0` in the live import (spawn at landing);
gating is by physical field barriers, not spawn level. `RECOVERED_CORRIDOR_DRAFTS`
(photocell-centered reconstructions) are inactive research notes only.

## Rewards

```
EXP: 2160 (CompleteGCQuestOnce; checkpointed)
Currency: 1000x Storm Seals (1000201) via GrantGCQuestSealsOnce (cap-aware, once-only)
No central gamedata_quest_rewards row (GC seal quests pay via script; inspected: no 111410 row)
Duty coffers (independent of quest): 6 route coffers + up to 5 boss-reward coffers
```

## Fail/retry/re-entry rules

- Entry refusal: wrong zone / not leader / party size / offline / zoning /
  non-combat class / level < 25 / active Toto-Rak timer -> explicit message, no
  instance created, quest stays at seq 10.
- 60-minute timeout: quest NPCs unusable; re-enter after timer via Bloisirant.
- 15-minute retry delay from expedition start (`TIMER_TOTORAK`).
- Wipe: no quest penalty; re-enter and continue at current seq.
- Abandon: standard; seal checkpoint is per-accept journal (no cross-accept leak).
- Late joiners: `TryJoinActiveTotorakInstance` admits party members to the live
  copy; actors rebind on visibility.

## Cutscenes / processEvents

```
processEventGUINCUMStart  accept offer (Guincum)
processEvent_005          Zerig petition -> urn
processEvent_010          Bloisirant entry briefing (args 0, 60)
processEvent_010_01       entry Yes/No
processEvent_015          moogle urn -> accumulator (arg routeVariant 0/1)
processEvent_020          Bloisirant report
processEvent_025          Guincum completion
rad0f300 / rad0f303-5 / rad0f306-8  duty opening / boss intro / boss death scenes
```

## Parley

```
none
```

## Quest registry + rewards (SQL, inspected)

```
QUEST: (111410, 'Imperial Devices (Limsa Lominsa)', 'Com5l0', 111403, 25)
REWARDS: (none in gamedata_quest_rewards; script-paid seals+EXP)
```
