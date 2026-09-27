# Local guildleve follow-up and regional/faction regression review

Reviewed 2026-09-07 against the current worktree and the local-leve commits
`f21b7e341` and `90845892a` (baseline `43580e43b`). No regional/faction regression
caused by those changes was found in the checks below. This is bounded server
and Lua evidence, not a claim that every encounter was played in a 1.23b client.

This review added diagnostics/test coverage and documentation only. No gameplay
script, player implementation, allowance setting, live database row, or running
server was changed or deployed by this review.

## Additional findings

### Failed local delivery can block the contact's normal services

`Data/scripts/local_guildleve_npcs.lua:25` sets `handled = true` before collecting
materials or attempting delivery. If a completed commission's reward cannot fit,
or its delivery cannot be saved, `CompletePassiveGuildleve` returns false but the
handler still ends the event and returns true. The camp master/submaster scripts
return immediately on that result, so their normal menus do not open. Retrying
the conversation repeats the same result until the delivery obstruction is
resolved or the commission is abandoned.

The existing `LuaHandoffs` fixture reproduces the underlying result: with a
completed commission and `CompletePassiveGuildleve` forced false, the production
handler still returns true. The NPC scripts' early returns establish the service
impact. Successful delivery and ordinary in-progress commissions do allow the
NPC's services on subsequent visits.

This is a local contact-flow problem, not a regional/faction acceptance, reward,
or encounter problem. It remains unfixed. A correction should allow normal
services after an unsuccessful handoff while retaining the quest, emitting no
completion dialogue, and keeping talk/event start/end calls balanced.

### Pre-existing faction test-command permission mismatch

`Data/scripts/commands/gm/factionleve.lua:8` has `permissions = 0`.
`LuaEngine.RunGMCommand` only rejects a non-GM when that value is positive; the
command's `onTrigger` and `GuildleveDirector.EnableGmBattleTestMode` do not add a
GM check. Consequently, a non-GM can invoke this reward-free test command and
its battlefield movement/start functionality.

The checked-in encounter-framework validator requires `permissions = 1` and
stops at that assertion. The setting was already zero in commit `dd02e4ad2`,
before the local-leve work. It may be a deliberate development convenience;
this review did not alter it or weaken the validator. The command being under a
`gm` directory does not itself restrict access.

## Regional/faction isolation

- **Publisher and encounter code:** No changes from the review baseline through
  the current HEAD to `PopulaceGuildlevePublisher.lua`, the aetheryte scripts,
  the guildleve encounter scripts, or `GuildleveDirector.cs`.
- **Slots:** Local journal marks occupy indices 8–15. Regional/faction operations
  use indices 0–7. New linked-production tests exercise first/last local slots
  with all eight regional slots populated, including pickup, success, failure,
  retry and removal. The actual production database writer is additionally
  tested with both local slots and actual regional/faction IDs populated.
- **Journal actions:** Production Lua is tested with local `120007`, regional
  `10861`, and faction `1001` held together. Retry/abandon actions dispatch to
  the correct family; another family's action codes do not mutate it.
- **Journal packets:** Plain IDs, regional quest IDs, unsigned actor IDs and
  signed actor IDs keep the regional/faction detail/map format. Local details
  keep their recipe/progress format. An ordinary scenario quest remains on its
  original journal path.
- **History:** Local completion records are excluded from regional evaluation,
  consumption and trimming. New database cases verify partial consumption with
  both actual regional and faction IDs, preserving local completion flags.
- **Allowances:** The allowance balance is intentionally shared. Accepting or
  retrying a local leve uses that common balance. The local transaction code
  does not introduce a separate pool or change faction credit rules.

## Verification

| Check | Result | Scope |
|---|---|---|
| Local state/Lua harness | PASS, 124 top-level assertions | Production local state and journal/NPC/crafting Lua, including new mixed-family journal cases; UI and external services are fixtures. |
| Production database harness | PASS, 59 assertions | Disposable MySQL schema; actual transaction, mixed-slot save and history code. No live player state is changed. |
| Faction rule validator | PASS, 6,669 compiled rule assertions, plus offer/menu Lua cases | All 53 faction IDs, fixed difficulty, linking restrictions, acquisition thresholds, credit costs, journal space, ordinary level cap, and parent/child aetheryte menus. |
| Local/fieldcraft integrity | PASS | 152 local commissions / 608 recipe variants; 99 regional fieldcraft leves / 288 placements. |
| Regional chest/reward validator | PASS | 619 level-1+ entries, including all 53 faction red chests and 140 faction reward rows. Includes documented reconstruction fallbacks, not an assertion of exact retail rewards. |
| Encounter framework validator | NOT PASSING | Lua syntax phase passes; stops on the existing faction test-command permission setting. Subsequent phases were not represented as tested by this invocation. |
| Isolated integration build | PASS | 0 errors; 5 existing warnings. No deployment. |

The faction validator now accepts an optional `-ServerBin` so it can inspect a
fresh isolated build instead of silently relying on an older Debug assembly:

```powershell
./tools/validate_faction_leve_rules.ps1 -ServerBin .codex-build/local-guildleve-catalog-audit
```

The previous [catalog audit](local_guildleve_catalog_audit_2026-09-07.md) still
applies: local level-band selection, variant availability, offer rotation and
the full-journal replacement route remain incomplete. Exact missing historical
completion rewards and connected-client edge cases remain separately tracked.
