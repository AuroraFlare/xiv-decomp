# Quest Availability Archive Audit — 2026-08-13

## Result

`Data/scripts/quests/quest_availability.lua` contains all 524 rows from
`Data/sql/gamedata_quests.sql` exactly once. The 224 rows whose SQL title is
`[en]` are present under visible `patch_unknown_or_internal` (or equivalent
generic-event) sections and are commented out by default. They can still be
enabled one at a time by removing the leading `--`. The matching broad category
switch in `Data/map_config.ini` must also be `true`; the category switch and
per-ID Lua line are intentionally additive safety gates.

Every row now has an inline implementation and mechanic annotation. The
implementation audit uses the current Lua, C#, director, spawn, mob, item, and
route data rather than treating every surviving script as complete:

- `Implemented` means the repository has a supported, playable server route,
  or the row intentionally owns a persistent system/menu surface.
- `Partially implemented` means meaningful handwritten code exists, but a
  required actor, battle/content handoff, shortcut, or runtime-proof gap remains.
- `Not implemented` means the row has no local Lua route or only a generated /
  reference template.

This is a server-readiness label, not a claim of byte-perfect retail parity. An
accept/reward wrapper or a script that skips its retail objectives is not marked
implemented merely because it can call `CompleteQuest`.

Current annotation totals:

| Annotation | Rows |
| --- | ---: |
| Implemented | 78 |
| Partially implemented | 80 |
| Not implemented | 366 |
| `[en]` rows disabled by default | 224 |

The count includes 10 static system/menu owners and 68 playable quest/tutorial/
event routes. The 224 `[en]` rows remain disabled regardless of implementation
status; a recovered working route does not make an untranslated offer safe to
enable by default.

### Implementation status by Lua category

| Lua category | Implemented | Partial | Not implemented | Total |
| --- | ---: | ---: | ---: | ---: |
| `main_story` | 13 | 2 | 6 | 21 |
| `class_quests` | 0 | 1 | 101 | 102 |
| `job_quests` | 0 | 0 | 42 | 42 |
| `grand_company_quests` | 14 | 10 | 78 | 102 |
| `world_quests` | 9 | 3 | 24 | 36 |
| `side_quests` | 29 | 52 | 82 | 163 |
| `special_quests` | 0 | 4 | 5 | 9 |
| `primal_quests` | 0 | 0 | 9 | 9 |
| `seasonal_quests` | 0 | 8 | 16 | 24 |
| `tutorial_quests` | 3 | 0 | 3 | 6 |
| `system_content_always_on` | 10 | 0 | 0 | 10 |
| **Total** | **78** | **80** | **366** | **524** |

### Main-scenario result

The main-scenario labels now match the repository's intended cutoff:

- IDs 110001–110014 are implemented except `Court in the Sands` (110010).
- `Court in the Sands` is partial: its long quest route exists, but its Coliseum
  fight / kill-to-post-fight-cutscene handoff is still the unresolved piece.
- `Toll of the Warden` (110015) is partial pending end-to-end route proof.
- `Forever Taken` through `Futures Perfect` (110016–110019) are reference
  scaffolds, and Man502/Man504 (110020–110021) are untranslated/reference-only.

The C# progression cap remains after `Together We Stand` (110014), which agrees
with this audit. The implementation pass did not change any user's commented or
uncommented quest choices.

### Important category findings

- The only materially handwritten class route is `The House Always Wins`
  (110060), and it explicitly skips two duties with temporary sequence jumps;
  it is partial. The other 101 class rows and all 42 job rows are generated or
  reference templates, so they are not implemented.
- The three `Imperial Devices` variants (111410/111610/111810) use the dedicated
  Toto-Rak quest implementation and are marked implemented. `The Mail Must Get
  Through` (111604) is partial because the current script skips its escort.
  Generic GC wrapper rows, including Ifrit/Garuda/Nael/content placeholders, are
  not treated as implemented.
- All nine primal rows remain not implemented at the quest-offer layer. Having
  pieces of a primal battle does not provide the missing quest route and reward
  contract.
- Eight seasonal rows have meaningful Lua logic, but the required event actor
  placements are absent from the active spawn table; they are partial rather
  than implemented. The remaining seasonal rows are templates/reference data.
- `Forging the Spirit`, `Joining the Spirit`, and `Waking the Spirit`
  (110812–110814) are partial: they currently advance from NPC dialogue without
  proving the required materialization, catalyst-gathering, or materia-melding
  objective. `Risky Business` and `Call of Booty` have complete supported
  talk/delivery routes.
- Handwritten side/world scripts were promoted only when their required actor or
  ambient mob lifecycle exists in the current data and no known route blocker
  remains. Missing client DAT map markers alone do not make a quest unplayable.

## Elemen Catalog Reconciliation

The five requested dated archives were crawled over HTTP and matched to client
IDs using the Japanese title column in `docs/Dat Mining/xtx_quest.csv`. This
avoids guessing English translations.

