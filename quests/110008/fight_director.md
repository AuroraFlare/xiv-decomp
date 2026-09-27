# 110008 fight + director (QuestDirectorMan2g001, SimpleContentMan2g01)

## Entry (quest `doSEQ004CombatInstance`)

guardCombatInstanceEntry (combat class) -> mount gate (no chocobo/goobbue mounted entry) ->
resolve 153/1 area -> SetBoundaryCircle -> end stale director -> CreateDirector ->
optional `processEvent007_2` yes/no (decline = EndDirector, no state change) ->
StartSequence(SEQ_004) -> AddMemberWithoutContentGroup(player) -> pre-spawn 3 allies ->
StartDirector(false) + SetLoginDirector + MarkQuestFightContentZoneChange ->
DoZoneChange to landing -> ReplacePlayerMember + SetLoginDirector again.

## Main loop (1s tick, 30:00 timeout, notice 50026 "30")

1. Rebind player ref every tick (relogin object replacement).
2. Abandon check (entered/armed + GetQuest==nil): cleanup actors, EndDirector, NO warp.
3. Battlefield tracking: fire layers start on first arena entry.
4. Landing-ready: arm fight, StartContentGroup, fight notice.
5. Death check (armed + IsDead): retail KO-warp — cleanup + recovery warp to 206
   outside Quiver's Hold + EndDirector; SEQ_004 retained, re-enter via Nonolato/O-App.
6. Left-battlefield (teleport/Return/walk-out): cleanup + EndDirector, NO warp
   (deliberate exit respected).
7. Spawn: allies (if not yet) -> Spirit (spawn delay 0) -> element index 1 applied.
8. Aggro: IsQuestFightAggroReady + 3s delay -> ForceQuestFightEngageTarget on first
   living ally (else player); allies engage immediately when ally is opener.
9. Assist: +2s delayed ally engage when player is opener.
10. Rotation tick: ally at/below 50% HP or dead withdraws (despawn + claim-party
    remove) and next reinforcement (Farrimond, then Burchard) joins; mob re-engages.
11. Flee: every 180s, 30s flee at speed 4.5, segments <=12u, interior points only,
    then re-engage opener rule.
12. Element: every 30s cycle wind(7/spell 27353) -> earth(8/27355) -> water(10/28957)
    via ConfigureElemenElementalProfile + notice 51006 (property-4). Matches retail
    "The elemental's aspect has changed!".
13. Timeout: cleanup + recovery warp + EndDirector. 14. Win: onKillBNpc (actor
    2105201 only): wait 2 -> processEvent010 -> SEQ_005 -> wards removed -> despawns ->
    ContentFinished -> recovery warp -> EndDirector. Missing-quest kill: same minus SEQ.

## Ward mechanic (retail shape, exact mitigation unrecovered)

O-App Trial001 prompt (mode 1 none-held / mode 2 swap), choice wind/earth/water ->
one ward item at a time, removed onFinish/win/fail. Retail dialogue (Loremonger):
"I have need of you. Take this ward..." / "I am attuning the ward! A moment, pray!" /
"The ward is ready! Bless all with its magic!". Walkthrough: cast matching ward on
each NPC as aspect changes; fight winnable by healing/AoE support while allies DPS.

## Verdicts (evidence, not placeholders)

- Phases/adds: single boss, no summoned adds in retail; ally reinforcements ARE the
  retail "a new one will join" beat. Element cycle + flee are the phase texture.
- Enrage: NO retail enrage found (retail director stub, no timer text, no wiki/
  Loremonger mention). Timeout-fail at 30:00 is the authored enrage equivalent.
- Leash/reset: arena-circle clamp on spirit+allies, boundary circle on area, boundary
  line in content script; no HP reset — leaving/death/timeout ends the attempt and
  re-entry builds a fresh director (stale director explicitly ended on entry).
- Chocobo: no chocobo actor/callback anywhere in beckon code; mounted entry rejected
  with system message (mirrors totorak_entry TotorakIsMounted pattern).
- Party/scaling: solo-only + NPC allies, fixed HP 2930, no scaling — matches retail
  (walkthrough "can be soloed", retail lua single-player flow, no party-entry text).
  No party-entrant collection by design (unlike man300-style duties).
