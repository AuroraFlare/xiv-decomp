# Hamlet Widget Contract - 2026-06-19

Outputs live in `tools\outputs\lpb\hamlet_widget_contract_20260619`.

## 2026-08-10 exact bootstrap closure

The stock title and main-HUD ownership paths are now statically closed in
`outputs/dungeon-widget-bootstrap-contract-20260810/`:

- The opening scenes own the title. `ham0s201`, `ham0f301`, and `ham0w201`
  embed `lua/show|hide/2DEffectLocation8|9|10`. `CutScene._onShowWidgetClip`
  maps those markers to effect ids `12/13/14`, and
  `DesktopWidget.openCutSceneEffectWidget` opens
  `HamletDefenseTitleWidget1/2/3` through slot 14's
  `SplashEffectWidget`.
- After the cutscene returns, `InstanceRaidHamletDefense.processStartEffect`
  prints NPC line 1 and maps Hamlet ids `1/2/3` to public effects `14/15/16`.
  Those effects open `DutyCommencedWidget1/2/3` through slot 13. The base
  lifecycle waits another second before calling the subclass
  `openInformationWidget`.
- `InstanceRaidHamletDefense.openInformationWidget` calls
  `DesktopWidget.openHamletExecutionWidget`, which opens
  `HamletDefenseWidget` in slot 15 and `HamletDefensePopupWidget` in slot 16.
  The ending scenes own `2DEffectDutySuccess1/2/3`, which map to the matching
  success splashes before `localClearEvent` asks for the score widget when
  score rows exist.

Consequently, widget index `0x1B`, `_loadForm`, `_createWidgetInWidgetContainer`,
and title-index probes are not the recovered stock bootstrap. Keep those paths
debug-only. The remaining live boundary is the EventStart/UI-command context
lifetime needed for `RunEventFunction("startEvent")`; packet acceptance alone
does not prove that the client lane remained attached through dispatch.

## 2026-08-10 result and PushEvent bytecode closure

The result-window client method is now exact, but its retail server trigger is
not present in the recovered static sources. The hash-locked
`InstanceRaidHamletDefense.localClearEvent` performs this sequence:

1. `printNPCSay(2)`.
2. Test `_countHamletDefenseScore() ~= nil`.
3. If score rows exist, call
   `askHamletDefenseScoreWidget(getContentID())`.
4. The desktop connector yields
   `Ask/HamletDefenseScoreWidget`; that widget reads
   `_getHamletDefenseScore` / `_getHamletDefenseScoreAll` and confirms with ask
   result `1`.

This is separate from `InstanceRaidBaseClass.clearEvent`, which only resets the
countdown, sets desktop mode `126`, closes the information widget, and sends
notification `52021`. It does not call `localClearEvent`. The current local
completion path plays the ending cutscene and calls `EndEventWithType(0)` while
`SyncEndSignal` publishes `guildleveWork.signal=-1` and `startTime=0`; neither
path statically invokes the recovered result method. Therefore the call or
packet that invokes `localClearEvent`, its ordering after score packet `0x01A8`
and the ending cutscene, and the required attached-director lifetime remain a
capture-only boundary. Do not substitute `clearEvent`, a generic widget open,
or an unattached immediate-exit Kick.

Failure is similarly bounded. The base `failedEvent(failureType)` flow and the
Hamlet `processFailedEffect` override are exact: notification ids are
`52065/52054/52010/52093`, the override prints NPC line `3` and opens public
effect `20`, and non-type-1 paths perform the recovered wait/fade sequence. The
Hamlet retail `failureType` and server invocation are not statically owned, so
they must not be guessed.

The human support/craft interaction is reconstructed from the hash-locked
Lua 5.1 prototypes rather than the damaged Lua text:

- `talkToSupport` is 207 instructions (lines 304-513). It starts client talk,
  handles the victory/all-walks branch, and otherwise plays the gatherer or
  crafter introduction before calling `askForEventMode` exactly once per loop
  with title `4` and choices `5/6/7/8`. The apparent repeated widget calls in
  the recovered Lua are a decompiler artifact.
