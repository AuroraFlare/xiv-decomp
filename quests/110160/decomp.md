# 110160 Filling the Quiver — `Arc200` (Archer 20)

- Offer+reward: Nonolato 1000463/1400007 (Quiver's Hold, zone 206, 232.88 / 12.46 / -1268.94).
- Chain: opener; prerequisite 0; required by 110161.
- Script: `Data/scripts/quests/arc/arc200.lua` thin stub + `class_quest_template.lua:Arc200`
  (generic driver route, `offer = true`).

## Sources

- Ranged pack `outputs/class-quest-ranged-decomp-20260927/` (sequences, events,
  markers, actors, fights, rewards CSVs — Arc200 rows).
- DAT quest markers 11016001-04 live; 11016005-20 rejected filler (-431,187).
- Video: `https://www.youtube.com/watch?v=1FwllHbw81Q` (00:00 Filling the Quiver)
  + `https://www.youtube.com/watch?v=hRTsFtZTPp8`.
- Walkthrough: Gamer Escape `Filling_the_Quiver` — Nonolato -> Keelty briefing ->
  Camp Emerald Moss fence cutscene -> instance at (17,16) -> kill 5 Yarzon Invaders.

## Sequence flow

- ACCEPT Nonolato `processEventNonolatoStart` -> 0 retry point -> [1] Keelty
  1000587 @11016001 `processEvent010` briefing -> [2] fence trigger 1000174
  @11016002 `processEvent020` -> battle {11016003} (`preEvent processEvent030`)
  -> [20] Nonolato @11016004 `processEvent040` aftermath -> 30 reward
  (`processEvent050` boundary hook).
- No result gates on any recovered event. Unbound flavor variants
  `005_2..005_8`, `010_2..010_5`, `030_2..030_4`, `040_2..040_4` (no owners).

## Dialogue / cutscene IDs

`processEventNonolatoStart/010/020/030/040/050`. 010/030/040 own after-warp
fades; 030 runs as battle preEvent (Gla306 precedent); 010/040 play as normal
talk callbacks (event lifetime across warp needs live verification).

## Objectives

Brief Keelty; rendezvous at the Emerald Moss fence; defeat 5 Yarzon Invaders in
the Fallgourd duty; report to Nonolato. The Insatiable Ixal flees and is never
an objective (walkthrough + fight rows).

## Instance / territory IDs

- Private content area `quest_sqb` / `SimpleContentQuestBattle`, director
  `Quest/QuestDirectorClassArc200`. Entry zone 152 (Black Shroud), duty site
  marker 11016003 (-1356.24,-2104.54). Party cap 3, 600 s timeout.
- No chocobo actor/callback anywhere; mounted leader or member is refused entry
  with a dismount message (`gc_sqb_quest.lua` collectEntrants + start check).

## Spawn positions (mob-map guide)

- Private encounter: adapter formation offsets around entry (documented
  reconstruction, not the duty layout): (-6,-6),(6,-6),(-6,6),(6,6),(0,9).
  Per `mob_map_coordinates.md`, private/content-owned zones stay JSON-only
  candidates — no public mob SQL; profiles live only in
  `server_battlenpc_mob_types.sql`.
- Public scaffolds (DAT-exact X/Z): Keelty id 3291 zone 206
  (261.38, Y 14.0 catalog floor, -1264.70, scaffold rot); fence trigger id 3292
  zone 152 (-1067.16, Y 20.293 navmesh-exact, -1764.70).

## Mobs (IDs / stats / abilities / AI)

- 2x actor 2205503 / bnpc 3122 + 2x 2205504 / 3123 + 1x 2205505 / 3124, all
  name-verified "yarzon invader" in DAT display text, level 15 (walkthrough).
- Stat shape cloned from `yarzon_bleeder`; curated Yarzon skill list 5063.
  Single wave, all kills required (`requireAllTargets`), standard enmity/leash
  via `ConfigureScriptedOneShotLifecycle`; exact retail jobs/skills unrecovered.

## Triggers

Talk Nonolato (offer) -> talk Keelty -> talk fence trigger -> duty auto-launch
after 030 -> kill-all victory -> talk Nonolato (aftermath + reward).

## Rewards

- Central (`gamedata_quest_rewards.sql`): 20,000 gil + 2,000 Archer marks
  (1000106). Script: 1,760 EXP (post-1.20 level-20 max, Gla200 precedent) +
  Elm Velocity Bow 4070011 x1.
- Inv-full: `grantCheckedItems` verifies `HasItem` after `AddItem`; a failed
  grant holds the reward step for retry instead of losing the bow.

## Sync / lockouts

- No level sync: retail 1.0 class quests have none; server enforces the
  Archer-20 floor on every handler and duty entry, no cap. No lockout beyond
  the 600 s duty timer; failure (death/timeout/disconnect/abandon/area-exit)
  fails to sequence 0 with a visible retry at Nonolato.

## Edge handling (verified in `gc_sqb_runtime.lua`)

Owner resolved by exact quest id + expected sequence 10; party helpers can never
become replacement owners; relog rebinds the same character id; kill credit
reconciles exact spawned uniqueIds (no dup/foreign credit); `StartSequence` +
`Save` + `UpdateENPCs` on every path; `EndEvent` exactly once (queued
transition owns it on success).

## Open gaps

Keelty Y/rotation scaffolds; duty formation offsets; 010/040 after-warp event
lifetime. `validate_arc200_route.py` PASS.
