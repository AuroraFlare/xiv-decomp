# Together We Stand (Man206) Decomp Addendum - 2026-07-08

This addendum updates `docs/together_we_stand_man206_decomp_2026-07-07.md`
after the later Man206 route/content work and the 2026-07-08 runtime log.

Short version: the old "missing route/spawn/shell" picture is stale. The route
and neutral trigger infrastructure now exists locally. The current error points
at event lifetime instead: Man206 is sending or queuing a `RunEventFunction`
delegate after the player's active event owner/name have already been cleared.

## Runtime Error Read

Observed log:

```text
===Event START===
Could not find actor 0x0 for event started by caller: 0x2
Event Starter:
Params: Param list was null?

===Event START===
Could not find actor 0x1 for event started by caller: 0x2
Event Starter:
Params: Param list was null?

[CourtEventFunction] ... questSeq=15 ... activeOwner=0x00000000 activeEvent= activeType=0x00 function=delegateEvent params=0x1, 0xA0F1ADBE, "questBaseRewardSeting"
[CourtLuaWait] add kind=event ... activeOwner=0x00000000 activeEvent= activeType=0x00
```

The first two blank event starts are probably not the fatal part. In
`PacketProcessor.cs`, the missing-owner debug line prints `triggerActorID` first
and `ownerActorID` second:

```text
Could not find actor 0x{triggerActorID} for event started by caller: 0x{ownerActorID}
```

So the shown pair is:

```text
owner=0x2 trigger=0x0 event=""
owner=0x2 trigger=0x1 event=""
```

That exactly matches the Man206 private-area bootstrap close guard for
`SimpleContentMan20610` / static `PrivateAreaMasterPast` type `1`: owner `0x2`,
trigger `0x0` or `0x1`, blank event name. These are loader/world-master lane
events that should be closed immediately. They are noise unless they are not
being closed or they appear outside the Man206 private/public escort startup
cases.

The smoking gun is the later line:

```text
activeOwner=0x00000000 activeEvent= activeType=0x00 function=delegateEvent ... "questBaseRewardSeting"
```

`global.lua:callClientFunction` calls `player:RunEventFunction(...)` and then
waits on `_WAIT_EVENT`. `Player.RunEventFunction` builds the outgoing
`RunEventFunctionPacket` from `player.currentEventOwner`,
`player.currentEventName`, and `player.currentEventType` exactly as stored.
`Player.EndEventWithType` immediately clears those fields to owner `0`, event
`""`, type `0`.

Therefore a `delegateEvent` with `activeOwner=0` means the server side no
longer has a live client event lane. Lua can add a wait, but there may be no
valid client event to answer it. This is the likely hang/error mechanism.

## What `questBaseRewardSeting` Is

The spelling is real recovered client spelling. In recovered
`questbaseclass_common.lua`, `questBaseRewardSeting` is a QuestBaseClass helper
around now-loading/fade reward setup, not a Man206-specific method name.

Man206's local quest completion path does not directly call
`questBaseRewardSeting`. It calls:

```lua
scenarioHelpers.delegateEvent(player, quest, "processEvent040")
scenarioHelpers.delegateQuestRewardWindow(player, quest, 300, 1, 1, 2) -- sqrwa
player:EndEvent()
completeQuestWithRewards(player, quest, 50000, 60000)
```

`delegateQuestRewardWindow` delegates `sqrwa`. The recovered `sqrwa` path asks
the reward widget and then continues through QuestBaseClass reward/notice logic.
Seeing `questBaseRewardSeting` with a blank active event means a reward/fade
follow-up is being fired after the event lane has already been ended, or from a
direct/staged probe that never had a live EventStart.

For the supplied log, `questSeq=15` originally made the
rendezvous/content-entry route look more likely than the final Tataru reward
turn-in. The fourth pass below refines that: `CourtEventFunction` is
court-specific instrumentation for quest `110010`, so this exact line should be
used as bridge evidence, not as Man206 ownership proof.

## Current Local State

The stale pieces from the 2026-07-07 doc:

- `1090178` now has a public zone 151 spawn:
  `man206_seq015_nineivies_trigger` at
  `1882.422, 34.153, -1018.115`, rotation `1.392`.
- Zone 151 now has a static private-area row for the escort layer:
  `PrivateAreaMasterPast`, type `1`.
- The three route JSON files exist and parse:
  - `Data/escortnavmesh/together_we_stand_inbound.json`
  - `Data/escortnavmesh/together_we_stand_post_cs.json`
  - `Data/escortnavmesh/together_we_stand_return.json`
- The content/director shell files exist:
  - `Data/scripts/content/SimpleContentMan20610.lua`
  - `Data/scripts/directors/Quest/QuestDirectorMan20610.lua`

Route shape from the helper pass:

| Route | Zone | Waypoints | Notes |
| --- | ---: | ---: | --- |
| `together_we_stand_inbound` | 151 | 38 | Nine Ivies trigger toward the first sylph/imperial staging point |
| `together_we_stand_post_cs` | 151 | 521 | Long leg to the moonspore/podling area; has 7 empty encounter stops |
| `together_we_stand_return` | 151 | 473 | Return leg from podling area back toward Flaxio; has 3 empty encounter stops |

The route files currently leave `escortActors` empty, but they set a
`caravanActorClassId`. `EscortRouteDirector.GetEscortActorDefinitions` can
backfill from that, so empty `escortActors` is not itself the blocker.

## Content Shell Notes

`man206.lua` now defines both:

- Static content entry: zone `151`, private area `PrivateAreaMasterPast`, type
  `1`, director `Quest/QuestDirectorMan20610`.
- Dynamic content entry: `SimpleContentMan20610` / content script `man20610`,
  also with `Quest/QuestDirectorMan20610`.

`SimpleContentMan20610.lua` is intentionally inert right now. Music, boundary,
and sylph actor spawning are commented out while the zone-in shell is being
proved. `onZoneIn` only clears the entry curtain for probe mode
`man206_entry_fade`. If a bare/fade test enters the private area and shows no
escort, that is expected.

`QuestDirectorMan20610.lua` currently drives three legs:

1. Inbound route complete -> `processEvent016` -> `EndEvent` -> post-CS leg.
2. Post-CS route complete -> `pE20` -> apply podling status -> sequence 25 ->
   `EndEvent` -> return leg.
3. Return route complete -> `pE30` -> clear podling status -> sequence 30 ->
   `EndEvent` -> finish content and warp out.

That immediate `EndEvent` after each delegate is the suspicious pattern. The
helper atlases mark several Man206 methods as after-warp/lifetime-sensitive.
Those delegates should not be closed until the recovered method's EventUpdate
return and follow-up behavior have been captured.

