# Aurum Vale and Cutter's Cry retail reconstruction, 2026-09-26

This pass adds supported 1.x behavior to both dungeons. It does not certify full
retail accuracy or a live-client pass. The existing launch-1.21 entry rules remain.
The [period evidence review](legacy_raid_footage_review_2026-09-26.md) distinguishes
contemporary observations, native client data and authored implementation choices.
New YouTube links were verified through their original uploader/strategy posts;
no new video frames were viewed because the available browser surfaces could not
play them. Earlier repository footage observations remain separately attributed.

## Implemented behavior

| Area | Change | Boundary |
| --- | --- | --- |
| Aurum fruit and root | Bind the native confirmation class and ask whether to eat; only an accepted, still-valid server-owned source applies the matching Veil and consumption history. | The current substitute object appearance remains unresolved. |
| Aurum charging circles | Set native persistent extra-stat bit `0x80` before appearance; clear it at activation and play the matching completion effect once. Reconnect and range entry restore state without replaying completion. | Uses the installed b936 e005-e009 resources; exact retail packet timing and client rendering remain unverified. |
| Miser first cohort | Add the initial 75-second cohort with retry-safe slots, frozen role selection and scoped initial combat threat. | Three plants and the <=40% Hearty alternative are explicit reconstruction choices. Later movement/regeneration/waves are still absent. |
| Miser roster | Add Giltrap, Hearty Victual and Aloes Rosetrap using existing native actor/name/appearance joins. | Reused family kits and numerical combat stats are authored. Aloes has no automatic later-wave assignment. |
| Cutter reinforcements | Princess Soldiers/Guard/Marshal and Chimera Scavengers inherit one eligible opponent from their exact owned boss once; ordinary AI then controls engagement. | The initial-target preference is authored. Guard healing target/action remains unresolved. |

The circle delivery code reuses the existing `DzemaelTerminalPresentation` envelope
through a factory restricted to Aurum zone 245, actor 1200228 and its valid native
variants. Existing Darkhold construction retains its original zone/identity rules.
Both paths retain session, generation, range-binding and actor ownership gates.
The old Aurum spawn/reconnect completion effects and delayed 650-ms replay were removed.
The reproducible native audit is `tools/inspect_aurum_terminal_presentation.py check`.

Miser profiles 32737–32739 appear identically in both main mob SQL files and the
optional `aurum_vale_miser_adds_20260926.sql` migration. The updater can obtain the
complete profile state from main SQL. No public spawn rows or live database were changed.

See [Aurum details](aurum_vale_retail_accuracy_2026-09-26.md),
[Cutter details](cutters_cry_retail_accuracy_2026-09-26.md) and the expanded
[client checklist](legacy_raid_client_verification_2026-09-18.md).

## Verified checkpoint before the navmesh placement review

All builds and database work below used isolated outputs under `.codex-build`.
No live server was restarted or replaced.

| Check | Result |
| --- | --- |
| Aurum and Cutter static validators, native circle audit, optional/main SQL consistency | Pass |
| Production manager suite, including native circle packets, confirmation ownership and Miser cohort | 999 checks, zero failures |
| Cutter production reinforcement suite | 41 checks, zero failures |
| Production database import, all 36 native roster joins, combat, loot and successful Miser cohorts | 2,699 checks; no unexpected runtime errors |
| Route/objective/coffer regressions and native Lua contracts | 376 checks plus passing native presentation, confirmation and Miser effect scenarios |
| Map coordinates, map registry and frozen Cutter ground | 19 + 15 + 4 tests, all pass |
| Shared Darkhold encounter/presentation regression | 4,598 checks, pass |
| Darkhold traversal | 84 checks, pass |

The database fixture shut down successfully. Its tested Map Server DLL SHA-256 was
`6DDC57311664B5A4A679AFDA2156B0281FD0FF2F5964223B16DC187CBC40D00F`.
The manager-suite output used DLL
`696E599C43BC5924AB83D4166B764D9292889DF5B7050B97B978D7A81F6A1899`.
These identify separate isolated builds in a workspace with other concurrent work;
neither identifies a deployed server. Tests exercise production code with fixture
state and controlled timing, not complete autonomous client fights.

`validate_legacy_raids.ps1 -SkipBuild` passes the Aurum/Cutter contracts but its
included Darkhold placement suite fails on existing historical floor provenance,
including `mob.feasting_chain_c`. That placement layer was not edited in this pass.
The aggregate validator is therefore not reported as passing. Logs are retained at
`.codex-build/retail-legacy-validation.log`, `retail-boss-validation.log`,
`retail-database-validation.log` and `retail-dzemael-validation.log`.

