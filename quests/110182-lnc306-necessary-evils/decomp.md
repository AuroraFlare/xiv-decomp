# 110182 Necessary Evils (`lnc306`) — in-depth decomp

- Class: LNC (classId 8) | Level: 36 | Offer+reward: Willelda 1000242 | Prereq SQL: 110181
- Text bank: 463 (`lnc306`). Retail quest Lua: `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/lnc/lnc306.lua` (195 lines, full body read).
- Retail director `QuestDirectorLnc30601`: empty base subclass (no retail kill/failure logic; no caravan-failure rule).
- Walkthroughs: [GamerEscape](https://ffxiv.gamerescape.com/wiki/Necessary_Evils) (11 steps; either first answer, Yes
  second; East Gridania exit south to 34,30; 1 Woodsent Elemental; optional campfire talks; broker Echo Yes),
  [Fandom](https://finalfantasy.fandom.com/wiki/Lancer_Quests_(version_1.0)) (6 journal entries; ~36,000 gil / ~4,720 EXP),
  period footage `YujVm-l0l68` (Part 1), `rVLQ6smILTk` (Ending).

## Sequence / flags

ACCEPT Willelda oath `processEventWilleldaStart` (`showQuestInfomation` gate; no ask) -> seq 1 J'moldva @11018201
`processEvent010` (NQ `lnc30610` afterWarp; good/bad-news briefing, either answer, no gate) -> seq 2 south-road
duty-trigger push 1000174 @11018202 `processEvent020` (NQ `lnc30620` arg 2 afterWarp; retail fires on approach, server on
proximity push) -> seq 10 battle {11018202} -> seq 20 campfire aftermath push @11018202 `processEvent030` (NQ `lnc30630`
afterWarp) -> seq 21 broker @11018203 `processEvent035` (**Echo gate**: ask 51030, `runCharaSchedulerPastAreaIn` on Yes,
requiredResult 1, decline holds) + `processEvent040` (NQ `lnc30640`, same interaction) -> seq 22 J'moldva @11018204
`processEvent050` (NQ `lnc30650`) -> seq 30 reward `processEvent060` (talk rows 61/94/62/95). Fail path -> retry seq 0.

## NPCs / actors

Willelda 1000242/1100014; J'moldva 1000599/1900046; duty/campfire push 1000174 (display 4000257);
Brazen-faced Broker 1000403/4000135 (Echo). Campfire merchants' talks optional flavor (no quest scene function; retail
030_2..030_7). Moogle chase + Garlean spies are Echo story beats, not targets. No chocobo actor.

## Dialogue / cutscene IDs (retail, verified in body)

WilleldaStart (info gate), 010->`lnc30610` afterWarp, 020->`lnc30620` afterWarp, 030->`lnc30630` afterWarp,
035 Echo ask 51030 + past-area-in, 040->`lnc30640`, 050->`lnc30650`, 060 talk 61/94/62/95.
Unbound sub-talks: 005_2..005_8, 010_2/010_3, 030_2..030_7, 040_2..040_10, 050_2. Off-path only.

## Objectives (journal, 6 entries)

Willelda oath (give your life for the wood) -> J'moldva good/bad-news briefing -> find caravan south ->
face enraged elemental (greenwrath) -> moogle chastises aiding outsiders -> Echo the merchants' moogle-capture attempt ->
report J'moldva (keep the secret for the Ul'dahn alliance) -> Willelda reward.

## Instance / territory

Private quest battle, `Quest/QuestDirectorClassLnc306`. Duty site: East Shroud south of Gridania (East exit).
Timeout 600 s, party cap 3, re-entry disabled, boundary r=45.

## Spawn positions (mob guide, zone 151 page 2100)

- Cell (34,30) center: X=346, Z=-758; bounds X[296,396] Z[-708,-808]. **0 recorded ground points in cell**
  (nearest recorded node 2741 is ~590 units away in cell (40,31) — not usable for height).
- Prior DAT reference (394.23,-782.40) falls inside this cell. Y unresolved: private spawn uses owner position;
  no recorded-height fallback is published (fail-closed per guide).
- Single target offset (0,-8) relative to owner. No retail battlefield coords published.

## Mobs / stats / abilities / AI

1x Woodsent Elemental, actor 2205202 (`ElementalStandard`, display 3205202), mob 3133, lv 36, single kill.
(2204605 homonym is the open-world fire block; 2205201 is CNJ306's Spirit of the Wood; 2205201/2205202 are the quest pair.)
Profile: speed 6, hostile, detectionRange 10, combatDelay 4200, job 23 (THM profile), neutral resists.
Skill list 5021 (Elemental: 23152 Aetherial Barrier). AI: server combat core + scripted one-shot lifecycle; retail
elemental scenario class is an empty base subclass (verified `ElementalScenarioLncLv20`). Credit only the exact spawned
actor at seq 10; quest-level `onKillBNpc` inert. No caravan-failure rule evidenced.

## Triggers

Duty-trigger push -> entry. Campfire aftermath push (same marker). Echo gate at broker (decline holds step).
Markers: live 11018201-05; 11018206-20 filler (rejected).

## Rewards

Central SQL: gil 1000001x36000, LNC marks 1000107x3600. Script: EXP 4720 (archived 1.0 value; post-1.20 max 6,231
documented, not granted). No item.

## Sync / lockouts / edge handling

Class LNC + true-level >= 36 gates; Echo decline-hold (requiredResult 1); mount/chocobo entry block; death/timeout/DC/
abandon/area-exit/entry-failed/quest-changed -> seq 0 retry with despawn + party return + content destroy; no overlevel
sync (fixed lv-36 mob); no dup credit; inv-full N/A (no item grant). Allowlisted: `quest_availability.lua` L156.

## Implementation mapping

`Data/scripts/quests/lnc/lnc306.lua` -> `class_quest_template.lua` Lnc306 (L1872-1924) ->
`directors/Quest/QuestDirectorClassLnc306.lua` + `gc_sqb_runtime.lua` via `private_quest_battle.lua`.

## Open gaps

No caravan-failure rule evidenced; duty-cell ground unrecorded (Y from owner position); after-warp lifetimes as talk
callbacks pending live verification; sub-talk owners unbound (off-path).
