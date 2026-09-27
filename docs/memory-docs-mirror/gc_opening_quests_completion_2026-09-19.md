# Opening Grand Company quests: completion audit — 2026-09-19

This audit covers the eighteen requested 1.0 opening Grand Company quests:
111401–111404, 111410–111411, 111601–111604, 111610–111611, 111801–111804
and 111810–111811. It reviews the current source after the September 17
finalization rather than repeating the superseded September 16 readiness gaps.

All eighteen routes have an offline implementation and focused regression
coverage. The initial audit found no missing encounter, handoff, item, reward or
persistence behavior. The later September 19 captures resolved the three field
trigger floors and supplied nearby recorded floor support for all nine distinct
formation slots. All eighteen remain disabled for ordinary offers until recorded
client playthrough acceptance; this review did not deploy SQL, restart a server
or run a live client.

The fresh main-SQL/source inventory at
[`outputs/gc-opening-audit-20260919/inventory.json`](../outputs/gc-opening-audit-20260919/inventory.json)
contains all eighteen quest rows, reports zero enabled routes and finds no missing
public actor class or spawn among the twenty-five public NPC IDs. The restored
homes are user-reviewed standing positions or evidence-scoped reconstructions as
documented in [the NPC restoration report](gc_npc_restoration_2026-09-16.md);
the inventory alone does not establish native rendering, collision or retail
actor coordinates.

## Quest status

“Offline complete” below means the current server route, guards and regression
contracts are present. It does not mean that native scenes, widgets, transfers,
NPC presentation or the complete route have passed in the 1.0 client.

