# 110011 Golden Sacrifices — `Man1u0` (Ul'dah MSQ #3, Lv 8, dialogue/echo-only, NO combat)

- Quest: 110011 | Code: Man1u0 | Prereq: 110010 Court in the Sands (Man0u1) | Next: 110012 Calamity Cometh (Man2u0)
- Type: talk/cutscene/linkpearl MSQ. No battle, no escort, no director, no dynamic content area.
- Implementation: `Data/scripts/quests/man/man1u0.lua` (617 lines, full body read). No script change needed;
  one server-side gate fix applied: `Map Server/Database.cs` 175/0 combat/party-lock removal (see Gate fix).

ORIGINAL WORK ONLY: no client binaries were decompiled or copied. Positions come from repo SQL,
objectives from repo datamined journal CSV, mechanics from public forum/wiki text + repo Lua/C#.

## Sources (VERIFIED by full-body read unless noted)

- Quest rows: `Data/sql/gamedata_quests.sql:43` `(110011, 'Golden Sacrifices', 'Man1u0', 110010, 8)`;
  `:44` successor 110012 Man2u0.
- Objectives: `docs/Dat Mining/xtx_quest.csv` 110011 formula (SEQ list 0/5/10/15/20/25/28/30/35/40/45/
  50/55/60/65/70) + `docs/Dat Mining/xtx_journalxtxWil.csv` EN rows 38-52 (all 15 read in full, see below).
- Story: Square-Enix forum thread 61474 "1.0 Ul'dahn story arc", Golden Sacrifices section (fetched,
  read): Momodi -> Platinum Mirage card-game echo (Thancred vs Niellefresne/Greinfarr, Corguevais takes
  the gil) -> F'lhaminn/Ascilia desert echo (Corguevais funeral gil refused) -> Ossuary echo 15 years ago
  (Mumuepo: no communion with the dead; corpse bought by the Order; Corguevais takes charge of Warburton's
  affairs) -> Momodi warns the Order's eye is on you. No combat anywhere in this quest.
- Combat lives in the SUCCESSOR: GamerEscape `Loremonger:Calamity_Cometh` "Battle Instance ... keep them
  away from here" + `man2u0.lua:457` `guardCombatInstanceEntry` + director duty (`startMan2u0MinemiteDuty`).
- Videos: Teranu `kDhJIw3oZak` (cited in script header) and `RuaiJWd7lEc` "MSQ 01 Ul'dah" (32:55 Golden
  Sacrifices) — page fetches returned chrome only, no transcripts; video contents NOT verified.
- Coordinates: `tools/mobspawns/map_coordinates.py maps` runs this session (zones 175/181/170/209).
  Zero mob placements: no BNPC rows, no `SpawnEnemy`/`SpawnAlly`/`CreateContentArea` in `man1u0.lua`
  (grep over `Data/scripts/quests/man/*.lua` hits every sibling except man1u0/man502/man504).

## Objectives (retail EN journal, VERIFIED: xtx_journalxtxWil rows 38-52)

- 38/SEQ0: Thancred + war-spy rumors; Niellefresne's circle meets at the Platinum Mirage. Speak to
  adventurers around you. | 39/SEQ5: Mirage opening; see the attendant. | 40/SEQ10: enter the gambling
  halls. | 41/SEQ15: Qoqoba stops you; Niellefresne/Greinfarr vs Thancred cheating row. Speak to them.
- 42/SEQ20: escorted out of the Mirage; contact Momodi by linkpearl. (Folded into SEQ25 in Lua; see Flow.)
- 43/SEQ25: F'lhaminn seeks you; find her at the Weavers' Guild (Sunsilk Tapestries). | 44/SEQ28+30:
  Deaustie marks her northern Thanalan rehearsal spot; travel there.
- 45/SEQ35: twins Popokkuli/Seserukka leave; Ascilia appears; talk to her. | 46/SEQ40: Corguevais's funeral
  gil refused; thaumaturges rumored to commune with the dead; linkpearl Momodi. | 47/SEQ45: visit Arrzaneth
  Ossuary grounds. | 48/SEQ50: Mumuepo divines F'lhaminn sent you; find someone else who knows more.
- 49/SEQ55: Warburton's funeral; no resurrection exists; a familiar man (Niellefresne) lurks; Yayake can
  help track him. | 50/SEQ60: Niellefresne curt; seek out Mumuepo. | 51/SEQ65: Mumuepo+Corguevais impasse;
  contact Momodi. (Folded into SEQ70 in Lua.) | 52/SEQ70: Momodi asks you to come by the Quicksand.

## Sequence flow (VERIFIED: man1u0.lua + spawn/private-area SQL)

Private areas (all `PrivateAreaMasterPast`, rows in `server_zones_privateareas.sql`):
175/0 Quicksand scene (row 58), 181/6 Mirage lobby (row 59), 181/7 Mirage high-stakes room (row 60),
170/0 Thanalan rehearsal spot (row 56), 209/4 Ossuary funeral (row 51). Zones: 175/209 Ul'dah,
181 Merchants Ward (Mirage), 170 Central Thanalan.

