# 110160 Filling the Quiver — `arc200` (Phase 3 MAGIC)

- Class: ARC 7 | Level: 20 | SQL prereq: 0 | SQL code: `Arc200`
- Availability: **ENABLED** (quest_availability.lua; must NOT be flipped in this pass)
- Lua: `Data/scripts/quests/arc/arc200.lua` (3 lines, class-driver-stub)
- Config: class_quest_template.lua:Arc200

## Evidence status legend
- VERIFIED = SQL row / DAT marker / wiki function list / decomp scenario / validator PASS.
- INFERRED = authored adapter default (offsets, party caps, timers, Y scaffolds, unbound-variant mapping).
- UNRECOVERED = no source; must not be invented (open instance-battle gaps listed at end).

## Sequence flow (VERIFIED: custom validator PASS; DAT markers; wiki §29 event list)
- SEQ_ACCEPT: Nonolato 1000463 `processEventNonolatoStart` (offer; nil/1 accepts).
- [1] Keelty 1000587 @11016001 `processEvent010` (Quiver's Hold briefing).
- [2] fence trigger 1000174 @11016002 `processEvent020` (Camp Emerald Moss, zone 152).
- Battle (QuestDirectorClassArc200, preEvent `processEvent030`, marker 11016003): 5 Yarzon Invaders, single wave — 2205503/3122 x2, 2205504/3123 x2, 2205505/3124 x1, all Lv.15. Require-all-kills. Ixal flees, never a target.
- [20] Nonolato @11016004 `processEvent040`; reward hook `processEvent050` + script EXP 1760.
## Delegate events
`processEventNonolatoStart/010/020/030/040/050` wired; ambient `005_2-005_8/010_2-010_5/030_2-030_4/040_2-040_4` unbound (no owners).
## Actors/markers
Nonolato 1000463/1400007; Keelty 1000587/1100199; trigger 1000174; markers 11016001-04 live, 11016005-20 filler (rejected).
## Mob profiles + spawn evidence (VERIFIED in server_battlenpc_mob_types.sql)
3122/2205503, 3123/2205504, 3124/2205505 (Lv.15, skill list 5063). Private-duty spawns only — no public spawn rows (INFERRED: offsets/party-cap-3/600s are adapter defaults).
## Rewards
EXP 1760 (script sqrwa+AddExp; no central Exp row); gil 20000 + Archer marks 1000106x2000 (central); item 4070011x1 (script).
## Instance-battle surface
Needed: private Fallgourd duty (exists: QuestDirectorClassArc200). Existing: full. No open-world kill surface needed.

## Journal hooks / counters / flags
Custom scripts: see header + flow above. Driver quests: route/battle/postBattleRoute sequences from config; journal text keyed off sequence (client). Scaffold/primal: no live journal route.

## Rewards (SQL reward consistency)
- Gil 1000001 x20000 (src wiki)
- Currency 1000106 x2000 (src dat-old)

## Mob profiles + spawn evidence
- mobType 3122: `(3122, 2205503, 'yarzon_invader_2205503', 5, 0, 1, 0, 0, 10, 0, 4200, 0, 8, 15, 15, 0, 0, 1, 1, 1, 1, 1, 1, 40, 1, 1, 1, 1, 1, 1, 1, 1, 0.75, 0.75, 1, 1, 1, 1, 5063, 0, 0),`
- mobType 3123: `(3123, 2205504, 'yarzon_invader_2205504', 5, 0, 1, 0, 0, 10, 0, 4200, 0, 8, 15, 15, 0, 0, 1, 1, 1, 1, 1, 1, 40, 1, 1, 1, 1, 1, 1, 1, 1, 0.75, 0.75, 1, 1, 1, 1, 5063, 0, 0),`
- mobType 3124: `(3124, 2205505, 'yarzon_invader_2205505', 5, 0, 1, 0, 0, 10, 0, 4200, 0, 8, 15, 15, 0, 0, 1, 1, 1, 1, 1, 1, 40, 1, 1, 1, 1, 1, 1, 1, 1, 0.75, 0.75, 1, 1, 1, 1, 5063, 0, 0);`

## Config block (verbatim source of truth for driver/scaffold behavior)
```lua
    Arc200 = {
        id = 110160,
        title = "Filling the Quiver",
        level = 20,
        classId = 7,
        actor = 1000463,
        offer = true,
        offerActor = 1000463,
        rewardActor = 1000463,
        marker = 11016001,
        rewardMarkers = {11016004},
        -- Post-1.20 level-20 maximum (Gla200 precedent); 20,000 gil and
        -- 2,000 Archer marks stay in the central reward rows.
        exp = 1760,
        items = {{4070011, 1}},
        route = {
            [1] = {actor = 1000587, markers = {11016001}, event = "processEvent010"},
            [2] = {actor = 1000174, markers = {11016002}, event = "processEvent020"},
        },
        battle = {
            code = "arc200",
            directorScript = "Quest/QuestDirectorClassArc200",
            markers = {11016003},
            preEvent = "processEvent030",
            targets = {
                {actorClassId = 2205503, mobTypeId = 3122, uniqueId = "arc200_yarzon_invader_1", displayName = "Yarzon Invader", offsetX = -6.0, offsetZ = -6.0},
                {actorClassId = 2205503, mobTypeId = 3122, uniqueId = "arc200_yarzon_invader_2", displayName = "Yarzon Invader", offsetX = 6.0, offsetZ = -6.0},
                {actorClassId = 2205504, mobTypeId = 3123, uniqueId = "arc200_yarzon_invader_3", displayName = "Yarzon Invader", offsetX = -6.0, offsetZ = 6.0},
                {actorClassId = 2205504, mobTypeId = 3123, uniqueId = "arc200_yarzon_invader_4", displayName = "Yarzon Invader", offsetX = 6.0, offsetZ = 6.0},
                {actorClassId = 2205505, mobTypeId = 3124, uniqueId = "arc200_yarzon_invader_5", displayName = "Yarzon Invader", offsetX = 0.0, offsetZ = 9.0},
            },
        },
        postBattleRoute = {
            -- processEvent040 is the recovered battle aftermath; the final
            -- reward hook stays processEvent050.
            [20] = {actor = 1000463, markers = {11016004}, event = "processEvent040"},
        },
        todo = "Implemented/enabled: Nonolato -> Keelty briefing -> fence rendezvous -> private Fallgourd fight (5 Yarzon Invaders) -> Nonolato report/reward. Single-wave 2/2/1 composition and party cap 3 are documented defaults; the after-warp lifetime of processEvent010/040 still needs live verification.",
    }
```

## Lua header (verbatim)
```lua
require ("quests/class_quest_template")

InitClassQuest("Arc200")
```

## Open gaps (esp. instance-battle needs)
- Live-client acceptance of scenes/fights/positions (adapter offsets, party caps, timers are INFERRED). After-warp lifetimes unverified.