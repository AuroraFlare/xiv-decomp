# 111406 Ceruleum Shock — `Com0l6` (Maelstrom GC Story, Lv 25, private squad battle + public aftermath)

- Quest: 111406 | Code: Com0l6 | Patch 1.19 | Type: Combat / Grand Company Story
- Issuer: Storm Lieutenant Guincum, Maelstrom Command (zone 232) | Prereq: 111405 An Officer and a Wise Man, Lv 25, DoW/DoM
- Chain: second Lominsan 1.19 campaign quest; unlocks 111407 Till Sea Swallows All (Com0l7)
- Implementation: `Data/scripts/quests/com/com0l6.lua` via shared `InitGrandCompanyCampaignQuest("Com0l6")`
  + `Data/scripts/directors/Quest/QuestDirectorGcCom0l6.lua` (all bodies read in full; quest Lua needs no
  changes — see File map. One server-side loophole fix applied: WorldManager.cs Toto-Rak skip removal.)

ORIGINAL WORK ONLY: no client binaries were decompiled or copied. Positions come from repo SQL/TSV,
dialogue from public text datamines already in the repo, mechanics from public wikis + repo Lua/C#.

## Sources (VERIFIED by full-body read unless noted)

- Walkthrough: GamerEscape `Ceruleum Shock` snippet (search 2026-09-27): Guincum -> Ferry Docks battle vs
  Immortal Speardancer / Bladedancer / Shadowspinner / Lightspinner -> Aisborgsyn -> Central Thanalan
  (24,23) cutscene -> Limsa elevator -> Cid. Full page fetch truncated; walkthrough steps corroborated by
  journal text below.
- Lore summary: Final Fantasy Wiki `Maelstrom Quests (version 1.0)` (fetch truncated at nav; snippet
  confirms ceruleum-fields "already discovered by the Immortal Flames" + Cid invitation to Mizzenmast).
- Video: YouTube `rS_DlIj4X-w` "Final Fantasy XIV 1.0 - Ceruleum Shock (Grand Company Quest)"
  ("Cid Garlond's Return"). Page fetch returned chrome only, no transcript — video contents NOT verified.
- Journals: `docs/Dat Mining/xtx_journalxtxSea.csv` rows 288–292 (EN read in full, see Sequence flow).
- Dialogue: `docs/Dat Mining/com0l6.csv` rows 2–105, EN column (read in full; see Dialogue flow).
- Quest rows: `Data/sql/gamedata_quests.sql:460` (111406 prereq 111405, Lv 25); `docs/Dat Mining/quest.csv`
  row 111406; `cutReplay.csv` row 11140601 = scene `com0l510`.
- Positions: `server_eventnpc_spawn_locations.sql` rows 3240–3243, 2771; `server_battlenpc_mob_types.sql`
  rows 2274–2277 (mob types 40201–40204); `gamedata_actor_class.sql` rows 6659–6662 (actors 2289026–29);
  skill lists 88/89/91, spell lists 2/4.
- Coordinates: `tools/mobspawns/map_coordinates.py` (`maps`/`locate` runs, this session, zones 172/170/133).

## Objectives (journal paraphrase, VERIFIED: xtx_journalxtxSea 288–292)

1. (288/289) Guincum asks you to join the Hollow Barons on a classified Thanalan mission and observe them.
   Travel to the Vesper Bay ferry docks. "Up to two party members may accompany you."
2. (290) After the Vesper Bay fight, speak with the remaining Hollow Barons about the battle.
3. (291) Learn the plan (Vesper Bay diversion; captain takes ceruleum in northern Thanalan). Find the captain.
4. (292) At the ceruleum fields the Barons are discovered; Cid Garlond defuses the standoff and invites you
   to the Limsa Lominsa Landing atop the Mizzenmast.

## Sequence flow (VERIFIED: gc_campaign_quest.lua + gc_campaign_placements.lua com0l6 route)

- SEQ ACCEPT/0: Guincum (1500199) `processEventGUINCUMStart` with arg `{1}` ("as you know" branch, since
  Com0l5 is complete). Accept (`==1`) + `AcceptQuest` -> 10. C# gate: `CanStartGrandCompanyCampaignQuest`
  requires no GC enlistment/rank yet (Player.cs:5744).
