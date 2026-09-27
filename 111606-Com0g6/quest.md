# 111606 Appetite for Destruction — `Com0g6`

- GC: Order of the Twin Adder [Story] | Level: 25 | Rank: Recruit | Patch: 1.19
- Offer: Serpent Lieutenant Fulke 1500200 (Adders' Nest, zone 234) | Status: Implemented, offer-gated
- Quest scripts: bespoke `com0g6.lua` (2 lines, delegates to shared `gc_campaign_quest`) + `gc_campaign_battles.lua` + `gc_campaign_placements.lua` (`com0g6` route) + director `directors/Quest/QuestDirectorGcCom0g6.lua` + shared `gc_sqb_runtime.lua` + `gc_reward_checkpoint.lua`.
- SQL: `gamedata_quests.sql` row `(111606, 'Appetite for Destruction', 'Com0g6', 111605, 25)`; prereq `111605 Their Finest Hour`; next `111607 Serenity, Purity, Sanctity`.
- Availability: `quest_availability.lua` line 340 — implemented but COMMENTED (offer disabled) pending a recorded live 1.0 playthrough, same gate as siblings 111605/111607. Deliberate; do not uncomment without that evidence.
- Public sources (inspected): Gamer Escape `Appetite_for_Destruction_(1.x)` (journal + 4-step walkthrough), Fandom `Order_of_the_Twin_Adder_Quests_(version_1.0)` §Appetite for Destruction (level 25, Recruit, Fulke, 300 seals, ~1,890 EXP, journal triplet). No quest-specific YouTube footage found; 1.0 GC cutscene archives exist only as general compilations.

## Objectives / phases (VERIFIED: placements + campaign quest + public walkthrough)

| Seq | Phase (journal id) | What the player does |
| --- | --- | --- |
| SEQ_ACCEPT/0 | Accept (339) | Talk to Fulke, accept `processEventStart` |
| 10 | Stillglade briefing (340) | Push entry 1099531 in Gridania (zone 206) → Stillglade Fane private (`PrivateAreaMasterPast`) → talk to Bowlord Lewin 1000020 (`processEventLewin {0,0}`) → auto-return to public Gridania |
| 20 | Nine Ivies battle (341) | Push battle entry 1099528 west of Camp Nine Ivies (zone 151) → private squad battle vs 3 diremites → victory movie `processEventNq` + scene `COM0G510` → SEQ 30, return to public |
| 30 | Cid debrief (342) | Push entry 1099531 again → Stillglade private → talk to Cid 1001572 (`processEventClear` + familiarity enum, see below) → 300 seals + 1,891 EXP → complete → auto-return to public Gridania |

Public journal triplet matches this shape exactly: (1) visit Stillglade Fane / Bowlord Lewin re Dalamud; (2) meet Arthur's contact at a clearing west of Nine Ivies, fell beasts; (3) Arthur/Cid exchange, return to Stillglade and speak to Cid.

## Delegate events (VERIFIED: gc_campaign_quest.lua:30-37,100-146 + gc_sqb_runtime.lua:289-310)

- Accept: `processEventStart` (no args; cf. Com0l6/Com0u6 sibling arg variants). `accepted == 1` + `player:AcceptQuest` → SEQ 10. Ineligible offer (prereq/allegiance via `CanStartGrandCompanyCampaignQuest`) ends event with zero client calls (tests.lua:71-75 pattern).
- SEQ 10: access push (no delegate; straight `DoZoneChange` to private) → `processEventLewin {0,0}` → SEQ 20 + return warp to `206 (-327.3, 8.0, -1671.06)`.
- SEQ 20: battle-entry push → `StartGrandCompanySquadBattle` (see Fight). Victory plays `processEventNq` + `COM0G510` INSIDE the private area via `storyScene.play(..., afterWarp=false)`, then SEQ 30.
- SEQ 30: access push → `processEventClear {history}` → seals → EXP → `CompleteQuest` → return warp to public Gridania.
- Every branch re-validated by `CanContinueGrandCompanyQuestDialogue` after each client yield (gc_campaign_quest.lua:25-28,103-114): stale/disconnected/replaced dialogue cannot apply progress or close a replacement event (tests.lua:78-82,144-146 patterns).
- Native event bodies are client-owned (not recovered server-side); server binds continuation identity only. Recovered-but-unwired client names from the audit gate (`processEventStartAfter`, `processEventLewinAfter`, `processEventPesi`, `processEventPesiAfter`) belong to the native movies; no server-owned step is missing.

## Dialogue flow (VERIFIED: placements + gc_campaign_quest.lua:56-79 + tests.lua:160-168)

1. Fulke accept widget → SEQ 10.
2. (Push) Stillglade entry → private Lewin `processEventLewin {0,0}` (baseline intro, tests.lua:164-165) → SEQ 20 + public return.
3. (Push) Nine Ivies entry → squad battle → `processEventNq`/`COM0G510` aftermath movie (Arthur/Cid exchange per journal) → SEQ 30.
4. (Push) Stillglade entry → private Cid `processEventClear {familiarity}` → rewards → complete + public return.
- `history="g6"` familiarity enum (gc_campaign_quest.lua:70-77): Limsa 111406 done → `{1}` (Nael branch), Ul'dah 111806 done → `{2}` (Gaius branch), both → `{4}`, neither → `{3}`. First-meeting `{3}` asserted (tests.lua:167-168). Sibling-completion mapping is INFERRED; the 1..4 native branches are recovered.
- No items change hands in this quest (no `giveItems`/`requirements`; `HasGCQuestCompletionEvidence` with nil items is vacuous).

## Actors / markers / triggers (VERIFIED: SQL rows + actor-class JSON)

- Fulke 1500200, zone 234 Adders' Nest `(169, 0, -174.7)` (offer/accept at SEQ_ACCEPT+0).
- Stillglade entry trigger 1099528-class 1099531, spawn id 3256 `com0g6_stillglade_entry`, zone 206 `(-327.3, 8.0, -1671.06)`; quest visibility SEQ 10+30; markers 11160501 (SEQ 10 access) / 11160504 (SEQ 30 access).
- Bowlord Lewin 1000020, private-only step SEQ 10 `(-353.58, 6.248, -1695.72)`; visibility `111606:[10]`; marker 11160502.
- Battle entry trigger 1099528, spawn id 3258 `com0g6_battle_entry`, zone 151 `(1502.14, 20.818, -778.19)`; visibility `111606:[20]`; marker 11160503.
- Cid 1001572, private-only step SEQ 30 `(-349.71, 6.248, -1697.97)`; visibility `111606:[30]` (+111406:[40], 111806:[30] sibling shares); marker 11160505.
- Proximity ownership: ≤14u horizontal + ≤6u vertical + exact zone/private-area match (`nearStep`, gc_campaign_quest.lua:48-54); wrong-floor same-X/Z rejected (tests.lua:106-109 pattern).
- Journal ids {0:339, 10:340, 20:341, 30:342}; marker ids are client-owned display ids returned verbatim by `getJournalMapMarkerList`.

## Fight tuning (VERIFIED: gc_campaign_battles.lua:21-32 + placements com0g6 + mob-type SQL + gc_sqb_runtime.lua)

- Roster (single wave, `requireAllTargets`, all must die): 3× Nine Ivies diremites —
  - `111606_nine_ivies_diremite_a`: actor 2101115 (SpiderFemaleStandard), mob type 40208, `(1498.14, 20.818, -773.19)` rot 0
  - `111606_nine_ivies_diremite_b`: actor 2101116 (SpiderChildStandard "miteling"), mob type 40209, `(1502.14, 20.818, -772.19)` rot 0
  - `111606_nine_ivies_diremite_c`: actor 2101120 (SpiderFemaleStandard), mob type 40210, `(1506.14, 20.867, -773.19)` rot 0
  - Diremite identity INFERRED from this quest's native `COM0G510` cast; the three ordinary variants + count/formation are authored (placements.lua:72-73). No NM, no second wave, no interaction item (unlike Com0g5's Earthbreaker golem).