- Choice `1` returns immediately without `finishCliantTalkTurn`; choice `2`
  emits the exact objective text sequence and loops; choice `3` emits the exact
  effect/item sequence and loops; any other result says text `35`, finishes the
  client talk turn, and returns.
- `sayText` is 11 instructions (lines 675-685): when a selector exists it calls
  `_runCharaScheduler(selector)` before `say(self,textId,0)`. The generated flow
  preserves every scheduler, text id, item argument, and loop edge.
- `supplyToSupport` is 41 instructions and owns the five exact status-response
  gesture/text branches before always finishing the talk turn.
- `talkToCraft` is 44 instructions and calls one widget with title `43`, choices
  `44-48`, and four item arguments. Cancel/non-positive/choice `5` returns nil;
  choices `1-4` return the 4-by-3 item matrix. `getCrafterType` compares both
  values returned by one `getStateMainSkill` call: either value in `29-31`
  selects group 1, either in `32-34` selects group 2, otherwise group 3. No
  dialogue scheduler occurs after this craft widget in the client method.

The external PushEvent entrypoint, ownership/meaning of the five support
arguments, choice-1 server result handoff, and craft inventory transaction are
not in these prototypes. Keep them capture-only. Reproducible fixtures and
capture requirements are in
`outputs/hamlet-push-event-animation-atlas-20260810/`, especially
`human_support_dialogue_flow.csv`, `craft_choice_widget_flow.csv`,
`ending_result_contract.csv`, `hash_locked_sources.csv`, and
`capture_only_boundaries.csv`.

## High-signal findings

- Retail `InstanceRaidHamletDefense` is a user-message driven HUD controller.
  Subtypes `1`-`10` update title/rank, harvest, field buffs, defense lines,
  goods, cargo target, boss flag, battle value, and popup information.
- The main `HamletDefenseWidget` command surface is recovered: title/timer,
  line status, war potential, goods status/target, army/enemy buffs, gathering
  bingo, and boss status.
- `HamletDefenseScoreWidget`, `HamletDefenseRankingWidget`, and
  `HamletDefenseTutorialWidget` are separate ask widgets. Score is tied to
  `hamletDefScore`/`hamletDefScoreAll`; ranking is tied to
  `hamletSupplyRanking`; tutorial owns kind/gc/page navigation.
- Local Hamlet Defense has an experimental server-side combat/probe backend
  and a large UI probe surface; the retail launch/widget gate remains
  unconfirmed. A direct retail user-message bridge is now seeded for subtypes
  `3`-`9`; the remaining gap is active-director live validation plus subtype
  `1` title/timer, subtype `2` harvest counts, and subtype `10` popup notices.
- Local score packet `0x01A8` has a promising native compact `0x105` payload.
  Local ranking packet `0x01A6` has an empty safe probe and a gated non-empty
  `0x5F0` sample whose field semantics are not validated. Keep production
  ranking empty and use only opt-in one-row debug probes until the stock client
  accepts the layout.

## Local Safety Notes

- Widget index is `0x1B`.
- Default widget profile is `loadbare`.
- Known-bad direct client director paths are blocked because they can trip
  client error `40000`.
- Non-empty ranking is intentionally gated; keep it that way until the native
  row layout is validated.
- Do not open Hamlet widgets through generic WidgetOpenCommand. Stage them only
  through an active Hamlet director/context, starting with the main HUD before
  popup, score, ranking, or tutorial.

## 2026-06-20 HUD Safety Update