| Elemen catalog | Archive entries | Matched IDs | Category mismatches |
| --- | ---: | ---: | ---: |
| [Main Quest](http://elemen.sakura.ne.jp/ff14_dated_archives/quest/MainQuest/index.html) | 19 | 19 | 0 |
| [SubQuest](http://elemen.sakura.ne.jp/ff14_dated_archives/quest/SubQuest/index.html) | 100 | 100 | 0 |
| [The Grand Companies](http://elemen.sakura.ne.jp/ff14_dated_archives/quest/TheGrandCompanies/index.html) | 69 | 69 | 0 |
| [Class Quest](http://elemen.sakura.ne.jp/ff14_dated_archives/quest/ClassQuest/index.html) | 51 | 51 | 0 |
| [Job Quest](http://elemen.sakura.ne.jp/ff14_dated_archives/quest/JobQuest/index.html) | 42 | 42 | 0 |
| **Total** | **281** | **281** | **0** |

Whitespace was normalized before title matching. Three known archive/client
spelling differences were treated as aliases rather than separate quests:

- `賢者の卵` in the walkthrough versus `賢者のタマゴ` in client data.
- `覚悟の頼り` in the walkthrough versus `覚悟の便り` in client data.
- `木霊が努め` in the walkthrough versus `木霊が務め` in client data.

The remaining client/SQL rows outside those 281 archive entries are still in
the Lua file. They include untranslated/internal rows and system, tutorial,
generic-event, or other content surfaces outside the five requested catalogs.

### SubQuest split

Elemen's single 100-entry SubQuest catalog maps to the deliberately separated
Lua sections as follows:

| Lua category | Elemen SubQuest entries |
| --- | ---: |
| `side_quests` | 68 |
| `world_quests` | 12 |
| `seasonal_quests` | 12 |
| `special_quests` | 4 |
| `primal_quests` | 4 |
| **Total** | **100** |

This is why a quest can appear in Elemen's broad SubQuest index while being in
a more specific local section such as primal or seasonal.

## Grand Company, Dungeon, and Primal Boundary

The historical catalogs and official patch notes distinguish the quest that
orders/unlocks content from the repeatable battle or bare content record.

| Content | Grand Company quest rows | Non-GC rows |
| --- | --- | --- |
| Toto-Rak | `Imperial Devices` — 111410, 111610, 111810 | Bare `The Thousand Maws of Toto-Rak` content row 110821 is `special_quests`. |
| Dzemael Darkhold | `Into the Dark` — 111411, 111611, 111811 | Bare `Dzemael Darkhold` content row 110822 is `special_quests`. |
| Ifrit | `It Kills with Fire` — 111416, 111616, 111816 | `Ifrit Bleeds, We Can Kill It` 110627 is a repeatable primal quest. |
| Garuda | `In for Garuda Wakening` — 111430, 111630, 111830 | `Taming the Tempest` 110867 is a primal quest. |
| Aurum Vale / Cutter's Cry | No GC entry quest in the dated catalog | Dungeon/content and optional sidequest surfaces remain `special_quests`. |

Official corroboration:

- [Patch 1.18 notes](https://forum.square-enix.com/ffxiv/threads/17007-patch1.18-Patch-1.18-Notes) associate Toto-Rak and Darkhold access with the three-company quest variants.
- [Patch 1.19 notes](https://forum.square-enix.com/ffxiv/threads/24910-patch1.19-Patch-1.19-Notes) list `It Kills with Fire` as Grand Company content and `Ifrit Bleeds, We Can Kill It` separately.
- [Patch 1.21 notes](https://forum.square-enix.com/ffxiv/threads/39024-patch1.21-Patch-1.21-Notes) describe Aurum Vale/Cutter's Cry access and the Darkhold prerequisite distinction.
- [Patch 1.22 notes](https://forum.square-enix.com/ffxiv/threads/43599-patch1.22-Patch-1.22-Notes) distinguish `In for Garuda Wakening` from `Taming the Tempest`.

## Mechanic Labels

The inline labels describe the retail quest route, not how much of that route
currently works on the server.

| Mechanic label | Rows |
| --- | ---: |
| `instance` | 109 |
| `instance/content record` | 4 |
| `multiple: instance + escort` | 6 |
| `multiple: instance + escort + open-world fight + mob kill/drop` | 1 |
| `multiple: escort + open-world fight + mob kill/drop` | 1 |
| `open-world fight + mob kill/drop` | 34 |
| `crafting/gathering/delivery` | 29 |
| `dialogue/delivery/interaction` | 103 |
| `tutorial/dialogue` | 3 |
| `system dialogue/menu` | 10 |
| `unknown/internal` | 224 |
| **Total** | **524** |

Mechanic evidence combines:

- the Elemen walkthrough objective text;
- `outputs/quest-fight-needs-implemented-20260701/quest_fight_needs_implemented_by_setting.csv`;
- concrete local escort routes for `Man0l1`, `Man0g1`, `Man0u1`, `Man206`, and related quest scripts;
- the deep runtime/safe-enablement atlases under `outputs/`;
- dungeon, primal, and Grand Company content records in client/SQL data.

For untranslated `[en]` rows, `unknown/internal` is intentional. Their exact
retail identity and mechanic are not invented from a code name alone.

## Validation

Refresh the generated annotations and validate coverage:

```text
python tools/validate_quest_availability.py --write
```

Validate without changing the Lua file:

```text
python tools/validate_quest_availability.py
```

The validator checks all of the following:

- all 524 SQL IDs occur once and only once;
- no unknown ID is present;
- every `[en]` row is commented out;
- every title and client code matches SQL;
- every implementation/mechanic annotation is current and well formed.
