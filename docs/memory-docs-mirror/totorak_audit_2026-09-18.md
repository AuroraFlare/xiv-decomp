# Toto-Rak audit — 2026-09-18

## Result and application status

Found and corrected three functional problems: fresh/late entry could skip its
opening presentation, exit callers treated a queued transfer as a failure, and
undeliverable chest rewards were discarded. The chamber porter also now reaches
the existing public-entrance fallback when a saved return point is unavailable.

These are source changes with an isolated Release build under
`outputs/totorak-audit-20260918/build`. The running Map Server was not restarted
or replaced. PID 34096 was observed on the normal Release path, started
2026-09-17 12:14:31 local time. Lua changes are in the shared script tree; their
cache/reload behavior must not be mistaken for deployment of the new C# code.
No new client acceptance is recorded by this audit.

Final isolated `Map Server.dll` SHA-256:
`28B9B0CCAA09A9A7CE4156B9CC799D55F87F6A99332FB0A142D91F261542293A`.

## Entry scene and widget

### Follow-up: show the opening before gameplay

Cutscene-enabled fresh/late entry now selects native position arrival mode 16
instead of ordinary duty arrival 2. The destination still loads and acknowledges
its actor snapshot first, but mode 16 retains the loading cover rather than
revealing the standing player before the movie. The existing occupancy
`rad0f300` call clears that cover through `CutScene.startCutScene`, then fades
into gameplay and opens the widget after playback or skip. Widget-only/debug
entry retains mode 2. No new login director, early actor publication, manual
player fade call or bypass of the landing safeguards is introduced.

Native evidence: local export
`outputs/consumable-return-animation-decomp-20260904/native-verified-targets.txt`,
SHA-256 `35ADC64290DF23EAA845F38D8BE1696972F29B33A5C57A97D5ECDC1630BCBF41`.
`0x0058B2A0` admits mode 16 to the normal arrival machine; `0x0058ADC0` selects
the loading branch; `0x0058A090` phase 12 excludes modes 16/21 from both its
loading release and automatic fade-in, then continues through completion.
Recovered `gamedata/cutscene_common.lua` clears the notice-event loading state
before loading its movie. `RaidFst0Dungeon03.eventNoticeCutScene` skips the
initial fade-out specifically for `rad0f300`, then fades in after the scene;
its `relogin` also clears loading. The existing opening-failure widget fallback
continues to use that native `relogin` path.

This selects a recovered native capability for Toto-Rak; it does not establish
the exact retail arrival packet. Client confirmation is still needed: test
`!totorak enter cs`, watched and skipped, for loading → movie → playable zone
and timer, with no standing-player glimpse. Also test `widgetonly`, debug,
late entry, and a refused/failed opening. This follow-up has not been deployed
to the running server.

Follow-up validation: isolated Release build in
`outputs/totorak-entry-cover-20260918/build`, 3,044 runtime assertions including
the compiled entry-mode selector and actual position packet bytes, 30 Lua
command/porter cases, and the encounter runtime suite passed. Entry logs now
record the selected arrival mode. The historical audit build/hash above remains
the earlier artifact; it does not include this presentation follow-up.

### Entry dispatch audit

`!totorak enter` deliberately selects `gm-debug-no-ui`. The existing presentation
command is `!totorak livetest cs`; `!totorak livetest widgetonly` omits the movie.
This pass also accepts `!totorak enter cs` and `!totorak enter widgetonly`.
`!totorak widget` prepares the entrance NPC; it is not the live duty-widget mode.
Use Bloisirant or `!totorak start` to test normal entry restrictions and party flow.

The August 31 log confirms both kinds of attempt. At 15:55:44 the server started
`gm-debug-no-ui`, with both presentation flags false. At 16:42:18 it started
`gm-solo-test-cs`, with both flags true, but never reserved or dispatched the
opening. Landing completed at 16:42:22 and the population was ready at 16:42:24.
Therefore command confusion alone does not explain the reported failure.

`DoZoneChangeContent` now queues an asynchronous transfer. Toto-Rak previously
checked `CurrentArea` immediately after calling it, skipped the original entrant,
and never revisited presentation scheduling. Late entry had the same assumption.
Both paths now schedule through the content transfer's completion callback.
The callback validates original Session ownership, authoritative Player, exact
destination, active instance, and expiry before scheduling. Existing landing,
scene generation, busy-event, native handshake and original deadline gates remain.
The admission count stays held until transfer completion/refusal; duplicate
completion cannot decrement it twice. No scene is credited from a failed entry.

