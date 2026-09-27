# 110018 Of Men They Sing — `Man402`

- Main scenario | Level 42 | Prereq 110017 Lord Errant (`Man308`); gates 110019
  Futures Perfect (`Man406`)
- Offer: Tataru 1001046, Ul'dah Merchant Ward (walkthrough: Ul'dah Market
  Wards 4,4). Solo escort + 2-Bloodhound fight in a zone-151 private area.
- Quest scripts: `man/man402.lua` + director `Quest/QuestDirectorMan40201` +
  content `SimpleContentMan40201` + trigger object `QuestObjectMan402` +
  escort route `Data/escortnavmesh/of_men_they_sing.json`
- Status: Implemented. SEQ/event branches, escort, fight, recovery, and reward
  verified against the bodies below; retail search-marker offset and unrecorded
  fight-area heights are the open live-verification items.
- ORIGINAL WORK ONLY: public wikis + repo sources + coordinate guide.
  No client binaries decompiled, disassembled, or copied. Every body cited
  below was opened.

## Public sources (inspected)

- Gamer Escape `Of_Men_They_Sing` (obsolete-quest page): full journal text
  (Path-linkpearl distress call traced to the East Forest; companion already
  en route to Camp Nine Ivies; Ala Mhigan Resistance scout separated while
  fleeing imperial pursuers; find her before the Empire does; scout survives
  severely injured; report back) + walkthrough ("Teleport to Camp Nine Ivies
  ... (The Black Shroud, Camp Nine Ivies) - 47,29. You will enter an instance.
  You must follow your path companion until you reach the NPC you are looking
  for. there are no monsters along the way so just make sure to not get to far
  away from your companion or you will leave the instance. When you arrive at
  the NPC you will have to fight 2 Bloodhound. They will not be a challenge.
  ... Report back to Tataru for your reward.").
- Full quest-list mirrors confirm id 110018 / `Man402` / lv 42 / prereq
  Lord Errant / next Futures Perfect.
- No quest-specific YouTube walkthrough with usable spawn text found (1.0
  cutscene compilations list the quest only as a chapter title). Wiki journal
  + walkthrough text are the public mechanic sources.

## Objectives / phases (VERIFIED: man402.lua + wiki journal)

- SEQ_ACCEPT: Tataru offer, `pES` start cutscene (SNPC arg list + replay
  sexuality skin). Accept -> `onStart` clears flags 0-1, SEQ_000.
- SEQ_000: travel to Camp Nine Ivies; push trigger 1090190. Push plays the
  camp `pE10` scene (SNPC delegate arg list + route flag 1, ordinary fade),
  then creates `SimpleContentMan40201` and starts SEQ_005 on transfer.
- SEQ_005: solo private-area escort. The player's own Path companion (dynamic
  SNPC class id + nickname) leads from the camp entry to the injured scout;
  reaching her sets flag 0 (`MAN402_FLAG_ESCORT_COMPLETE`) and starts the
  Bloodhound fight. Journal exposes the flag as its progress value.
- SEQ_015: fight won (`pE20` SNPC scene) -> warped to the public return;
  market entrance -> Waking Sands -> Tataru `pE30` + reward window (39000
  EXP) -> `completeQuest` -> Waking Sands return warp.
- SEQ_020: legacy recovery sequence only. Nothing advances INTO it; old saves
  parked there are folded back to SEQ_015 at Tataru without replaying `pE30`.
  Not a live stage; kept so pre-rework journals stay completable.

## Actors / markers / spawns (VERIFIED: SQL + CSV + map tool)

- Tataru 1001046 (offer + reward). Camp trigger 1090190
  `man402_nine_ivies_trigger` / eventspawn 3075 / zone 151
  `(1690.881, 20.171, -857.553, rot 2.539)` — equals the content entry.