## Recovered Scene And Lifetime Matrix

LPB recovered Man206 has eight scene wrappers:

| Method | Scene | Current local use | Risk |
| --- | --- | --- | --- |
| `processEventUdowntownrectStart` | `man20600` | early Ul'dah/private-area start context | after-warp lifetime risk |
| `processEvent001` | `man20601` | early quest cutscene | after-warp lifetime risk |
| `processEvent010` / related | `man20602` | local quest intro/middle | SNPC tuple/default route |
| `pE13` | `man20603` | content entry from seq 15 | branchy, SNPC tuple, after-warp lifetime risk |
| `processEvent016` | `MAN20610` | inbound route completion in experimental director | HQ cutscene/content ownership still unproven |
| `pE20` | `man20620` | podling pickup leg | SNPC tuple/default fade; payload still needs proof |
| `pE30` | `man20630` | return-to-Flaxio leg | SNPC tuple plus after-warp fade/lifetime risk |
| `processEvent040` | `man20640` | Tataru final reward turn-in | after-warp lifetime risk before reward widget |

The helper outputs agree on the main caution:

```text
after_warp_keep_open_until_recovered_method_returns
```

Applies especially to `pE13`, `pE30`, `processEvent001`, `processEvent040`, and
`processEventUdowntownrectStart`.

## Actor, Item, Status, Reward Facts

Known local/DAT actor facts:

- `1001237 -> 2450020 -> Flaxio`
- `1001238 -> 2450021 -> Dokixia`
- `1001517 -> 2450021 -> Dokixia`

The SQL actor-class rows for Flaxio/Dokixia have blank class paths, but the
content actor spawning is currently disabled, so that should not affect the
current bare/fade/private-area shell tests.

Podling state:

- Item `11000091` is `Podling`.
- Status `223993` is `Intact-Podling Toting`.
- Local director constants match those IDs.

Rewards remain unresolved:

- Local script grants `50000` EXP and `60000` gil.
- Raw `quest_new_reward` exposes `60000`.
- Legacy `quest_reward` has a `78000` value on `11001401`.
- The all-normal helper pack still says no normalized reward rows.

Keep reward parity flagged until the reward row semantics are reconciled.

## Marker And Route Alignment

Current local marker sequence:

| Sequence | Local marker |
| ---: | --- |
| `SEQ_000` / `SEQ_005` | `11001401` |
| `SEQ_010` | `11001402` |
| `SEQ_015` | `11001403` |
| `SEQ_020` | `11001404` |
| `SEQ_025` | `11001406` |
| `SEQ_030` | `11001408` |

DAT marker rows also include `11001405` around the moonspore/post-CS area and
`11001407` in Coerthas. The local quest marker table intentionally does not use
every replay/map marker. Route endpoints roughly align with the sequence-20,
moonspore, and Flaxio return marker evidence.

## Helper Evidence Used

This pass used:

- Scenario helper surface: `Data/scripts/scenario_decomp_helpers.lua`
  (`delegateEvent`, `delegateSnpcEvent`, `delegateQuestRewardWindow`, SNPC arg
  helpers, marker/reward helpers).
- Current Man206 script/director/content shell.
- Recovered LPB Lua:
  `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/man/man206.lua`
  and `tools/outputs/lpb/decomp_more_20260617/lua/quest/questbaseclass_common.lua`.
- All-normal quest pack:
  `outputs/all-normal-quest-decomp-20260707`.
- Runtime/probe atlases:
  `outputs/quest-runtime-probe-atlas-20260630`,
  `outputs/quest-runtime-proof-gap-atlas-20260630`,
  `outputs/quest-cutscene-push-matrix-atlas-20260630`,
  `outputs/quest-push-payload-execution-atlas-20260630`,
  `outputs/quest-universal-push-operator-atlas-20260630`.
- DAT mining CSVs under `docs/Dat Mining`.
- Three read-only helper-agent passes:
  - event/reward lifecycle
  - route/content shell
  - data-mining and stale-doc correction

## Safe Probe Ladder

Avoid raw ally probes unless deliberately reproducing a crash. The safe ladder:

```text
!where
!questcomplete man206 nineivies
!where
!questcomplete man206 escortfollow
!escortcall
```

Then later public route legs:

```text
!questcomplete man206 postcsfollow
!questcomplete man206 returnfollow
```

Private-area shell isolation:

```text
!questcomplete man206 bare
!questcomplete man206 fade
!questcomplete man206 direct
```

Use `bare`/`fade` to prove zone entry and loading curtain behavior. Use `direct`
to start static content without the risky `pE13` entry cutscene. Treat
`content` as higher risk because it currently delegates `pE13`, ends the event,
then zones.

Instrumentation-only cutscene/lifetime probes:

```text
!questevent on man206_110014_pE13 180
!questdelegate class:1090161 pE13 @snpc5
!questevent off

!questevent on man206_110014_pE20 180
!questdelegate class:1090161 pE20 @snpc5
!questevent off

!questevent on man206_110014_pE30 180
!questdelegate class:1090161 pE30 @snpc5
!questevent off

!questevent on man206_reward 180
-- natural Tataru reward turn-in, not a direct GM reward call
!questevent off
```

For the final reward path, prefer a natural Tataru `EventStart`. The important
proof is that the active event resolves to Tataru/quest before
`processEvent040`, `sqrwa`, and any QuestBaseClass reward setup function.

Avoid by default:

```text
!questcomplete man206 escortallyraw
!questcomplete man206 inboundallyraw
!questcomplete man206 postcsallyraw
!questcomplete man206 returnallyraw
!questcomplete man206 escortallypartyraw
```

Those raw Ally/BattleNpc path companion probes are known crash repros.

## Next Decomp Work

1. Add/enable logging around every Man206 delegate that can cross a fade, warp,
   or reward widget:
   - active owner/name/type before `RunEventFunction`
   - EventStart owner/name/type
   - EventUpdate return tuple
   - owner/name/type after coroutine resume
   - EndEvent timing
2. Do not close `pE13`, `pE30`, `processEvent040`, `processEvent001`, or
   `processEventUdowntownrectStart` immediately after the delegate until their
   recovered return behavior is proved.
3. Reproduce the user log with `!questevent on ...` enabled and confirm whether
   `questBaseRewardSeting` is emitted after an explicit local `EndEvent`, after
   `DoZoneChange` auto-closes the active event, or from an out-of-band/direct
   probe.
4. Once zone entry and event lifetime are stable, re-enable
   `SimpleContentMan20610` pieces one at a time:
   - music
   - boundary
   - neutral/content actors
   - escort director attach
   - encounter stops
