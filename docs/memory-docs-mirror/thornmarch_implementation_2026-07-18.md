# Thornmarch implementation notes (2026-07-18)

This server implements the one Good King Moggle Mog XII encounter that existed in FFXIV 1.x. It intentionally has no normal, hard, or extreme profile.

**Current follow-up:** [September 25 retail accuracy review](moogle_retail_accuracy_2026-09-25.md)
records the King self-Maximoogle, role-specific Mogdive, level and Cure IV targeting
corrections, their evidence and validation limits.
`thornmarch-retail-research-2026-09-07.md` records the earlier
DAT verification, two-video review, behavior changes, test results and unresolved
retail gaps. The August sections below are historical: Memento now uses the
installed **three-second cast** plus separate presentation time. Flare is an
avoidable 12-yalm Astral magic circle; Break is Earth magic. Maximoogle and Eye
Shot have additional completion, defense and cleanup corrections.

## Recovered contract

- Content `5`, director `InstanceRaid/InstanceRaidDarkMoogle`, zone `238`, region `103`, music `97`, primal weather `8028`.
- Retail entry requires exactly eight level-45+ Disciples of War or Magic, completion of a city-state version of *It Kills with Fire* by every member, and an active or completed *A Feast of Fools* on the leader.
- The battle timer begins when Whiskerwall is engaged. Success/failure set Thornmarch timer index `4` to 15/5 minutes.
- The five enchanted keystones affect treasure eligibility, not entry, and are never consumed here.

## Explicit server tuning

The recovered BNPC rows have zero HP and all seven lesser moogles share skill list 48. `MoogleEncounter.lua` therefore owns encounter-local HP/damage values, disables automatic mob-skill selection, and schedules each role's documented actions explicitly.

Memento uses exact per-target tuning based on phase-one survivors: `450`, `1800`, `3500`, or `9999` damage for zero, one, two, or more than two survivors. These values preserve the documented survivable/heavy/probable-wipe bands where exact historical intermediate values are unavailable.

The known pool includes Kupo Nut Charm (`10011152`), Murderous Mogfists (`4020112`), Morbid Mogblade (`4030407`), Malignant Mogaxe (`4040013`), Mischievous Mogbow (`4070214`), Melancholy Mogfork (`4080212`), Maleficent Mogstaff (`5020111`), Malevolent Mogwand (`5030036`), Grade 5 Dark Matter, Vampire Plant, and the Unmarked Keystone (`10011153`). The exact original weapon, consumable, and token probabilities have not been recovered. A retail winner who possesses all five enchanted keystones therefore receives one Kupo Nut Charm in the generated loot list as a conservative provisional reward. The encounter never directly grants a weapon, and the unmarked keystone is not treated as an eligibility key. GM test mode grants nothing and changes no quest or content timer. Rowena's ten-charm weapon exchange remains separate from the encounter.

## Video/data behavior pass (2026-08-04)

The complete 21:13 player recording at <https://www.youtube.com/watch?v=hDZy_jGvHxk> was reviewed at five-second intervals, with one-second inspection around the royal summoning. Its phase timing agrees with the existing 5:30 combat-time ritual after accounting for the recording's pre-pull lead-in, so the timer was retained.

The behavior pass fills the non-placement gaps exposed by the recording and the local 1.x guide/action data:

- Phase-two replacements copy their matching phase-one moogle's entire enmity table. Role actions prefer that moogle's highest-enmity live target, making the recorded split-tank and Tailturner-kite strategy functional.
- Court actions use a non-blocking queue, so one casting or Maximoogle-enhanced actor cannot freeze every other moogle's rotation.
- Maximoogle copies the singer's threat table into its chosen court member for the chase, and applies the documented slow in addition to size, invulnerability, and auto-attack damage.
- Ruffletuft becomes almost stationary and repeatedly uses Moogle-Go-Round below 50% HP in phase two. Once the King has inherited that art, he likewise favors it below 50% HP.
- Connected director membership is refreshed during the fight, the raid start event is replayed once per replacement session, pending re-raise paths receive time to resolve, and reconnectable participants prevent a premature wipe.

### Summoning and action presentation pass (2026-08-05)

The video's royal transition was rechecked frame by frame around the battle-log line "The moogles begin the rites of summoning." The surviving court begins the rite, the 2.67-second court/King reveal completes at roughly the ten-second mark, and the approximately five-second Memento Moogle entrance attack then resolves. The encounter now reproduces that order without changing any spawn coordinates:

- Living phase-one moogles cancel their current skill, become passive and damage-immune, and play the installed common-Moogle dance bank `0753` for the summoning rite.
- The complete replacement court is materialized atomically before the old actors are removed. The King plays common-Moogle jump bank `0755`, while the restored retainers play bound/bounce bank `0774`.
- In the August pass, Memento Moogle used a dedicated three-second reveal window, WSS11 presentation for every damage tier and a provisional five-second cast. The September pass replaces that cast with the installed three-second value and an explicit action-completion acknowledgment. Its survivor-scaled value remains the fixed base hit, while Stoneskin, Sentinel, and Sanguine Rite damage reduction apply; the existing Sanguine Rite damage callback consequently restores MP as shown in the recorded strategy.
- The named Moogle commands now use their contiguous installed scheduler banks: Mogdive WSS1, Whisker Bash WSS2, Moogle-Go-Round WSS4, Eye Shot WSS7, Pom Flare WSS8, Maximoogle WSS9, Mognesia WSS10, Memento Moogle WSS11, and Break WSS25. Break's WSS25 petrification scheduler provides an additional content-level cross-check for the numeric mapping.
- A warned Eye Shot whose marked target becomes invalid now fades instead of silently selecting an unmarked player. Victory/failure cleanup cancels in-flight skills and makes every surviving encounter actor inert during the result delay.

The common animation banks and the contiguous WSS mapping are present in the installed client data and are safe combat selectors. The exact `sum6m000` sequence clips are cutscene-timeline assets, not proven `PlayAnimation` selectors, so they are deliberately not invoked from the battle director. Final client-side visual review is still required to tune any bank whose installed scheduler is correct but whose retail timing is not fully observable in the recording.

No placement coordinates were changed in this pass.

## Geometry and presentation limitations

The installed zone layout DAT for `fst_f0_fld04` contains the dedicated `sgrp_f0f0_mog_ring_h`, `f0f0_mog_ring_h`, `attr_f0f0_mog_ring_a`, and moogle wall groups. Its `SEDBPHB` collision resource has local X/Z bounds of approximately `-29.615..29.615`, confirming a roughly 29.6-yalm circular footprint. The layout's world-transform format is not safely decoded, so the private area uses a conservative 29-yalm boundary around the recovered Thornmarch warp anchor `(-2350, -22.85, -890)`, places the party on that anchor, and keeps all scripted spawn points within 25 yalms. Recheck the provisional world origin if a complete client layout/navmesh parser becomes available.

There is no safely wired treasure chest or Fretful Moogle exit actor. Rewards use the generated loot list and the director returns players to their recorded entry point after the normal clear delay. A legitimate clear notifies the active *A Feast of Fools* quest and records a pending clear flag, but does not force-complete or directly reward the quest. The recovered `processEventContentExit` conversation remains unavailable until its missing Fretful Moogle actor/event bridge is implemented.

## Operator commands

- `!testmoogle` starts a solo mechanics test.
- `!testmoogle retail` runs full eight-player retail validation.
- `!testmoogle status` reports the current phase and king state.
- `!testmoogle exit` returns the GM to the recorded entry point.