- Markers (`quest_marker.csv` rows inspected):
  - 11001801 offer Tataru (-199.56,-162.35, Waking Sands interior).
  - 11001802 Nine Ivies (1700.49,-868.11, zone 151) ~15u from the trigger.
  - 11001803 Waking Sands entry (-235,51).
  - 11001804 reward Tataru (same point as 11001801).
  - 11001805 scout search (1917.46,-1627.58, zone 151) — the RETAIL search
    area, ~85u NW of the authored fight clearing (see Open gaps).
  - 11001806-10 are filler `i11000101` rows, unused by the script.
- Zone 151 East Shroud, native page 2100 (scale 1, base 3104/3808):
  - Entry (1690,-857) -> map (47.94, 29.51), square (47,29) — matches the
    wiki walkthrough's "Camp Nine Ivies 47,29" exactly. 44 recorded movement
    points within 30u; nearest `!pos 151 1684.648 20.230 -862.413` (7.6u).
    Entry Y 20.171 is grounded. Safe return (1712,20,-862) sits in the same
    recorded camp bowl, outside the 5u trigger circle.
  - Fight clearing (1984,-1680)/(1987,-1713) -> map (50.88, 21.28): ZERO
    recorded points within 30u; nearest node ~210u away. Scout/bloodhound/
    ally Y values are authored, not recorded (see Open gaps).
  - Retail search marker (1917,-1627) -> map (50.21, 21.81): also ZERO
    recorded points (nearest ~199u). No recorded basis to prefer either
    clearing; live capture decides.
- Roster (private area only; no public spawn rows):
  - 1x Path companion escort (`man402_path_companion_escort`, dynamic SNPC
    class, Lv 42, ally-flagged, level badge hidden, leash map marker shown).
  - 1x Resistance scout (`man402_resistance_scout`, class 2290016 /
    appearance 1001239, `(1984.491, 31.996, -1680.115, rot -0.302)`).
    Retail scout is female ("find her"); server display name is neutral.
  - 1x Path companion combat ally (`man402_path_companion_ally`, Lv 42,
    4200 HP / 1400 MP, PathCompanionAI, claim-party joined) at
    `(1982.600, 31.996, -1683.000, rot -0.300)`.
  - 2x Bloodhound (actor 2201417 / mob type 32715 `bloodhound` lv 42/42,
    3200 HP scripted) at `(1987.319, 32.733, -1713.693)` and
    `(1989.393, 32.656, -1714.478)`, rot -0.339. Mob row inspected in
    `server_battlenpc_mob_types.sql`.
- Boundary square (1650,-1750)-(2025,-820) contains the entry, the full
  escort route, and the fight clearing.

## Triggers