5. Keep Flaxio/Dokixia actor-class blank paths and reward parity as separate
   follow-up issues. They are real gaps, but they do not explain
   `activeOwner=0` on a delegate.

## Current Diagnosis

The two blank startup events are expected Man206 loader events when owner is
`0x2`, trigger is `0x0` or `0x1`, and event name is blank. They should be closed
by the existing guard.

The actionable bug is the no-owner delegate:

```text
activeOwner=0x00000000 activeEvent= function=delegateEvent ... "questBaseRewardSeting"
```

Man206 currently has multiple places that can create that shape: `pE13` content
entry ends the event before/around zoning, the experimental director ends events
immediately after route-completion delegates, and reward setup may continue
through QuestBaseClass after `sqrwa`. The next patch should prove and preserve
the active event lane across those recovered after-warp methods before changing
actor spawning or reward values.

## Second Pass: Recovered Flow Notes

Recovered `Man206` is small enough to reason about by method family. The main
split is not "quest dialogue vs content" but "plain delegate" vs "delegate that
does fade/warp-sensitive work inside QuestBaseClass".

Recovered method groups:

| Method family | Recovered behavior | Local use | Decomp read |
| --- | --- | --- | --- |
| `processEvent000_*`, `processEvent001_2..11`, `processEvent012_2..7`, `processEvent016_1..3`, `processEvent020_2`, `processEvent030_2..8` | client talk-turn text only | normal `onTalk` reminder/dialogue routes | safe to close after return |
| `processEventUdowntownrectStart` | fade out, NQ `man20600`, fade in after warp | office west door in Waking Sands | keep event open through after-warp fade |
| `processEvent001` | fade out, NQ `man20601`, branch chooses after-warp or default fade | Minfilia seq 0, then zone to Waking Sands interior | keep event open until return tuple proves the fade branch |
| `pE12` | SNPC NQ `man20602`, default fade | Gridania trigger seq 10 -> seq 15 | standard SNPC tuple; current local helper shape is plausible |
| `pE13` | SNPC NQ `man20603` with branch on cutscene result, after-warp on accepted branch | Nine Ivies/content entry seq 15 | highest-risk entry path; do not close immediately |
| `processEvent016` | fade out, HQ `MAN20610`, default fade | inbound route completion | no SNPC args, but ownership is unproven because current call is director-driven |
| `pE20` | SNPC NQ `man20620`, default fade | post-CS/podling leg | tuple likely right; owner/event lane still unproven |
| `pE30` | SNPC NQ `man20630`, after-warp fade | return-to-Flaxio leg | do not close immediately; likely warps/fades back toward public route |
| `processEvent040` | NQ `man20640`, after-warp fade | Tataru reward completion | reward widget must run before closing event lane |

`pE13` is the one to treat with the most suspicion. The decompiler renders it
as a branch on `startSnpcNQCutScene("man20603", 2, ...)`, then a fade-in path,
then a returned call. That may be decompiler shape around a stored cutscene
result, but the semantic signal is clear: the result tuple matters. This is not
just "play scene then close"; it decides between after-warp and normal fade.

## SNPC Tuple Status

`scenario_decomp_helpers.delegateSnpcEvent` delegates through
`getSnpcDelegateArgListWithExtras`, which currently expands to:

```text
SNPC nickname
SNPC skin
SNPC personality
SNPC coordinate
initial town
```

Recovered Man206 converts the skin slot through `getSnpcActorClassID` inside
`pE12`, `pE13`, `pE20`, and `pE30`. That means the local helper's standard five
SNPC arguments are structurally aligned with the recovered method signatures.

The remaining unknown is not "what are the five arguments?" It is:

- what EventUpdate tuple comes back from `man20603` branch `2`;
- whether `pE13` should advance/zone only on return value `1`;
- whether `pE30` performs or expects an after-warp transition before server
  sequence 30;
- whether director-driven route callbacks have a live event owner at all.

## Ownership Hazard Map

Current local code has four different event-owner risks:

1. Minfilia seq 0:
   `processEvent001` is delegated, then sequence 5 starts, then
   `DoZoneChange` runs. `DoZoneChange` snapshots whether an event is active and
   closes it after zone packets. This may be okay if the recovered method has
   fully returned first, but it is still an after-warp method and should be
   logged once.
2. Nine Ivies seq 15 content entry:
   `prepareMan206ContentEntry` delegates `pE13` and immediately calls
   `player:EndEvent()`. Static content entry later calls `player:EndEvent()`
   again before `DoZoneChange`. This is the most likely path to wipe the active
   owner before a follow-up delegate/fade is sent.
3. Experimental route director:
   `completeCurrentLeg` calls `processEvent016`, `pE20`, or `pE30` from route
   completion logic. A route completion callback is not obviously a natural
   client `EventStart`. If `currentEventOwner` is already zero when the route
   completes, `RunEventFunction` will send owner `0` even before the explicit
   `EndEvent` lines.
4. Tataru seq 30 reward:
   local `onTalk` calls `processEvent040`, then `sqrwa`, then `EndEvent`, then
   completion rewards, then falls through to the final `EndEvent`. The second
   close is harmless if already empty, but the first close must be after all
   QuestBaseClass reward/fade follow-up has completed.

Before the fourth-pass bridge check, this made the user log look consistent
with route 2 or route 3. The blank startup events are still the loader pair, but
the exact no-owner `questBaseRewardSeting` line is now better treated as
cross-quest/director evidence unless a natural Man206 probe shows
`processEvent016`, `pE20`, `pE30`, `processEvent040`, or `sqrwa` with owner
`0`.

## Route Director Ownership Question

The director currently initializes as `/Director/Quest/QuestDirectorMan20601`,
not `MAN20610`; the file comment correctly notes that `MAN20610` is the HQ
cutscene key for `processEvent016`. That means the content/director owner should
probably be the quest director or content director lane, not the route companion
itself.

The local implementation does not yet prove which owner the client expects for:

- inbound route completion -> `processEvent016`;
- post-CS route completion -> `pE20`;
- return route completion -> `pE30`;
- final content finish/warp back to Camp Nine Ivies.

Until that is proven, route-completion delegates should be considered
instrumentation-only. If the next logs show `activeOwner=0` at route completion,
the fix is not just "remove `EndEvent`"; the route callback may need to open or
preserve a director/event lane before calling `RunEventFunction`.

## Patch Shape After Probe Proof

Do not patch all of this blind. The likely final shape is:

1. `pE13` entry:
   - call `delegateSnpcEvent`;
   - capture the result;
   - only close the event after the recovered method/fade branch is done;
   - only start content if the result matches the retail accept/continue value.
