# Level 30–46 main scenario: bytecode follow-up

Scope: `110015 Man300`, `110016 Man304`, `110017 Man308`, `110018 Man402`,
and `110019 Man406`. This follows the Grand Company bytecode pass and the
existing August MSQ implementation, placement, and cutscene-order work.

## Results

All five quests have active implementations. This pass corrected one companion
argument mismatch in Lord Errant's final scene. It also produced traces for
all 173 scenario event methods and exercised all 162 outgoing comparison
edges in the sampled domain. The 35 method-to-scene associations resolve to
34 installed scene files; their hashes are recorded. These are static
results, not a new live-client playthrough.

| ID | Quest | Event methods | Sampled EQ edges | Referenced scene files |
|---:|---|---:|---:|---:|
| 110015 | Toll of the Warden / Man300 | 54 | 4 | 7 |
| 110016 | Forever Taken / Man304 | 33 | 38 | 4 |
| 110017 | Lord Errant / Man308 | 27 | 78 | 9 |
| 110018 | Of Men They Sing / Man402 | 17 | 2 | 4 |
| 110019 | Futures Perfect / Man406 | 42 | 40 | 10 |

[Evidence pack](../outputs/msq-30-46-bytecode-20260904/README.md) ·
[Builder](../tools/build_msq_30_46_bytecode_decomp.py) ·
[Regression tests](../tools/test_msq_30_46_bytecode_decomp.py)

## Corrected: Lord Errant's final companion ID

Most companion scene wrappers call `getSnpcActorClassID` before starting a
scene. Its bytecode is simply `skin + 1070000`. The server's ordinary
`delegateSnpcEvent` supplies `nickname, skin, personality, coordinate, initialTown`.
Three scene-bearing wrappers do **not** perform that conversion:

| Wrapper | Scene | Server contract |
|---|---|---|
| `Man308.pE90` | `man30900` | **Corrected** to `delegateSnpcCutsceneEvent` |
| `Man402.pES` | `man40200` | Already supplies actor class through `getMan402StartCutsceneArgList` |
| `Man406.pE60` | `man40660` | Already supplies actor class through `getMan406P60CutsceneArgList` |

Before this correction, `Man308.pE90` received the raw skin number. For example,
skin `123` reached the scene as `123`; the corrected dispatcher supplies
actor class `1070123`. The existing converted-argument helper converts once.
Other wrappers keep their ordinary skin input to avoid double conversion.

Bytecode proof: `pE90` moves incoming R4 to the scene argument at PC 7
(`0x24F5`) and calls `startSnpcNQCutScene` at PC 11 (`0x2505`). It never
invokes the conversion helper. The shared scene bridge likewise passes
incoming R4 into `startNQCutScene` at PC 179 (`0xCAD`); it does not convert
that slot from skin to actor class. The conversion helper's ADD is at `0x1195`.

The fix changes only the existing final scene's payload. The after-warp
finalizer, reward and public return retain their order. Live follow-up should
watch/skip `man30900` with a configured companion, confirm its appearance,
and verify the reward and public return.

## Forever Taken: exact scene and return order

The readable decompiler puts fade-in before the scene expression in `return`.
Actual `Man304.pES` bytecode executes:

```text
convert skin to actor class
fade out
derive personality bucket
fade out again
result = startSnpcNQCutScene(man30400, mode 2, tuple, bucket, 5, 10)
fade in
return result
```

Both fade-out calls really exist. The scene runs before fade-in and its result
is saved. Personality IDs 1–9 map to buckets `1,1,2,2,3,3,4,5,1`; unmatched
sampled IDs keep zero. `5,10` are literal payload values, not independently
proven gameplay counts or timing units.

The conclusion's personality rows match all nine server helper entries.
Personalities 7 and 8 use `376/385` and `375/384`, respectively; simple
ascending text-row arithmetic would be wrong.

## Of Men They Sing: two acceptance results and unreachable cleanup

`Man402.pES` calls `showQuestInfomation` once. Numeric result `1` starts
`man40200`; it then fades in and returns the **scene's** saved result. Declining
the first offer says row 250 and returns the offer result without a scene.
The offer and scene results were varied independently. The server correctly
gates `AcceptQuest` on the wrapper's final result.

