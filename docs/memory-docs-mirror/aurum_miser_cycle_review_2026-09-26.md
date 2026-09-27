# Miser's Mistress: plant, pool and regeneration cycle

This follow-up supports a repeating pool-recovery encounter, but does not recover a complete exact retail scheduler. It adds two useful findings to the earlier [period review](legacy_raid_footage_review_2026-09-26.md): a contemporary report of movement later than two minutes, and independent late-1.x confirmation that players continue damaging Miser during recovery. Native recovery messages were already implemented; the new period comparison corroborates their meaning.

No new footage was viewed. Computer-use inventory returned no enabled browsers, and an explicit attempt to open the original video in the in-app browser returned `Browser is not available: iab`. Web opens of three period-video links also failed. No videos were downloaded. This review changes no runtime, placements or SQL.

## Contemporary observations

The directly reread [April 8–9, 2012 discussion, page 2](https://forum.square-enix.com/ffxiv/threads/42212-BLM-Miser-Burn-Strategy/page2?mode=linear) contains the corrected launch-era measurements:

| Observer | Observation | Consequence |
|---|---|---|
| Kikosho, post 13 | Two Hearty Victuals replace two Giltraps at an uncertain 40–50% HP condition. The cycle restarts after Miser leaves the pool. | Do not turn a guessed threshold into a recovered constant. |
| Kaeko, post 14 | After checking video, corrects plants to 75 seconds from aggro or pool exit, and movement to 120 seconds. | The earlier 60-second claim is superseded. |
| carraway, post 16 | Reports kills before movement whose duration exceeds two minutes. | A strict unconditional move at exactly 120 seconds is not established. |

The last observation is important: action deferral, differing timing references or approximate measurements could explain it, but the post does not identify which. The 120/125-second discrepancy is therefore not evidence of a patch change.

The [April 8 opening discussion](https://forum.square-enix.com/ffxiv/threads/42212-BLM-Miser-Burn-Strategy?mode=linear&p=628445), especially carraway's post 7, associates faster damage with the Hearty/Giltrap configuration and slower damage with Tender/Giltraps. It does not establish a universal alternating sequence over several regeneration phases. Its linked [hSo25Bm075Q video](https://www.youtube.com/watch?v=hSo25Bm075Q) is described as a **1:49 kill**; that number is fight duration, not a reviewed video timestamp. A kill before movement cannot by itself validate the subsequent regeneration phase.

[Rollan's August 20, 2012 first-person gear-swap example](https://forum.square-enix.com/ffxiv/threads/51385-WHM-and-gear-swapping?p=795145&viewfull=1) describes swapping to offensive equipment and nuking the Aurum boss while it regenerates in the pool. He calls it Miser Murphy, but explicitly places the example in AV. This supports continued targetability and damage during recovery, not invulnerability. It provides no healing amount, tick interval, travel coordinate or slug order.

[TirionCrey's March 29, 2012 reply](https://forum.square-enix.com/ffxiv/threads/40917-Paladin-Updates/page29) likewise describes party damage competing with the boss's pool regeneration. It is qualitative corroboration, not a rate measurement. [September 6–7 players](https://forum.square-enix.com/ffxiv/threads/53078-Can-someone-give-me-a-DRG-skill-rotation/page3) distinguish kills before movement from runs with one pool phase and warn about poison pits and slug areas. This corroborates persistence of the broad behavior into later 1.x.

## Full-cycle archive and its limits

The [eLeMeN 1.x archive](http://elemen.sakura.ne.jp/ff14_dated_archives/gamecontents/InstancedRaids/AurumVale.html) describes:

- Three or four Giltraps at approximately 75 seconds.
- Approximately 50 seconds later, Miser moves **to the Giltraps' location** and begins recovering HP.
- Three Tender Victuals at recovery onset, two Hearty Victuals on the next recovery, then alternation. Fast damage can reverse the initial order.
- Recovery ends after approximately 25 seconds or defeating Giltraps. Remaining Giltraps disappear when recovery ends; the roughly 75-second cycle repeats.

Its HTTP modification date is January 6, 2016: this is not a pinned launch revision. Approximate 75+50-second arithmetic does not establish five seconds of travel.

Adjacent leads: fog clears near 70% HP; Fields III/V have two/three terminals; large circles summon bosses; Coincounter slugs begin near half HP and repeat every 20 seconds. No independent numeric fog threshold was found. These require separate review, not automatic launch-1.21 attribution.

## Native and period presentation agreement

The [old-data nWiki page](https://wikiwiki.jp/ff14n/%E6%97%A7%E3%83%87%E3%83%BC%E3%82%BF/%E3%82%A4%E3%83%B3%E3%82%B9%E3%82%BF%E3%83%B3%E3%82%B9%E3%83%AC%E3%82%A4%E3%83%89/%E3%82%AA%E3%83%BC%E3%83%A9%E3%83%A0%E3%83%B4%E3%82%A7%E3%82%A4%E3%83%AB%E9%9C%A7%E4%B8%AD%E8%A1%8C%E8%BB%8D), carrying a June 25, 2012 page modification stamp, associates one Japanese system message with recovery and another with resumed action. Both match `docs/Dat Mining/worldMaster.csv` exactly:

| Native row | Meaning | Existing implementation |
|---|---|---|
| 34273 | Goldbile quickens the named actor's recovery. | `UpdateGoldbileEnemyRecovery` emits it on entering its recovery set. |
| 34274 | The named actor moves away from Goldbile. | The same method emits it when leaving that set. |

The table hash is `347e59c116adca34541ff90ac5d96d89dc3ca5a4eb50269c74859e93885e4963`. This is primary native wording, corroborated by a period community transcription. It does not supply a server timer, healing magnitude or model-state bit. The current generic 1%-maximum-HP/three-second recovery remains an authored policy already documented in [the July implementation](aurum_vale_implementation_2026-07-22.md).

## Concrete implementation boundaries

The existing `Map Server/Dungeons/AurumValeMiser.cs` implements a one-use first cohort only. Extending it needs a per-cycle state machine with distinct ordinary combat, requested movement, travel, recovery and return transitions. The evidence supports these behaviors:

1. Preserve damage and normal encounter ownership during recovery. Do not add invulnerability, a slug-devour action, or a heal-on-slug-death rule.
2. Associate a cycle's recovery destination with that cycle's plant cluster. A selected arena home and path must separately pass the shared coordinate/mesh workflow; this research provides no XYZ.
3. Start a recovery-duration clock at actual recovery entry, not when travel is requested. Movement admission must respect the active command and cancellation lifecycle. Choosing a nominal 120-second request and a 25-second recovery cap is a disclosed reconstruction, not recovered native code.
4. Track the current plant cohort separately from slugs and route trash. If implementing the archive's plant-defeat interruption now, “all living plants in this cycle are defeated” is an explicit conservative policy; the source does not settle one-versus-all, pre-arrival deaths, or zero successful spawns.
5. Retire surviving plants when that cycle ends. Do not infer that all surviving slugs also disappear: that is not what the archive identifies.
6. Return to the owned combat opponent through ordinary eligibility/hate rules, retaining a separate pool-exit transition. Restarting the next cycle there matches the corrected April account. Target choice, completion tolerance and failed-path handling remain implementation policy.
7. Treat slug order as a separate unresolved decision. Simply combining an early low-HP Hearty replacement with a fresh three-Tender wave at the same cycle's recovery can invent two slug cohorts. Strict alternation, first-cycle selection and whether an early Hearty replacement consumes that cycle's slug slot need explicit policy or additional observation.

The strongest next footage sample would be a continuous **slow** fight showing at least two recoveries, with the duty clock, boss HP and target/add names visible. Required checkpoints are initial aggro; plant appearance; first movement; recovery message; any plant deaths; exit message; and the next slug cohort. A separate sample killing only one plant during recovery would distinguish interruption semantics. None of those timestamps was newly observed here.

## Video provenance and access record

- [hSo25Bm075Q](https://www.youtube.com/watch?v=hSo25Bm075Q): linked by the April 2012 strategy author; before-movement burn, no newly viewed frames.
- [QI0fvbDKHxw](https://www.youtube.com/watch?v=QI0fvbDKHxw): inherited Blue Garter SR5C lead. Earlier repository timestamps remain inherited observations.
- [gs8nEtHrCr8](https://www.youtube.com/watch?v=gs8nEtHrCr8): identified as Sylvarion Ryulong's *FFXIV 1.0 Aurum Vale 16min* by an [archived 2018 embed](https://www.tumgik.com/xivlegacy). The embed establishes attribution and a lead, not run date or newly observed mechanics. Browser opening was unavailable.

Source-response hashes and access scope are recorded in `Data/raidroutes/evidence/aurum-miser-cycle-20260926/source-review.json`. Full remote pages and media are not redistributed. ARR fruit stacks, seedlings, and sowing thresholds were excluded.