2. Static/dynamic content entry:
   - avoid preemptive `player:EndEvent()` immediately before `DoZoneChange`
     when a just-finished after-warp scene still has pending follow-up;
   - let zone change close only when there is no pending recovered event flow,
     or introduce a Man206-specific "defer close" path.
3. Director route completion:
   - log current owner/name/type before each `processEvent016`, `pE20`, and
     `pE30` delegate;
   - if owner is zero, prove the correct synthetic/director owner before
     enabling mutation;
   - if owner is nonzero, remove immediate close for `pE30` at minimum and let
     the EventUpdate resume decide close timing.
4. Reward:
   - keep Tataru completion natural-event-only until proven;
   - do not call `processEvent040`/`sqrwa` from GM staging without a live
     `EventStart`;
   - log if QuestBaseClass calls `questBaseRewardSeting` after `sqrwa` and keep
     the lane open through that call.

## Minimal Next Probe

The single most useful log bundle is:

```text
!questcomplete man206 nineivies
!questevent on man206_entry_lifetime 180
-- push the 1090178 Nine Ivies trigger naturally
!questevent off
```

Capture these around `pE13`:

- active owner/name/type before delegate;
- exact SNPC tuple values sent;
- EventUpdate result tuple from `man20603`;
- active owner/name/type after Lua resumes;
- whether `DoZoneChange` closes the same event lane;
- whether `questBaseRewardSeting` appears before or after any explicit close.

If that still produces `activeOwner=0`, repeat with the lower-risk direct route:

```text
!questcomplete man206 direct
!questevent on man206_direct_route_lifetime 180
-- let inbound route complete or force only the route-complete callback
!questevent off
```

This separates the two likely failure classes:

- entry cutscene lifetime bug (`pE13` path);
- director route-completion owner bug (`processEvent016`/`pE20`/`pE30` path).

## Third Pass: Story, Route, And Encounter Reconstruction

The mined text rows make the duty shape clearer than the current implementation:
this is a stealth escort/rescue, not a straight combat route.

High-level retail beats:

1. Sylphs enter the Waking Sands and ask for help.
2. Minfilia sends the player and Path companion to investigate.
3. The companion rendezvous occurs in Gridania, then the pair moves to Camp
   Nine Ivies.
4. Escaped sylphs explain that imperial soldiers are closing in on Moonspore
   Grove and that podlings are hidden there.
5. Sylphs use glamour/conjury to distract or blind the soldiers while the player
   and companion retrieve the podling.
6. The podling must be carried back without being damaged.
7. Reinforcements relieve the scouting pair, and Tataru handles the report and
   reward back in the Waking Sands.

That matters for server behavior because the post-`pE20` status is not merely a
flavor buff. `Intact-Podling Toting` is the mission state that should fail or
degrade if the player gets hit too much.

## Scene, Marker, And Sequence Crosswalk

Cut replay rows are exactly eight scenes:

| Replay row | Scene key | Recovered method | Notes |
| ---: | --- | --- | --- |
| `11001401` | `man20600` | `processEventUdowntownrectStart` | office/door cutscene, after-warp fade |
| `11001402` | `man20601` | `processEvent001` | Minfilia start cutscene, branchy fade |
| `11001403` | `man20602` | `pE12` | Gridania companion arrival, SNPC tuple |
| `11001404` | `man20603` | `pE13` | Nine Ivies rendezvous/content entry, SNPC tuple, branchy fade |
| `11001405` | `man20610` / recovered `MAN20610` | `processEvent016` | HQ sylph diversion cutscene |
| `11001406` | `man20620` | `pE20` | podling pickup, SNPC tuple |
| `11001407` | `man20630` | `pE30` | return to Flaxio/sylphs, SNPC tuple, after-warp fade |
| `11001408` | `man20640` | `processEvent040` | Tataru completion, after-warp fade |

The current local marker table is close but skips some retail replay/map rows:

| Local sequence | Local marker | Data interpretation |
| ---: | ---: | --- |
| `0` / `5` | `11001401` | Waking Sands / Path start |
| `10` | `11001402` | Gridania trigger near the aetheryte |
| `15` | `11001403` | Nine Ivies pre-content/rendezvous region |
| `20` | `11001404` | first Moonspore search leg / inbound endpoint |
| `25` | `11001406` | return podling to Flaxio |
| `30` | `11001408` | Waking Sands report/reward |

DAT marker `11001405` sits near the Moonspore/podling pickup area, but the local
script currently does not assign it to a sequence. DAT marker `11001407` is also
present but not used locally. Do not delete those as "unused"; they probably
belong to content-internal route/replay state rather than normal journal state.

## Route Reconstruction

Runtime `QuestDirectorMan20610.configureRouteForPathCompanion` overrides the JSON
route speed to `4.0`, rewrites `CaravanActorClassId` from the player's SNPC skin,
and rewrites `DisplayName` from the player's SNPC nickname. So `2210501` in the
JSON is a fallback placeholder, not the intended retail escort actor.

Current route distances:

| Route | Waypoints | Distance | Approx runtime at speed 4 | Current use |
| --- | ---: | ---: | ---: | --- |
| `together_we_stand_inbound` | 38 | `79.6` | `19.9s` | Nine Ivies trigger to sylph rendezvous / first content beat |
| `together_we_stand_post_cs` | 521 | `1109.8` | `277.5s` | sylph diversion toward Moonspore/podling pickup |
| `together_we_stand_return` | 473 | `1009.3` | `252.3s` | podling return toward Flaxio/Nine Ivies |

Two extra route captures also exist:

| Route | Waypoints | Distance | Current status |
| --- | ---: | ---: | --- |
| `imperial_patrol_1` | 558 | `1189.4` | not referenced by Man206 director |
| `imperial_patrol_2` | 473 | `1009.3` | not referenced by Man206 director |

Those patrol routes match the text's "imperial sentinels" pressure, but no
Man206 script currently starts them. They are candidates for a later stealth
layer, not proof that stealth is active now.

## Encounter Stop Semantics

The current route JSONs have stop breadcrumbs, but all stop `mobs` arrays are
empty. `EscortRouteDirector.TryStartEncounterAtCurrentWaypoint` returns early
when `stop.Mobs` is empty, so these stops do not pause the route or spawn
enemies.

Known stop labels:

| Route | Stop labels |
| --- | --- |
| `together_we_stand_post_cs` | `almxio_talk`, several `enemy_sight`, plus generic `stop5`/`stop7` |
| `together_we_stand_return` | `enemy_sight`, `stop2`, final `stop3` |

This looks like an unfinished capture of retail phases:

