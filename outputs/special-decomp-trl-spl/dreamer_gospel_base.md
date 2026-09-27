# Shared base: dreamer_gospel_base.lua (The Dreamer's Gospel driver)

- File: `Data/scripts/quests/spl/dreamer_gospel_base.lua` (158 lines, VERIFIED read)
- Role: INFRASTRUCTURE, not a quest. Required by `spl0g1.lua`, `spl0l1.lua`, `spl0u1.lua` via
  `require ("quests/spl/dreamer_gospel_base")` + `InitDreamerGospelQuest({...})` (VERIFIED per file).
- Entry: `InitDreamerGospelQuest(config)` with `{girl, boy, sp1, sp2}` actor-class IDs (VERIFIED).

## Sequences (VERIFIED from source)

| Seq | Name (local) | Meaning |
|---|---|---|
| ACCEPT | offer | Dreamer (`girl`) offers; cross-city guard blocks holding two Gospel variants |
| 0 | SEQ_WARM_EGG | Warm/claim egg via `HatchingEventNpcs.claimEgg(player, npc, 2011)` |
| 1 | SEQ_HELPER_EXPLAINS | Defined but UNREACHABLE: boy talk at seq 0 jumps straight to seq 2 (line 118-120); only seq-1 talk replays `processEvent010` then also jumps to 2. Dead sequence, preserved as-is. |
| 2 | SEQ_TURN_IN | Boy exchanges for Pristine Egg Cap 8012801, then `CompleteQuest` |

## Delegates (recovered client functions, VERIFIED names in source)

- `processEventGirlStart` (accept), `processEvent000_over10` / `processEvent000` (egg gift / no gift),
  `beforeGirl`, `beforeBoy`, `beforeSp1`, `beforeSp2`, `processEvent010` (helper),
  `processEvent020` (success), `processEvent010_2` (payment missing), `isCapMes` (already owns).
- Bodies are client-owned; server only branches on return code (`accepted == 1`) and C# results.

## Actors / markers / counters / journal (VERIFIED)

- ENPC flags: all four actors TALK on ACCEPT/0/1; on seq 2 boy becomes REWARD, rest TALK.
- Markers: none (`return {}`).
- Flags: `FLAG_DREAMER_REMINDER = 0` is READ but never SET anywhere in the file — journal slot 1 is
  always 0 at seq 0. Dead flag, preserved. (VERIFIED by grep: `SetFlag` has zero hits in this file.)
- Journal otherwise returns all zeros.

## Rewards (VERIFIED)

- `TryExchangeSeasonalReward("hatching2011", 8012801)` result codes (C# `SeasonalExchange.Execute`):
  0 success -> `processEvent020` + `attentionMessage(25228, 8012801, 1)` + single `CompleteQuest`.
  4 payment-missing -> `processEvent010_2`. 2 already-owns -> `isCapMes`. Else -> `reportResult`.
- No SQL reward rows exist for 110789/110794/110804 (VERIFIED grep: zero hits in
  `gamedata_quest_rewards.sql`), so engine auto-grant on `CompleteQuest` grants nothing — no double-grant.
- Egg itself comes from `TryClaimHatchingEgg(2011, actorClassId)` (C#), not from quest SQL.

## Hardening verdict (PART 2)

- SEQ_ACCEPT gating: VERIFIED (cross-city `HasQuest` guard at both `onStateChange` and `onTalk`).
- Colon-form calls throughout (`player:AcceptQuest`, `player:CompleteQuest`, `quest:UpdateENPCs`,
  `player:EndEvent`); `callClientFunction` is the global function form (correct).
- Single `CompleteQuest` (line 129), only on exchange result 0. Overkill guards: N/A (no kills).
- `UpdateENPCs` + `EndEvent` paired via `finishEvent` on every path, including the seasonal-disabled
  early return. Abandon/re-accept: no counters used; fresh QuestData is safe.
- No changes made. No chocobos, no kills, no invented mechanics.

## Open gaps (reasons)

- Native dialogue bodies and exact retail journal text are client-owned; only function names are recovered.
- SEQ_HELPER_EXPLAINS (1) unreachable and FLAG_DREAMER_REMINDER never set — retained verbatim;
  do not "fix" without client evidence of a path that uses them.