- ACCEPT: Momodi (1000841) `processEventMomodiStart` -> `AcceptQuest`; full journal releases the fade with
  a move-at-current-position + `EndEvent` (retryable). Accept -> `onStart`: SEQ_000 + warp 175/0
  (-73.811, 195, 78.759, -0.448).
- SEQ_000: 6 adventurers flavor (`processEvent000_2..7`). Momodi in-private -> `processEvent010`,
  `WarpToPublicArea`, SEQ_005. Momodi in-public (relog recovery) -> re-warp 175/0, stays SEQ_000.
- SEQ_005: Gagaruna (1000862) `processEvent015` -> SEQ_010. Ambient: Qata Nelhah, Mammet, Momodi.
- SEQ_010: push GAMBHALL_TRIGG (1090114, 175 public -153.9,185.65,128.15) -> zone 181/6
  (-204.9441, 0, -159.944, 1.591). 4 lobby ambients flavor (`015_5..8`). Push ROOM_TRIGG (1090283, 181/6
  -165.251,0,-160.01) -> `processEvent020`, zone 181/7 (-134.301, 1, -159.996, 1.581), SEQ_015.
- SEQ_015: Thancred (1000948) `processEvent021` -> zone 175 public (-149.812,185.454,123.459),
  `NewNpcLsMsg(1)`, SEQ_025. Ambients: Greinfarr, F'lhaminn, Qoqoba, Corguevais, twins, Niellefresne
  (`020_2..8`). (SEQ_020 journal stage folded: LS pack 1 plays at SEQ_025 instead.)
- SEQ_025: Deaustie (1000293, 209 public 38.84,195.59,257.89) `processEvent028` -> SEQ_028.
- SEQ_028: Deaustie reminder `028_2` (dialogue-only, safe). Push FLHAMINN_TRIGG (1090075, 170 public
  260.007,216.661,-873.143) -> `processEvent030`, SEQ_030.
- SEQ_030: push NORTH_THANTRIGG (1090077, 170 public 255.187,243.754,-864.094) -> `processEvent040`,
  warp 170/0 (290.640,245.201,-875.147, 2.315), SEQ_035.
- SEQ_035: Ascilia (1000042, 170/0 317.261,248,-893.992) `processEvent050` -> zone 170 public
  (314.750,247.899,-894), `NewNpcLsMsg(1)`, SEQ_040. F'lhaminn (170/0 287.926,244.235,-872.185) flavor `040_2`.
- SEQ_040: linkpearl stage. `onNpcLS` pack 2 -> `StartSequenceForNpcLs(SEQ_045)` (matches retail 46->47).
  Gegeissa flavor `055_2`. (Yayake branch unreachable: Yayake not quest-enabled at SEQ_040; harmless.)
- SEQ_045: Yayake (1000846, 209 public -292.89,206.46,219.88) `processEvent060` -> warp 209/4
  (-344.473,206,243.186, 1.704), SEQ_050.
- SEQ_050: push THAUMA_TRIGG (1090045, 209/4 -309.534,206,254.354) or THAUMA2_TRIGG (1090047, 209/4
  -321.358,206,220.517) -> `processEvent070`, same-area warp (-294.941,206,231.882,-1.567), SEQ_055.
- SEQ_055: Niellefresne (1001867, 209/4 -302.807,206,217.182) `processEvent080` -> SEQ_060. 6 mourner
  ambients + Thancred flavor (`070_2..7`). (Yayake branch unreachable in-private; harmless.)
- SEQ_060: push either thauma trigger -> `processEvent090`, zone 209 public (-294.941,206,231.882),
  `NewNpcLsMsg(1)`, SEQ_070. (SEQ_065 journal stage folded: LS pack 3 plays at SEQ_070.)
- SEQ_070: travel to the Quicksand (175). Momodi `processEvent100` + `sqrwa` widget (REWARD_EXP 300) ->
  `CompleteQuest`; pays 15000 gil (msg 25031) + 300 EXP only if `SEQ_COMPLETE`, else retryable unpaid.
  Gogofu/Yayake flavor. Rewards VERIFIED: EXP audit 2026-09-05 (300, corrected) + `StoryRewardTests`
  `("man1u0", 70, "MOMODI", 300, 15000)` + early-story review 2026-09-11 (completion-gated pay).

Markers: 0/70 Momodi 11001101; 5 Gagaruna ...02; 10 gambling hall ...03; 15 Thancred ...04 (private) else
...03; 25 Deaustie ...05; 28/30 N.Thanalan ...06; 35 Ascilia ...08 (private) else ...06; 45 Yayake ...09;
50/60 hall ...10 (private) else ...09; 55 Niellefresne ...11 (private) else ...09. No marker at pure
linkpearl stage SEQ_040 (by design: LS read advances).

## Actors / triggers / spawns (VERIFIED: server_eventnpc_spawn_locations.sql rows)

