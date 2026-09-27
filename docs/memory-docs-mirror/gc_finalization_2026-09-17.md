# Opening Grand Company quest finalization — 2026-09-17

The eighteen requested Com0[lgu]1–4 and Com5[lgu]0–1 routes have implementation
and offline verification prepared. **Every route remains disabled and awaiting
client acceptance.** No live deployment, database update or restart was performed
in this pass. This report supersedes the September 16 missing-encounter findings;
dungeon combat remains separate work.

## Encounters and evidence

Engineering Victory, Mail and Arms Race enter private battles at their native
field markers, at sequence 10. Each requires Funditor + Bestiarius, then
Triarius + Speculator, then Veles. Victory saves sequence 20 before item delivery.
The shared lifecycle handles death, timeout, disconnect, failed entry/return and
partial wave-spawn failure. Actual allocated dead actors count once; duplicate
party callbacks cannot credit a living target. Later waves keep fixed X/Z and the
entry floor. Death during victory settling still fails. Helpers do not inherit
the owner's quest progression. Every spawned target uses the existing one-shot
director lifecycle, so a defeated early-wave enemy cannot respawn mid-battle.
Battle limits now use a monotonic process clock rather than counting Lua
wakeups. Delayed scheduler ticks do not extend the limit, and kill callbacks at
or after the deadline cannot award victory or spawn another wave. A final kill
credited before the deadline keeps its result even if result processing is late.
The clock still starts when the director starts, preserving the existing entry
timing policy; this is not evidence of the exact retail timer display.
The running battle also binds the exact accepted quest and its data object.
Removal, advancement or reacceptance on that player ends the old encounter
promptly, without rewriting the new journal. A legitimate replacement Player
on relog rebinds its current journal for ongoing combat, but an already-yielded
aftermath cannot write to that replacement. The default aftermath rechecks the
captured quest/data/sequence before committing, then saves success or retry
before return. Custom aftermath functions retain their own progression policy.
Player replacement uses C# reference identity because Actor.Equals compares
character IDs; a same-character relog must still rebind the current journal.
The launcher likewise captures the accepted quest/data/sequence before staging
and checks it again after the opening movie, including the authoritative
connected session. A stale source callback cannot publish a new battle.
The three familiar wrappers save a failed-start retry only while that same
combat quest is current. They also respect the launcher's source-event cleanup
result rather than closing another event after a yielded recovery. The three
field trigger wrappers now respect that same result. A regression first
reproduced their second EndEvent closing a replacement conversation after a
failed staged launch; all three now preserve that conversation while still
closing an ordinary refused launch exactly once.

Reviewed sources:

- [Arms Race footage](https://www.youtube.com/watch?v=OxWLJFjNA60), 3:49:
  level-19 Triarius/Speculator and preceding Funditor/Bestiarius defeats;
  5:16: Veles defeated and the objective-complete announcement.
- [Mail footage](https://www.youtube.com/watch?v=gLFUoKLFnHw), 4:20:
  level-19 Funditor/Bestiarius and the thirty-minute announcement; 5:26:
  Triarius/Speculator defeats followed by level-22 Veles's defeat.
  The additional 4:07–4:12 review shows the enemy-group objective; 5:32 shows
  the earned Imperial Letter and completed objective in the log and journal.
- [Mail handoff footage](https://www.youtube.com/watch?v=J3uHi7NtJ8c), 6:26:
  the log records the magitek device design document after Radulf's conversation.
- Engineering's three-wave roster: local
  [eLeMeN ledger](grand_company_quests_elemen_ledger_2026-08-22.md).

**Mail's protection mission is the recorded enemy-wave diversion.** Native
journal Fst row 279 says the conjurers and guards are absent after the battle;
native com0g4 dialogue 33 credits the player's diversion for their escape, and
row 35 refers to the returned conjurers. Together with the on-screen enemy-group
objective, these support the implemented battle rather than the earlier escort
interpretation. No separate allied combat actor or health-based loss condition
is established by this evidence. The source rows, hashes and observations are
recorded in the field-encounter manifest. Exact enemy tuning and client
acceptance remain separate, unresolved checks.

The former Arms Race actor 2109801 is a wolf. Its misleading sqbprivate probe is
retired; the real route uses the field entrance. Native name/weapon bindings
select actors 2280018/2280017/2280019/2280021/2280022, profiles 40101–40105.
Numeric variants, ability lists, stat fallback, formation and facing remain
reconstructed. Native journals Sea 235 and Fst 278 confirm two accompanying
party members for Engineering and Mail; Arms Race's three-player limit remains
a reconstruction choice. These battles use level 22 and thirty minutes. Do not
describe unresolved policy choices as fully recovered retail tuning.

The familiar battles retain peiste 2200708/1359, drake 2202206/1358 and anole
2200205/1360. Their director limits are now thirty minutes. Guarded source and
aftermath scene envelopes retain their explicit native arguments. The launcher
revalidates party readiness after the source movie, including life, level and
configured proximity. Movie/transfer watchdogs still require native proof and
confirmed landing; no broad loading bypass was added.

## Dialogue, items and rewards

| Routes (Limsa / Gridania / Ul'dah) | Reviewed flow | Rewards |
| --- | --- | --- |
| 111401 / 111601 / 111801 | Familiar → checked agreement/oath/letter → officer, with completion retry after evidence consumption | 1760 / 1541 / 1760 EXP |
| 111402 / 111602 / 111802 | Acceptance and seal tutorial, persisted closing-dialogue receipts | 1100 EXP + 250 seals |
| 111403 / 111603 / 111803 | Shop introduction, decline/refused-completion retry | 1100 EXP |
| 111404 | Three waves → saved victory → transceiver → Guincum → Ebrelnaux → officer | 1541 EXP + 500 seals |
| 111604 | Three waves → Imperial Letter → Fulke → Radulf's checked exchange for Magitek Designs → officer | 1541 EXP + 500 seals |
| 111804 | Golden Bazaar battle → Aubrey → C'ndanya/Raaka/Bamponcet's distinct contracts → officer | 1760 EXP + 500 seals |
| 111410 / 111610 / 111810 | Acceptance/intermediaries → landed Toto-Rak entry → owned dungeon NPC proof → Bloisirant → officer | 2160 EXP + 1000 seals |
| 111411 / 111611 / 111811 | Checked access items → Dyrstweitz → owned Captain objective → route-specific proof return → officer | 6231 EXP + 4000 seals |

The item helper verifies possession after the production void AddItem call.
Partial two-item delivery retains the first item and retries only the missing one.
Contract count is derived from three distinct held contracts. Engineering's
earned transceiver can be recovered at Guincum after a full-inventory refusal.
Its Ebrelnaux exchange now saves sequence 40 before removing the transceiver;
the final report retires a leftover item if interruption occurred after that
save. Arms Race likewise saves Aubrey's contract stage and saves the completed
contract stage together with its count, rather than saving only the prior stage.
The further footage/native review corrected the earlier assumption that Mail's
letter was progression-only: item 11000257 is the Imperial Letter, already in
main item SQL. Battle victory saves sequence 20 before delivering it; Fulke
retries a refused delivery, retains the letter and saves the Radulf stage.
Radulf requires the letter (or already-delivered designs from a partial exchange),
retains it if designs delivery fails, and saves sequence 40 before consuming it.
Final report retires any letter left by interruption after that save. Both
handoffs reject a stale quest/data/sequence continuation after dialogue.
This recoverable ordering is a server policy, not a recovered retail packet order.

All 41 direct client-dialogue boundaries in Com0[lgu]1–4 now capture the accepted
quest data and sequence before yielding and recheck the exact connected player,
accepted journal object, data object and sequence after returning. Invalid old
continuations return before further item/reward/progression work or EndEvent,
so they do not close a replacement event. The Lua regression covers each boundary
with changed sequence, replaced data, removed journal and disconnected-player
conditions; the existing compiled guard tests establish the production identity
checks. Each call captures its current stage, including the closing tutorial
dialogue after newly accepting the quest. This does not establish a native
event-generation token for unchanged same-quest/same-stage dialogue replacement.
The shared `CanContinueGrandCompanyQuestDialogue` adapter also validates the
eighteen unaccepted offers: it requires the current connected Player, exact
published offer object, unstarted sequence and absence of an accepted copy.
`Player.AcceptQuest` independently rechecks this identity for the eighteen IDs
before eligibility, packets or persistence. Equal scenario IDs are insufficient.
GM ForceAddQuest retains its explicit diagnostic path. The six shared
dungeon routes now apply the same accepted-journal continuation guard at every
delegate return, including both entry prompts, optional return conversations,
re-entry briefings and final reward scenes. Their helpers propagate invalidation
back to the outer handler so it cannot dispatch another prompt, grant rewards,
refresh NPC flags or close a newer event. Tests cover 51 dungeon dialogue paths
in addition to the 41 direct opening boundaries, with the same four invalidations.
All eighteen offer dialogues additionally cover withdrawn/replaced offers,
disconnection and changed sequence, plus normal accept/decline decisions.
The dispatcher source review found existing disconnect cancellation in
SessionCleanup, exact-wait claiming in LuaEngine.OnEventUpdate, and stale-wait
replacement in EventStarted/AddWaitEventCoroutine. Those shared dispatch paths
were not changed; the new offer checks cover an already claimed callback and
prevent a rejected stale offer continuation from closing a replacement event.

Reward flags fit the existing 24-bit database field: seal receipt 22, EXP receipt
23, existing acceptance receipt 21. Imperial Devices saves its seal receipt
**before** yielding for closing dialogue. Seal caps preserve the report/items.
A persisted EXP receipt permits completion retry after evidence consumption if
CompleteQuest refused its final delivery. Tests cover ordinary relog, interrupted
dialogue and refused delivery, **not an atomic inventory/quest transaction across
a process crash**. Ordinary saves still use the existing player save cycle;
critical battle and Captain receipts explicitly save before delivery.

Native old-numbered journal markers now identify officers and battlefields.
Sthalmann placeholder rows are not presented as shop locations; those shop
steps retain their real NPC flags.

## Six dungeon connections

Native journals Sea 246/252, Fst 292/297 and Wil 349/356 explicitly make each
dungeon's three city variants mutually exclusive while active. The new
GrandCompanyOpeningQuestRules gate suppresses sibling offers and rechecks the
live journal at acceptance, including a stale offer after dialogue. Normal
AddQuest also observes it; ForceAddQuest remains the explicit diagnostic bypass.
The two dungeon families are independent. Acceptance refreshes offers; existing
completion, abandonment and login paths recompute availability. The exclusion
filter only clears offer bits, so it cannot override disabled routes, level or
prerequisite gates. Existing journal routes, including old/GM-created conflicts,
remain playable. A completed variant is not itself an exclusion of its siblings.

The [dungeon acceptance review](gc_dungeon_acceptance_2026-09-17.md) corrects
all six main-SQL prerequisites to their company's seal tutorial
(111403/111603/111803). Into the Dark is independent of Imperial Devices.
Native enlistment notices also restrict new offers across all eighteen requested
routes to the player's chosen company after pledging. Unpledged recruits retain
all companies; the twelve field/tutorial routes do not gain a dungeon-family
exclusion. Later enlistment and promotion quest rules remain separately scoped.
Current allegiance is rechecked at acceptance; existing journal progress stays.
Exact prerequisite mapping uses secondary legacy listings because the preferred
Elemen archive was unavailable. Client acceptance and any custom live optional
prerequisite-table overlays remain unverified.

Toto-Rak keeps its existing level-25, combat-discipline, 2–4 player, sixty-minute
entry manager. After the six-second NPC settling delay, entry checks the exact
public source/NPC, current session, life, event slot and transfer state. A refused
continuation is handled without closing a newer event. Entry credit waits for
confirmed landing and is saved. Quest callbacks/database writes occur outside
the instance-list lock, after revalidating its snapshot.

Moogle and A-Ruhn steps require the exact published NPC in the active private
Toto-Rak instance, checked before and after dialogue. Expiry, departure and
retired instances cannot award proof. A cleared duty retains its existing
voluntary exit and stopped clock. Inside sequences expose Bloisirant for retry
through the normal re-entry policy if the player left without proof.
Toto-Rak dialogue progression now saves immediately. Limsa's petition/urn and
urn/accumulator exchanges save the next sequence before removing the old item;
later earned stages retire any leftover petition or urn. Final reward proof is
retained while seals are capped.

Darkhold keeps its level-45, 4–8 player, sixty-minute entry and Captain's Quarters
objective. The owned Captain saves receipt flag 20 before delivering proof.
A full-inventory refusal can be retried with Dyrstweitz after exit/relog without
another kill. Limsa receives 11000270 and consumes access 11000269; Gridania
receives 11000264; Ul'dah 11000266. Return NPCs consume their own proof, then the
officer pays once. No dungeon combat, objective identity or homes were changed.
Both Dyrstweitz's receipt recovery and the intermediary proof reports save their
new stage before item retirement. Final reports can clean up proof remaining
after that save, even when reward delivery is still blocked by the seal cap.
This prevents consumed evidence from stranding an older saved stage; it does not
turn the separate database writes into an atomic process-crash transaction.

## Main SQL and unresolved floors

All new data is in main SQL: three trigger classes/appearances, spawns 3237–3239
and five combat profiles. The eleven earlier public NPC restorations remain in
main SQL. No migration-only data is needed by the Python updater.
An optional scoped install export is prepared at
.tmp/gc-finalization/install-gc.sql, including the eleven existing native
appearance rows; it has not been applied. Its exporter validates the main SQL
before writing the local artifact.

Reproduce with:

    python tools/build_gc_field_encounters.py build
    python tools/build_gc_field_encounters.py check
    python tools/restore_gc_opening_npcs.py check

Evidence: Data/quest_npcs/gc_field_encounters.json.

| Code | Zone | Native X | Native Z | Provisional Y | Height support |
| --- | --- | --- | --- | --- | --- |
| com0l4 | 130 | 983.919983 | -1566.650024 | 53.059307 | Nearest sample 254.735 yalms away; unresolved |
| com0g4 | 152 | -636.609985 | -2031.650024 | 18.228950 | Sample 1.078 yalms away; not exact floor capture |
| com0u4 | 171 | 1152.500000 | -952.159973 | 287.453100 | Sample 49.028 yalms away; unresolved |

Use **!gcbattle goto CODE**, correct feet height, then **!gcbattle capture CODE**.
Goto preserves current Y/facing. Capture rejects wrong zones, more than five
yalms X/Z displacement, private maps, open events and nonfinite coordinates.
It records evidence, not SQL or quest progress. Walk formation footprints too:
using the entrance Y for all five actors is still a provisional flat-floor policy.
Preserve the earlier eleven NPC captures and Vairemont's 175.228470 feet Y.
User navigation recordings were not edited.

## Offline results

- Isolated Release build: .tmp/gc-finalization/Map Server.dll.
  SHA256 15CDABD24EB1FCEE662AEFAD4A86021D199B384272E9B6474721595F6D474025.
- Grand Company Lua acceptance/handoff/item/reward tests: **2,431 assertions**.
  Includes 41 direct and 51 dungeon accepted-journal dialogue paths with four
  invalidations each, eighteen current/stale offer dialogues, valid/cancelled dungeon entry decisions, and evidence
  save-before-consumption and leftover-retirement checks, plus all three field
  triggers' refused, staged-failure and successful launch paths.
  The delayed Toto-Rak continuation uses a host-resumed coroutine, matching the
  production scheduler; both admission and refusal preserve the source arguments.
- Job/GC lifecycle: **45 cases / 1,201 assertions**; native lease 51, transition 31,
  scene contracts 49, compiled scene guards 61, compiled transition guards 35,
  compiled dungeon/clock/quest-identity guards 33, NPC SQL/visibility 197, both GM floor helpers.
- Compiled offer identity: **396 assertions**, including the actual AcceptQuest
  rejection path for every requested ID before any database or packet work.
- Compiled opening-quest acceptance: **1,427 assertions** across all eighteen routes,
  early/intermediate/report sequences, stale offer snapshots, removed journal
  slots, independent families, disabled offer bits and existing conflicting journals.
  Includes recruit/enlisted/invalid allegiance, retained accepted foreign routes,
  field/tutorial coexistence, and the six canonical dungeon main-SQL rows through
  the production prerequisite evaluator.
- All eighteen requested quest scripts load with production search paths.
  Native method/arity, availability, field SQL generation and four NPC generator
  regression tests pass.
- Current main-SQL inventory: eighteen quests, zero enabled, no missing public
  spawn/client-class binding among the twenty-five public NPC IDs. Evidence is
  in outputs/gc-finalization-audit-20260917/inventory.json and public-npcs.csv;
  the earlier September 16 inventory is preserved. Reproduce with
  `python tools/audit_gc_opening_quests.py --output outputs/gc-finalization-audit-20260917`.
  This catalog check does not certify exact NPC locations or client rendering.
- Ferry/airship transport: **1,139 assertions** against the prior isolated server
  DLL A29120B58815B2DD22CBCFBC9AC6B0D63232EECD0EEE4A298654076FBCD5387C.
- Darkhold static validator passes; **2,346 production encounter checks** and
  **84 traversal checks** pass, using that same prior DLL. The subsequent C#
  changes expose the monotonic clock, exact quest/data and Player identity checks,
  the connected-session quest continuation guard and dungeon-variant offer rules;
  the dungeon combat and transport implementations did not change.
- The broader Toto-Rak validator stops on an existing pursuit assertion:
  it expects IgnoreSpawnLeash=1 while unchanged TotorakEncounter.lua explicitly
  chooses 0 and the finite shared leash. Both files match the pre-task Git state.
  This is a validation gap, not a green complete dungeon-combat suite.
- Existing dependency warnings: DotNetZip and System.Security.Cryptography.Xml.
  No package change was made.

## Client acceptance — all eighteen routes pending

Install the matching DLL/Lua/main-SQL state together at a safe server restart.
Verify restored NPCs and all three battlefield floors first. Use
`!questcomplete ID SEQUENCE` to stage one disabled route at a time; its force-add
path bypasses the offer gate. Plain `!quest ID add` cannot add disabled routes.
Staging is not evidence that acceptance, prerequisites or skipped handoffs passed.
The [client command sheet](gc_client_commands_2026-09-18.md) provides all eighteen
story starts, the six battle shortcuts, dungeon entry checkpoints and NPC positions.

For every route record quest sequence, inventory and seals before/after each
handoff. Test full inventory, partial two-item delivery, seal cap, relog between
steps and repeated closing dialogue. For all six battles test watched/skipped
source and aftermath where present, victory, every wave, death (including final
kill settling), timeout, disconnect/relogin, failed entry and failed return.
Verify helper isolation and all private actors retire. Dungeon variants also
require normal-party admission, failure retaining sequence, owned objective/NPC
credit, inventory-refused proof recovery and return rewards. GM solo entry does
not validate normal-party admission. Verify the corrected tutorial unlocks and
pre/post-enlistment offers through normal NPC acceptance. Verify each
family's sibling offers disappear on acceptance and recover after completion,
abandonment and relog, without hiding the player's accepted route.

The pass condition after each movie/transfer is **movement and the next quest
interaction**, with no stuck Now Loading, stale event, black screen or crash.
Enable each route only after its recorded acceptance. Native playback alone is
insufficient. No live acceptance has occurred in this pass.
