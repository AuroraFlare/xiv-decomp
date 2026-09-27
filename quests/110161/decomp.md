# 110161 The Foreboding Forest — `Arc300` (Archer 30)

- Offer+reward: Nonolato 1000463/1400007 (Quiver's Hold, zone 206).
- Chain: follows 110160; required by 110162.
- Script: custom `Data/scripts/quests/arc/arc300.lua` (outside the generic
  driver; template keeps metadata only).

## Sources

- Ranged pack `outputs/class-quest-ranged-decomp-20260927/` (Arc300 rows in all
  six CSVs); decompiled client scenario arc300.lua (NonolatoStart, 010, 015,
  020, 025, 025_2, 027, 030, 040, 050).
- DAT quest markers 11016101-08 live; 11016109-20 rejected filler.
- Video: `https://www.youtube.com/watch?v=1FwllHbw81Q` (04:23 Foreboding Forest)
  + `https://www.youtube.com/watch?v=_2wtLRaKOXw`.
- Walkthrough: Gamer Escape `The_Foreboding_Forest` — Keelty briefing -> Owl's
  Nest gate cutscene -> Vairemont delivery -> Keelty x2 -> return via North
  Shroud road ambush vs Bandit Pathfinder + Bandit Scout, 30-minute cap.

## Sequence flow

- ACCEPT Nonolato `processEventNonolatoStart` -> 0 Keelty Hold briefing `010` ->
  5 Owl gate push `015` -> 10 Vairemont delivery `020` -> 15 Keelty Owl `027` ->
  16 Keelty Owl again `030` -> 20 road-ambush push `040` -> 21 internal duty ->
  25 post-fight Keelty report `050` (Yes gate: nil/1 advances, explicit 0 holds)
  -> 30 Nonolato standard-path reward (no recovered completion event).
- Keelty shares class 1000587 across Hold/Owl/post phases: every talk is
  disambiguated by 60-yalm proximity to the expected DAT marker; wrong-phase
  talks play nothing.
- 040 is not result-gated (scene always advances; native duty prompt carries
  decline). 025/025_2 Pascaleret interlude has no recovered owner and stays
  unbound; story rides inside 027/030. No Echo subsystem needed (post-fight
  vision is a cutscene).

## Dialogue / cutscene IDs

`processEventNonolatoStart/010/015/020/027/030/040/050` (+ `sqrwa` EXP
presentation). No chocobo actor/callback anywhere.

## Objectives

Brief Keelty; reach the Owl's Nest gate; deliver papers to Vairemont; confer
with Keelty twice; survive the road ambush; report to Keelty (say Yes); return
to Nonolato.

## Instance / territory IDs

- Private content area `quest_sqb` / `SimpleContentQuestBattle`, director
  `Quest/QuestDirectorClassArc300`. Entry zone 152 (Black Shroud), ambush
  marker 11016106 (-1602.12,-1854.22). Party cap 3, 1800 s timeout (recovered
  30-minute cap). Mounted entrants refused with dismount message.

## Spawn positions (mob-map guide)

- Private encounter: adapter formation offsets around entry (documented rank-30
  defaults): pathfinder (-4,-8), scout (4,-8). Per `mob_map_coordinates.md`,
  private/content-owned zones stay JSON-only candidates — no public mob SQL.
- Public scaffolds (DAT-exact X/Z): 3319 `arc300_owl_gate` zone 145
  (2463.37, Y 182.3 gatehouse floor, 1217.62); 3320 `arc300_vairemont` zone 145
  (2565.75, Y 175.5 navmesh-exact, 1319.58); 3321 `arc300_keelty_owl` zone 145
  (2566.69, Y 175.7 navmesh-exact, 1313.25); 3322 `arc300_ambush_trigger`
  zone 152 (-1602.12, Y UNRESOLVED — 0 recorded pts ≤30 ylm, nearest node 2567
  @63.5 ylm NOT borrowed per guide; needs `!quicknavmesh` capture, -1854.22);
  3323 `arc300_keelty_post`
  zone 152 (-1588.56, Y 31.3 flagged, -1913.51).

## Mobs (IDs / stats / abilities / AI)

- 1x Bandit Pathfinder actor 2280165 / bnpc 32748 + 1x Bandit Scout 2280164 /
  32747 (distinct DAT graphic rows 3280164/3280163), level 30, single wave,
  both must fall (`requireAllTargets`).
- Profiles cloned from the Kraken Deckhand humanoid, skill list 15; exact
  retail jobs/skills unrecovered. Standard enmity/leash via
  `ConfigureScriptedOneShotLifecycle`.

## Triggers

Talk Nonolato (offer) -> talk Keelty (Hold) -> push Owl gate -> talk Vairemont
-> talk Keelty x2 (Owl) -> push ambush trigger (040 + duty launch) -> kill both
-> talk Keelty (Yes -> reward step) -> talk Nonolato (reward).

## Rewards

- Central: 30,000 gil + 3,000 Archer marks (1000106). Script: 3,420 EXP
  (post-1.20 level-30 max) + `sqrwa` presentation. No item reward.
- Dup turn-in safe: reward runs once at sequence 30, then `CompleteQuest`.

## Sync / lockouts

- No level sync (none in retail 1.0 class quests); Archer-30 floor enforced on
  every handler and duty entry. No lockout beyond the 1800 s duty timer;
  failure fails to sequence 20 (ambush trigger) for a visible retry.

## Edge handling (verified in `gc_sqb_runtime.lua` + `arc300.lua`)

Owner by exact id + sequence 21; helpers never adopted; relog rebinds same
character; kill credit reconciles exact spawned uniqueIds; failed duty starts
that own event cleanup are never ended twice; 050 nil result advances (no
softlock); `StartSequence` + `Save` + `UpdateENPCs` on every path.

## Open gaps

Owl-gate / Keelty-post Y scaffolds; formation offsets; party cap default; 040
ask handling; unmapped final scene. `validate_arc300_route.py` PASS.
