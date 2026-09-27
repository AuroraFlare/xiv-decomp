# Job and Grand Company decomp implementation

Scope: the concrete runtime findings in [the 87-quest decomp](job_gc_full_decomp_2026-09-07.md) and its three linked reviews. The existing availability setting and unrelated ongoing work are preserved. Missing original combat profiles and unproved world placements remain explicit source boundaries; scene-local coordinates are not used as public warp coordinates.

## Implementation checklist

- [x] Stage private battle resources before entry presentation; retain the event through its actual transition, with retry cleanup.
- [x] Move Paladin 30's crystal scene from entry to victory and its return transition.
- [x] Bind Black Mage 40's briefing to Kazagg, passing the player's race enum exactly once.
- [x] Require the explicit numeric acceptance result; cancellation and missing results cannot accept quests.
- [x] Remove Neale's ambient dialogue from the Warrior 30 Gorge reward.
- [x] Preserve Warrior 50's Silver Bazaar reward destination and reject a cave reward binding.
- [x] Move Monk 50's aftermath to victory and give its final dialogue to a real Widargelt event owner, including recovery.
- [x] Preserve White Mage 30's open talk turn across Clear and ClearNQ.
- [x] Record White Mage 50's exact Firebound Wrath identity without inventing its missing combat profile.
- [x] Correct companion totals in job launch and director contracts; distinguish recommendations from maximums.
- [x] Correct Keeper's Hymn, Burst and Hallowed Ground descriptions while retaining numeric grants.
- [x] Forward explicit success payloads without collapsing nil, false and zero.
- [x] Correct Grand Company offer/completion dispatch and empty-class boundaries.
- [x] Preserve enlistment confirmation/FAQ behavior, reject canceled offers and make reward retries idempotent. Audit the client UI close boundary separately.
- [x] Model the three level-40 Grand Company devices and Gridania's wounded protection objective from their separate source contracts.
- [x] Audit the remaining job/GC routes against their detailed reports, including AF ownership and inert content boundaries.
- [x] Map adapter phases to the recovered client journal selectors, without inventing current objectives for adapter-only phases.
- [x] Execute runtime regression tests and all affected source/data validators; record evidence and limits below.

## Event ownership and recovery

The shared launcher allocates the private area, director, enemies and required actors before its entry movie. It publishes player membership and the content group after the movie, then lets the native transition capture and close the source event. Failed allocation, publication and queueing retain a public retry route. A proved AfterWarp lead-in uses a real recovery move if publication fails after its scene; ordinary-fade methods do not manufacture that handoff.

An opt-in native lease owns abandoned job/GC shells, including disconnected source events and suspended success scenes. The factory reserves the owner's area name atomically. Cleanup waits for pending entry/return transfers, drains remaining participants through their saved return points, and retires the original scene actor afterward. Public battle-phase retries require the previous named instance to be gone. Session replacement cannot transfer quest ownership to a party helper or overwrite a connected character's new saved location.

Paladin 30 now plays its crystal aftermath from director victory, retaining the event for the return. Dragoon 50 likewise plays exactly one aftermath wrapper at success, leaving only Alberic's actual reward conversation afterward. Paladin 45's Default aftermath and world-owned reward widgets complete inside the victorious content; its journal has no extra Jenlyns return objective.

Monk 50 persists victory at sequence 9, plays the aftermath with a real reload of the same private area, then exposes a registered Widargelt at sequence 10. The reward handler checks the exact private area owner, actor class, unique ID, actor instance and landing state. Erik can reopen an interrupted scene/reward phase. The existing public Widargelt in Eastern Thanalan is not used as a Silvertear Falls destination. The private NPC uses the adapter's current position; no scene coordinate is presented as a recovered public transform.

Black Mage 40 now runs Kazagg's briefing once, with race mapped from the fifteen original tribe/sex rows to the five values used by the source text. Unknown tribes do not advance. Every job offer requires numeric 1; nil, false, zero and strings cannot accept a quest or grant its starting instrument.

Held content and interaction rewards have explicit owners. This prevents a future marker-only shell from completing Monk 30, Monk 40, Black Mage 45/50 or Bard 45 through an unrelated public reward click. Black Mage 30's later Yayake scene and Keeper's Hymn payload are restored. White Mage 50's scene and robe presentation precede its Raya report. Paladin 50's recovered close-only method is appended to the two methods that leave the talk turn open; that pairing is identified as a server reconstruction.

The [42-row job audit](../tools/job-quest-runtime-tests/AUDIT.md) records every audited route, including unchanged correct hooks and unresolved actor/encounter prerequisites.

The [journal mapping audit](../tools/job-quest-runtime-tests/JOURNAL_MAPPING.md) covers 108 adapter phases across all 42 jobs. Its extractor verifies the current-journal expressions in all four client languages. Adapter phases never double as journal selectors or AF acquisition counts; unsupported pending-reward phases return an empty result instead of displaying a next-quest notice.

## Grand Company objectives and persistence

