# Content cutscene lifecycle contract

## Scope

Use this audit for every cutscene that enters, exits, or runs inside private
content, and for every cutscene that must survive a disconnect. Ordinary
same-area NPC dialogue does not automatically need deferred duty binding.

Do not apply one ordering to every duty. Recovered client protocol decides
whether the destination snapshot must already contain its director or content
group. The client may generate a destination `noticeEvent` from that envelope;
its lifecycle is independently significant and must not be merged with a named
cutscene event.

## State layers that must be audited separately

These are related but not interchangeable:

1. **Event ownership**: `currentEventOwner`, event name/type, delegate coroutine,
   and `EventFinish` ordering.
2. **Director ownership**: the player is a director member and the client knows
   the director actor. This can exist without duty membership.
3. **Player_work login director**: `SetLoginDirector` embeds a director reference
   in the player bind. Verify that the destination client contract requires it.
4. **Content-group membership**: `AddMember` and `ReplacePlayerMember` normally
   assign `charaWork.currentContentGroup` immediately, even before
   `StartContentGroup`.
5. **Content-group start**: `StartContentGroup` publishes the duty roster/work
   envelope. Deferring only this call does not defer membership if the player was
   already added normally.
6. **Map/landing readiness**: actor-table construction, client opcode `0x0007`,
   visibility readiness, and the first safe post-landing event dispatch.

Man406 testing proved that these layers must be measured independently. Merely
assigning `charaWork.currentContentGroup` does not clear `Now Loading`. For the
Man406/Man0u102 pattern, publishing that group before the destination
acknowledgement instead leaves the transfer presentation active above the next
movie.

## Cutscene entry patterns

### Same-area/default-fade scene

- Publish the event owner and any referenced actors.
- Delegate the recovered client event.
- Let its default fade-in complete.
- End the event once the delegate returns.

### After-warp scene

- Identify `startFadeInCutSceneAfterWarp` from raw bytecode, not decompiler
  control-flow guesses alone.
- Keep the event alive until the matching `DoZoneChange`,
  `DoZoneChangeContent`, or `DoPlayerMoveInZone` is queued.
- Do not call `EndEvent` in the quest script before that transition.
- Watched and skipped playback use the same delegate return path; a skip is not
  a separate server protocol.

### Destination acknowledgement, then group and named scene (Man406 pattern)

1. Allocate the content area and attach entrants to its director with
   `AddMemberWithoutContentGroup`.
2. Opt reconnect into the same deferred group rule with
   `DeferContentGroupMembershipOnReconnect`.
3. Perform the paired entry warp while any source-side after-warp event is still
   owned.
4. From the destination area's `onZoneIn`, open a director-owned `noticeEvent`.
   Do not play a movie from this event.
5. Inside that active notice, delegate the stock QuestBase
   `questBaseRewardSeting` wrapper. It calls
   `_fadeInNowLoadingForNoticeEventJustInArea`, performs the ordinary fade, and
   waits before returning. Close the notice only after it returns.
6. Once the client is landing-ready, add entrants with
   `AddContentGroupMember`, call `StartContentGroup` once, and open the named
   cutscene through a fresh event.
7. Choose a conditional wrapper's default branch when no warp follows the movie;
   choose its after-warp branch only when the same event owns a real subsequent
   move or zone transition.

Man406 keeps its content group unpublished through `DoZoneChangeContent`, clears
the destination presentation in the `onZoneIn` notice, and later starts
`man40620` under `imperialsWithdraw`. Because no warp follows that movie,
`processEvent020(true)` selects the default fade-in.

Do not delegate PlayerBase native fade methods directly from a director. A live
2026-08-22 trace showed `delegateEvent(player, player, "_fadeInAfterWarp")`
failing in `PlayerBaseClass:_fadeInAfterWarp_cpp()` at
`Functor::GetArguments_`, producing client error `40000`. Player-native fade
operations must be reached through a client Lua wrapper that owns their expected
call frame.

Do not use ordinary event closure as a loading reset. The failed Man406
experiment delegated `startFadeInCutSceneAfterWarp` and assumed the subsequent
`EndEvent` would invoke a balancing `_resetFade`; the movie remained audible
under `Now Loading`. Use the recovered wrapper which explicitly clears the
destination presentation instead.

### Skipping a source scene during recovery