- Local Hamlet HUD support is stronger than a generic widget gap: `Defense.lua` has an experimental open sequence, C# sends user-message subtypes `3`-`9` through opcode `0x0133`, `guildleveWork` fallback sync exists, score packet `0x01A8` has normal/current and native compact builders, and ranking packet `0x01A6` has empty/sample builders.
- Still keep the widget-open path probe-only until a live active-director path proves stable. Validate public `retailstart` and HUD subtypes `3`-`9` first; only then add subtypes `1` title/timer, `2` harvest counts, and `10` popup notices.
- Keep non-empty `0x01A6` ranking gated. The manager currently allows empty ranking only and the director rejects non-empty ranking, which is the right production posture until field layout is proven.
- `!testhamlet` exposes completion/fail/score/ranking/unsafe-instance/support mutation modes with permissions `0`; keep `hamlet_defense_enabled=false` outside controlled testing or make the command GM-only before broader use.
- Victory reward mutation is not retail-proven: `ClaimReward` grants item `1000001` based on `finalScore / 20` without reward widget or tier validation. Keep supply/reward mutation behind server-owned pending context, TTL, actor/row/item re-resolution, quantity/HQ/materia/capacity/anima checks, and idempotent grant/remove logic.
- Add `directorWork.contentCommand/contentCommandSub` sync before trying to treat retail `ContentCommand` as a Hamlet action path.
## 2026-06-20 HUD Validation Addendum

- The seeded Hamlet HUD user-message path currently covers subtypes `3-9`: reset/harvest clear, field buffs, defense line state, goods/cart status, cargo target forced to `0`, boss flag, and battle value.
- Subtypes `1` title/timer, `2` harvest counts, and `10` popup notices remain gated. Do not map harvest from `potsDelivered`, and do not translate chat strings into popup ids until retail ids/arguments are validated.
- `HamletDefenseWidget` open is still a controlled probe at widget index `0x1B` with profile `loadbare`; score, ranking, tutorial, and popup are separate surfaces and do not prove the live HUD bridge.
- `0x01A8` score has experimental empty/current/full/single/native builders; `0x01A6` ranking must stay empty-only until the non-empty `0x5F0` layout is live-proven.
- Current workspace config has `hamlet_defense_enabled=true`; treat this checkout as test-enabled and make `!testhamlet` GM-only or set the flag false before broader/non-controlled use.

## 2026-06-20 Window Ownership Addendum

- The Hamlet widgets themselves are mostly recovered now: `InstanceRaidHamletDefense` opens the execution widget, `HamletDefenseWidget` has the main command surface, and score/ranking/tutorial are separate ask widgets.
- The missing proof is the retail server-to-client open gate, especially director-method / `RunEventFunction 0x0130` packet capture. Do not treat a successful local direct open as proof of the retail path.
- Keep `WidgetOpenCommand` out of this lane. Hamlet should open through an active instance-raid/Hamlet director context, with user-message and score/ranking packets validated separately.
- Risky runtime patches remain generic widget open, non-empty ranking payloads, forced direct director calls, private `retailinstance`, unsafe score/content command probes, supply/reward mutation, and blind director `RunEventFunction` calls.

## 2026-06-20 Widget Bootstrap Focus

- Hamlet backend and packet coverage are broad enough for controlled probes: test manager/director, public lifecycle probes, militia/cart/wave spawning, HUD subtype snapshots, score rows, empty ranking, native score packet, and ranking packet builders exist.
- The next useful decomp target is widget identity/data binding: `_loadForm`, `_createWidgetInWidgetContainer`, `Window_HamletDefenseWidget`, widget index `0x1B`, and the red `Undefined` fallback.
- Do not use score packet success as proof of live HUD parity. Main HUD bootstrap, subtype `1/2/10`, non-empty ranking, popup ids, and supply/reward mutation each need separate validation.

## 2026-06-21 Hamlet Adapter Boundary

- Local Hamlet Defense is a specialized C# adapter, not recovered `InstanceRaidHamletDefense` production parity. Keep it on the active `HamletDefenseDirector` path with raid ids `8/9/10`, widget index `0x1B`, and source-actor variation checks.
- Recovered `InstanceRaidHamletDefense` remains a useful contract for user-message subtypes and local text, but it should not replace the current guarded adapter until the live open gate, subtype coverage, score/ranking, and reward/supply mutation are proven.
- Validation order: subtype `3-9` main HUD first, then subtype `1/2/10`, then native score, then empty ranking. Non-empty ranking, unsafe widget opens, completion/fail/reward, and supply mutation remain gated.
- `ContentCommand` work-sync is still separate. A visible Hamlet widget or commandContent probe does not prove `directorWork.contentCommand/contentCommandSub` or command `24302`.
- `PopulaceHamletSupply` remains preview/read-only: it opens/selects/closes `Ask/QuestDeliveryWidget` and intentionally does not mutate items, anima, or supply points. Retail reward tiers and supply commits stay gated behind owner/result validation.

