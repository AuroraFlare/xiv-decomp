# Court in the Sands Coliseum Fight/Cutscene Assessment - 2026-06-30

## Verdict

Court in the Sands can be decompiled further and the post-fight cutscene itself is known. What is still missing is a recovered or live Court-specific fight director that proves the retail kill-to-cutscene lane.

The safe implementation rule is:

1. Do not call `delegateEvent(..., "processEvent035")` from a naked battle/kill callback.
2. First establish a live event owner, preferably an owned quest director using `kickEventContinue(player, director, "noticeEvent", "noticeEvent")`.
3. Then call `delegateEvent(player, quest, "processEvent035")` while that owner tuple is active.

Without that owner bridge, the post-fight push trigger remains the safer route.

## Proven Court Data

- Quest: `Court in the Sands`, quest id `110010`, script `Data/scripts/quests/man/man0u1.lua`.
- Current live fight placeholder is in `SEQ_015` and still skips the coliseum fight:
  - `COL_TRIG = 1090141`
  - `GLD_TRIG = 1090283`
  - `GLD2_TRIG = 1090077`
  - `Data/scripts/quests/man/man0u1.lua` calls `delegateEvent(..., "processEvent035")` from the `COL_TRIG` push path when `subseqGLD == 1`.
- Recovered post-fight scene method:

```lua
function Man0u1.processEvent035(A0_115, A1_116, A2_117)
  A0_115:startFadeOutCutSceneDefault(A1_116)
  A0_115:startNQCutScene("man0u135", 1)
  A0_115:startFadeInCutSceneAfterWarp(A1_116)
end
```

- Recovered scene key: `man0u135`.
- Cutscene classification: direct `startNQCutScene`, after-warp fade-in.
- Recovered instance prompt: `processEvent1000_5` returns `ask(worldMaster, 34112, 2)`, where joined text identifies `34112` as `Enter this instance?`.

## Missing Court-Specific Data

- No live `QuestDirectorMan0u101.lua` or `QuestDirectorMan0u102.lua` implementation.
- Recovered `QuestDirectorMan0u101` and `QuestDirectorMan0u102` are empty subclasses of `QuestDirectorBaseClass`.
- No recovered Court-specific `onKillBNpc` or success callback.
- No live `TOURNEY_GLADIATOR` constant in `man0u1.lua`.
- Actor/display data exists for `2280157`, `tourney gladiator`, but no live Court spawn row was found.
- No live post-coliseum trigger symbol such as `COLISEUM_POST_TRIG`.
- No proven retail event owner tuple for launching `processEvent035` immediately after the fight.

## Event Owner Evidence

Lua `callClientFunction` uses `player:RunEventFunction(...)`, which sends the function through the player's current event tuple. It does not choose a safe owner by itself.

Known safe patterns first open an event:

- `kickEventContinue(player, director, "noticeEvent", "noticeEvent")`
- wait for the matching `EventStart`
- then call `delegateEvent(player, quest, "processEvent035")`

The closest live comparator is `Data/scripts/directors/Quest/QuestDirectorMan0u001.lua`, where the kill callback first kicks a director `noticeEvent`, then delegates into the quest cutscene function. The Totorak server-side fight path also uses a bound director/event lane rather than a naked quest delegate.

## Recommended Implementation Lane

1. Keep Court as a quest/private-area fight, not a guildleve.
2. Use the existing `processEvent1000_5` entry prompt if entering the arena from the trigger.
3. Spawn or materialize the fight target using actor `2280157` (`tourney gladiator`) with explicit display/job/mob data so fallback resolution is not ambiguous.
4. Add a Court fight controller/director that owns the player's fight lifecycle.
5. On kill, pause long enough for cleanup safety, then open a director-owned `noticeEvent`.
6. From that active event, delegate to `Man0u1.processEvent035`.
7. Only after successful event/cutscene progression should `CNTR_SEQ15_GLD` advance to the post-coliseum value and rewards/progression unlock.

## Probe Checklist

- Outgoing `KickEvent` owner id, event name, and event type.
- Matching `EventStart` owner/name/type.
- `RunEventFunction` owner/name/type used for `delegateEvent`.
- `EventUpdate` return tuple for `processEvent035`.
- Quest counters before fight, after kill, after cutscene, and after warp.
- Whether the dynamically spawned `tourney gladiator` uses the intended class path/job/type.
- Whether reward/quest progression stays locked if the kill happens but the cutscene lane fails.
- Whether cleanup removes the fight target and closes the director without stranding the player in the private area.