Do not replace a skipped source scene with
`processAfterWarpFadeOutGeneral` merely because the recovered scene would have
ended in `startFadeInCutSceneAfterWarp`. `_fadeInAfterWarp()` creates a loading
owner that is valid only when the same event participates in its real warp
contract. A recovery path that skips the scene must close its source event and
let the hard content transfer own `Now Loading`.

This is distinct from the ordinary watched/skipped movie path: the client movie
skip still returns through the recovered delegate and therefore retains the
scene's genuine after-warp finalizer. The warning applies when server recovery
omits that movie entirely. Synthesizing the finalizer in that case can leave two
loading references; the destination movie releases one and remains audible and
interactive beneath the other.

### Duty envelope required before the scene

Some InstanceRaid/Occupancy and quest launchers use the content/raid director
and group to select their native landing event or UI. Retain the proven
destination envelope and use the recovered duty-specific fade/notice handshake.
Man406's deferred rule is not a global replacement for pre-warp group binding.

## Disconnect/reconnect contract

Test disconnects at all four boundaries:

- before the destination is ready;
- while the opening cutscene is playing;
- after the scene but before gameplay starts;
- during a later mid-duty or completion cutscene.

Login constructs a new `Player` object. Re-entry must replace the stale object
by character ID, restore the director without premature group membership, reset
landing state, run the destination acknowledgement for the replacement, and
then add that replacement to the already-started group. Do not replay an
interrupted named scene from the landing notice; close loading first, then
dispatch the persisted unfinished scene as a fresh event.

Guard each event phase with both a queued flag and an in-progress flag. A
timeout fallback must not launch a second copy while the first delegate is
still waiting. Downstream startup failure must not reset the quest to a trigger
that immediately repeats the same scene.

## Diagnostic fingerprints

| Symptom | First lifecycle checks |
| --- | --- |
| Cutscene audio plays behind `Now Loading` | Scene asset and delegate worked. Check whether destination acknowledgement completed before group/movie publication, then check for an unmatched after-warp fade reference. |
| Login says “You are now bound by duty,” then hides the replay | Verify that the landing notice closes before a fresh named scene starts; the duty message alone does not prove the loading lifecycle completed. |
| Exiting/skipping the hidden scene immediately repeats it | Check queued/in-progress guards, event completion, and whether pursuit/combat startup failed and reset the trigger. |
| Watched playback works but skip stays black | Check an after-warp finalizer whose owning event was ended before its paired move/zone transition. |
| No audio and no visible scene | Check director actor publication, event type/name/arguments, client base class, and landing readiness before changing fade logic. |
| Scene works until reconnect during a later duty scene | Audit per-phase replay state; fixing only the first login cutscene is insufficient. |

## Required evidence before packet-level experiments

- Raw scenario bytecode for fade branch and scene chain.
- Cutscene package actor dictionary and player/party anchors.
- Recovered director/base-class inheritance and event argument shape.
- Server trace from EventStart through EventUpdate/EventFinish, group work,
  actor publication, map packets, and first movement/`0x0007` readiness.
- Watched, skipped, fresh-entry, and reconnect traces.

Do not change E2 mode, `SetMap` delay, or global EventFinish ordering merely
because a scene is hidden. Audio behind `Now Loading` is strong evidence that
the scene launched and a higher-level duty/loading lifecycle still owns the
screen. Audit the duty's destination notice or `onZoneIn` acknowledgement,
director/group state, fade-branch selection, and replay ordering first. Which
notice applies is duty-specific evidence, not a global assumption.

## Review checklist for other missions

- [ ] Classify every scene finalizer as default, conditional, or after-warp.
- [ ] Identify the exact event owner and client director/base class.
- [ ] Search all quest, content-area, director, GM-checkpoint, and reconnect
      hooks for ordinary `AddMember`/`ReplacePlayerMember` calls.
- [ ] Decide whether the content group is required before or after the scene.
- [ ] Confirm director actor publication independently of group membership.
- [ ] Keep destination acknowledgement separate from the named cutscene. An
      `onZoneIn` callback may open the acknowledgement, but must not play the
      movie from it.
- [ ] Confirm every conditional after-warp branch has a real subsequent warp.
- [ ] If recovery omits a source movie entirely, close its event instead of
      synthesizing the movie's after-warp finalizer.
- [ ] Make queued/in-progress/completed phase state reconnect-safe.
- [ ] Test watched and skipped playback on fresh entry.
- [ ] Test disconnect during every cutscene phase and during gameplay.
- [ ] Treat packet-timing changes as a last, trace-backed step.