## 2026-06-21 Helper Wave Subtype / Transaction Update

- Recovered live HUD subtypes are still only `3-9`: harvest reset/clear, field buffs, defense line state, goods/cart state, cargo target, boss flag, and battle value. Subtypes `1`, `2`, and `10` remain unknown/gated and should not be guessed from local score or chat fields.
- The active path is not generic WidgetOpen: `Defense.lua` seeds the instance-raid context, text, score wait, widget container, and HUD snapshot; C# pushes user messages through the active `HamletDefenseDirector`.
- `0x01A8` is score data for `HamletDefenseScoreWidget`; it is not proof that the main HUD opened. `0x01A6` has a known native ranking shape, but production/runtime use should remain empty-only until non-empty rows are live-proven.
- Supply delivery row bases are actor-specific in recovered data: Aleport, Hyrstmill, and Golden Bazaar use different item/materia base ranges. Local `PopulaceHamletSupply` correctly stays preview-only until package/slot/item/count/HQ/materia/anima/supply-point revalidation and a contribution ledger exist.
- Reward selection and NM/content reward widgets are display/result surfaces. Current local reward claim state is in-memory and lacks persistent idempotency; do not enable Hamlet reward mutation until a claim ledger plus inventory transaction wrapper exists.
- Captain, breeder, and `Noc002` custom-window flows should stay text/tutorial/status preview only. They do not prove supply, ranking, score, or reward transaction authority.

## Implementation Order

| Priority | Surface | Target |
| ---: | --- | --- |
| 1 | Freeze one safe widget-open path | `Data/scripts/directors/Hamlet/Defense.lua` and `HamletDefenseDirector` widget profile |
| 2 | Validate direct user-message subtype bridge | `HamletDefenseDirector -> InstanceRaidHamletDefense.processUserMessage` subtype `3`-`9` payloads |
| 3 | Finish remaining live-HUD rows | title/timer, harvest counts, popup notices |
| 4 | Stabilize score window | `HamletDefenseScoreWidget` and `0x01A8` |
| 5 | Keep ranking non-empty gated | `HamletDefenseRankingWidget` and `0x01A6` |
| 6 | Tutorial and popup polish | `HamletDefenseTutorialWidget` and `HamletDefensePopupWidget` |

## Generated Files

- `hamlet_widget_function_contracts.csv` (204 rows)
- `hamlet_user_message_protocol.csv` (10 rows)
- `hamlet_widget_command_matrix.csv` (12 rows)
- `local_probe_surface.csv` (8 rows)
- `hamlet_data_map.csv` (3 rows)
- `local_gap_summary.csv` (5 rows)
- `bridge_queue.csv` (6 rows)
- `contract_summary.json`
- `README.md`

## 2026-06-21 Active Reward Boundary

- Hamlet active HUD subtypes `3-9` are locally wired through `GenericDataPacket`/instance-raid user-message data and the active `HamletDefenseDirector`. Subtypes `1`, `2`, and `10` remain recovered-only until wired and validated.
- `PopulaceHamletSupply` is active but preview-only: it opens item/materia delivery previews and logs selections without inventory, anima, supply-point, or contribution mutation.
- Local Hamlet reward mutation exists but is not retail-proven: `HamletDefenseDirector` uses an in-memory claim set and grants gil, and completion can auto-call that path. Do not widen it until a persistent claim ledger, inventory/currency transaction wrapper, cap checks, rollback, and disconnect/retry probes exist.
- Recovered Noc002 captain/supply/ranking mutation flows remain read-only/status-preview work until those transaction boundaries are implemented.
