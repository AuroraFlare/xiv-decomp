# Opening Grand Company quests: readiness audit

Historical baseline: the implementation/NPC findings below are superseded by
[the September 17 finalization report](gc_finalization_2026-09-17.md) and
[NPC restoration](gc_npc_restoration_2026-09-16.md). Client acceptance is pending.

These 18 quests are **not ready for end-to-end player use**. All remain disabled
in the new-offer allowlist. The `Implemented` labels describe existing handlers;
they do not certify NPC availability, placement, native rendering, or completion.
This audit excludes dungeon combat reconstruction, but includes the public
handoffs before and after those dungeons. No live quest playthrough or live
database comparison was performed in this pass.

## Corrections made

The three familiar quests and Arms Race required `gc_sqb_quest` without its
directory. Their four directors likewise required `gc_sqb_runtime` without its
directory. `LuaEngine.LoadGlobals` searches the scripts root, not each caller's
directory. Corrected those eight imports. The earlier GC runtime harness added
a quest-directory search path and therefore hid the quest-load failure.

The same four directors returned nonexistent client class paths such as
`/Director/Quest/QuestDirectorGcCom0l1`. `Director.StartDirector` copies `init()`'s
return into the client actor bind; this is independent of the server Lua filename.
They now return the recovered classes beneath
`/Director/Quest/SimpleQuestBattle/`: `QuestDirectorCom0l101`,
`QuestDirectorCom0g101`, `QuestDirectorCom0u101`, `QuestDirectorCom0u401`.
Their recovered files register `SimpleQuestBattleBaseClass` as the parent.
Server script filenames, encounter identities, rewards, and coordinates are unchanged.

The added regressions load all 18 quest wrappers with production module paths and
execute the four director `init()` methods, checking their advertised paths against
the recovered native assets. These fix actual loading/binding defects, but are
not evidence that the client has successfully played the associated scenes.

## Quest-by-quest result

“Dialogue candidate” means its required public NPC has a main-SQL spawn and usable
client class and its dialogue flow exists. It does not mean live acceptance.
Names below use the English display-name table; older guides sometimes romanize
Quiliane/Yuhelmeric differently.

