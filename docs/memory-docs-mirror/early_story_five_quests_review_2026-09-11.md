# Early city story quest review — 2026-09-11

Scope: Golden Sacrifices (110011 / Man1u0), Beckon of the Elementals
(110008 / Man2g0), Whispers in the Wood (110007 / Man1g0), Never the Twain Shall
Meet (110004 / Man2l0), and Legends Adrift (110003 / Man1l0).

## Fixes

- All five quests now verify the completed sequence before paying their
  script-owned EXP and gil. A rejected completion remains retryable and does
  not pay those rewards. Archived reward amounts are unchanged.
- Beckon and Twain preserve the source event through their queued after-warp
  transfers, including re-entry and story exits. Removed premature/trailing
  event closure from these paths; sequence changes precede the final transfer.
- Beckon resolves its battlefield and director before the entry-choice scene
  can arm an after-warp fade. Missing resources leave the initial sequence and
  ward items unchanged. Declining ends the unused director without starting it.
- Twain resolves its battlefield director before playing the entry scene or
  setting the duty-active state. Failed allocation retains the original entry
  stage. Declining the entry prompt closes the event once.
- Legends Adrift releases its opening cutscene fade with a move at the current
  position if `AcceptQuest` declines admission, such as for a full journal.

## Evidence and validation

Inspected recovered scenario Lua and original Lua 5.1 method constants under
`tools/outputs/lpb/decomp_more_20260617/{lua,luac}/quest/scenario/man/`.
After-warp methods explicitly contain `startFadeInCutSceneAfterWarp`.
The apparent `processEvent_007_2` typo is inside an inactive commented block;
the active entry calls the valid `processEvent007_2` method. Reviewed the
recovered journal formulas in `docs/Dat Mining/xtx_quest.csv`; these five entries
select their text using the sequence supplied by the journal request command.
Reviewed battle/escort entry and completion code without altering actor
coordinates, profiles, routes, or combat balance.

Passed:

- `tools/starter-city-tests`: the existing suite plus 30 early-story after-warp
  transfer cases, 8 battlefield-entry success/failure/rejection cases, full
  journal opening recovery, and failed-completion/retry tests for all five.
- `tools/validate_legends_adrift.ps1`: 34 watched/skipped cutscene cases plus
  opening progression and Echo/public inn behavior.
- `tools/validate_starter_city_opening_quests.py`: corrected its stale text
  assertion to require the current two-part tutorial dispatch guard. No
  opening tutorial runtime scripts were changed.
- `tools/validate_quest_availability.py`: the five quests remain enabled and
  labeled Implemented.
- `git diff --check`.

The new runtime tests are in `tools/starter-city-tests/EarlyStoryFlowTests.cs`.
They exercise actual quest callbacks with controlled client/transport doubles;
the world manager owns completion of queued transfers. These checks do not
replace an in-game playthrough or establish visual cutscene fidelity, terrain
collision, or live battle behavior. No SQL was applied and no server was
restarted. Existing package-audit warnings appeared during the successful build.

## Live follow-up: Beckon staging rejected after fade

The September 11 live log at 17:58:03 shows `man1g900` completing, followed by
`[InstanceEntry] Rejected ... class=33 job=33 destination=206/PrivateAreaMasterPast#9`.
The player remained in public Gridania with the client waiting for a warp.
This is Nonolato's staging/recovery event, not A'naidjaa's later dialogue.

The authoritative transfer gate reused the party-lock allowlist, which includes
the recoverable Beckon staging Echo. That incorrectly imposed a combat-class
requirement on a dialogue area. `IsCombatRestrictedStaticInstanceArea` now
excludes this exact destination while retaining its recovery and party policy.
The actual Beckon battlefield, zone 153 / Past #1, remains combat-restricted.

The native MSQ-entry regression failed on class 33 before the production fix.
It exercises the actual WorldManager admission gate for classes 33, 39, and 2,
the staging destination, and all five previously restricted static battlefields.
The starter-city regression also exercises the real Lua class guard at
O-App-Pesi in stages 3 and 4, requiring rejection before any scene or allocation.
The earlier transport doubles did not cover this native class-policy mismatch.
Applying this C# change requires rebuilding and restarting the Map Server;
an in-game retry is still needed to confirm the complete visible transition.