- SEQ 10: battle entry. Push trigger 1099521 at Vesper Bay ferry docks -> `StartGrandCompanySquadBattle`
  (see Fight). All 4 targets dead -> 20. Any failure -> back to 10 (retry at the same trigger).
- SEQ 20: talk Aisborgsyn (1001749, Vesper Bay) `processEvent_005` -> 30.
- SEQ 30: push trigger 1099522 at the ceruleum fields, Central Thanalan `processEvent_010` args `{1}` -> 40.
  (Recovered scene `com0l510` for this step is NOT wired yet — see Open gaps.)
- SEQ 40: talk Cid (1001572, Limsa Landing) `processEvent_015` with history arg (`l6` policy: both Gridania
  and Ul'dah sibling quests done -> {4}; Gridania only -> {1}; Ul'dah only -> {2}; neither -> {3}) ->
  complete: 300 Maelstrom seals (once, flag 22) + 1891 EXP (once, flag 23), no items/gil/evidence required.

Journal markers: SEQ 10 -> 11150501; SEQ 20 -> 11150502; SEQ 30 -> 11150503; SEQ 40 -> 11150506.
(Marker IDs are client markers referenced by Lua; no server SQL row defines them.)

## Actors / triggers / spawns with guide coordinates (VERIFIED: SQL rows + map tool)

