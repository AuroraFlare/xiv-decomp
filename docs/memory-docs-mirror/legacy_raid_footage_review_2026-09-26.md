# Aurum Vale and Cutter's Cry: period evidence review, 2026-09-26

This pass checked period source text, native identities and video provenance
against the existing route and mechanics audits. It did **not** watch new video
frames: the computer-use inventory returned no available browsers, and the
YouTube web opens failed. Existing footage notes remain earlier observations,
not observations made by this review. No placements, SQL or runtime are changed
by this document.

## Aurum Vale: the missing Miser entourage is well supported

The April 8, 2012 [BLM Miser Burn Strategy discussion](https://forum.square-enix.com/ffxiv/threads/42212-BLM-Miser-Burn-Strategy?mode=linear&p=628445)
is first-hand launch-era evidence. Carraway reports sleeping Hearty Victuals and
different add combinations on fast versus slower damage. Its opening post links
[a 1:49 Miser kill](https://www.youtube.com/watch?v=hSo25Bm075Q): 1:49 describes
fight duration, **not** a timestamp in that video.

The follow-up [page-two corrections](https://forum.square-enix.com/ffxiv/threads/42212-BLM-Miser-Burn-Strategy/page2?mode=linear)
matter more than the earlier hypothesis:

- [Kikosho, post 13](https://forum.square-enix.com/ffxiv/threads/42212-BLM-Miser-Burn-Strategy?p=628708&viewfull=1#post628708)
  reports two Hearty Victuals replacing two Giltraps, with an uncertain 40–50%
  boss-HP condition and an estimated 80–90-second appearance.
- [Kaeko, post 14](https://forum.square-enix.com/ffxiv/threads/42212-BLM-Miser-Burn-Strategy?p=628711&viewfull=1#post628711)
  explicitly corrects the earlier 60-second estimate after reviewing video:
  plants at 75 seconds from initial aggro or leaving the pool, movement at
  120 seconds, and a low-HP Victual alternative around 40%.

These are contemporary observers' measurements, not recovered server constants.
The HP equality rule and total launch-wave count are not established. Do not
retain the superseded 60-second claim or treat 40% as exact native logic.

The unversioned [eLeMeN 1.x Aurum archive](http://elemen.sakura.ne.jp/ff14_dated_archives/gamecontents/InstancedRaids/AurumVale.html)
adds a fuller cycle: 3–4 Giltraps around 75 seconds; movement to them and HP
regeneration about 50 seconds later; three Tender Victuals at regeneration,
then two Hearty Victuals at the next regeneration, alternating thereafter.
Fast damage can reverse the starting slug order. Regeneration ends after about
25 seconds or the plants' defeat; remaining plants disappear then, and the
roughly 75-second cycle repeats. This page was successfully read directly over
HTTP on this review date; the web reader's 403 is not evidence of absence.

The archive corroborates the 75-second plant phase, but its movement is about
125 seconds and its slug onset differs from the April account. Its surviving
page has no pinned revision proving launch behavior. Choosing four plants,
40%, or one particular slug schedule is therefore an authored interpretation.
The archive supports plant-associated regeneration, not a specific slug-eating
action, healing magnitude, tick cadence or a recorded travel destination.

Official [May 14, 2012 world/lore-team information relayed by Triairy, post 9](https://forum.square-enix.com/ffxiv/threads/45351)
lists Miser's Hearty Victual, Aloes Roselet and Giltrap entourage. This is official
1.x identity evidence after the launch period; it does not explain Aloes's
spawn trigger. The Japanese Roselet name maps to native English **Aloes Rosetrap**.
The description of Hearty as a snack alone does not prove a devour/heal mechanic.

Native joins were checked in `docs/Dat Mining/xtx_displayName.csv`,
`Data/sql/gamedata_actor_class.sql` and `Data/sql/gamedata_actor_appearance.sql`:

| English identity | Actor class | Name row | Native script | Model / size / body |
|---|---:|---:|---|---|
| Giltrap | 2302703 | 3302701 | FlowerPoisonousStandard | 10039 / 3 / 1056 |
| Aloes Rosetrap | 2302705 | 3302703 | FlowerPoisonousStandard | 10039 / 2 / 1024 |
| Hearty Victual | 2304202 | 3304202 | SlugStandard | 10504 / 3 / 1056 |
| Tender Victual | 2304203 | 3304203 | SlugStandard | 10504 / 2 / 1024 |

Actor 2304201/name 3304201 is Sulfur Slug, not Tender Victual. These joins establish
identity/appearance, not encounter HP, damage, level, location or autonomous AI.
The supplied *Maps, Loot, and Strategy Guide Excluding Toto-Rak* PDF, pages
16–19, adds no precise Miser-wave counts or clocks beyond these sources.

Implementation priority: restore the proven entourage identities and a clearly
labelled, lifecycle-safe interpretation of the first plant wave. Preserve the
evidence boundary for repeat movement, regeneration, slug selection and Aloes
placement until the full phase can be observed. Missing adds are a concrete
mechanics gap; adding names alone does not complete the fight.

## Cutter's Cry: reinforcement engagement and Guard recipient

Erwald's [March 17 guide, edited April 4, 2012](https://forum.square-enix.com/ffxiv/threads/40090-Le-Gouffre-Hurlant-Soluce-Tips-attention-Spoil)
describes Soldier waves approaching from several directions and recommends a
funnel with tanks ahead of mages. This supports reinforcements entering the
existing fight. It does not establish their first-target preference or a precise
enmity seed; the new scoped reinforcement behavior must label that choice.

Section 5a says one Guard arrives each minute, beginning a minute after the
Princess pull. Its exact short healing clause is:

> de très gros heals qui peuvent renverser le combat

That means large heals capable of reversing the fight. The target and command
are unspecified. The preceding Marshal paragraph explicitly describes a small
self-heal and a cone, so it cannot be reassigned to the Guard or Princess.
A subsequent [April 12, 2012 first-person account](https://forum.square-enix.com/ffxiv/threads/41830-Tanking-Adjustments-PLD-WAR?p=681847&viewfull=1)
by Aceofspades, post #33 and quoted in #34, explicitly describes letting the
Guard heal the Princess to prolong the fight. The [Guard review](cutters_guard_healing_review_2026-09-26.md)
records this stronger recipient evidence and the scoped correction. Action
variant, potency, area and cadence remain open; ARR tether rules are not evidence.

The guide's reward appendix explicitly labels its theories provisional.
Do not use it to undo the later accepted coffer, Cactuar or achievement rules.
The existing implementation already covers the source's Princess schedule,
Chimera adds and sand interactions. The strongest remaining Cutter verification
targets are Guard heal action/potency, Chimera part-break budgets/recovery
durations and actual route/boss presentation. This review recovered no new exact
constants that would justify replacing their documented reconstruction values.

## Verified period video leads and chronology

[Ragz's original uploader thread](https://forum.square-enix.com/ffxiv/threads/39927-New-Video-up-on-youtube-%28Cutter-s-Cry%29)
provides dated primary provenance:

| Posted | Video | Observation scope in this pass |
|---|---|---|
| March 15, 2012 | [Princess](https://www.youtube.com/watch?v=1qk-Z4QIyI0) | Link verified in uploader post; no frames watched |
| March 15, 2012 | [Chimera](https://www.youtube.com/watch?v=WPhF-e0FuYM) | Link verified; uploader's March 16 reply warns the recording wraps around, so no uninterrupted elapsed-time inference |
| March 22, 2012 | [Cutter five-coffer run](https://www.youtube.com/watch?v=TH4l0vzGjqg) | Link verified in uploader's follow-up; strongest new full-route review lead |
| April 8, 2012 | [Miser BLM burn](https://www.youtube.com/watch?v=hSo25Bm075Q) | Linked by the contemporary strategy author; 1:49 is reported kill duration |

The existing `docs/legacy_raid_routes_2026-09-07.md` records earlier inspection
of [Blue Garter Aurum SR5C](https://www.youtube.com/watch?v=QI0fvbDKHxw) at
0:44, 3:33, 10:40 and 14:14, and [Blue Garter Cutter SR5C](https://www.youtube.com/watch?v=9bAA6Ym_fs8)
at 1:45. Those inherited checkpoints can guide subsequent viewing; this review
does not upgrade them to fresh observations or exact spatial measurements.

The March/April posts concern the original 1.21-era eight-player raids. The May
official lore post and unversioned final 1.x archive corroborate later identities
without proving unchanged launch scripts. No ARR material was used to fill a
mechanics gap. No source in this pass recovers actor XYZ, facing, exact pool
travel, unseen wave counts, packet ordering or live-client acceptance.