| Quest | Offline implementation and evidence | Remaining acceptance |
| --- | --- | --- |
| **111401 — The Price of Integrity** | Restored Guincum/Walcher/Urianger path; private peiste familiar; guarded `COM0L105` opening and `COM0l110` aftermath; signed-agreement handoff; 1,760 EXP completion receipt. | Watch and skip both native scenes, confirm private target/return, restored Urianger presentation and dialogue, death/timeout/relog/full-inventory retries, movement after each transfer. |
| **111402 — Testing the Waters** | One-NPC seal tutorial with persisted 250 Storm Seal and 1,100 EXP receipts. | Confirm native tutorial/widget opens and closes, cap refusal leaves the report retryable, repeated closing dialogue pays once. |
| **111403 — Seals for the Whorl** | Grizzly Gnat shop-introduction conversation and 1,100 EXP completion retry. | Confirm native shop-introduction result, decline/retry and completion in the client. Placeholder Sthalmann marker rows remain intentionally unused. |
| **111404 — Engineering Victory** | Native-X/Z sequence-10 field entrance with exact-marker captured Y; explicit enemy Y from three frozen walking supports; evidence-backed Funditor/Bestiarius, Triarius/Speculator and Veles waves; saved victory, recoverable transceiver, Guincum/Ebrelnaux exchange; 500 seals and 1,541 EXP. | Test all waves in the client, party/helper isolation, death/timeout/relog/full inventory and both public handoffs. Formation X/Z, facing, stats and abilities remain authored. |
| **111410 — Imperial Devices (Limsa)** | Guincum/Zerig/Bloisirant route; guarded Toto-Rak admission; owned moogle proof; petition → urn → accumulator exchanges save before consumption; 1,000 seals and 2,160 EXP. | Normal 2–4-player entry, native entry dialogue/transfer, owned moogle interaction, voluntary exit/re-entry, inventory and seal-cap retries, final movement/interaction. Toto-Rak combat is a separate system. |
| **111411 — Into the Dark (Limsa)** | Guincum/Hasthwab/Quiliane/Dyrstweitz handoffs; access item; owned Captain receipt and proof recovery; 4,000 seals and 6,231 EXP. | Normal 4–8-player entry, restored Quiliane rendering/dialogue, Captain objective/proof recovery, return handoff, cap/full-inventory/relog paths. Darkhold combat is reviewed separately. |
| **111601 — Breaking the Seals** | Restored Fulke/Ailith/Urianger path; private drake familiar; guarded `COM0G105` opening and `COM0G110` aftermath; Ailith's oath; 1,541 EXP completion receipt. | Watch/skip scenes, validate restored Ailith and Urianger presentation, private target/return, death/timeout/relog/full-inventory retries and post-transfer control. The reconstructed aftermath number baseline still needs client acceptance. |
| **111602 — Why Did It Have to Be Snakes** | One-NPC seal tutorial with persisted 250 Serpent Seal and 1,100 EXP receipts. | Confirm native tutorial/widget lifecycle, seal-cap refusal and pay-once closing-dialogue retry. |
| **111603 — Adder's Nest Egg** | Haurtelle shop-introduction conversation and 1,100 EXP completion retry. | Confirm native shop-introduction result, decline/retry and completion. Placeholder Sthalmann marker rows remain intentionally unused. |
| **111604 — The Mail Must Get Through** | Native-X/Z three-wave enemy diversion with exact-marker captured Y and explicit enemy Y from frozen walking supports; saved Imperial Letter delivery; Fulke/Radulf checked exchange for Magitek Designs; 500 seals and 1,541 EXP. Native journals/dialogue and footage support a diversion, not an allied escort. | Test all waves, item refusal/partial exchange/relog and final rewards in the client. Do not add an unevidenced escort actor or health-loss rule. Formation X/Z, facing, stats and abilities remain authored. |
| **111610 — Imperial Devices (Gridania)** | Fulke/Bloisirant route; guarded Toto-Rak admission; owned A-Ruhn-Senna and moogle steps; recording-plate proof; 1,000 seals and 2,160 EXP. | Normal-party entry, both owned dungeon NPCs, re-entry/exit, native dialogue/transfer, proof and reward retries. Toto-Rak combat remains separate. |
| **111611 — Into the Dark (Gridania)** | Fulke/Yuhelmeric/Dyrstweitz handoffs; owned Captain receipt and proof recovery; 4,000 seals and 6,231 EXP. | Normal-party entry, restored Yuhelmeric rendering/dialogue, owned Captain proof and return/reward retry paths. Darkhold combat remains separate. |
| **111801 — Career Opportunities** | Restored Aubrey/Taylor/Urianger path; private anole familiar; guarded `COM0U105` opening and `COM0U110` aftermath; Taylor's letter; 1,760 EXP completion receipt. | Watch/skip scenes, validate restored Urianger presentation, private target/return, death/timeout/relog/full-inventory retries and post-transfer control. |
| **111802 — Kindling a Flame** | One-NPC seal tutorial with persisted 250 Flame Seal and 1,100 EXP receipts. | Confirm native tutorial/widget lifecycle, seal-cap refusal and pay-once closing-dialogue retry. |
| **111803 — Burning a Hole in One's Pocket** | Rahz shop-introduction conversation and 1,100 EXP completion retry. | Confirm native shop-introduction result, decline/retry and completion. |
| **111804 — Arms Race** | Native-X/Z three-wave Golden Bazaar fight; nearby accepted capture Y applied 0.826080 yalms to native X/Z; explicit enemy Y from frozen walking supports; Aubrey stage; restored C'ndanya, Raaka Maaka and Bamponcet contacts; three recoverable contracts; 500 seals and 1,760 EXP. | Validate the authored three-player allowance, waves/tuning, all three restored NPCs, distinct contract retries and final reward in the client. Formation X/Z, facing, stats and abilities remain authored. |
| **111810 — Imperial Devices (Ul'dah)** | Aubrey/Nuala/Bloisirant route; guarded Toto-Rak admission; owned moogle proof with partial two-item delivery; 1,000 seals and 2,160 EXP. | Normal-party entry, native transfer/dialogue, owned moogle, partial proof retry, re-entry/exit and capped final reward. Toto-Rak combat remains separate. |
| **111811 — Into the Dark (Ul'dah)** | Aubrey/Vairemont/Dyrstweitz handoffs; access item; owned Captain receipt and proof recovery; 4,000 seals and 6,231 EXP. | Normal-party entry, restored Vairemont rendering/dialogue, Captain proof and return/reward retries. Vairemont's marker-X/Z adjustment retains the captured feet Y but has no separate client floor check. Darkhold combat remains separate. |

## Field-floor evidence

The September 19 capture and walking pass resolved the offline floor layer. Main
SQL retains native trigger X/Z and uses accepted capture Y: 64.456551 for
`com0l4`, 18.128950 for `com0g4` and 311.773834 for `com0u4`. The first two are
exact-X/Z captures. The Ul'dah capture was 0.826080 yalms from the marker, so its
Y is documented as nearby support applied at native X/Z.

All five targets now carry explicit Y. Each of the three distinct authored
formation X/Z slots uses the nearest eligible node from a frozen walking
recording; support ranges from 0.906554 to 2.955584 yalms. The runtime therefore
does not substitute the entrant's Y in any wave. Captured player rotations are
excluded, and enemy facing remains the authored `math.pi`.

The exact captures, snapshot hashes, excluded vertical-positioning samples and
all nine node selections are documented in
[the field-battle floor review](gc_field_battle_floor_review_2026-09-19.md).
They support floor height at retained authored X/Z; they do not recover retail
enemy XYZ or establish client combat acceptance.

## Safety and persistence disposition

The code review confirmed the shared safeguards described by
[the September 17 finalization](gc_finalization_2026-09-17.md):

- all direct and dungeon dialogue continuations bind the connected player,
  accepted quest object, quest-data object and sequence before applying progress;
- battle launch and aftermath bind the accepted journal and authoritative session;
- item delivery verifies actual possession after the void `AddItem` call, with
  partial two-item retry where required;
- handoff stages save before retiring evidence, and final reports can retire a
  leftover item after an interrupted saved exchange;
- seals and manual EXP use persisted receipt bits, so an interrupted closing
  dialogue cannot pay them twice during ordinary retries;
- Toto-Rak and Darkhold proof comes from the owned private-instance NPC/objective;
  public lookalikes cannot advance these routes;
- the two dungeon families enforce mutually exclusive city variants only while a
  sibling is active, and allegiance is rechecked at ordinary acceptance.

These are server-side offline guarantees. The separate writes for currency, EXP,
quest data and inventory are not an atomic transaction across a process crash.
No evidence supports changing that shared persistence architecture in this pass.

## Reproduction and results

Run from the repository root unless a command changes directory explicitly:

```powershell
dotnet run --project tools/grand-company-runtime-tests/GrandCompanyRuntimeTests.csproj -c Release --no-restore
dotnet run --project tools/job-gc-lifecycle-tests/JobGcLifecycleTests.csproj -c Release --no-restore
python -B tools/validate_grand_company_quests.py
python -B tools/validate_quest_availability.py
python -B tools/build_gc_field_encounters.py check
python -B tools/restore_gc_opening_npcs.py check
python -B tools/audit_gc_opening_quests.py --output outputs/gc-opening-audit-20260919
Push-Location tools
python -B -m unittest test_build_gc_field_encounters.py
python -B -m unittest test_restore_gc_opening_npcs.py
python -B -m unittest test_gc_mission_decomp.py
python -B -m unittest test_job_gc_decomp.py
Pop-Location
```

Fresh results for this audit:

- Grand Company Lua runtime: **2,437 assertions passed**, including 41 direct,
  51 dungeon and 18 offer dialogue boundaries with four stale-continuation
  invalidations each.
- Job/GC lifecycle: **46 cases / 1,240 assertions passed**; the same run reports
  native lease 51, transition 31, scene 49 and NPC SQL/visibility 197. No external
  server assembly was selected, so optional reflection checks against a separately
  built DLL were not part of this fresh run.
- Grand Company static audit passed: 102 SQL rows, 69 named wrappers, 69 ledger
  rows, 69 seal rewards, 685 recovered methods and 227 verified server
  declarations; no route is exposed by the audit gate.
- Quest availability validation passed with all eighteen routes still outside the
  ordinary offer allowlist.
- Field generator check passed: five combat profiles, three reviewed trigger
  heights and fifteen explicit target placements; client acceptance remains
  pending. Its **3 focused tests** cover frozen evidence, fail-closed floor drift
  and generated explicit-Y/facing contracts.
- NPC restoration check passed: eleven native appearance/binding rows and eleven
  reviewed public spawns, with no unpublished capture left in the manifest.
- Python regressions passed: NPC restoration **4**, mission decomp **8**, job/GC
  decomp **14**.
- Fresh inventory: **18 quests, 0 enabled, 0 blocked public actor IDs**.

The client procedure and commands remain in
[the September 18 command sheet](gc_client_commands_2026-09-18.md). A route is
ready to enable only after a recorded full playthrough demonstrates scene/widget
behavior, transfer completion with player movement, the next interaction, combat
failure/retry paths, inventory and seal-cap handling, relog behavior and pay-once
completion. GM staging or native playback by itself is not that acceptance.
