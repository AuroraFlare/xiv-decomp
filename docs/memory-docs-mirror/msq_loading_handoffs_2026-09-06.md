# Main scenario cutscene loading handoffs

The Legends Adrift loading report prompted a review of six other quests.
Their client fade contracts were checked against the raw Lua 5.1 chunks in
`tools/outputs/lpb/decomp_more_20260617/luac/quest/scenario/man`.

An after-warp finalizer calls the player's native `_fadeInAfterWarp`. The event
must remain owned until its paired move or transfer. `DoZoneChange` schedules
work through `RunExclusiveZoneOperation`; returning from that call does not mean
the transfer has executed. Quest Lua must return without calling `EndEvent`
after queuing it. Synchronous same-area moves instead precede `EndEvent`.

| Quest | Repair |
| --- | --- |
| Whispers in the Wood / 110007 | Removed ten early event closures before Echo entry, re-entry, and exit warps. |
| Golden Sacrifices / 110011 | Kept acceptance and queued Echo transfers owned; a rejected quest acceptance releases its fade with a same-position move. |
| Calamity Cometh / 110012 | Removed event closure after queued battlefield, hospital, and crypt transfers. Chocobo Lender entry now resolves the battlefield/director before playing `processEvent005`, then advances the quest and transfers. |
| Fade to White / 110013 | Moved the Path-joining position warp before event closure. Market entry retains the `pE00` event. Companion-naming content is allocated before `pE050`; its caller returns without closing the transfer's event. |
| Together We Stand / 110014 | Minfilia's `processEvent001` and entry `pE13` transfer only on result `1`, matching their bytecode fade branch. Entry validates the destination before the scene. Tataru's final `processEvent040` now has a matching position warp. |
| Toll of the Warden / 110015 | Minfilia's opening `processEvent000` now has a matching position warp. Battlefield/director allocation happens before `pE30` arms loading. |

The two missing-warp repairs preserve the player's pre-scene coordinates and
rotation. This supplies the required warp completion without guessing a new
retail destination. Together We Stand refreshes completed quest phasing before
closing the reward event. Ordinary dialogue/default-fade scenes retain their
normal event closure. Recovery paths that omit a movie do not synthesize an
after-warp fade.

## Validation

`tools/validate_msq_loading_handoffs.ps1` runs the real quest scripts and scenario
helpers under MoonSharp against a simulated event/warp lifecycle. Its fade
inventory comes from raw client bytecode, since the source decompiler duplicates
calls in conditional methods. The area-transfer mock deliberately defers
execution until after quest Lua returns.

- 68 cases pass: entries, re-entries, exits, same-area moves, missing-destination
  and missing-director failures, declined choices, a full journal, recovery,
  rewards, and ordinary dialogue.
- The `-UseHeadScripts` option runs these cases against committed runtime scripts
  for comparison; the pre-fix scripts fail across all six quests.
- The existing Legends Adrift checks, Together We Stand and Toll of the Warden
  validators, and the shared Man304/308/402/406 cutscene-order validator pass.
- `git diff --check` passes.

These checks establish server-script ordering and progression, not native client
rendering. In-game verification should watch and skip the affected scenes,
decline both Together We Stand choices, and retry after reconnecting. No server
binary rebuild is required; quest scripts are loaded from disk for new events.
