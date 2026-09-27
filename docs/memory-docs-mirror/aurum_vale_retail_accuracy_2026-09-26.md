# Aurum Vale: native confirmation and Miser's first reinforcement cohort

This pass restores the original fruit/root confirmation and introduces Miser's
previously missing named reinforcements. It does **not** complete the whole retail
encounter. Subsequent coordinate reviews correct the route's horizontal homes and
supported floors; a missing Stage 2 transport pair brings the route to 102 entries.
No live server was restarted or database updated during this work.

## Fruit and root confirmation

Previously, examining a route fruit/root immediately applied protection and counted
as consumption for Breathless. The native `GimmickPoisonCure` class instead asks the
player whether to eat it. The route actors now bind that recovered client class and
call `askPoisonCure`: mode 1 uses `gimmickPoisonCure` rows 1/2/3; mode 2 uses 5/6/7.
The class loads text sheet 10080. Its `GimmickNpcBaseClass.initForEvent` receives the
existing six-yalm interaction range. The route's substitute coffer appearance remains
explicitly unresolved; a native prompt class is not evidence for a fruit model.

`AurumProtectionRequest` captures the exact server route, source, player, session,
actor-table generation and event identity. Both initial admission and acceptance
check the registered source, available stage, range, participant and client actor
visibility. A declined, duplicate, stale, removed, replaced or out-of-range source
cannot apply protection. Client event parameters cannot choose the protection tier.
The source stays available to other party members. The route branch never falls
through to generic poison cleansing when a request fails. The existing GM fruit/root
commands still apply their selected protection immediately.

Native sources:

- `tools/outputs/lpb/decomp_further_20260617/lua/chara/npc/gimmick/gimmickpoisoncure.lua`
- `tools/outputs/lpb/decomp_further_20260617/lua/chara/npc/gimmick/gimmicknpcbaseclass.lua`
- `docs/Dat Mining/gimmickPoisonCure.csv`

## Miser reinforcement evidence and applied scope