- Mob-type rows (raw; only the 25/25 level pair is interpreted, matching the quest level; other numeric columns undecoded):
  - `(40208,2101115,'nine_ivies_diremite',...,25,25,...)`, `(40209,2101116,'nine_ivies_miteling',...,25,25,...)`, `(40210,2101120,'nine_ivies_diremite',...,25,25,...)`
  - No `server_battlenpc_skill_list` / `spell_list` rows for 40208-40210 (or any 4020x/4021x campaign types): basic-attack tuning is the shared convention across all six campaign routes.
- Entry rules (`StartGrandCompanySquadBattle`, gc_sqb_quest.lua:45-57,161-221): public area only, connected session, combat class/job, alive, level ≥25, unmounted, no live content shell `gc_sqb_com0g6_<playerId>`; party via leader only, cap 3, every entrant online/combat-ready/same-area/event-free/alive/level-qualified/unmounted/within 30u.
- Arena: private content copy at the entrant's position, boundary circle r=45, `DisableReentry`, director `Quest/QuestDirectorGcCom0g6` → `gc_sqb_runtime` (owner-bound, 1800s deadline, 1s monitor).
- Kill credit (`runtime.onKill`): exact spawned uniqueId + same area + class match + actually dead; duplicate/fan-out callbacks and foreign same-class kills are NOT credit (gc_sqb_runtime.lua:359-379). All 3 → `won` → `finish(true)`.
- Victory path: 2s settle → owner must be connected, in-area, alive, quest-current (else downgraded to failure) → `processEventNq`/`COM0G510` → SEQ 30 (guarded by `IsQuestBattleQuestCurrent` post-movie) → despawn → return party → destroy area.
- Chocobo: mounts blocked — leader gets "Dismount your chocobo before entering", members "Every party member must dismount before entering"; re-checked post-movie before publication (gc_sqb_quest.lua:30-39,170-171,207-208,232-234,343). 1.0 has no combat companion, so mount exclusion is the complete policy; no chocobo can enter the instance.