## Exits

Saved-return and missing-return exits now use `BeginZoneChange`'s admission result
and asynchronous completion callback. They no longer infer failure because the
player is still in the source area immediately after queueing. The original
Player's exit claim remains held while queued; an unsuccessful completion releases
only that Player's claim. It cannot erase a replacement session's claim.
Empty-content cleanup and the shared Aurum/Cutter departure notifications occur
after successful transfer completion.

The post-clear `InstanceRaidExit` porter still uses native `askExit` and moves
only on boolean true/numeric one. Cancel stays in the chamber. If the return
point is missing, only private zone-159 content can use the established entrance
fallback at zone 154, `(835.642, -12.682, 643.485)`, rotation `2.502`.

The duty timeout path had another queued-transfer race: it could immediately
force logout while the exit was still waiting to start. It now awaits the actual
transfer result, bounded by the existing 30-second landing timeout, before
applying recovery. Boss clear retains voluntary exits; opening all coffers does
not trigger an automatic return and one member can remain after another leaves.

## Coffers and drops

The old opener committed the opened flag even if every delivery failed. It also
rerolled on a retry after an exception following partial delivery. A per-coffer
`TotorakCofferReward` now retains the selected reward family, individual items,
and original gil shares for this content copy. Successful items/shares are removed
from its pending list individually. A failed delivery keeps the chest available
without crediting the six-route-chest objective. The existing reservation prevents
simultaneous clicks on the same chest. This is in-memory instance state, not a
durable reward transaction across a server crash or database exception after an
unreported partial write.

Successful deliveries use existing native item/gil messages; internal coffer keys
and route counters are no longer shown in success messages. The chest opens and
despawns after its complete reward is delivered. No pool, probability, quantity,
coffer position, boss condition, or encounter profile was changed.

The six route equipment pools, five boss-coffer definitions, Grade 3 Dark Matter
and gil resolve to 20 items in main SQL. All 15 encounter profiles are in the main
`server_battlenpc_mob_types_loot.sql`; the base mob-type dump alone is not the
complete seed. All seven Diremite skill-list bindings exist in main SQL. A
read-only check of the configured live database confirmed the 15 exact BNPC/actor
joins and the 20 items. No SQL correction or database write was necessary. This
does not inspect the running process's already-loaded BNPC cache.

## Validation

### Follow-up: dungeon aggression ignores player level gap

At the user's request, `BattleNpc.CanAggroByLevel` now exempts player targets
when the mob's current zone is in the existing `WorldManager.IsDungeonZone`
classification. This applies to all 16 classified zones, including public
dungeons and Toto-Rak, Darkhold, Aurum Vale and Cutter's Cry. Outdoor mobs
retain the existing ten-level threshold, and explicit `IgnoreLevelDifference`
flags still work. NPC-versus-NPC level rules are unchanged. Passive status,
detection senses/range, floor/LOS checks and special target protections remain
independent requirements. No SQL/profile changes were needed.

The isolated Release build under `outputs/dungeon-aggro-20260918/build` passed.
`Fishing Tests --mob-aggro-semantics-only` includes 244 production-method checks
across all dungeon zones, level boundaries, passive/no-sense actors, missing
areas and NPC targets. That suite, `--mob-aggro-range-only` and
`--combat-contracts-only` passed. This is a user-requested behavior policy,
not newly recovered retail evidence. No running server was restarted/replaced;
live pull acceptance remains open.

### Follow-up: extended dungeon territory

At the user's request, every enemy created by Toto-Rak's encounter helper now
receives a finite 125-yalm X/Z pursuit radius from its spawn home, matching
Darkhold's authored dungeon policy. This includes corridor mobs, bosses and adds.
The shared outdoor default remains 75 yalms; Toto-Rak's initial detection remains
10 yalms for corridor mobs and 18 for bosses. Return-to-territory behavior and
cutscene hate protection still use the shared AI. This supersedes the earlier
75-yalm Toto-Rak setting; 125 is a user-guided estimate, not recovered retail data.
Live pull/return acceptance remains open. No server restart was performed.