The three level-40 controllers require exact supplied actor, status, timing and spawn bindings. Limsa's 11000423 suppresses reinforcements, Gridania's 11000422 clears poison and prevents its reapplication during the mist interval while wounded NPCs recover, and Ul'dah's 11000421 removes the configured enemy enhancements. Every callback checks the encounter owner and content; device use also requires the host's inventory, command, range and target authorization. Failure, cancellation and callback errors release partially applied effects. These controllers do not enable the held missions. The [45-row Grand Company audit](../tools/grand-company-runtime-tests/AUDIT.md) records the disposition and remaining boundary of every requested GC quest.

Enlistment and tutorial payouts checkpoint seals and EXP before another client dialogue yields. The three field-survey routes also save object credit and their report transition before progress dialogue, repair interrupted all-object saves, and protect reward retries. Declined or malformed choices cannot accept a quest or grant a reward. Merit-probe death and timeout dispatch the recovered failure outcome; withdrawal and area departure use cancellation.

## Party totals

The launcher cap and matching director agree for all nine corrected rows. Source recommendations remain identified separately from source maximums.

| Source | Quests | Total participants |
| --- | --- | ---: |
| Three companions recommended | War0j2, Blm0j2, Pld0j2, Pld0j3 | 4 |
| Three companions permitted | Blm0j3 | 4 |
| Seven companions recommended | Mnk0j6, Drg0j5 | 8 |
| Seven companions permitted | Pld0j5, Drg0j6 | 8 |

## Source boundaries

The report does not recover the missing retail server. Held AF coffers, public destinations, encounter profiles, soldier rosters, elemental identities, original counts/waves, allied AI and opaque scene-argument producers remain held where their required data is absent. Firebound Wrath's 2204610/3204607 identity is now recorded, but its missing combat profile is not substituted.

The Grand Company device controllers implement distinct rules against explicit supplied bindings; those three missions cannot launch until their actor, status, spawn and timing bindings exist. A successful unit test with supplied fixture bindings does not make an unbound encounter playable.

The enlistment checkpoint protects interrupted coroutine/reward retries. It uses flags 21–23, which survive the database's 24-bit quest-flag column; the regression fixture verifies a save/reload round trip and the schema width. It is not an atomic database transaction across a process crash between a grant and checkpoint persistence. A decline grants nothing. The [bounded client cleanup review](../outputs/job-gc-decomp-20260907/reviews/gc/enlistment-event-cleanup.md) proves that `_onPostEvent` closes event-mode widget tiers 4 and 5, including the GC status tier. The native EndEvent-packet-to-client-callback edge and live-client behavior remain unobserved; the successful-enlistment ceremony is not replayed to dismiss a canceled menu.

No live watched/skipped/reconnect client playtest has been performed for this implementation. The automated suites test the production server scripts and native lifecycle rules with controlled client/area boundaries. Availability and deployment switches retain the user's existing settings.

## Verification

| Check | Result |
| --- | --- |
| `dotnet run --no-restore --project tools/job-quest-runtime-tests/JobQuestRuntimeTests.csproj` | 974 behavioral cases passed, 0 failed, across 9 groups. Includes production callbacks for all 42 jobs, 18 materialized battle retries, reward ownership, AF persistence and journal selectors. |
| `python -X utf8 tools/job-quest-runtime-tests/extract_journal_contracts.py --check` | 42 quests and 108 phase mappings match the current-journal expressions in all four languages. |
| All `tools/validate_job_*.py` | 18 validators passed, including the held-combat validator. The [job validation record](../tools/job-quest-runtime-tests/VALIDATION.md) lists the other 17 commands. |
| `python tools/validate_quest_availability.py` | 524 availability rows valid; 42 job rows, 34 battle boundaries, 8 interaction boundaries, 13 proven routes, 94 markers and 18 enabled-offer definitions accounted for. The existing job deployment switch remains disabled. |
| `python -m unittest discover -s tools -p test_job_gc_decomp.py -v` | 14 decomp extraction/decoding tests passed. |
| `dotnet run --no-restore --project tools/grand-company-runtime-tests/GrandCompanyRuntimeTests.csproj` | 202 assertions passed for all 45 requested GC rows, including enlistment save/reload, field reward retries, guarded battle retries, merit outcomes and all three device contracts. |
| `python -B tools/validate_grand_company_quests.py` | 69 named wrappers and source-ledger rows passed; 685 recovered methods, 224 server declarations, 44 literal dispatch arities and 36 bespoke offers verified; all 13 generic battle placeholders remain gated. |
| `dotnet run --no-restore --project tools/job-gc-lifecycle-tests/JobGcLifecycleTests.csproj` | 19 lifecycle cases and 319 assertions passed, including 48 native lease assertions, watched/skipped ordering, canceled-event cleanup, session replacement, queued transfer cleanup and return retries. |
| `dotnet build "Map Server/Map Server.csproj" --no-restore` | Build succeeded with 0 errors. Four existing dependency-advisory warnings remain for DotNetZip 1.16.0 and System.Security.Cryptography.Xml 5.0.0. |
| `git diff --check` over this implementation | Passed; only line-ending conversion notices were reported. |
