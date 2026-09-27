# Cutter's Cry retail reconstruction: reinforcements and supported homes

This pass fixes an encounter behavior missing from the existing populated 1.x
route. It does not establish complete retail or live-client acceptance.

## Evidence checked

The [March 17, 2012 player guide](https://forum.square-enix.com/ffxiv/threads/40090-Le-Gouffre-Hurlant-Soluce-Tips-attention-Spoil)
describes roughly ten attacking soldiers per Princess wave, Guards arriving
once per minute, and three groups of roughly eight to ten Scavengers during
Chimera's 60–70% phase. Its Princess strategy explicitly funnels approaching
soldiers away from the mages. That supports reinforcements joining the fight;
it does not recover an initial threat table, exact target-selection algorithm,
spawn XYZ or the existing authored soldier/scavenger cadence.

The [original uploader's March 15 thread](https://forum.square-enix.com/ffxiv/threads/39927-New-Video-up-on-youtube-(Cutter-s-Cry))
links [Myrmidon Princess](https://www.youtube.com/watch?v=1qk-Z4QIyI0)
and [Chimera](https://www.youtube.com/watch?v=WPhF-e0FuYM). The author warns that
the Chimera upload wraps around. The March 22 follow-up links the
[five-coffer run](https://www.youtube.com/watch?v=TH4l0vzGjqg). These period links
were rechecked; no new frame-by-frame timing or positional measurement was
recovered from playback in this pass. Previously inspected Blue Garter footage
and map evidence remain documented in
[the route reconstruction](legacy_raid_routes_2026-09-07.md).

## Implemented behavior

The spawn path previously created Princess soldiers, Guards and Marshal, plus
Chimera Scavengers, as ordinary isolated enemies. They have no shared content
group by design, to prevent distant dungeon packs assisting each other. Nothing
connected them to the summoning boss's current fight, so normal sight/range
acquisition could leave a reinforcement idle after successful publication.

`CuttersCryReinforcements.cs` gives only those summoned actors a one-use link to
their exact source boss. Once a living, connected original entrant is available
among that boss's current target or hate entries, it adds the ordinary base hate
entry. The normal AI then controls engagement, movement, floor restrictions,
targetability, actions and cutscene protection. No action or cast is forced.

Current-target preference, then the eligible top threat, then an eligible source
hate member ordered by actor ID, is an explicit reconstruction. It is not claimed
as the original server's target-selection rule. Existing add hate wins, and
successful admission is one-use; later boss target changes never overwrite add
threat. Missing or temporarily unavailable opponents retain pending admission.
Dead, transferred or replaced bosses/adds and finishing/cleanup cancel it.
Both the area actor registry and the instance spawn registry must retain the
exact boss and add objects; removal or same-ID replacement cancels pending work
even when a stale actor still reports the same `CurrentArea`.
Session identity is checked so an obsolete Player object cannot inherit a
replacement session's readiness. Ordinary route packs, GM-spawned actors,
unrelated bosses and the hidden Sand Pillar worm never receive this linkage.

The route retains 70 entries and all gameplay fields. A later reviewed native-map
and mesh overlay corrects three Stage3 homes, described below. Native sands,
frozen recording hash/local node IDs, page assignments and exact native anchors
are preserved. Coffer progression still uses the four Stage 3 cactuars separately
from the final-two-cactuar bonus, and Stage 4 still requires only Princess death.
No SQL changed, and no live deployment or restart was performed.

## Verification

`tools/cutters-reinforcement-tests` invokes the real manager helpers and real
`HateContainer`, using in-memory actors and sessions without a database or server.
It covers all four summon roles, one-use admission, existing threat, unavailable
opponents and source-hate fallback, non-entrants, transferred/dead/disconnected
players, cutscene protection, session ownership, source/add lifecycle invalidation
and unrelated roles. Normal AI can select the resulting actual hate entry.
The latest central production-DLL pass passed all41 reinforcement checks,
including registry removal/replacement cases, with zero failures.
It does not simulate a complete encounter or observe client movement.

Build/run the dedicated fixture in an isolated output directory:

```powershell
dotnet build tools/cutters-reinforcement-tests/CuttersReinforcementTests.csproj -m:1 -p:NuGetAudit=false -p:UseSharedCompilation=false -o .codex-build/cutters-reinforcements
dotnet .codex-build/cutters-reinforcements/CuttersReinforcementTests.dll
```

The parent integration pass records final test results. A live party should
specifically verify soldiers appearing behind the tank, all Scavenger groups,
the effect of an entrant entering a cutscene, ordinary add threat changes after
engagement and cleanup when Chimera falls.

## Three Stage3 homes corrected

The supplied guide registers to native page5403 at scale1.5 and pixel translation
(619,546), independently cross-checked by four unannotated background patches.
Two authored enemy homes lay beyond the corridor's east wall, and the regular4
coffer lay north of its marked position in wall space. The corrected homes are
late-trash-4(-1350,250.297,-1742), late-trash-8(-1350,251.477,-1730), and
coffer-4(-1328,251.419,-1722). Each Y is the actual mesh surface evaluated at the
selected exact X/Z. Actual Detour polygon links connect each home to the
unchanged native `i` marker; the separate frozen zone246 recording corroborates
each floor within2.063 horizontal yalms and0.572 vertical yalms.

The [review evidence](../Data/raidroutes/evidence/cutters-stage3-review-20260926/README.md)
contains before/after renders with calibration frames, all source hashes,
polygon paths, authored-placement limits and individual decisions for all11
original mesh exceptions. Eight uncorrected exceptions retain accepted evidence;
missing mesh alone does not authorize replacement, and native effect origins
are never forced onto a walkable surface. The original54-row ground audit is
preserved. The strict current overlay validates all70 rows before checking that
historical layer; 51 nearest-node homes,16 native rows and three mesh-supported
corrections now make up the route. Fifteen Python regressions pass, including
partial-overlay rejection, unrelated-home preservation and cactuar objectives.

## Open evidence boundaries

The March guide mentions substantial Guard heals and Marshal self-healing but
does not identify the Guard's recipient or action. A later found April 12, 2012
first-person account explicitly identifies the Princess as the Guard's recipient.
The [Guard healing review](cutters_guard_healing_review_2026-09-26.md) describes the
scoped correction, native command audit and remaining action/potency/area limits.
No ARR tether or new healing timer was imported.

Other documented reconstruction boundaries remain: dynamic formations, exact
boss/add stats and AI cadence, the Sand Pillar sites/footprint, anatomical damage
budgets and recovery clocks, loot probabilities and physical final-coffer
associations. Native scenes, full party travel, floor/presentation and complete
autonomous fights still need client acceptance. Offline checks do not close them.