Both branches RETURN before the trailing `finishCliantTalkTurn` instructions
at PCs 40–41. Those instructions are unreachable through either branch. The
server's explicit `EndEvent` remains necessary: finding a finish constant in
the chunk does not prove that cleanup executes.

`Man402.pE10` converts the skin and appends its extra flag **twice** to
`man40210`. The duplicated arguments are real bytecode. The server currently
supplies numeric `1` for that flag.

## Futures Perfect: scene chains and argument provenance

- `pES` runs `man40600` once. Saved numeric result `1` selects after-warp fade;
  sampled `0` selects ordinary fade. It returns the same saved result.
- `pE30` runs `man40630` with the SNPC NQ API, `man40635` with the SNPC HQ API,
  then `man40645` with the plain NQ API, before its after-warp finalizer.
- `pE50` appends initial town a second time to `man40650`. That duplicate is
  present in the bytecode and should not be removed as redundant.
- `pE60` expects an actor class and derives its own additional sexuality/skin
  selector through the client helper. Its server tuple helper supplies a
  redundant sixth argument which this non-vararg, eight-parameter wrapper
  ignores. Its actor slot is already correct. `Man402.pES` has the same
  extra-input shape.

These observations establish call order and argument provenance. The trace
fixtures do not execute the renderer or establish meanings for opaque payloads.

## Toll of the Warden and Lord Errant: retained boundaries

Toll of the Warden adds six after-warp-capable methods to the four-quest
August inventory: `processEvent000`, `processEvent010`, `pE20`, `pE30`, `pE50`,
and `pE60`. `pE30` uses ordinary fade only for boolean `true`; numeric `1`,
numeric `0`, false and nil use after-warp fade. `pE50` forwards the extra
`10` supplied by the implementation; it does not supply a default if omitted.

Lord Errant's `pE50` really plays HQ **`man40640`** before `man30850`. The
filename crossing quest families is not a typo. `pE80` chains `man30880` and
`man30890`; final `pE90` plays `man30900`. The decompiler's out-of-loop `break`
statements in personality dialogue are not executable Lua. Bytecode traces
verify all nine opening, accepted-response and post-ritual personality rows,
including the intentionally exchanged 7/8 ordering.

## Gameplay and remaining live verification

| Quest | Implemented route | Live checks not replaced by this pass |
|---|---|---|
| Toll of the Warden | Parley or nonlethal private battle; Hedyn return | Both routes, noncombat entry, surrender threshold, interrupted return |
| Forever Taken | Five crystal interactions and private assembly; no fight | Duplicate soil interaction, interrupted handoff, personalities, scene skipping |
| Lord Errant | Private ritual, Parley and Amalj'aa battle | Corrected finale companion, Parley retry, battle/re-entry, scene skipping |
| Of Men They Sing | Companion escort and Bloodhound battle | Escort interruption, offer decline/scene result, recovery and final warp |
| Futures Perfect | Imperial pursuit, centurion withdrawal and cave aftermath | All-disciplines entry, HQ/NQ chain, withdrawal, completion rebase and reward |

The prior route, placement and live-test notes remain the gameplay evidence.
This pass does not change availability, encounters, rewards or return points.

## Reproduction and validation

```powershell
python -B tools/build_msq_30_46_bytecode_decomp.py
python -B tools/test_msq_30_46_bytecode_decomp.py
python -B tools/test_gc_mission_decomp.py
```

The builder accepts `--client-root` and `--output`. It reads recovered chunks,
joins English text and hashes scene files. Client APIs are inert return
fixtures. Its domain includes nil, booleans and numbers 0–10. Personality and
tail flags vary together; other tuple lanes vary individually. All 162
comparison edges were reached, but this is not an exhaustive Cartesian
product of every possible input. Choice and scene results independently use
0/1. Converted-class and sexuality results are explicitly labelled fixtures
in the JSON, not simulated API implementations.

Ten MSQ regression tests and eight GC tests pass. All five quest validators
and the four-quest after-warp ordering validator pass. The new tests cover
conversion ownership, saved returns, unreachable cleanup, scene order,
duplicate payload slots and all six server personality tables.