The April 8, 2012 [BLM Miser discussion, page 2](https://forum.square-enix.com/ffxiv/threads/42212-BLM-Miser-Burn-Strategy/page2?mode=linear)
contains a correction from the observer Kaeko: the add appearance is approximately
75 seconds after initial aggro, correcting that author's earlier one-minute estimate.
The same discussion associates faster damage with two Hearty Victuals replacing
Giltraps, but is uncertain between roughly 40 and 50 percent HP. It also discusses a
later movement/poison phase; that movement is not implemented by this pass.

The [archived eLeMeN guide](http://elemen.sakura.ne.jp/ff14_dated_archives/gamecontents/InstancedRaids/AurumVale.html)
reports three to four Giltraps near 75 seconds and describes later regeneration,
Tender/Hearty waves and repeated cycles. Its account differs from the early forum
in phase timing and slug onset. Those accounts must not be silently merged into one
supposedly recovered full phase script.

The May 14, 2012 [official lore-team answer, post 9](https://forum.square-enix.com/ffxiv/threads/45351)
separately confirms Giltrap, Hearty Victual and Aloes Roselet as Miser encounter
species. The installed English client names the last actor **Aloes Rosetrap**.

The new first cohort uses these explicit choices:

| Property | Applied behavior | Evidence scope |
| --- | --- | --- |
| Initial clock | 75 seconds from observed engagement, with damage fallback | Corrected period observation; server detection is reconstruction |
| Cohort size | Three | Lower end of guide's three-to-four observation |
| Substitution | At `HPP <= 40`, two Hearty Victuals and one Giltrap; otherwise three Giltraps | Authored lower boundary of uncertain 40–50% reports |
| Role selection | Frozen once when the cohort becomes due | Retry consistency, not a recovered retail rule |
| Publication retry | Independent unfilled slots, no more than once each second | Server reliability policy |
| Initial hate | Existing eligible participant already fighting the owned Miser | Authored preference; ordinary AI retains movement/skill admission |
| Spawn home | Exact current Miser XYZ and facing for each add | Co-located fallback, not recovered retail placements |
| Later phases | No automatic repeated cohort, feeding, poison-pool travel or regeneration cycle | Still unresolved; do not imply these now exist |

Successful slots remain spent across add deaths, boss healing and another descent in
HP. The cohort binds the exact owned Miser on first engagement; a lookalike or
replacement cannot continue it. Finishing, cleanup, death and departure reject
updates. An idle recovered pull pauses publication without resetting the original
deadline or spent slots. Adds enter the existing instance-owned retirement path and cannot become
ordinary respawning public mobs. They do not count as first-two-room slugs.

The native actor/name/appearance rows already existed. The manager and both main
mob SQL layers now add scoped profiles:

| Key | BNPC | Native actor | Combat profile policy |
| --- | ---: | ---: | --- |
| `giltrap` | 32737 | 2302703 | Plant family; level 52, HP 4800, MP 1800, damage 90 |
| `heartyvictual` | 32738 | 2304202 | Slug family; level 52, HP 5000, damage 95 |
| `aloesrosetrap` | 32739 | 2302705 | Plant family; level 52, HP 4800, MP 1800, damage 90 |

Aloes is available through the roster/GM hook, with no invented automatic later-wave
assignment. Family skills, combat statistics and initial hate are authored; these are
not recovered boss-add potencies or a recovered complete unique spell list.

## Coordinate review

The shared workflow was run with zone 245 and the separate frozen recording
`Data/quicknavmesh-evidence/quicknavmesh-20260924/zone_245.tsv`:
SHA-256 `44f754eb65e1426b51728b319c983bc0963e7907f217c1056c11c4d3e800e243`.
The original first-pass Miser home `(-984,176,1042)` is outside native page 5503's texture
bounds. A diagnostic page-5500 crop is blank map terrain at that point. With height
176 ±20, its nearest frozen movement sample is node 1365, 98.679 yalms away; no
sample is within 30 yalms. This mismatch triggered the separate guide/native-map
review under `Data/raidroutes/evidence/aurum-stage3-20260926/`; transferring a nearby
sample's Y cannot repair the horizontal mismatch.

The diagnostic image and exact frame are under
`outputs/aurum-retail-20260926/miser-floor-review.*`. They were rendered from native
client artwork and inspected. The page is an explicitly labeled diagnostic, not a
new Stage 3 page assignment. Dynamic add co-location preserves the owned boss's
actual current XYZ and introduces no unsupported offset floor heights.

The applied Stage 3 layer now puts Miser at `(-910.5,178.900,1537)` on its own
native page. All fifteen final-room roles use the registered guide and exact-X/Z
mesh surfaces connected to the reviewed corridor or native arena seed. The gas
reference point moves to the shaded boss arena; its radius remains authored.
`tools/aurum_stage3_placements.py build|check` reproduces the layer and ten focused
regressions cover source coordinates, overlapping floors, disconnected/partial
paths, preserved gameplay and layer ordering. See the
[Stage 3 evidence](../Data/raidroutes/evidence/aurum-stage3-20260926/README.md).

## Historical scoped native-navmesh floor overlay

The user's subsequent request authorizes actual navmeshes and quicknav evidence.
`tools/aurum_navmesh_ground.py build|check` reproduces the Stage 1/2 overlay from
`Data/raidroutes/evidence/aurum-navmesh-ground-20260926/`. The frozen baseline retains
all original 100 rows and the complete polygon query retains every candidate floor.
The builder applies this overlay before the separate Stage 3 layer.

The actual zone-245 mesh is `Data/navmesh/roc0Dungeon04.nav`, SHA-256
`5cc549f7ea7b93435853e93b6e0d4cbc19bf0eea936d118666297422e086b99c`,
1,348,752 bytes, 233 tiles and 7,709 polygons. The staging manifest identifies the
reviewed private Bahamut `navmesh-runtime-1.23b` collection. This provenance does
not recover bake parameters or prove retail actor XYZ. The production loader uses
world XYZ directly; no layout translation is added.

Among the 78 unresolved non-Stage3 rows, 15 have one polygon floor within three
yalms of the old estimate and nearby independent recording support. The mesh
evaluates Y at the **unchanged original X/Z** using `GetPolyHeight`; the frozen
recording corroborates floor selection and never supplies the assigned Y. The
review policy requires its nearest node within six horizontal yalms and its Y
within two yalms of the selected surface. Actual maxima are 5.476 and 1.290 yalms.
These are authored selection bounds, not recovered retail tolerances.

| Resolved rows | Count |
| --- | ---: |
| Entry wasps 2–4 | 3 |
| Golden Pools gas, wasps 1–2, slugs 2–3 and fruit | 6 |
| Stage 2A gas, wasp 3 and imperial 6 | 3 |
| Coincounter | 1 |
| Stage 2B banemites A1–A2 | 2 |

Four Golden Pools points have an additional upper surface well outside the window.
Both surfaces remain in evidence; the nearby walking samples corroborate the lower
selection. Of the other non-Stage3 fallbacks, 57 have no containing walkable mesh
polygon and six have only surfaces outside the selected window. These 63 rows
stay unresolved. Absence of a walkable polygon does not prove absence of visual
floor: mesh bake clearance and quantization can exclude walkable-looking edges.
The seven non-Stage3 native anchors and every gameplay field remain unchanged.
Stage 3 is excluded from this tool so its independent coordinate review can proceed.

The 1,603-node/1,756-edge frozen zone-245 recording is byte-identical to the live
recording at review time. Neither source is merged. Native page-5500/5502 previews
with this recording were rendered and inspected under
`outputs/aurum-retail-20260926/stage1-floor-review.*` and `stage2-floor-review.*`.
They are contextual floor reviews, not proof of authored actor placements.

`tools/test_aurum_navmesh_ground.py` passes 12 tests, including source substitution,
floor ambiguity, horizontal snap rejection, false resolution, metadata preservation
and independent Stage 3 composition. The two initial temporary-file checks hit the
Windows sandbox's restrictive temporary-directory ACL; using unique fixture files
under the workspace fixed the environment issue and all checks passed. The initial
overlay rebuild preserved all X/Z and regenerated Cutter's manifest unchanged.

## Stage 2 map and travel correction

The later native-map comparison exposed much larger horizontal errors than the
first floor-only review could fix. The supplied Stage 2 image registers to its own
native page 5502 at pixel offset **(798,549), scale 1**, with normalized unannotated
background correlation **0.999673**. Existing native physical barrier anchors align,
but the original Stage 2A entry was 180.850 yalms from the guide START. Five coffer
homes were 24–126 yalms from their guide regions. Genuine native `r0d4_pos01` XYZ did
not establish the assigned entry role.

The reviewed `tools/aurum_stage2_placements.py` layer applies **58 coordinate
corrections**, with containing native mesh Y and independently corroborating frozen
zone245 samples. Fifty retain the selected guide X/Z. Eight use explicit nearby
recorded X/Z where those guide/art slots lacked the correct mesh floor: seven are
within six yalms, while regular3 uses the separately stated 9.777-yalm exception.
The four Lily marks were inspected at enlarged scale; they are not a compact
four-actor formation. Three native circle/barrier anchors and the existing Stage2B
gas volume remain unchanged. Source records distinguish interpreted map landmarks,
authored formations, recorded X/Z and mesh-derived Y.

The independent `tools/aurum_stage2_travel.py` layer then restores the missing
Stage 2A→2B pair. The northwest guide arrow gives
`stage2b-transporter=(-1049,196.374,1328)`; white START gives
`stage2b-entry=(-1057,192.647,1265)`. Each has one exact-X/Z mesh floor corroborated
by its own frozen sample. Both require `circle:miner`, with **no imperial kill gate**.
Travel pairing and barrier gating remain explicit reconstruction choices.

The guide places Stage 2A's seven optional imperials beyond Barrier C, before that
exit. Their former `Until=circle:miner` retired them at the unlock required to reach
them. The separate progression layer changes only those seven requirements to
`circle:miner` and removes their retirement condition. Their tags, count, optional
Miser coffer role and all geometry remain intact. Regular2/3 and the four Lilies
retain their explicit Barrier C retirement rules.

Frozen candidates, rejected upper surfaces, final support and a complete 62-row
shared-map render are under
`Data/raidroutes/evidence/aurum-stage2-review-20260926/`; see its README for the
before/after landmarks, hashes and query reproduction. The active builder applies
the geometry and travel layers after the earlier floor and Stage 3 layers. Active
file validation reconstructs the complete approved stack, so historical support
cannot silently overwrite later corrections or excuse arbitrary edits.
Thirteen focused Stage 2 tests pass, covering field preservation, eight recorded
adjustments, ground ambiguity, rejected source mutations, exact travel landmarks,
one-use overlay application and the seven optional imperial progression changes.

## Native fruit/root appearance candidates

`tools/inspect_aurum_protection_appearance.py build|check` pins both existing native
appearance rows and their embedded model resources in
`Data/raidroutes/aurum_protection_appearance_review.json`. Row **1200330** is
`b998/e011` (model 20998, size 2, body 11264); row **1200331** is `b998/e012`
(body 12288). Their embedded `initf_idle` actions explicitly reference
`mi998e11` and `ne998e12`, consistent with Japanese *mi* (fruit) and *ne* (root).
They follow the native Aurum circle rows 1200325–1200329 and precede the Cutter
sand rows. This contextual association supports a **reconstructed** fruit/root
binding; it is not recovered original server actor-class assignment. Some nested
resource names retain opposite mi/ne strings, so those names are not independent
confirmation.

Only `LegacyRaidRuntime` route `aurum`, zone 245, fruit/root kinds now use these
two existing rows in ordinary NPC construction. The existing native
`GimmickPoisonCure` script override remains. Both exported actor classes have
blank class paths/name 0, and no map-object export row refers to layout 214.
Neither the class table nor the native prompt leaf independently binds those
appearance IDs to the interaction modes. No main SQL change is needed: both
canonical appearance rows already exactly match the native graphics table.

These are three-vertex placeholder meshes with embedded effect resources, not
recovered fruit/root polygon models. The embedded initializers contain bind,
sound, action and chant-sync controls, with **no extra-stat parameter/conditional
branch**. Runtime adds no power flag or action selector. It preserves route XYZ,
targetability, prompt modes, effects, durations and other object kinds. Exact
particles, color, sound, scale and fruit-versus-root client rendering remain
unverified; no new video observation is claimed.

The native audit's build/check passes. New production integration coverage in
`tools/legacy-spawn-tests/AurumProtectionAppearanceChecks.cs` loads all five
approved protection homes through the actual runtime spawn path and canonical
database, checks area/director ownership, serializes appearance/position/script
packets and rejects appearance leakage across zone, route and object-kind
boundaries. The parent combined validation records its execution outcome.

## Validation and remaining work

`AurumProtectionLuaChecks` executes the actual production Lua adapter for both
native modes, positive/negative choices, forged event mode and rejected source.
`AurumProtectionChecks` exercises production route admission, one-use callbacks,
decline, range/floor checks, death, transfer, retirement, replacement, session and
generation changes. `MiserFirstCohortChecks` exercises the production clock and slot
ledger, threshold boundary, frozen retry roles and excluded boss lifecycles.
The parent validation pass records the combined build and suite outcome.

The historical [Blue Garter run](https://www.youtube.com/watch?v=QI0fvbDKHxw&t=854s)
remains a final-room viewing reference. No newly viewed YouTube frames are claimed
in this pass: text-browser access to that watch page failed. The research log tracks
other period video leads separately.

Full acceptance still needs normal-party/client checks of the native confirmation,
terminal rendering, boss/add placement, encounter aggro and complete combat. The
Miser movement, pool regeneration/feeding, later add cycles, Aloes behavior and
precise counts/thresholds remain open. Fruit/root visual acceptance, transport pairs,
patrols and all unresolved floor homes also remain open. No ARR Locksmith, Gold Rush
stack cleansing, Burr/seedling mechanics or modern boss behavior was added.
