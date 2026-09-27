# GC dungeon quest acceptance review — 2026-09-17

Scope: prerequisites and family exclusions for the six Com5[lgu]0–1 variants,
plus allegiance for all eighteen requested Com0[lgu]1–4 / Com5[lgu]0–1 routes.
All eighteen remain disabled. No live database update or server deployment
accompanies this review.

## Unlock evidence

Both dungeon families branch from each company's seal tutorial:

| Dungeon quest IDs | Required completed tutorial | Minimum levels |
| --- | --- | --- |
| 111410 / 111411 | 111403, Seals for the Whorl | 25 / 45 |
| 111610 / 111611 | 111603, Adder's Nest Egg | 25 / 45 |
| 111810 / 111811 | 111803, Burning a Hole in One's Pocket | 25 / 45 |

The previous main SQL incorrectly required formal enlistment for Imperial
Devices, then Devices completion for Into the Dark. `gamedata_quests.sql` now
contains the six corrected prerequisite values. The existing level gates remain.
The loader adds optional prerequisite-table entries to the main row; no canonical
optional-table row for these quests was found. A separately customized live
database must be checked for additional stale restrictions at deployment.

The exact predecessor mapping comes from the version-1.0 quest listings:
[Maelstrom](https://finalfantasy.fandom.com/wiki/Maelstrom_Quests_%28version_1.0%29),
[Twin Adder](https://finalfantasy.fandom.com/wiki/Order_of_the_Twin_Adder_Quests_%28version_1.0%29),
and [Immortal Flames](https://finalfantasy.fandom.com/wiki/Immortal_Flames_Quests_%28version_1.0%29).
Each tutorial lists both dungeon follow-ups; their dungeon entries identify the
tutorial predecessor. This is secondary historical evidence, not decoded server
acceptance bytecode. The preferred Elemen dated archive and Wayback page were
unavailable in this review; this fallback does not establish an Elemen cross-check.
The [official 1.18 notes](https://forum.square-enix.com/ffxiv/threads/17007)
independently establish both families as early GC dungeon-entry quests and their
city-variant exclusions, but do not identify those exact tutorial predecessors.
Do not reuse the original patch's fixed party sizes in the later native route.

## Native allegiance and active-variant evidence

Local native dialogue CSVs provide the enlistment notices:

- `docs/Dat Mining/com0l7.csv`, rows 7–8.
- `docs/Dat Mining/com0g7.csv`, rows 6–7.
- `docs/Dat Mining/com0u7.csv`, rows 6–7.

They retire other companies' recruit status and forbid their new duties.
The Japanese row explicitly describes new acceptance. This change applies that
rule to all eighteen requested opening routes: gcCurrent=0 permits all companies;
1/2/3 permits only the corresponding company's new offers. An invalid nonzero
company admits none. Already accepted journal routes are retained; this is not
an instruction to delete a player's outstanding items or progress.
`GrandCompanyOpeningQuestRules` uses an explicit eighteen-ID scope, so later
enlistment/promotion quests retain their existing independent policy. The twelve
field/tutorial quests have no cross-company active-variant exclusion: completing
one company's opening work does not prevent a recruit from trying the others.

Native journal Sea 246/252, Fst 292/297 and Wil 349/356 separately prohibit
another active city variant of the same dungeon family until completion or
abandonment. Devices and Dark remain independent. Completed history is not a
permanent family ban. Normal acceptance rechecks current allegiance and journal
state after dialogue, even against a stale offer. ForceAddQuest remains an
explicit diagnostic bypass. Existing enlistment synchronization refreshes
availability; the filter only clears bits and cannot enable disabled content.

## Verification and remaining work

The compiled harness exercises actual Player/QuestStateManager methods for all
eighteen routes: stale offers, each valid allegiance, invalid allegiance, active
foreign journal preservation, and disabled offers. It also loads the six main
SQL rows into production QuestGameData and tests the production prerequisite
bit evaluator against missing, correct, wrong-company, battle, enlistment and
Devices completion histories. All **1,427 compiled acceptance assertions** pass;
the full lifecycle suite passes **45 cases / 1,201 assertions** against the
updated isolated Release build. The static GC validator locks the six mappings
and audits the three native enlistment notices; it and the availability validator
pass. The optional local install export was regenerated from main SQL, not applied.

Normal acceptance and client movement still require watched/skipped client
checks. This review does not claim to audit allegiance for GC quests outside
the eighteen requested routes or validate live optional prerequisite overlays.