- `almxio_talk` likely belongs near the post-`processEvent016` sylph guidance.
- `enemy_sight` marks patrol/stealth pressure points.
- final return stop is near Flaxio and should drive `pE30`.

Current code treats all of them as ordinary waypoints because no mobs are
attached. That means the "avoid detection" and "podling can be harmed" gameplay
is not implemented yet.

## Content Actor Reconstruction

Current sylph actor data:

| Actor class | Display | Name | SQL class path status |
| ---: | ---: | --- | --- |
| `1001085` | `2450002` | Almxio | populated `PopulaceStandard` |
| `1001086` | `2450004` | Zoxio | populated `PopulaceStandard` |
| `1001178` | `2450012` | Diluxio | populated `PopulaceStandard` |
| `1001237` | `2450020` | Flaxio | blank path |
| `1001238` | `2450021` | Dokixia | blank path |
| `1001517` | `2450021` | Dokixia variant | blank path |

All six have appearance rows. The practical blocker is only the blank actor
class path for Flaxio/Dokixia variants. Since `SimpleContentMan20610` actor
spawning remains disabled, these blank paths still do not explain the current
`activeOwner=0` event bug.

## Podling State And Failure Gap

Mined item/status facts:

- Item `11000091` is `Podling`.
- Status `223993` is `Intact-Podling Toting`.
- The status text describes carrying an intact sylph podling.
- Local director applies that status after `pE20` and clears it after `pE30` or
  when leaving/failing content.

Missing local semantics:

- no evidence yet that podling integrity decreases on damage;
- no evidence that imperial aggro/failure clears the status;
- no route stop mobs to threaten the podling;
- no patrol director wiring for `imperial_patrol_1` / `imperial_patrol_2`.

So the current content can at best prove route and event flow. It cannot yet
prove retail mission rules.

## UI Payload Oddities

The route JSONs still carry generic caravan-style UI defaults:

- `displayGuildleveId = 10826`
- `placeStart = 1031` and `placeEnd = 1030`, which resolve to Wineport/Aleport
  place names in the DAT table
- `name1..3 = 3210501..3210503`, which resolve to Loco/Coco/Moco
- `rewardCargo = 9`
- feed item IDs from caravan data

`EscortRouteDirector` suppresses ordinary route chat for route keys beginning
with `together_we_stand`, but a client widget or packet field may still expose
these inherited defaults. Treat that as a polish/probe issue after event
lifetime is fixed.

## Third-Pass Implementation Order

After the event-owner bug is pinned down, the next practical Man206 order should
be:

1. Prove `pE13` result/fade/zone timing.
2. Prove route-completion owner for `processEvent016`, `pE20`, and `pE30`.
3. Make `11001405` / Moonspore marker behavior explicit during the post-CS leg.
4. Enable or script the `almxio_talk` stop as a non-combat route beat.
5. Add imperial patrol/stealth pressure separately from escort route completion.
6. Implement podling failure semantics using status `223993`.
7. Re-enable Flaxio/Dokixia actor spawning only after their actor class path gap
   is resolved.
8. Replace or suppress caravan UI defaults before exposing any route HUD/widget.

The key restraint: do not add enemies or podling damage before the event lane is
stable. The current user-facing error is still event ownership, not missing
encounters.

# Fourth Pass: Event Bridge And Probe Helpers

This pass decomped the C# event bridge and the debug helper scripts around the
captured line:

```text
[CourtEventFunction] player=Illusive Fizz questSeq=15 ... activeOwner=0x00000000 activeEvent= activeType=0x00 function=delegateEvent params=0x1, 0xA0F1ADBE, "questBaseRewardSeting"
```

## Packet Header Versus Delegate Payload

`RunEventFunction` has two different actor concepts that are easy to collapse
when reading logs:

1. Packet event lane: `currentEventOwner`, `currentEventName`, and
   `currentEventType`.
2. Lua delegate payload: whatever arguments the script passes to
   `delegateEvent`.

The bridge is:

- `Data/scripts/global.lua` `callClientFunction` calls
  `player:RunEventFunction(functionName, ...)`, then yields on `_WAIT_EVENT`.
- `Player.RunEventFunction` builds the Lua param list, logs it, then calls
  `RunEventFunctionPacket.BuildPacket(Id, currentEventOwner, currentEventName,
  currentEventType, functionName, lParams)`.
- `RunEventFunctionPacket` writes trigger actor, owner actor, event type, event
  name, function name, then serialized Lua params.
- `Player.StartEvent` is the normal source of `currentEventOwner`: it copies
  `EventStartPacket.ownerActorID/eventName/eventType` before calling into Lua.
- `Player.EndEventWithType` sends the end packet and clears the current lane
  back to owner `0`, event `""`, type `0`.

So `activeOwner=0x00000000 activeEvent= activeType=0x00` is not a malformed
delegate payload. It means the server-side packet lane was already empty at
the moment `RunEventFunction` was called.

## Decoding The Captured Params

`LuaUtils.CreateLuaParamList` serializes C# actor objects as Lua param type
`0x6` with the actor object's `Id`. `LuaUtils.DumpParams` prints type `0x6`
as hex, just like integer and uint values. That means:

```text
params=0x1, 0xA0F1ADBE, "questBaseRewardSeting"
```

most likely came from:

```lua
callClientFunction(player, "delegateEvent", player, quest, "questBaseRewardSeting")
```

Interpretation:

- `0x1` is the serialized `player` actor argument.
- `0xA0F1ADBE` is the serialized actor object passed as the delegate owner,
  probably a quest actor instance.
- `"questBaseRewardSeting"` is the client method requested on that delegate
  owner.

The payload owner being nonzero does not repair the packet lane. The packet
still goes out with owner `0`, empty event name, and event type `0`.

## Important Label Correction

The quoted log line is from `CourtEventFunction`, not a Man206-specific logger.
The code constants are:

| Field | Value |
| --- | --- |
| `CourtQuestId` | `110010` |
| Quest name | `Court in the Sands` |
| `CourtSeq15` | `15` |
| Court director | `Quest/QuestDirectorMan0u101` |

Man206 is quest `110014` / `Together We Stand`. The local quest table confirms
`110014` is followed by `110015` / `Toll of the Warden`.

The misspelled client method `questBaseRewardSeting` does not appear in
`man206.lua`. In the local Lua sources it is called by:

| Script | Quest id | Function |
| --- | ---: | --- |
| `Data/scripts/directors/Quest/QuestDirectorMan0g101.lua` | `110006` | `clearEntryNowLoading` |
| `Data/scripts/directors/Quest/QuestDirectorMan0l101.lua` | `110002` | `clearEntryNowLoading` |