Follow-up validation passed: the actual Lua encounter population/route suite
(`powershell -NoProfile -File tools/validate_totorak_legacy_raid.ps1 -EncounterOnly`)
checks the finite 125-yalm override on every spawned enemy and unchanged detection.
The Fishing Tests `--totorak-leash-only` contract also passed after an isolated
Release build under `outputs/totorak-audit-20260918/leash-tests` (zero errors).
The full historical validator still fails its broader source-shape checks;
the focused encounter result does not mark that entire validator passing.

### Audit checks

- Isolated Release build: zero errors; existing dependency warnings remain.
- `tools/totorak-runtime-tests`: 3,036 checks, including retained item/gil retries,
  all reward outcome families, actual compiled coffer failure handling, compiled
  entry refusal/cancellation, and old-versus-replacement exit claims.
- `tools/validate_totorak_interactions.ps1`: 30 actual Lua command/porter cases.
- `tools/test_totorak_reward_data.py`: three main-SQL data tests passed.
- `tools/decompile_totorak_cutscene_setup.py`: all nine installed native scenes
  decoded; staging remains distinct from persistent world homes.
- Shared job/GC lifecycle harness against the isolated DLL: compiled transition
  guards passed (35 assertions), with the full Lua lifecycle suite passing
  45 cases / 1,201 assertions and its other compiled guards passing.
- Scoped `git diff --check`: passed.

The older `validate_totorak_legacy_raid.ps1` was also run. Its Lua mocks needed
updates for the intentional finite leash, randomized fixed-per-spawn Pudding
aspect, model-state accessor, and the newer NPC continuation guard. Those runtime
probes now execute. Changed entry/exit source assertions were updated to test the
completion callback contract. The validator still reports **30 pre-existing
structural mismatches**, many involving old synchronous transport/login source
shapes and `.ConfigureAwait(false)` literals superseded by the zone scheduler.
Comparison against saved pre-change WorldManager/PrivateAreaContent sources shows
no new failure messages after updating the changed-code contracts. This is not a
passing result for that entire legacy validator or proof all its inherited
findings are harmless. Reports are under `outputs/totorak-audit-20260918`.

Reproduce the focused checks from the repository root:

```powershell
dotnet build 'Map Server/Map Server.csproj' -c Release --no-restore -o outputs/totorak-audit-20260918/build
dotnet run --project tools/totorak-runtime-tests -c Release --no-restore -- 'outputs/totorak-audit-20260918/build/Map Server.dll'
# Optional read-only check of the configured database; credentials are not printed:
dotnet run --project tools/totorak-runtime-tests -c Release --no-restore -- 'outputs/totorak-audit-20260918/build/Map Server.dll' --live-db
powershell -NoProfile -File tools/validate_totorak_interactions.ps1
python -B tools/test_totorak_reward_data.py
python -B tools/decompile_totorak_cutscene_setup.py
```

## What remains before claiming retail/client completion

1. On a server running the corrected build, enter with `!totorak livetest cs`.
   Confirm visible `rad0f300`, then the countdown widget with the original expiry.
   Repeat natural party entry through Bloisirant and reconnect with time elapsed.
2. For each boss route, use `!totorak checkpoint antares`, `sargas`, or `shaula`,
   click the real terminal, finish the actual encounter, loot, then click the
   chamber porter. The checkpoints are GM setup, not normal-progression evidence.
   A `spawnboss` probe does not establish the encounter-owned clear path.
3. Test porter Cancel and Yes, then a two-player clear where one leaves while
   the other remains, loots and leaves later. Verify arrival outside, widget
   closure and eventual empty-instance cleanup. `!totorak leave` is an emergency
   GM warp and does not validate the porter.
4. Exercise full loot/inventory packs, partial two-item delivery, and retry after
   freeing space. Confirm rewards actually arrive in inventory/Loot, with no
   duplicates and no lost pending item. Offline tests cannot prove packet rendering.
5. Native chest color/model matching remains separate: this implementation still
   uses the shared `1200161` coffer appearance without route/reward-specific
   overrides. Do not copy Darkhold's colors without Toto-Rak evidence.
6. The current one-in-six route-equipment chance, fallback split, 700-gil amount,
   uniform fixed-chest count/selection and encounter tuning remain reconstruction
   choices where exact retail distributions/timing have not been recovered.
   Existing scene/placement logs are historical evidence, not fresh acceptance.

The older implementation chronicle is `docs/totorak_implementation_2026-07-18.md`.
Its dated deployment and live-proof statements apply only to their recorded runs.
