# 111418 Saving the Stead Instead — `Gcl302` (Maelstrom GC Sidequest, Lv 25, private squad battle)

- Quest: 111418 | Code: Gcl302 | Patch 1.19 | Type: Combat / Grand Company Sidequest
- Issuer: Hasthwab (actor 1001064), the Astalicia, Limsa Lominsa Lower Decks (4,7), zone 230
- Prereq: SQL `gamedata_quests` row gates on 111417 The Cove, Lv 25; chain 111417 → 111418 → 111419
  (wiki lists "Till Sea Swallows All → Stead → Cove"; the server chain follows the SQL row)
- Rank: Storm Private Third Class (wiki) | Rewards: 300 Storm Seals + 1,891 EXP, no gil/items
- Implementation: `Data/scripts/quests/gcl/gcl302.lua` → `quests/com/gc_sidequest` (`Gcl302`) +
  `quests/com/gc_sidequest_battles` (`gcl302`) + `directors/Quest/QuestDirectorGcSideGcl302.lua`
  (all bodies read in full; one pirate-placement fix applied this pass — see File map)

## Sources (VERIFIED)

- Walkthrough: Final Fantasy Wiki `Maelstrom Quests (version 1.0)` (fetched 2026-09-27): Hasthwab →
  caves NE of Camp Bloodshore → rendezvous Bloody Executioners → slay all kobolds → return.
  Party note: "Up to two party members may accompany you."
- Patch: official patch 1.19 notes quest table (fetched): `Saving the Stead Instead | Hasthwab |
  Limsa Lominsa Lower Decks (4,7)` — matches computed map square below.
- Dialogue: `docs/Dat Mining/gcl302.csv` rows 2–28, full body read (offer/deny/accept/reminder,
  four pirate intros, victory thanks, three-part reward; JA/EN/DE/FR).
- Journals: `docs/Dat Mining/xtx_journalxtxSea.csv` 268/269/270 (EN extracted verbatim).
- Positions: `server_eventnpc_spawn_locations.sql` rows 382 (Hasthwab), 3281 (battle entry);
  markers `quest_marker.csv` 11183101–04; mob `server_battlenpc_mob_types.sql` row 2321 (40305);
  skills `server_battlenpc_skill_list.sql` list 5037; quest row `gamedata_quests.sql` (111418).
- Coordinates: `tools/mobspawns/map_coordinates.py` (`maps --zone 130/230`, `locate` on all
  three zone-130 markers; zone-130 recording sha256 `240295af…07812e83d2`, 6977 nodes).

## Sequence flow (VERIFIED: gc_sidequest.lua Gcl302 block + journals + walkthrough)

- SEQ ACCEPT Hasthwab `processEventStart(companyFlag)`: Deny (csv row 9) holds unaccepted,
  retryable; Accept (row 10) → SEQ 0, then `processEventStartAfter` briefing (row 11).
- SEQ 0 travel to Bloodshore caves (journal 268, marker 11183101); Hasthwab re-talk replays
  the reminder; entry trigger 1099542 push (≤14 yalms, ≤2.5 Y) launches the private battle.
  Four pirate optionals (any order, no progress effect): Fyrilskyf `processEventFyrilskyf`
  (row 12), Albin `processEventAlbin` (row 13), TGizzoh `processEventTGizzoh` (row 14),
  Denston `processEventDenston` (row 15).
- SEQ 0 private fight (see Instance/Fight). All four kobolds dead → SEQ 10; any failure → 0.
- SEQ 10 Hasthwab `processEventClear` (rows 18–21) + seals/EXP once-checkpoints → complete.
  No evidence items, no accept/cleanup items on this route.

## Actors / markers (VERIFIED: SQL rows + Lua constants + marker CSV)

| Who | Actor class | Zone | Position (X, Y, Z) | Map |
|---|---|---|---|---|
| Hasthwab (offer/reward) | 1001064 | 230 Astalicia | -778.32, 16.35, 383.49 | marker 11183104 → (4,7) ✓ patch notes |
| Battle entry trigger | 1099542 | 130 E. La Noscea | 1578.200, 26.221, -1169.000 | marker 11183101 → (41,18) |
| Pirate party ground | 1001681–84 (private only) | 130 private copy | ≈1569.3, ≈26.6, ≈-1130 | marker 11183102 (1570,-1129) → (40,18) |
| Cave mouth ground | — | 130 | marker (1532,-1120) → (40,18), floor node `!pos 130 1531.060 19.351 -1118.316` |