Those directors call it on `noticeEvent` entry to clear a loading/fade state.
If this exact log happened during a Man206 test, treat it as cross-quest or
cross-director noise until a `QuestEventProbe` capture shows the Man206 lane
itself sending `processEvent040` or `sqrwa` with owner `0`.

## Man206 Completion Path Check

The local Man206 Tataru completion path is:

1. `processEvent040`
2. `sqrwa`
3. `player:EndEvent()`
4. `completeQuestWithRewards`

Both client calls happen before the explicit `EndEvent` in the script. In a
normal Tataru talk event, both should inherit the same nonzero talk owner lane.
If `sqrwa` ever logs with owner `0`, then something cleared the lane between
the two calls, or the completion path was invoked outside a natural event
start.

The currently supplied `questBaseRewardSeting` line is therefore not proof of a
Man206 final-reward bug. It is proof that at least one recovered quest director
can send a loading/fade delegate while the server event lane is empty.

## After-Warp Follow-Up Behavior

`LuaEngine.EventStarted` has an event recovery branch for after-warp cutscene
follow-ups:

- if a sleeping coroutine receives a new event with the same owner and event
  name,
- the previous event owner is nonzero,
- the new event type is `0x4D`,
- and the only param is boolean `false`,
- then the engine restores the previous owner/name/type and ignores the
  follow-up as a lane replacement.

That recovery matters for Man206 because several recovered methods are
after-warp or warp-adjacent:

| Method | Risk |
| --- | --- |
| `processEventUdowntownrectStart` | push event then warp inside Waking Sands |
| `processEvent001` | Minfilia scene then zone change to Waking Sands |
| `pE13` | Nine Ivies content entry, cutscene/notice-event transition |
| `processEvent040` | final Tataru cutscene/fade behavior |

The right failure signature to hunt is not the two blank private-area startup
events. It is a later `runFunction` where Man206 delegate methods appear with
`activeOwner=0`.

## Helper Scripts: What They Prove

### `!questevent`

Command:

```text
!questevent on|probe [label] [seconds] | off | status | mark [label]
```

This is the best helper for the owner bug because it logs natural event
lifetime:

- `phase=eventStart`: trigger, owner, event type, event name, params, and
  active state before `StartEvent`.
- `phase=runFunction`: current active owner/event/type at the exact client call.
- `phase=wait`: add/replace/cancel/resume/drop of Lua event waits.
- `phase=eventUpdate`: update params and whether a wait consumed them.
- `phase=endEvent`: owner/name/type being closed.
- `phase=mark`: manual breadcrumb with the current active lane.

Use this for final proof. It is the only current helper that directly answers
"was the lane alive when the Man206 delegate packet was sent?"

### `!questdelegate`

Command:

```text
!questdelegate <owner> <method> [arg1] ... [arg8]
```

Supported owner specs include `quest:<id|name>`, `static:<name>`,
`actor:<id>`, `class:<actorClassId>`, `unique:<uid>`, `target`, `player`, and
`director`.

Useful arg helpers:

| Helper | Expands to |
| --- | --- |
| `@snpc5` | nickname, skin, personality, coordinate, initial town |
| `@snpcNickname` | player SNPC nickname |
| `@snpcSkin` | player SNPC skin |
| `@snpcPersonality` | player SNPC personality |
| `@snpcCoordinate` | player SNPC coordinate |
| `@initialTown` | player initial town |
| `@snpcActorClass` | `1070000 + skin` |

`!questdelegate` creates a temporary `Debug/QuestDelegateProbe` director,
starts a `noticeEvent`, sends:

```lua
callClientFunction(player, "delegateEvent", player, owner, method, ...)
```

then calls `player:EndEvent()`.

This proves payload shape and client method viability. It does not prove the
retail Man206 event owner, because the lane belongs to the temporary debug
director rather than the real NPC, quest, or content event.

### `!testcutscene`

Command:

```text
!testcutscene <sceneKey> [delegate] [arg]
```

This creates `Debug/CutsceneProbe`, sends:

```lua
callClientFunction(player, "delegateEvent", player, director, "startNQCutScene", sceneKey, arg)
```

then ends the event. It is useful for smoke-testing scene keys, not for quest
owner semantics.

## Suggested Capture Recipes

For the blank startup events:

```text
!questevent probe man206_private_startup 120
```

Expected benign lines:

- `eventStart` or missing-owner debug for owner `0x2`, trigger `0x0`/`0x1`,
  event name empty.
- an `EventRecovery` close if the Man206 missing-owner guard fires.
- no later Man206 `delegateEvent` with owner `0`.

For Nine Ivies entry and `pE13`:

```text
!questevent probe man206_pE13_entry 300
```

Then trigger the `NINE_IVIES_RENDEZVOUS_TRIGGER` naturally. Expected important
line:

```text
phase=runFunction ... activeOwner=<nonzero> ... function=delegateEvent params=..., "pE13", ...
```

For content/director notices:

```text
!questevent probe man206_content_notice 600
```

Watch for `noticeEvent` starts and any `processEvent016`, `pE20`, or `pE30`
delegates. If one has owner `0`, the content/director is calling the delegate
after closing or without receiving a natural event start.

For Tataru completion:

```text
!questevent probe man206_tataru_finish 180
```

Expected order:

1. natural Tataru `eventStart`
2. `runFunction` `delegateEvent` with `"processEvent040"` and nonzero owner
3. `wait` / `eventUpdate` for the cutscene result
4. `runFunction` `delegateEvent` with `"sqrwa"` and the same nonzero owner
5. `endEvent`

If the run function is instead `"questBaseRewardSeting"`, the capture is not
the Man206 Tataru path.

## Fourth-Pass Working Conclusion

The supplied error bundle has two different things in it:

1. The two blank event starts are still consistent with Man206 private-area
   bootstrap noise and are already covered by the current missing-owner close
   guard.
2. The `CourtEventFunction` `questBaseRewardSeting` line is a separate empty
   lane `RunEventFunction`. Its params show a valid delegate payload, but its
   packet header is empty. It is labeled for `Court in the Sands` quest `110010`
   seq `15`, and the exact method is locally sourced from other recovered quest
   directors, not Man206.

Next Man206 work should therefore chase natural `QuestEventProbe` output for
`pE13`, `processEvent016`, `pE20`, `pE30`, `processEvent040`, and `sqrwa`.
Those names, not `questBaseRewardSeting`, are the owner-lifetime proof points
for Together We Stand.

# Fifth Pass: Content Director Runtime Wire

This pass followed the local Man206 quest script, content script, quest
director, escort route director, and GM staging helpers together. The main
finding is sharper than the earlier owner-lifetime suspicion: the current
route-completion delegates are sent from a director timer loop, not from a live
client event.