175/0: Momodi r2644 (-74.91,195.45,81.14,2.88); ruminating elezen r2654; well-dressed midlander r2657;
queerly lalafell r2653; silver-haired seductress r2658; waxen widower r2655; lumbering lalafell r2656;
exit actor r2660. 181/6: Kockacha r2661; Gwenolie r2662; Patient Crow r2663; Raginhart r2664; ROOM_TRIGG
r1722. 181/7: Thancred r1723 (-123.39,1.204,-159.176,1.877); Greinfarr r1740; Niellefresne r1745; F'lhaminn
r1746; Qoqoba r2666; Corguevais r2667; Popokkuli r2668; Seserukka r2669. 170/0: Ascilia r1725; F'lhaminn
r1748. 209/4: Niellefresne r1728; Thancred r1754; downcast derelict r2674; strumpet r2675; Zssapa r2676;
ailing roegadyn r2677; Sinette r2678; thauma triggers r1726/r1727. Public: Gagaruna 175 r61; Deaustie 209
r184; Yayake 209 r210; Gegeissa 170 r37; Gogofu 209 r147; Sinette 209 r202; Popori/Mammet/Qata 175 r45/89/90.
Mumuepo has NO server actor: appears only inside client cutscenes (`070`/`090` family). Zero BNPC rows
for this quest (grep-verified); zero escort routes.

## Cutscenes / processEvents / linkpearl (VERIFIED: man1u0.lua)

Accept/0: MomodiStart, 000_2..7, 010. Mirage: 010_2..4, 015, 015_2..8, 020, 020_2..8, 021 (+021_2/025_2
flavor flagged for retail review in-script). Thanalan: 028, 028_2, 030, 040, 040_2, 050. Ossuary: 055_2,
060, 070, 070_2..7, 080, 080_2, 090, 090_2, 100, 1000_4 (Gogofu, flagged), 100-item. NPCLS_MSGS sender
1500014: pack1 {73,74,200} at SEQ_025; pack2 {114,155,116,117} at SEQ_040/045 (->045 on completion);
pack3 {160} at SEQ_070.

## No-combat / no-escort record (why template fight items are N/A)

- No `guardCombatInstanceEntry`, director, content area, kill callback, timer, adds, phases, enrage, leash,
  reset, or party/solo scaling in `man1u0.lua` (sibling-wide grep). No chocobo policy applies: indoor
  dialogue rooms inherit the parent zone flag; nothing to summon for. No escort pathing: no follow/teleport/
  aggro surface exists. Death/timeout: no damage or timer sources. Disconnect: all five areas are static
  non-recoverable (`IsStartupRecoverable` false) -> relog boots to public; every SEQ re-enters cleanly
  (000 Momodi re-warp; 010 175 trigger; 015 marker+trigger loop; 035 N.Than trigger; 050/055/060 Yayake
  re-warp with at most a 055/060->050 repeat, no stuck state). Abandon in 170/0 or 209/4 (canExitArea 0,
  exit warp globally commented out) strands until teleport/GM: GLOBAL engine gap shared by all dialogue
  quests (no `onAbandon` in any `man/*.lua`), not fixed here.

## Gate fix applied (Memory repo)

`Map Server/Database.cs` `IsPartyLockedStaticInstanceArea`: removed `case 175: type 0` ("Coliseum tourney
fight"). Evidence it was misplaced: COL_TRIGG 1090141 spawns in 209/0 (row 253; fight floor 209/0
-192.4,174.89,160.119 per guide + `man0u1.lua:963`); 175/0 spawns are ONLY the 8 MAN1u0_* dialogue rows
above. Effect of the bug: `WorldManager.CanPlayerEnterInstanceArea` rejected DoH/DoL (quest journal says
"All" disciplines) from the SEQ_000 scene, and `PrivateArea.LocksPlayerPartyChanges` party-locked a
2-minute talk scene. Precedent: Beckon 206/9 dialogue exclusion (early-story review 2026-09-11). The real
coliseum 209/0 stays protected by `man0u1.lua`'s Lua guard; adding 209/0 to the C# list is a man0u1-owner
follow-up (touches 110010 admission; out of scope here).

## Coordinates (map tool, this session)

175 Ul'dah map_available p1800; 209 Ul'dah map_available p1900; 170 Central Thanalan map_available p1000;
181 Merchants Ward world_only (49 live nav nodes; private rooms use exact staged SQL coords, no generated
placements). No `plan` output: nothing to place.

## Open gaps / follow-ups (not 110011 defects)

- man0u1 owner: consider listing the real coliseum 209/0 in `IsPartyLockedStaticInstanceArea` (currently
  Lua-guard-only) after auditing 209/0 dialogue users.
- Engine owner: abandon/timeout exit from static dialogue rooms with canExitArea 0 (170/0, 209/4, 175/0).
- Retail-fidelity polish (NOT applied): SEQ_020/065 exist in retail journal (rows 42/51) but are folded
  into SEQ_025/070 in Lua (LS packs play at destination). Flow is completable and test-covered; rewiring
  would change accepted, reviewed behavior. In-script `Needs investigating` flags: `021_2`, `025_2`, Gogofu
  `1000_4` owners.
- Video transcripts unverified (fetches returned player chrome only).