Journal markers: SEQ ACCEPT/10 → 11183104; SEQ 0 (public) → 11183101; SEQ 0 (private) → journal 269.
Markers 11183105–10 are filler (Ul'dah merchant-strip placeholder, shared text `i11000101`).

## Dialogue / interaction branches (VERIFIED: gcl302.csv + Lua)

- Offer passes `ownCompany` (Maelstrom = 1); csv row 2 vs row 28 are the company/non-company
  openers. Deny holds; accept + briefing advance.
- All four pirate talks are optional flavor; they never gate entry or completion.
- Post-clear pirate thanks (rows 16–17, incl. player-name split) have no wired scene in the
  shared template: victory goes straight to SEQ 10 (OPEN — native success scene unrecovered).
- Reward rows 18–21 play on `processEventClear`; seals grant precedes the scene, EXP on completion.
- Every yielding dialogue re-checks `CanContinueGrandCompanyQuestDialogue` (quest/data/sequence/
  session/area identity), so abandon/re-accept/replace-session mid-scene never writes stale state.

## Instance layout / bounds (VERIFIED: gc_sqb_quest.lua + SimpleContentGrandCompanySquadBattle.lua)

- Private content-area copy of zone 130, name `gc_sqb_gcl302_<ownerId>`; native director class
  `/Director/Quest/SimpleQuestBattle/QuestDirectorGcl30201`.
- Boundary: circle r = 45.0 centered on entry point; `DisableReentry()` — leaving fails the
  fight (retry at SEQ 0). Timeout: 1800 s (`timeoutSeconds`, default 600 when unset).
- Party: owner + up to 2 helpers (max 3); only the leader's quest starts it; Lv 25+,
  combat class/job, alive, unmounted, no open event, within 30-yalm party radius — validated
  pre-launch AND post-movie before the roster publishes.
- No chocobo: five `isMounted` gates (CanStart, leader, members, pre-launch, post-movie);
  no ally/trust/companion spawns in this battle config.

## Mob roster with guide coordinates (VERIFIED: walkthrough + SQL + map tool)

Eastern La Noscea page 300: `world = pixel/1 − (2528,3008)` ⇒ cell (41,18) = world rect
X 1572..1672, Z −1208..−1108 (trigger at map 41.06,18.39). Tool run: 32 recorded nodes in radius,
trigger exactly on recorded node 4180 (`!pos 130 1578.200 26.221 -1169.000`).

| # | Mob | Actor / mob type | Lv | Wave / trigger | Position (private) |
|---|---|---|---|---|---|
| 1–4 | kobold attacker ×4 | 2206603 Gnole-path / 40305 `gc_side_kobold_attacker` | 25 | Wave 1 (only wave), pre-placed compact pack | (1572.20,26.886,-1162.0), (1576.20,26.886,-1159.0), (1580.20,26.628,-1159.0), (1584.20,26.399,-1162.0); floor nodes 4184/4184/4183/4182 |

Single-wave kill-all (`requireAllTargets`); no adds, no enrage. Count/variant/formation are
authored (native count unrecovered); the "kill all kobolds" objective is recovered.

## Pirate party with guide coordinates (VERIFIED: battle config + map tool + fix this pass)

| Pirate | Actor | Private position (exact recorded node) | Warp |
|---|---|---|---|
| Fyrilskyf | 1001681 | 1569.317, 26.860, -1129.741 (node 4191, d=1.01) | `!pos 130 1569.317 26.860 -1129.741` |
| Albin | 1001682 | 1569.695, 26.630, -1126.624 (node 4246, d=2.40) | `!pos 130 1569.695 26.630 -1126.624` |
| T'Gizzoh | 1001683 | 1569.391, 26.676, -1131.639 (node 4247, d=2.71) | `!pos 130 1569.391 26.676 -1131.639` |
| Denston | 1001684 | 1568.903, 26.425, -1125.562 (node 4192, d=3.61) | `!pos 130 1568.903 26.425 -1125.562` |

Non-combat flavor NPCs (talkDefault only); they do not fight, die, or gate completion.
FIX THIS PASS: the shared freeze loop overwrote these absolute homes with the route center
(all four stacked at the trigger); it now preserves absolute actor XYZ (see File map).

## Abilities / aggro / leash (VERIFIED: SQL + runtime)

- Mob 40305: speed 6, hostile, detectType 1, detectRange 10, job 3, Lv 25/25, att 40,
  skillList 5037, spellList 0, dropList 0 (no loot rows, no spell rows).
- Skill list 5037 (eLeMeN Kobold family): Titan's Soul 23184, Titan's Anger 23185,
  Titan's Boon 23187/23398, Firedamp 23396, Titan's Heart 23397. No scripted AoE/telegraph.
- Aggro: standard proximity on content-owned actors. Leash: boundary circle + area-exit
  detection; kill credits only the exact actor class 2206603 allocated to this wave in this
  area — ambient same-class kills and duplicate fan-out callbacks are rejected.

## Rewards (VERIFIED: gc_sidequest.lua + wiki)

- 300 Storm Seals (`GrantGCQuestSealsOnce`, company 1) + 1,891 EXP (`GrantGCQuestExpOnce`);
  wiki shows Storm Seal ×300 + ~1,890 EXP. Both are one-time checkpoints: crash/interrupt
  safe, never double-pay. No gil, no items. Unlocks 111419 per SQL chain.

## Fail / retry / re-entry rules (VERIFIED: gc_sqb_runtime.lua + gc_sqb_quest.lua)

- Death, timeout, disconnect, area exit, entry failure, wave-spawn failure, or quest-changed
  (abandon/re-accept/replace-session) → party returned to public return point, quest stays/
  returns to SEQ 0 (re-push the entry trigger). All-kill → SEQ 10.
- Re-entry forbidden (`DisableReentry`); relog rebinds by owner character id only, never
  adopts a helper; entry/exit transitions are ticketed with source recovery or clean disconnect.
- Level sync: none (no sync in this 1.0 content; Lv 25 mob vs Lv 25 quest; overlevel allowed).
- Repeats: one-time sidequest; EXP/seal checkpoints make interrupted completion idempotent.
- Availability: offer remains commented out in `quest_availability.lua` (line ~337) pending
  live-client acceptance, per the file's 1.19 policy note.

## File map (all bodies read in full)

- `FF14-Memory/Data/scripts/quests/gcl/gcl302.lua` — 2-line stub → `InitGrandCompanySidequest`
- `FF14-Memory/Data/scripts/quests/com/gc_sidequest.lua:21-30,119-140,168-322` — Gcl302 config/flow
- `FF14-Memory/Data/scripts/quests/com/gc_sidequest_battles.lua:69-96,230-254` — battle config
  + freeze loop (**fixed this pass**: absolute actor homes preserved; was: all pirates → route center)
- `FF14-Memory/Data/scripts/quests/com/gc_sidequest_placements.lua:14-16` — route/marker
- `FF14-Memory/Data/scripts/directors/Quest/QuestDirectorGcSideGcl302.lua` — director (7 lines)
- `FF14-Memory/Data/scripts/directors/Quest/gc_sqb_runtime.lua` — lifecycle/deadline/kill credit
- `FF14-Memory/Data/scripts/quests/com/gc_sqb_quest.lua:30,41-42,50-51,170-234,266-273,330-356` —
  launcher/entry/chocobo/boundary/post-movie gates
- `FF14-Memory/Data/scripts/content/SimpleContentGrandCompanySquadBattle.lua` — boundary content
- `FF14-Memory/Data/scripts/quests/com/gc_reward_checkpoint.lua`, `gc_sidequest_items.lua` — rewards
- `FF14-Memory/tools/grand-company-runtime-tests/GcSidequestTests.cs:43` — offer-method coverage
- `FF14-Memory/docs/gc_sidequests_2026-09-19.md` — route contract + staging reference
- `FF14-Memory/Data/quest_npcs/gc_sidequests_20260919.json` — trigger/actor reservations

## Open gaps

- Live-client acceptance of offer/briefing/reward scenes and relative kobold formation
  (formation offsets and numeric tuning are authored, not retail coordinates).
- Native victory scene (csv rows 16–17) unbound: no retail scene binding recovered.
- No per-quest YouTube footage found (searched); walkthrough consensus is wiki + DAT text.
- `python tools/build_gc_sidequests.py check` fails on a pre-existing foreign reserved-ID
  collision (spawn id 3291 `keelty`, Gridania) — unrelated to this quest (uses 3281).