## Native mesh placement review

The user authorized quicknavmesh recordings and the actual installed navmeshes as
floor support. The first applied layer resolves fifteen Aurum Stage 1/2 Y values
at unchanged X/Z, with independent nearby frozen recording samples corroborating
floor selection. The next layer corrects all fifteen Stage 3 homes using the
guide's exact registration to native page 5503. Its floor selection follows
walkable mesh links from a unique corridor seed and the separate native arena
anchor; higher overlapping floors remain visible in the evidence and are rejected.

Miser now uses `(-910.5,178.900,1537)` in the mapped arena. The two Stage 3 arrival
points, eight supplemental monsters, consumables, arena transporter and existing
gas reference point move to their reviewed rooms. The gas covers the guide's
shaded arena and excludes the unshaded corridor. Its radius and the supplemental
formations remain authored. No new Goldbile shoreline or complete pool cycle is
implied. See [the frozen Stage 3 review](../Data/raidroutes/evidence/aurum-stage3-20260926/README.md).

The completed placement stack also corrects twenty Stage 1 homes and 58 Stage 2
homes from their own separately registered native pages. Three native Stage 1
anchors and three native Stage 2 circles remain exact. Eight Stage 2 placements
use explicitly reviewed nearby recorded X/Z, with Y evaluated on the mesh at that
new position; their displacements and the coffer-3 exception are retained in the
audit. Every layer preserves its prior input and rejects unreviewed changes.

The guide exposes a missing Stage 2A-to-2B transfer. Its new source and arrival
have exact-X/Z mesh support and independent recorded corroboration. They require
Barrier C, with no optional-kill requirement. The seven imperials beyond that
barrier now become available after it opens, instead of retiring at that moment.
The Lily and regular-coffer retirement conditions remain unchanged.

Aurum now has **102 entries: 95 mesh-supported reference points, six exact native
anchors and one unresolved existing Stage 2B gas-volume reference**. All physical
actors and travel destinations have floor support. The remaining gas volume's
placement and applicability still need separate review; it is not certified by
the supported actor homes. See the [Stage 1 evidence](../Data/raidroutes/evidence/aurum-stage1-20260926/README.md)
and [Aurum details](aurum_vale_retail_accuracy_2026-09-26.md).

Cutter remains **70 entries**. Two off-corridor trash homes and regular4's coffer
move onto reviewed, connected mesh surfaces within the same Stage 3 corridor.
Its four-cactuar coffer condition and separate final-two reward remain unchanged.
The other 67 entries retain their accepted sources: sixteen native homes and
51 frozen-recording homes. The original 54-resolution audit remains a checked
historical layer; it cannot overwrite the later three corrections. See the
[Cutter evidence](../Data/raidroutes/evidence/cutters-stage3-review-20260926/README.md).

Both static validators and **392 route checks** pass with the final manifests.
The earlier 999 manager and 41 reinforcement checks also pass on rerun. The
51 Aurum layer tests, eleven Cutter correction tests, four frozen-Cutter tests
and 34 shared coordinate/registry tests pass: **100 placement and coordinate
tests** in total. These exercise evidence hashes, wrong-floor rejection,
registration, progression and exact rebuilds. Full current
Aurum validation regenerates the complete layer stack in memory and compares
every row, metadata field and order, rather than exempting later stages.

The final isolated production build succeeded with zero errors and twenty
warnings in the concurrently developed Darkhold navigation code. Its Map Server
DLL SHA-256 is `BC26F036EED0FEB4964026C2ACCFA7EAE5D7C653835840A964C4BCCBF91B38DE`.
The final disposable database imported the main SQL and passed **2,720 production
checks**, including all 36 roster joins and 107 command/category bindings, with
no unexpected runtime errors. The fixture shut down successfully; diagnostics
are under `.codex-build/legacy-raid-db/8c408fa80f084374ba6229ca66571020` and the
log is `.codex-build/retail-final-database-validation.log`. No live process or
database was changed.

## Remaining accuracy work

Other open requirements include Miser's complete pool/regeneration/add cycle,
exact add formations and thresholds, native fruit/root appearances, travel-pair
and patrol acceptance, full normal-party entry and charging, native scene/widget
rendering, Guard healing behavior, and complete live boss fights. Passing the
offline suites does not reduce those requirements to height correction alone.