## Local Man206 Content Constants

The quest script defines the current content shell as:

| Field | Value |
| --- | --- |
| Quest id | `110014` |
| Quest class | `Man206` |
| Content director constant | `Quest/QuestDirectorMan20610` |
| Director init class path | `/Director/Quest/QuestDirectorMan20601` |
| SimpleContent script | `man20610` |
| Dynamic content private area | `SimpleContentMan20610` |
| Static private area | `PrivateAreaMasterPast`, type `1` |
| Zone | `151` |
| Entry/return coords | `1882.422, 34.153, -1018.115`, rot `1.392` |
| Route keys | `together_we_stand_inbound`, `together_we_stand_post_cs`, `together_we_stand_return` |

The naming trap matters: `MAN20610` is the HQ cutscene key used by
`processEvent016`; the live director script explicitly reports itself as
`/Director/Quest/QuestDirectorMan20601`.

## Quest State Wire

`onStateChange` exposes the intended player-facing progression:

| Sequence | Active local objective |
| ---: | --- |
| `0` | Waking Sands crisis setup, Minfilia talk starts the quest cutscene |
| `5` | Waking Sands follow-up NPC chatter |
| `10` | Gridania path-companion trigger `1090177` |
| `15` | Camp Nine Ivies rendezvous trigger `1090178` |
| `20` | Search toward Moonspore Grove, Dokixia enabled |
| `25` | Return the podling, Flaxio enabled |
| `30` | Report to Tataru, reward marker |

The local content entry advances to `SEQ_020` before the escort route actually
proves the inbound leg. That is expedient for local testing, but retail logic
probably treats the `pE13` accept result and the `processEvent016` leg as the
real boundary.

## Entry Path: Static Versus Dynamic

Current natural `startMan206Content` uses the static private-area path:

1. `prepareMan206ContentEntry` sends `pE13` through
   `scenarioHelpers.delegateSnpcEvent` unless direct-test mode skips it.
2. It immediately calls `player:EndEvent()`.
3. It creates or reuses zone `151` private area `PrivateAreaMasterPast` type
   `1`.
4. It creates `Quest/QuestDirectorMan20610` in that private area.
5. It starts sequence `20` and updates ENPCs.
6. It adds the player to the director, starts the director, marks login
   director/content zone change, calls `player:EndEvent()` again, and zones the
   player to the static private area.

Dynamic content helpers exist too:

- `startMan206DynamicContent` creates `SimpleContentMan20610`, starts the
  content director/group, kicks `noticeEvent`, then zones with
  `DoZoneChangeContent`.
- `startMan206BareContentTest` creates the private content area but leaves
  director, content group, notices, escort, and spawned NPCs disabled.
- `startMan206FadeContentTest` only adds the entry-fade clear probe.
- `startMan206GroupContentTest` creates a content-group-only probe with the
  lightweight `QuestDirectorSqbPrivateProbe`.

Default runtime is therefore the static `PrivateAreaMasterPast` path, not the
dynamic `SimpleContentMan20610` path.

## SimpleContentMan20610 Is Mostly Inert

`SimpleContentMan20610.lua` has content actor definitions for Almxio, Flaxio,
Zoxio, Diluxio, and Dokixia, but `onCreate` intentionally comments out:

- music application;
- private-area boundary setup;
- sylph actor spawning.

`onZoneIn` only clears the entry fade if the consumed test mode is
`man206_entry_fade`.

`onPlayerLeft` is the real mutation hook: if the player leaves while Man206 is
sequence `20` or `25`, it clears `IntactPodlingToting`, rolls the quest back to
`SEQ_015`, and updates ENPCs. That is a useful failure fallback, but it also
means zoning/leaving during route experiments can silently undo content
progress.

## QuestDirectorMan20610 State Machine

The director has three route legs:

| Leg | Route key | Completion delegate | Quest mutation |
| ---: | --- | --- | --- |
| `1` inbound | `together_we_stand_inbound` | `processEvent016` | no sequence change; next leg is post-CS |
| `2` post-CS | `together_we_stand_post_cs` | `pE20` | applies podling status, starts `SEQ_025` |
| `3` return | `together_we_stand_return` | `pE30` | clears podling status, starts `SEQ_030`, finishes content, warps back |

The director also:

- sends attention messages for protecting item `11000091` / `Podling` and the
  30 minute mission timer;
- applies status `IntactPodlingToting` for one hour after `pE20`;
- clears that status on return, failure, or content leave;
- uses `StartDelaySeconds = 4`;
- forces `MoveSpeed = 4.0` and `ArrivalDistance = 1.0`;
- keeps the path companion as a normal NPC escort, not an Ally/BattleNpc;
- enables Call-command style recall with owner leash/follow distances.

Failure resets Man206 to `SEQ_015`, clears podling status, finishes content,
ends the current event if any, warps to the Nine Ivies coordinates, and ends the
director.

## Owner-Lane Hazard In The Director

The director's `onEventStarted` only handles `noticeEvent` by sending the
mission notice and immediately calling:

```lua
player:EndEventWithType(eventType or 0)
```

The actual route completion logic is in `main`:

1. wait until the player is landed in the Man206 content area;
2. start `EscortRouteDirector`;
3. poll `escortDirector:IsEscortRouteComplete()`;
4. when true, call `completeCurrentLeg`;
5. `completeCurrentLeg` sends `processEvent016`, `pE20`, or `pE30` directly.

That means the leg-completion delegates are not naturally inside a client event
started by the director. The only director event lane seen in this script is
the entry `noticeEvent`, and that lane is explicitly closed before route
completion.

So if a probe shows:

```text
phase=runFunction ... function=delegateEvent ... "processEvent016"
```

with `activeOwner=0`, that is not mysterious anymore. It is the expected result
of sending the cutscene from the timer loop instead of from a fresh
`noticeEvent`/EventStart lane.

## EscortRouteDirector Behavior

The C# escort route director is server-only route machinery:

- `StartEscortRoute` spawns the configured escort actor(s).
- If `SpawnEscortAsAlly` is false, it uses `SpawnPathCompanion`.
- It moves the escort along waypoints, with optional owner leash/recall.
- At the final waypoint it sets `wasSuccessful = true` and calls `EndDirector`.
- It does not open a client event or call Lua on completion.

Encounter stops only pause when a stop has mobs:

- empty stop: marked completed, but no pause and no spawn;
- mob stop: spawns enemies, engages them on the escort NPC, waits until they
  are dead, then resumes;
- final-encounter completion is only used when
  `CompleteOnFinalEncounterClear = true`.