## Placement — guide coordinates (VERIFIED: mob_map_coordinates.md workflow + live CLI this session)

- Zone 151 East Shroud, native page 2100 (scale 1, base 3104/3808, layout 302/place 2008). Battle trigger world `(1502.14, -778.19)` → map `(46.06, 30.30)`, cell `(46,30)`. Nearest recorded node 4883: `!pos 151 1500.214 20.818 -778.663` (1.98u, inside selection, 46 recorded points in radius). `existing_mobs_in_selection: 9` — public-zone context only; the fight runs in a private copy so ambient mobs cannot satisfy or disturb the encounter.
- "Clearing west of Nine Ivies" check: Camp Nine Ivies anchors (man402 trigger `(1690.88, 20.17, -857.55)`, battlewarden `(1712, 20, -862)`). Battle point is ~189u west and ~80u south of camp — predominantly west, consistent with the journal. (Compass note: +Z is south on these maps.)
- Zone 206 Gridania, native page 2800 (scale 2, base 608/1824, layout 331/place 2001). Stillglade entry world `(-327.3, -1671.06)` → map `(2.81, 1.53)`, cell `(2,1)`. Nearest recorded node 261: `!pos 206 -327.625 8.000 -1670.931` (0.35u, inside, 31 recorded points, 0 mobs).
- Private-room Y (6.248 Lewin/Cid floor, 6.25/0.774 landings) is layout-derived room support, not captured retail NPC Y — same documented status as the Com0l5 Bridge room.
- Heights at marker centers unresolved per guide; Y values above are the exact SQL/placement Y confirmed by adjacent recorded nodes.