- `onPush` 1090190 at SEQ_000: combat-class guard first (Lua preflight +
  C# `IsPlayerEligible` at transfer), then camp `pE10` + content create +
  director start + SEQ_005 + entry-return override (safe camp anchor, never
  the live trigger position, so login recovery cannot retrigger the push).
- `onPush` 1090190 at SEQ_005: same entry with the cutscene skipped — the
  public recovery path when the dynamic copy expired or the player left.
  The escort-complete flag is preserved, so recovery resumes at the
  escort/fight boundary, not from the camp scene.
- `onPush` 1090265 market entrance at SEQ_015/020: Waking Sands zone change.
  At any other sequence the push ends silently (no content, no warp).
- Trigger pushes at SEQ_015+ (post-fight) end silently: completed players
  cannot re-enter the battlefield.
- `onTalk` Tataru: SEQ_ACCEPT runs `pES` accept/decline; SEQ_015/020 run the
  flag-1-gated `pE30` + 39000-EXP reward window + `completeQuest` + Waking
  Sands return warp. All other talk/push contacts end the event with no
  state change.

## Dialogue flow (VERIFIED: man402.lua + scenario_decomp_helpers.lua bodies)

- `pES`: offer cutscene, `getMan402StartCutsceneArgList` (SNPC tuple +
  replay sexuality skin). Accept -> quest taken; decline -> no state change.
- `pE10`: camp scene, `getMan402P10DelegateArgList(player, 1)` — recovered
  wrapper appends the route flag to the companion tuple, ordinary fade.
  GM/recovery entries skip it (duty envelope is the only presentation).
- `pE20`: post-fight SNPC scene at completion, before the public warp.
- `pE30`: reward scene at Tataru, played once (flag 1); legacy SEQ_020 saves
  skip straight to the reward window.
- No parley, no linkshell puzzles, no item objectives. Retail beat is
  follow -> fight -> report, and the script matches it exactly.

## Fight tuning (VERIFIED: QuestDirectorMan40201.lua + mob SQL)

- Single phase, no adds, no enrage: retail "They will not be a challenge"
  fixes this — 2x Lv-42 Bloodhounds at 3200 HP each vs player + Lv-42
  companion ally is the complete encounter. No retail phase/add data was
  recovered because retail has none; do not invent waves.
- Bloodhound AI: DPS, aggro enabled (0x11), DetectionRange 42, SpawnLeash
  80, LinkRadius 45, no roam, AttackRange 4. Spawned ~33u from the route
  endpoint, inside detection range: they engage on arrival. Leash 80 keeps
  the fight in the clearing; kiting past it leashes/resets per engine rule.
- No monsters exist during the escort (route has no encounters) — matches
  wiki "there are no monsters along the way".
- Completion: authoritative 1s poll counts exact uniqueIds
  (`man402_bloodhound_1/2`) dead-or-despawned; `onKillBNpc` is intentionally
  a no-op exactly like `Man308` (legacy callback lacks the runtime unique
  id). Both dead -> `noticeEvent/battleWon` with an 8s direct-fallback, then
  SEQ_015 + `pE20` + cleanup + public warp (1870.35, 19.69, -1731.40).
- 30-minute duty timeout (shared MSQ default, same as Man308), then fail.

## Escort rules (VERIFIED: of_men_they_sing.json + director bodies)

- 50 waypoints, camp entry (1694.42, 20.00, -861.23) -> scout clearing
  (1984.49, 32.00, -1680.12). Speed 7.0, arrival 2.0u, 2s start delay.
- Owner leash 30u / fail 40u + 6s grace, leash map marker (40u, caution
  32u) — the server form of retail "don't get too far or you will leave
  the instance". Route fail/deleted -> battlefield fail -> SEQ_005 retry.
- Owner recall 4u / resume 10u / combat-hold 24u; escort holds actors on
  completion, then the director swaps the escort actor for the combat ally
  + scout + hounds. `canCallBackChocobo=false`, escort ally NOT in party
  during the walk (joins the claim party only for the fight).
- Route/ally/companion Y past the camp bowl is authored along the same
  unrecorded corridor as the fight clearing (see Open gaps).

## Chocobo disabled (VERIFIED: engine bodies, no Lua needed)

- No `Man*` quest carries Lua mount code (repo-wide check); the engine owns
  the policy and Man402 inherits all of it:
  - `DoZoneChangeContentAsync` (WorldManager.cs) calls
    `EnforceMountRestrictionForArea(contentArea)` — mounted entrants are
    force-dismounted during the transfer.
  - `SetMountState` / `PrepareChocoboMount` (Player.cs) refuse any
    mount/summon when `CanMountInCurrentArea()` is false, and
    `IsMountRestrictedArea` is true for every private area.
- Mount exclusion is the complete policy: 1.0 has no combat companion, and
  the escort route sets `canCallBackChocobo=false`. Do not add a Lua
  mounted-entry refusal: it would diverge from every sibling Man quest while
  the engine already force-dismounts.

## Wipes / resets / edge cases (VERIFIED: director + content bodies)

- Player death (any phase), companion-ally death in combat, escort
  lost/failed, leaving the battlefield (>120 ticks), landing timeout
  (>120 ticks), combat-spawn failure, 30-min timeout, quest missing/
  abandoned, player missing (>120 ticks) -> fail -> actors despawned,
  flag 0 cleared, SEQ_005, safe camp warp (1712,20,-862), director ended.
- Disconnect: C# swaps the session object; the 1s poll detects it via
  `IsSamePlayerSession`, stops the route, and on re-land respawns from
  the persisted flag boundary (escort restart at entry incl. reposition,
  or straight to combat). Relog to public re-enters via the SEQ_005
  trigger push. Owner-only: content is single-player, rebind is by
  character id.
- Abandon inside: next poll tick sees quest nil -> fail + warp out.
  Abandon/reaccept race: worst case the stale director (~1 tick lifetime)
  parks the fresh journal at SEQ_005 with flag cleared, which is itself a
  valid trigger-retry state — fails closed, never dead-ends.
- `SimpleContentMan40201.onPlayerLeft` keeps SEQ_005 + saves at the
  escort/fight boundary for reconnect; completion/fail paths call
  `ContentFinished` and end the director exactly once (completed/failed
  guards).
- Solo-only as retail: `CreateContentArea(player, ...)` takes only the
  owner (unlike Man308/Man406 party entrants); each player gets their own
  copy. No party scaling exists because retail has no party here; stats
  are fixed Lv-42 (hounds 3200 HP, ally 4200 HP).

## No-loophole checklist

- [x] Non-combat class cannot enter (Lua guard + C# transfer gate).
- [x] Mounted entry impossible (engine force-dismount) / summon inside
  refused (engine mount restriction on all private areas).
- [x] Party members cannot join or scale the duty (owner-only content).
- [x] Post-fight re-entry impossible (trigger silent at SEQ_015+).
- [x] Escort skip impossible (fight spawns only on route completion or the
  persisted flag; flag set only at the scout).
- [x] Hound kills outside the owned area cannot credit (exact uniqueIds in
  the owned area; legacy callback ignored by design).
- [x] Completion requires both hounds dead + player landed in-battlefield;
  death in the same tick wins over completion (checked first).
- [x] Death/disconnect/timeout/leave/abandon/spawn-failure all retry from
  SEQ_005 with the correct escort/fight boundary.
- [x] Reward scene plays once (flag 1); legacy SEQ_020 saves complete
  without replay; double reward impossible (single completeQuest path).
- [x] Login recovery cannot retrigger the entry push (safe-anchor return
  override outside the 5u trigger circle).
- [x] All talk/push contacts at wrong sequences end silently, no state
  change; nil classId falls through to EndEvent.

## Rewards (VERIFIED: man402.lua body; client-scenario header per prior stub)

- 39000 EXP via `delegateQuestRewardWindow(player, quest, 39000, 1, 1, 2)`.
  No gil/item reward recovered; wiki infobox reward data not captured.
  Next quest 110019 offered on completion per SQL prereq chain.

## Open gaps / conflicts

- Fight-clearing heights UNRECORDED: scout / hounds / combat ally /
  late-route Y (31.9-33.0 corridor near 1984,-1680) has zero recorded
  movement points within 30u (nearest ~210u). Capture with server
  `!quicknavmesh start/sample/stop/save` around the clearing, or verify
  the exact `!pos` points in-game, before calling placements final.
  Authored Y is used as-is at spawn (no engine ground snap on this path).
- Retail search marker 11001805 (1917.46,-1627.58) sits ~85u NW of the
  authored clearing; its area is likewise unrecorded (nearest ~199u), so
  there is currently no recorded basis to move the fight. The companion
  leads the player in retail, so the marker is a search area, not proof of
  the exact scout position — do not relocate on the marker alone.
- Retail timeout length and exact Bloodhound stats/AI were not recovered;
  30 min + 3200 HP + DPS/42/80/45 tuning is authored to the wiki's "will
  not be a challenge" (same MSQ defaults as Man308).
- Reward gil/items (if any) unrecovered; EXP 39000 only.
- Live entry-scene lifetime; escort Y conformity in-game; client
  acceptance of the full chain.