Together We Stand route messages are suppressed except failures, which is good
for polish but makes logs more important.

## Route Data Snapshot

The current route endpoints and stops:

| Route | Waypoints | Stops | Start | End |
| --- | ---: | ---: | --- | --- |
| inbound | `38` | `0` | `1882.422,34.153,-1018.115` | `1928.3616,34.417,-1055.2325` |
| post-CS | `521` | `7` | `1928.3616,34.417,-1055.2325` | `2239.7163,32.011257,-1694.8887` |
| return | `473` | `3` | `2239.7878,32.007732,-1696.7666` | `1982.9343,33.020466,-1069.0237` |

Post-CS stops:

| Stop | Waypoint | Label | Mobs |
| --- | ---: | --- | ---: |
| `stop2` | `51` | `almxio_talk` | `0` |
| `stop3` | `83` | `enemy_sight` | `0` |
| `stop4` | `236` | `enemy_sight` | `0` |
| `stop5` | `266` | `stop5` | `0` |
| `stop6` | `328` | `enemy_sight` | `0` |
| `stop7` | `415` | `stop7` | `0` |
| `stop8` | `446` | `enemy_sight` | `0` |

Return stops:

| Stop | Waypoint | Label | Mobs |
| --- | ---: | --- | ---: |
| `stop1` | `165` | `enemy_sight` | `0` |
| `stop2` | `235` | `stop2` | `0` |
| `stop3` | `472` | `stop3` | `0` |

The inbound route's final waypoint has `stopId = stop1`, but there is no
matching `encounterStops` entry. It is only a label on the waypoint right now.

## Imperial Enemy Fallbacks Exist But Are Unused

`WorldManager` has fallback mob types for Man206 imperial soldiers:

| BNPC id | Actor class | Internal name | Job | Skill list |
| ---: | ---: | --- | ---: | ---: |
| `1366` | `2280004` | `imperial_retiarius` | `8` | `88` |
| `1367` | `2280002` | `imperial_triarius` | `8` | `88` |
| `1368` | `2280005` | `imperial_hastatus` | `8` | `88` |
| `1369` | `2280008` | `imperial_speculator` | `7` | `87` |

They are hostile, level `22`, detection range `10`, speed `4`, no drops, and
fallback base stats. `EscortRouteDirector.SpawnEncounterMobs` would use these
if route stops had mob definitions, but all Man206 route stops currently have
empty mob lists. So the stealth/combat vocabulary is partially wired in C# but
not reachable from current route JSON.

## Test Harness Map

`!questcomplete man206` aliases and checkpoints are useful as a local probe map:

| Checkpoint family | Meaning |
| --- | --- |
| `nineivies`, `rendezvous`, `trigger`, `public`, `coords` | stage quest `110014` seq `15` at public East Shroud/Nine Ivies coordinates |
| `bare`, `instance` | dynamic private-area creation with director/content disabled |
| `fade`, `clear` | bare dynamic private-area entry plus fade-clear probe |
| `group`, `contentgroup` | content-group-only dynamic probe |
| `escort`, `inbound`, `escortnav` | public inbound nav-only path companion route |
| `escortnpc`, `escortfollow`, `inboundfollow` | public inbound normal NPC escort with owner leash |
| `postcs`, `postcsfollow` | public post-CS route tests |
| `returnroute`, `returnfollow` | public return route tests |
| `content`, `direct` | static private-area content entry, with/without `pE13` |
| `dynamic`, `dynamicdirect` | dynamic SimpleContent entry, with/without `pE13` |
| `contentpostcs` | static content starting at the post-`processEvent016` route origin |
| `moonspore` | static Dokixia checkpoint with the configured Path companion held nearby; the 15-yalm check then arms the `pE20` talk marker |
| `contentreturnroute`, `returnpodling` | static content starting on podling return leg |

The Ally/BattleNpc path companion tests are deliberately disabled except raw
crash repro helpers. Local comments say spawning the Path companion SNPC as
Ally/BattleNpc crashes the client, so the current director intentionally uses a
normal NPC escort with owner leash instead.

## Retail Decompiled Method Notes Rechecked

The original recovered Man206 client class reinforces the local leg order:

| Method | Client call shape |
| --- | --- |
| `pE13` | `startSnpcNQCutScene("man20603", 2, ...)`, return value controls fade branch |
| `processEvent016` | `startHQCutScene("MAN20610", 1)` |
| `pE20` | `startSnpcNQCutScene("man20620", 1, ...)`, default fade |
| `pE30` | `startSnpcNQCutScene("man20630", 1, ...)`, after-warp fade |
| `processEvent040` | `startNQCutScene("man20640", 1)`, after-warp fade |

Two local mismatches stand out:

1. `prepareMan206ContentEntry` ignores the `pE13` result and starts content
   unconditionally.
2. The route-leg cutscenes are launched from the director timer loop rather
   than from an EventStart lane.

The second mismatch is the stronger candidate for the current owner error.

## Fifth-Pass Patch Shape

The likely route-owner fix is to convert route completion into a director
notice event:

1. `main` detects `IsEscortRouteComplete()`.
2. It records a pending leg-completion action.
3. It kicks the client with the Man206 content director as owner, for example a
   `noticeEvent` payload such as `legComplete, currentLeg`.
4. `onEventStarted` handles that notice while `currentEventOwner` is the
   director.
5. It sends `processEvent016`, `pE20`, or `pE30` inside that live lane.
6. It advances sequence/status/content only after the delegate wait returns.
7. It closes the event once, at the end of that handler.

Do not use `BeginSyntheticEvent` as the first real fix. It is useful for
diagnosis, but a director-owned `KickEvent`/EventStart is closer to the client
contract and should give `QuestEventProbe` a clean owner trail.

## Fifth-Pass Probe Recipe

The strongest next capture:

```text
!questcomplete man206 direct
!questevent probe man206_static_route_owner 900
```

Let the inbound route finish. If the hypothesis is right, the log will show:

```text
phase=runFunction ... activeOwner=0x00000000 ... function=delegateEvent ... "processEvent016"
```

Then repeat after changing route completion to kick a director notice event.
The fixed trace should show:

```text
phase=eventStart ... owner=<QuestDirectorMan20610 runtime id> ... event=noticeEvent ...
phase=runFunction ... activeOwner=<same runtime id> ... "processEvent016"
phase=endEvent ... owner=<same runtime id> ...
```

For post-CS and return legs, use:

```text
!questcomplete man206 contentpostcs
!questevent probe man206_postcs_owner 900
```

and:

```text
!questcomplete man206 returnpodling
!questevent probe man206_return_owner 900
```

The expected broken methods are `pE20` and `pE30` respectively.