| Who | Actor | Zone | Position (X, Y, Z) | Map (tool-measured) |
|---|---|---|---|---|
| Storm Lt. Guincum | 1500199 (row 2771) | 232 Maelstrom Cmd | 168.9, 0, -175.7, rot -1.5 | office interior (not probed) |
| Battle entry trigger | 1099521 (row 3240) | 172 W. Thanalan | -2189, 14.133845, -425 | (4.98, 26.47); floor OK: node 9104 (-2185.50, 14.06, -424.67) 3.5u |
| Aisborgsyn | 1001749 (row 3241) | 172 W. Thanalan | -2205, 14.133845, -423 | (4.82, 26.49); floor OK: node ~(-2202.61, 14.00) 2.4u |
| Ceruleum scene trigger | 1099522 (row 3242) | 170 C. Thanalan | -187, 215.862230, -735 | (25.00, 23.37), square (25,23); floor OK: recorded (-192.88, 215.86) — exact Y match. Wiki walkthrough says (24,23): adjacent square, ~40u west; trigger X/Z is the native marker. |
| Cid (Landing) | 1001572 (row 3243) | 133 Limsa (public!) | -461, 92, 209 | p800 (7.55, 5.29); street nodes Y~20.7; NO recorded nodes above Y 50 nearby — Y=92 (Mizzenmast platform) needs a walked floor capture. Reached by the PUBLIC elevator; no scripted warp (unlike Com0l5's private-room elevator). |

Mob formation (authored around the native marker; Y from frozen capture nodes):

| # | Mob | Actor / mob type | Lv/Job | Position |
|---|---|---|---|---|
| 1 | immortal_bladedancer | 2289026 FighterEnemyGladiatorFactionEmp / 40201 | 25 GLA(3) | -2193, 14.576857, -421 |
| 2 | immortal_lightspinner | 2289027 FighterEnemyConjurerStandard / 40202 | 25 CNJ(23) | -2189, 14.375232, -420 |
| 3 | immortal_speardancer | 2289028 FighterEnemyLancerStandard / 40203 | 25 LNC(8) | -2185, 14.133845, -421 |
| 4 | immortal_shadowspinner | 2289029 FighterEnemyThaumaturgeStandard / 40204 | 25 THM(22) | -2189, 14.576857, -417 |

## Triggers (VERIFIED: gc_campaign_battles.lua + gc_sqb_runtime.lua)

- Entry: QFLAG_PUSH on 1099521 only at SEQ 10; requires same area, zone 172, |dY|<=6, horizontal <=14u.
- `StartGrandCompanySquadBattle` gates: public area, connected, not zoning, combat class/job, alive,
  Lv>=25 (leader AND every helper), unmounted (leader + helpers, checked 3x: pre-create, entrant collect,
  post-movie), party<=3 leader-only start, helpers within 30u radius, no open event, no live content area.
- Private copy `gc_sqb_com0l6_<ownerId>`, director `/Director/Quest/SimpleQuestBattle/QuestDirectorCom0l601`,
  boundary circle r=45 at entry point, `DisableReentry()`.
- Kill credit: exact actor-class reconciliation per wave; foreign same-class kills and duplicate fan-out
  callbacks rejected; `requireAllTargets` (4/4) -> won. Timeout 1800s.

## Dialogue flow (VERIFIED: com0l6.csv EN rows 2–105)

- Guincum offer (rows 2–21): accept (row 18 "Well spoken, recruit.") -> mission; deny (rows 16–17) holds at
  offer, retryable. Covers Hollow Barons induction, Garlond flagship, ceruleum shortage, Ul'dah 300% tariff,
  "test their loyalty" escort task, Vesper Bay warning.
- Vesper Bay aftermath (rows 22–29): pirate Row 22/23 orders you to find Captain Lvfrid; rows 24–25 mock the
  beaten Flames; rows 26–29 explain the diversion plan and mark the northern Thanalan pits on your map.
- Ceruleum fields scene (rows 30–58, the com0l510 content): pirates vs Flame corporal ultimatum (32–33),
  mockery (34–35), Cid's "Stay your blades" (39–40), ceruleum instability warning (42–43), Dalamud/aether
  lecture (45–49), pirates leave (50–51), Cid invites YOU to the Mizzenmast landing, alone (53–58).
- Limsa Landing (rows 59–88): Ironworks hands (59–64, incl. 100k gil bounty on Lvfrid's head), Cid's full
  briefing: aether study (66), Dalamud suspect (68), history-variant "you've heard this before" (69/70) vs
  fresh (71), Garlemald foreknowledge (72–73), his Garlean defector confession, variant by prior meeting
  (75 vs 76), neutrality + stakes (77–78), Admiral comment (79), question variant (80/82), Maelstrom praise
  (81/83), "be the wind" (84–86), instincts (87), "Dalamud calleth" (88). Bystanders marvel at Cid (89–91);
  airship/ferry flavor (92–96); rows 98–105 are the Com0l5 handoff lines, not this quest's flow.

## Fight tuning (VERIFIED: mob_types rows 2274–2277 + skill/spell lists)

All four: Lv 25 (min=max), speed 6, hostile, detectionRange 12, respawn 60, combatDelay 4200, att 40,
acc/def/eva 1, all resists 1.0, element 0, hpMax/mpMax 0 (formula-derived), dropList 0 (no loot).

- Bladedancer (40201, GLA): skill list 91 — flash, fast/flat/savage/riot blade, shield bash, phalanx.
  Tank/disruptor.
- Lightspinner (40202, CNJ): spell list 4 — Cure, Stoneskin, Aero. Healer — kill priority with the THM.
- Speardancer (40203, LNC): skill list 88 — true/heavy thrust, impulse drive, feint. Melee DPS.
- Shadowspinner (40204, THM): skill list 89 (dark seal, resonance, blizzard, fire, thunder) + spell list 2
  (fire, thunder). Caster nuke.
- No waves/adds/enrage; single 4-target wave, simultaneous aggro expected inside r=45. Lv 25 quest vs Lv 25
  mobs; 1–3 players allowed, no level sync (consistent with 1.0 GC fights).

## Chocobo / companion disabled (VERIFIED: gc_sqb_quest.lua + runtime, full-body reads)

- `isMounted` refuses entry at `CanStartGrandCompanySquadBattle` (with "Dismount your chocobo" message),
  in `collectEntrants` (leader + every helper), and in post-movie revalidation.
- Zero companion/chocobo/ally/trust spawn calls across com0l6.lua, gc_campaign_quest.lua,
  gc_campaign_battles.lua, QuestDirectorGcCom0l6.lua, gc_sqb_runtime.lua,
  SimpleContentGrandCompanySquadBattle.lua (all read in full). No `config.actors` on this route.

## Wipes / resets / edge cases (VERIFIED: gc_sqb_runtime.lua + WorldManager.QuestBattle)

- Death, 1800s timeout, disconnect, area exit, entry failure, wave-spawn failure, quest-changed
  (abandon/re-accept/replacement session) -> fail-safe return to public return point, quest stays/returns
  to SEQ 10 (retry at the Vesper Bay trigger). Relog rebinds by owner character ID only, never adopts a
  helper. Success (4/4 kills, owner alive + in area + quest current) -> SEQ 20.
- One-time story quest; seals/EXP once-flags (22/23) make interrupted completion idempotent; completion
  requires no evidence items for this quest (requirements nil).
- Cross-company exclusion via GrandCompanyOpeningQuestRules.cs + per-dialogue journal-currency guards.

## No-loophole checklist

- [x] Ambient-actor credit: kills only count for exact content-owned actors in this area/wave (reconciled).
- [x] Re-entry: `DisableReentry()` — no second target set or reward path.
- [x] Boundary: r=45 circle; leaving the area fails the fight.
- [x] Mount/level/party gates triple-checked (pre/movie/post).
- [x] Stale-journal writes: `IsQuestBattleQuestCurrent` / `CanContinueGrandCompanyQuestDialogue` after yields.
- [x] Double-pay: seals + EXP once-flags with Save checkpoints.
- [x] Toto-Rak skip (FIXED this session): `AdvanceTotorakEntryQuest` (WorldManager.cs, fired on Toto-Rak
  landing) auto-advanced 111406 10->20, letting players skip the Vesper Bay battle while keeping Toto-Rak
  access. The 111406 row is removed; entry access is unchanged (separate check). Sibling campaign rows
  (111405/111605/111606/111805) carry the identical legacy bug and need the same review before patch_1_19
  quests are enabled — left untouched to avoid cross-quest conflicts.
- [x] Availability: `quest_availability.lua` patch_1_19 block (incl. 111406) is commented = not offered;
  active journals still progress; GM ForceAddQuest still works. Do NOT enable until open gaps close.

## File map (all bodies read in full)

- `FF14-Memory/Data/scripts/quests/com/com0l6.lua` (2 lines, delegate) + `gc_campaign_quest.lua` (shared
  quest machine) + `gc_campaign_placements.lua` com0l6 route + `gc_campaign_battles.lua` (battle config)
- `FF14-Memory/Data/scripts/directors/Quest/QuestDirectorGcCom0l6.lua` + `gc_sqb_runtime.lua` (lifecycle)
- `FF14-Memory/Data/scripts/quests/com/gc_sqb_quest.lua` (launcher/gates) + `story_scene.lua`
- `FF14-Memory/Data/scripts/content/SimpleContentGrandCompanySquadBattle.lua` (boundary)
- `FF14-Memory/Map Server/WorldManager.cs` (Totorak transitions ~4393, landing hook ~9906 — FIXED)
- `FF14-Memory/Map Server/Actors/Chara/Player/Player.cs:5744` (accept gate)
- `FF14-Memory/Map Server/Actors/Quest/GrandCompanyOpeningQuestRules.cs` (company exclusion)
- `FF14-Memory/Data/scripts/quests/com/gc_reward_checkpoint.lua`, `gc_quest_items.lua` (rewards)
- `FF14-Memory/Data/scripts/quests/quest_availability.lua:331` (111406 gated), `totorak_entry.lua:39`
- `FF14-Memory/Data/scripts/commands/gm/sqbprivate.lua:119` (BLOCKED probe record),
  `gcbattle.lua` (floor capture), `totorak.lua:180` (label)

## Open gaps (do NOT paper over)

1. Scene `com0l510` (cutReplay 11140601) is recovered but unwired: SEQ 30 currently plays dialogue-only
   `processEvent_010 {1}`. Wiring `scene="com0l510"` needs the live payload/after-warp probe first
   (sqbprivate BLOCKED preconditions). Staged optional one-liner, NOT applied:
   `[30]={trigger=1099522,...,event="processEvent_010",args={1},scene="com0l510"}`.
2. `processEvent_000`, `processEvent_elevator_nq1/nq2` (audit-gate list) have no bound caller on this route;
   `elv0l01a/elv0l02a` appear in no cutReplay row (generic elevator scenes, likely no quest binding needed).
   Cid is public-zone; the elevator is the public one.
3. Cid Y=92 has no movement-capture support (street nodes Y~20.7; zero nodes above Y 50 nearby). Needs
   `!gcbattle goto com0l6`-style walked capture at the Mizzenmast landing before enable.
4. Mob formation (4 fixed points) is authored around the native marker, not retail coordinates.
5. YouTube video contents unverified (no transcript available via fetch).
6. C# change needs a normal solution build/CI pass (one array-row removal + comment; no Lua touched).
