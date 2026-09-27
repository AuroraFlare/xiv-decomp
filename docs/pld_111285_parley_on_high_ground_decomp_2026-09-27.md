# Pld0j5 deep decomp: Parley on High Ground (111285, Lv45)

JOB PLD, 2026-09-27. Instance quest (private SQB battle, entry scene +
content-owned aftermath/auto-reward).

## Sources

- `PLD_paladin-job-quest-deep-decomp-2026-09-27.md` (Pld0j5 section)
- `docs/Dat Mining/quest_marker.csv`: 11224401 (313.96, -895.30,
  104/401 Central Thanalan; 02-10 default filler)
- `job_quest_template.lua` Pld0j5 row + `QuestDirectorJobPld0j5.lua`;
  `job_quest_journal.lua` `pld0j5 = {[0] = 0, [5] = 1}`
- GamerEscape `Parley_on_High_Ground` (Obsolete/Patch 1.21
  walkthrough, inspected): speak to Jenlyns at PLD 45; head to
  (29-21) Central Thanalan for a cutscene + instance; fight Jenlyns
  Straightblade (Lv52, high DEF/HP) plus four Sultansworn Elite
  (Lv50); killing ALL enemies auto-completes with rewards; "up to
  seven party members may accompany you (Recommended)"
- Fandom 1.0 journal: parley with Solkzagyl arranged through
  intermediaries; meeting on high ground NE of Ul'dah; could be a trap
- No 1.0 YouTube footage was found (search returned only wiki/patch
  mirrors); mechanics rest on the 1.21 walkthrough + journal above

## Stages and flags

| Seq | Phase | Owner |
| --- | --- | --- |
| 65535 | Offer at Jenlyns (`processEventJENLYNSStart`) | NPC |
| 0/5 | Entry scene `pld0j510` (`processEvent_005NQ_1(true)`, normal-area fade-in) -> private fight | Private SQB |
| 5+win | Aftermath `pld0j520` (`processEvent_015NQ_2`, Default fade) + `processEventClear` auto-reward | Content |
| (done) | No Jenlyns return (`completionOwner = "content"`) | Content |

Retry boundary is sequence 0. No persisted flags/counters.

## Mobs (archive + retail)

- Jenlyns Straightblade 2289035/3064 (job 3, Lv52/52, skill list 15:
  animal instinct/godsbane/jump/wyvern dive per
  `server_battlenpc_skill_list.sql`). Exact profile; retail high
  DEF/HP is represented by the Lv52 boss staging.
- 4x Sultansworn Elite, actor 2289036 (free 22890xx humanoid shell,
  display 3280318) + adapter mob 32765 (job 3 GLA, Lv50/50 per
  retail, skill list 15 same as their captain, speed 6, element 0 —
  full 41-column row cloned from the 3064 Jenlyns row).
- Single simultaneous wave, all five required
  (`requireAllTargets = true`); no phase/add/positioning evidence
  beyond the walkthrough roster. Formation: Jenlyns center, elites
  flanking (offsets +-3.5/+-6.5).

## Instance bounds, fail/reset, sync

- Private area `quest_sqb_pld0j5_<ownerId>`; boundary circle r=45.0
  (launcher default); cap 8 (retail "seven companions"); timeout 600;
  `minimumLevel` 45 gates owner AND every member (no 1.x sync).
- Entry: leader-only; members online, alive, same-area,
  combat-ready; chocobos explicitly refused ("Dismount your chocobo
  before entering the private encounter") — no battle chocobos exist.
- Wipe/owner-death/timeout/area-exit/disconnect/death-during-event:
  runtime `finish` -> retry seq 0, no reward, targets despawned;
  post-movie revalidation converts stale sessions to failure.
- Abandon/reacquire: `boundQuestIsCurrent`/quest-changed fail; owner
  binding only (helpers never inherit). Retrigger: exact
  actor+uniqueId+area kill reconciliation; ambient/foreign kills grant
  no credit. Unplayed success scene fails the phase (no reward leak).

## Rewards

EXP 5340 + Cover 27159 (job 16), granted automatically by
`CompleteJobQuestFromContent` after the aftermath.

## Implementation

Template Pld0j5 `targets` + `QuestDirectorJobPld0j5.lua` roster
extended to the full five-mob retail roster (all
`validate_job_pld0j5_route.py` fragments preserved); mob 32765 in
main SQL + the PLD-B live migration. Note for the shared-row owner:
party evidence is a journal "(Recommended)", not a maximum.