## Rewards (VERIFIED: gc_campaign_quest.lua:81-85 + gc_reward_checkpoint.lua + Fandom)

- 300 Serpent Seals (company 2) + 1,891 EXP. Fandom: "Serpent Seal x 300 ... ~1,890 EXP" — seals exact, EXP within the wiki's approximation (1,891 is the shared six-route value).
- Pay-once: seals flag 22 persisted BEFORE any further yield; EXP flag 23 before `CompleteQuest`; retries never double-pay; seal-cap refusal fails closed with quest un-completed and retryable.
- `characters_quest_scenario.flags` MEDIUMINT 24-bit; bits 21-23 reserved for these routes; no field-objective flags used by this quest.

## Wipes / resets / edge cases — no-loophole checklist (VERIFIED: gc_sqb_runtime.lua:400-496 + gc_sqb_quest.lua:113-159 + gc_campaign_quest.lua)

- Death (owner, after entry): `finish(false, "death")` → retry SEQ 20, return to public, area destroyed. Helpers' deaths do not end the fight.
- Timeout (1800s): `finish(false, "timeout")` → retry SEQ 20. Kill callbacks at/after deadline ignored.
- Disconnect: owner offline → `finish(false, "disconnect")`; relog rebinds by character id (`refreshOwner`), never adopts a helper as owner.
- Leaving the private area / failed entry / entry-session replaced: `area-exit` / `entry-failed` / `entry-session-replaced` → fail closed to SEQ 20.
- Abandon/re-accept mid-fight (`quest-changed`): finish(false); post-movie journal rewrite refused unless the EXACT quest/data/sequence identity survived.
- Ambient-kill injection: impossible — credit requires the exact spawned uniqueIds inside the private area; ambient same-class kills elsewhere never count.
- Helper without quest: cannot advance own state; rewards/sequences resolve to the bound owner only (`findQuestOwner`).
- Mount mid-fight entry: re-checked after the pre-movie; mounted entrants refuse the whole start before publication (no partial roster).
- Party tricks: non-leader starts solo path only; >3 members refused; out-of-radius/out-of-area/busy/dead/under-level members refuse with explicit messages.
- Allocation/spawn failure: `finishFailedStart` despawns, destroys shell, ends director, removes login directors, keeps source event consistent (recovery via `RecoverQuestBattleSource` only after an AfterWarp delegate; this quest uses none).
- Seal-cap at completion: `GrantGCQuestSealsOnce` false → no completion, no warp, fully retryable.
- Full inventory: N/A (no item grants).
- Re-entry: `DisableReentry`; each retry allocates a fresh `gc_sqb_com0g6_<id>` shell; `HasLiveContentArea` blocks double-open.

## Tests (VERIFIED: suite run this session)

- `tools/gc-campaign-runtime-tests` (MoonSharp harness over the real `com/com0g6.lua` + placements + battles): **PASS, 53 assertions** (`dotnet run`, exit 0).
- g6-specific: battle contract (questId 111606, SEQ 20, 3 targets, `processEventNq`/`COM0G510`); explicit Stillglade entry warp; Lewin `{0,0}` → SEQ 20; Cid `{3}` first-meeting completion (tests.lua:64,160-168).
- Shared-matrix coverage reused for this route: ineligible-offer block, stale-yield guard, floor separation, ordered/paired handling (sibling routes), pay-once retries.

## Open gaps

- Live 1.0 client playthrough pending (native `processEventStart`/`processEventLewin`/`processEventNq`/`processEventClear` widget lifecycle, `COM0G510` movie framing, Stillglade private-room visuals, completed-marker clearing). Offer stays commented out until that recording exists.
- Diremite count/variants/formation are authored from the native cast; retail-correct only after retail footage review.
- Private-room Y (6.248) and landing transforms are layout-derived, not captured; confirm standing height in-game.
- Journal text ids 339-342 and marker ids 11160501-05 are client-owned display data; server returns them verbatim (no server text table to verify against).