| Quest | Result outside dungeon combat |
| --- | --- |
| 111401 — The Price of Integrity | **Blocked:** Urianger 1500204 has no usable class or public spawn. Familiar battle loading/binding corrected; opening and aftermath need live verification. |
| 111402 — Testing the Waters | Dialogue candidate; Guincum exists. Native seal tutorial/widget flow, no NQ battle/warp. Test seal-cap rejection and widget close. |
| 111403 — Seals for the Whorl | Dialogue candidate; Grizzly Gnat exists. Shop introduction, no NQ battle/warp. |
| 111404 — Engineering Victory | **Blocked:** sequence 10 has no encounter/progression; Ebrelnaux 1060011 also lacks a usable class/spawn. Later finale call exists but is not normally reachable. |
| 111410 — Imperial Devices (Limsa) | Guincum, Zerig and Bloisirant exist; public and dungeon-entry/report handlers exist. Dungeon flow remains separate. Closing-dialogue reward retry issue below. |
| 111411 — Into the Dark (Limsa) | **Blocked before dungeon:** Quiliane 1001635 has no usable class/spawn; also needed for return handoff. Hasthwab and Dyrstweitz exist. |
| 111601 — Breaking the Seals | **Blocked:** Ailith 1001628 and Urianger 1500314 have no usable class/spawns. Familiar loading/binding corrected; scene validation pending. |
| 111602 — Why Did It Have to Be Snakes | Dialogue candidate; Fulke exists. Native seal tutorial/widget, no NQ battle/warp. Test cap rejection/widget close. |
| 111603 — Adder's Nest Egg | Dialogue candidate; Haurtelle exists. Shop introduction, no NQ battle/warp. |
| 111604 — The Mail Must Get Through | **Blocked:** sequence 10 has no protection encounter/progression. Fulke and Radulf exist. Later finale call exists. A moving escort is not established by recovered evidence. |
| 111610 — Imperial Devices (Gridania) | Fulke and Bloisirant exist; entry/report handlers exist. A-Ruhn-Senna and moogle steps are inside the excluded dungeon scope. Reward retry issue below. |
| 111611 — Into the Dark (Gridania) | **Blocked before dungeon:** Yuhelmeric 1000370 has no usable class/spawn; also needed after return. |
| 111801 — Career Opportunities | **Blocked:** Urianger 1060009 has no usable class/spawn. Taylor exists. Familiar loading/binding corrected; scene validation pending. |
| 111802 — Kindling a Flame | Dialogue candidate; Aubrey exists. Native seal tutorial/widget, no NQ battle/warp. Test cap rejection/widget close. |
| 111803 — Burning a Hole in One's Pocket | Dialogue candidate; Rahz exists. Shop introduction, no NQ battle/warp. |
| 111804 — Arms Race | **Blocked:** all three contract NPCs lack usable classes/spawns. Private fight currently copies Aubrey's area/current player position, not the Golden Bazaar encounter location. Loading/binding corrected; encounter is still a reconstruction. |
| 111810 — Imperial Devices (Ul'dah) | Aubrey, Nuala and Bloisirant exist; public and entry/report handlers exist. Dungeon flow remains separate. Reward retry issue below. |
| 111811 — Into the Dark (Ul'dah) | **Blocked before dungeon:** Vairemont 1000586 has no usable class/spawn; also needed after return. |

## NPCs and placement evidence

The reviewed routes require **25 distinct public NPC IDs**. Fourteen have public
spawn rows and usable client classes in the main SQL. Eleven have **both no public
spawn and an empty class path with propertyFlags 0**:

| NPC | Actor ID(s) | Affected quests |
| --- | --- | --- |
| Urianger | 1500204 / 1500314 / 1060009 | 111401 / 111601 / 111801 |
| Ailith | 1001628 | 111601 |
| Ebrelnaux | 1060011 | 111404 |
| C'ndanya / Raaka Maaka / Bamponcet | 1001632 / 1001631 / 1001633 | 111804 |
| Quiliane | 1001635 | 111411 |
| Yuhelmeric | 1000370 | 111611 |
| Vairemont | 1000586 | 111811 |

The current wrappers only call `SetENpc` for these actors. Its default
`isSpawned` is false, and setting an interaction flag does not supply a world
position or materialize a missing actor. The reviewed launcher/director scripts
do not create these handoff NPCs dynamically. A cinematic actor with the same
name is not a replacement for the missing interactable actor.

The complete main-SQL XYZ, rotation, zone and applicable outdoor map conversion
are recorded in [public-npcs.csv](../outputs/gc-opening-audit-20260916/public-npcs.csv).
Bloisirant converts to approximately (39.396,44.515), consistent with the guide's
(39,44) entrance area; Dyrstweitz converts to (36.345,25.337), consistent with
(36,25). These support their broad locations, **not collision, floor height or
interaction acceptance**. The remaining existing coordinates were inventoried,
not certified as retail positions. Fight-location guide coordinates must not be
reused as a contact NPC's exact XYZ.

Raw `quest_marker.csv` is not sufficient to fill these gaps: many requested
marker rows alias the same unrelated Baderon coordinate, and other entries
refer to different route data. Scene-local actor coordinates likewise require
a proven world registration before they can become spawn coordinates.

Reproduce the catalog inventory with `python -B tools/audit_gc_opening_quests.py`.
[inventory.json](../outputs/gc-opening-audit-20260916/inventory.json) pins input
hashes and maps each quest to its missing public IDs. This is an audit report,
not a passing availability validator. No SQL or live database data was changed.

## Cutscene and transition assessment

The recovered opening delegates are `Com0l1.processEvent_020`,
`Com0g1.processEventUrianger`, and `Com0u1.processEvent_020`. Each current launcher
passes boolean **false**, selecting the native AfterWarp branch. Allocation and
target creation precede the movie. The original NPC event remains open until
the content transfer handles its close; its asynchronous staging/actor-table
reset cannot be certified by a Lua mock.

The success delegates are `processEvent_030`, `processEventUriangerMore`, and
`processEvent_030`. They play `COM0l110`, `COM0G110`, and `COM0U110` respectively,
then use AfterWarp fades. Their recovered parameter is forwarded as an NQ
payload; all three server configurations omitted it at the initial audit.
The follow-up recovered register-1 consumers and their serialized NumberClip
initial values. Current configurations explicitly use those native baselines:
Limsa 1, Gridania 0, Ul'dah 1. This is a documented reconstruction choice;
the original familiarity predicate and personalized greeting selection remain
unverified. **Neither the earlier nil nor the new baseline has live acceptance.**
The director notice event already has blocking conditions; the ferry attendant's
nonblocking-notice defect is not directly applicable here.

Existing lifecycle coverage includes watched/skipped mock replies, failed
allocation/publication, session replacement, helper departure, death/timeout,
staging expiry, transfer reservations, and repeated failed exits. The post-battle
runtime retains its event and scene actors through queued return and retries
failed exits. These are useful server checks, not native-rendering tests.

The original audit found an **admission risk**: `gc_sqb_quest.lua` treated a
nonthrowing `DoZoneChangeContent` invocation as queued. The production method
returns void and can refuse a reservation or staged transition without throwing.
The pre-movie/post-movie guards reduce that race, but do not prove queue admission.
The content lease protects pending transfers and drains orphan areas; it does
not certify recovery of a public player's completed AfterWarp movie after a
silent refusal. This must be resolved/tested before promising no loading stalls.
The follow-up [shared transition fix](gc_quest_transition_safety_2026-09-16.md)
now uses explicit admission, acknowledged landing and scoped source recovery.
That report distinguishes the tested server safeguards and native scene baseline
from the still-open retail familiarity predicate and native-client acceptance.
No quests were enabled.

Engineering Victory, The Mail Must Get Through and Arms Race use default-fade
finale branches with numeric `0`, `0,0`, and `0`. Their wrapper argument shapes
match the recovered branches. This does not make the unfinished steps leading
to those scenes playable.

The six Com5 dungeon wrappers use dialogue/entry requests rather than their own
NQ battle movies. The dungeon director owns arrival scenes, widgets, and cleanup.
Correct entry-request arguments alone cannot validate the full dungeon transition.

Separate retry defect: all three Imperial Devices completions call `AddGCSeals`
before yielding for the closing dialogue, without the persisted reward checkpoint
used by the newer GC tutorials. Re-entering that reward step after an interrupted
dialogue can grant the 1,000 seals again. This remains open; it is not a loading
fix or evidence of successful quest completion.

## Verification and remaining acceptance

- All 18 wrappers load with production module paths and expose `onTalk`.
- Job/GC lifecycle: **20 cases / 331 assertions**, plus **48 native lease assertions**.
- Existing Grand Company runtime suite: **199 assertions passed**.
- GC bytecode audit regression: **8 tests passed**.
- Grand Company static audit and quest availability validator passed; zero of
  these 18 quests enabled.
- A NuGet vulnerability-feed lookup emitted NU1900 while offline; compilation
  and the test executables completed. No server restart was performed.

Before enabling a battle route: resolve its missing actors/placements and the
open admission/payload contracts, then test opening and aftermath both watched
and skipped, victory, death, timeout, disconnect/relogin and failed return. A
successful run must include destination readiness and player control/movement,
not merely a movie-completion reply. Tutorial acceptance must include seal-cap
rejection and widget cleanup. Imperial Devices also needs its reward-retry fix.

Source companions:
[native mission decomp](grand_company_missions_bytecode_decomp_2026-09-04.md),
[expanded native review](grand_company_requested_decomp_2026-09-07.md),
[Elemen route ledger](grand_company_quests_elemen_ledger_2026-08-22.md), and
[earlier transition audit](grand_company_quests_cutscene_transition_audit_2026-08-31.md).
