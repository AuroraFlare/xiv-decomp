# Grand Company journals: nested macros and argument contracts

This second pass parses every macro and literal in five journal fields and all four locales for all 102 core Grand Company rows plus the separate Noc001 service quest. Each quest has a complete source-preserving syntax tree, exact half-open character spans, raw predicates, true/false arms, passthrough parameters and resolved sheet text. The first pass's flattened journal references remain available; this pass adds the conditions that decide which references belong together.

The inventory contains **2060 fields**, **4208 sheet-reference occurrences** across four locales and **1052 English occurrences**. These counts include repeated references in current/history/completed fields, not that many unique objectives. There are **0 cross-locale reference/guard/argument differences** and **4 unresolved reference occurrences**; full details are in [summary.json](../../outputs/grand-company-second-decomp-20260926/journals/summary.json).

## What the deeper parse establishes

- **The Price of Integrity (`com0l1`) has selectors 0, 1, 2, 3.** Selector 2 contains another IF on `$E0($E8(3),1)`, choosing Sea/265 versus Sea/232. A flat row list loses that alternative. The held-item field separately tests argument 2 and references item 11000254.
- **Don't Hate the Messenger (`gcl105`) has sparse selectors** 0, 3, 5, 10, 15, 20, 25, 28, 30, 35, 40, 45, 50, 55, 60. Its five held-item branches use arguments 2–6 independently for items 11000433–11000437. Collapsing these into consecutive numbered stages changes the source contract.
- **To Kill a Raven (`gcl107`) uses selectors** 0, 5, 10, 15, 20, 25, 30, 35. Its current, history and completed presentations share prose references but have different conditions and argument payloads.
- **Their Finest Hour (`com0g5`) contains an anomalous `.354` completed-journal row token in all four locales.** The extractor retains it and reports it unresolved; it does not silently rewrite it to row 354. Its native runtime interpretation has not been established.
- Current journals generally gate references with `$E4($E8(1),literal)`, history uses `$E0`, and held items inspect other arguments. Completed prose and quest summaries are separate fields. A summary row is not a current-objective selector, and a literal text row ID is not automatically a selector or item counter.

## Native syntax and evidence limits

The AST preserves E0/E4 exactly. The established repository journal contracts interpret them as threshold/equality predicates; this extraction does not claim a newly recovered machine-code implementation of that text-expression VM. It never substitutes a guessed truth value, assumes adjacent selectors are reachable server stages, or treats a journal mention as a recovered mob placement. The native scene IfClip interpreter recovered in the separate [scene pass](scenes.md) is a different opcode family.

CSV data-field indices exclude the leading row ID: current 13–16, history 18–21, held items 22–25, completed 28–31 and summary 46–49; English is the second field in each group. Source line numbers include multiline CSV records. Locale comparisons check sheet/row identity, enclosing predicate arms and forwarded arguments; they intentionally ignore translated literal whitespace and locale-specific sheet columns. A structural difference is retained rather than silently choosing the English variant.

The [independent verification report](verification.md) traces the current server's `qtdata` packet through the raw native desktop/widget instructions. This keeps transport parameters distinct from native text-row references and from authored server sequences. Display-path conclusions are offline source findings, not observations of a running client.

The [UI macro bridge](../../outputs/grand-company-second-decomp-20260926/journals/ui-bridges.json) independently pins text rows 5004 (current), 5005 (history), 4001 (held items) and 5024 (completed), in all four locales. The first three choose quest row `$E8(1)` and forward `$E8(2)` through `$E8(7)` plus `$EA(8)`. Thus the widget's A1 becomes the quest field's first numeric argument, after the stored journal ID selects the quest row. Completed text forwards no extra arguments. The partial UI CSV independently agrees on the first three rows; it lacks 5024, which is preserved from the complete UI CSV.

## All quest journal dossiers

| Quest | English references | Current selector literals | Nested current IF |
| --- | ---: | --- | --- |
| [110817 noc001](../../outputs/grand-company-second-decomp-20260926/journals/readable/noc001.md) — Provisioning & Supply Missions | 0 | none | no |
| [111401 com0l1](../../outputs/grand-company-second-decomp-20260926/journals/readable/com0l1.md) — The Price of Integrity | 16 | 0, 1, 2, 3 | yes |
| [111402 com0l2](../../outputs/grand-company-second-decomp-20260926/journals/readable/com0l2.md) — Testing the Waters | 3 | 0 | no |
| [111403 com0l3](../../outputs/grand-company-second-decomp-20260926/journals/readable/com0l3.md) — Seals for the Whorl | 3 | 0 | no |
| [111404 com0l4](../../outputs/grand-company-second-decomp-20260926/journals/readable/com0l4.md) — Engineering Victory | 14 | 0, 1, 2, 3 | no |
| [111405 com0l5](../../outputs/grand-company-second-decomp-20260926/journals/readable/com0l5.md) — An Officer and a Wise Man | 13 | 0, 1, 2, 3 | no |
| [111406 com0l6](../../outputs/grand-company-second-decomp-20260926/journals/readable/com0l6.md) — Ceruleum Shock | 13 | 0, 1, 2, 3 | no |
| [111407 com0l7](../../outputs/grand-company-second-decomp-20260926/journals/readable/com0l7.md) — Till Sea Swallows All | 3 | 0 | no |
| [111408 com0l8](../../outputs/grand-company-second-decomp-20260926/journals/readable/com0l8.md) — [en] | 0 | none | no |
| [111409 com0l9](../../outputs/grand-company-second-decomp-20260926/journals/readable/com0l9.md) — [en] | 0 | none | no |
| [111410 com5l0](../../outputs/grand-company-second-decomp-20260926/journals/readable/com5l0.md) — Imperial Devices (Limsa Lominsa) | 19 | 0, 1, 2, 3, 4 | no |
| [111411 com5l1](../../outputs/grand-company-second-decomp-20260926/journals/readable/com5l1.md) — Into the Dark (Limsa Lominsa) | 21 | 0, 1, 2, 3, 4, 5 | no |
| [111412 com5l2](../../outputs/grand-company-second-decomp-20260926/journals/readable/com5l2.md) — [en] | 0 | none | no |
| [111413 com5l3](../../outputs/grand-company-second-decomp-20260926/journals/readable/com5l3.md) — [en] | 0 | none | no |
| [111414 com5l4](../../outputs/grand-company-second-decomp-20260926/journals/readable/com5l4.md) — [en] | 0 | none | no |
| [111415 com5l5](../../outputs/grand-company-second-decomp-20260926/journals/readable/com5l5.md) — [en] | 0 | none | no |
| [111416 gcl101](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcl101.md) — It Kills with Fire (Limsa Lominsa) | 34 | 0, 1, 2, 3, 4, 5, 6, 7 | no |
| [111417 gcl301](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcl301.md) — The Cove | 8 | 0, 1 | no |
| [111418 gcl302](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcl302.md) — Saving the Stead Instead | 10 | 0, 1, 2 | no |
| [111419 gcl303](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcl303.md) — It's a Piece of Cake to Bake a Poison Cake | 7 | 0, 1 | no |
| [111420 gcl304](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcl304.md) — Kobold and the Beautiful | 11 | 0, 1, 2 | no |
| [111421 gcl501](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcl501.md) — [en] | 0 | none | no |
| [111422 gcl502](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcl502.md) — [en] | 0 | none | no |
| [111423 gcl601](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcl601.md) — [en] | 0 | none | no |
| [111424 gcl602](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcl602.md) — [en] | 0 | none | no |
| [111425 gcl603](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcl603.md) — [en] | 0 | none | no |
| [111426 gcl305](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcl305.md) — Oil Crisis | 8 | 0, 1 | no |
| [111427 gcl102](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcl102.md) — Alive | 14 | 0, 1, 2, 3 | no |
| [111428 gcl701](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcl701.md) — The Weakest Link | 17 | 0, 1, 2, 3, 4 | no |
| [111429 gcl103](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcl103.md) — Deus ex Machina | 10 | 0, 5, 10 | no |
| [111430 gcl104](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcl104.md) — In for Garuda Wakening (Limsa Lominsa) | 24 | 0, 5, 10, 15, 20, 25, 30 | no |
| [111431 gcl105](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcl105.md) — Don't Hate the Messenger (Limsa Lominsa) | 51 | 0, 3, 5, 10, 15, 20, 25, 28, 30, 35, 40, 45, 50, 55, 60 | no |
| [111432 gcl106](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcl106.md) — United We Stand (Limsa Lominsa) | 13 | 0, 5, 20, 25 | no |
| [111433 gcl107](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcl107.md) — To Kill a Raven (Limsa Lominsa) | 25 | 0, 5, 10, 15, 20, 25, 30, 35 | no |
| [111434 gcl702](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcl702.md) — Patrol, Interrupted | 10 | 0, 5, 10 | no |
| [111601 com0g1](../../outputs/grand-company-second-decomp-20260926/journals/readable/com0g1.md) — Breaking the Seals | 16 | 0, 1, 2, 3 | yes |
| [111602 com0g2](../../outputs/grand-company-second-decomp-20260926/journals/readable/com0g2.md) — Why Did It Have to Be Snakes | 3 | 0 | no |
| [111603 com0g3](../../outputs/grand-company-second-decomp-20260926/journals/readable/com0g3.md) — Adder's Nest Egg | 3 | 0 | no |
| [111604 com0g4](../../outputs/grand-company-second-decomp-20260926/journals/readable/com0g4.md) — The Mail Must Get Through | 15 | 0, 1, 2, 3 | no |
| [111605 com0g5](../../outputs/grand-company-second-decomp-20260926/journals/readable/com0g5.md) — Their Finest Hour | 15 | 0, 1, 2, 3 | no |
| [111606 com0g6](../../outputs/grand-company-second-decomp-20260926/journals/readable/com0g6.md) — Appetite for Destruction | 10 | 0, 1, 2 | no |
| [111607 com0g7](../../outputs/grand-company-second-decomp-20260926/journals/readable/com0g7.md) — Serenity, Purity, Sanctity | 3 | 0 | no |
| [111608 com0g8](../../outputs/grand-company-second-decomp-20260926/journals/readable/com0g8.md) — [en] | 0 | none | no |
| [111609 com0g9](../../outputs/grand-company-second-decomp-20260926/journals/readable/com0g9.md) — [en] | 0 | none | no |
| [111610 com5g0](../../outputs/grand-company-second-decomp-20260926/journals/readable/com5g0.md) — Imperial Devices (Gridania) | 14 | 0, 1, 2, 3 | no |
| [111611 com5g1](../../outputs/grand-company-second-decomp-20260926/journals/readable/com5g1.md) — Into the Dark (Gridania) | 17 | 0, 1, 2, 3, 4 | no |
| [111612 com5g2](../../outputs/grand-company-second-decomp-20260926/journals/readable/com5g2.md) — [en] | 0 | none | no |
| [111613 com5g3](../../outputs/grand-company-second-decomp-20260926/journals/readable/com5g3.md) — [en] | 0 | none | no |
| [111614 com5g4](../../outputs/grand-company-second-decomp-20260926/journals/readable/com5g4.md) — [en] | 0 | none | no |
| [111615 com5g5](../../outputs/grand-company-second-decomp-20260926/journals/readable/com5g5.md) — [en] | 0 | none | no |
| [111616 gcg101](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcg101.md) — It Kills with Fire (Gridania) | 34 | 0, 1, 2, 3, 4, 5, 6, 7 | no |
| [111617 gcg301](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcg301.md) — Eternal Recurrence | 9 | 0, 1 | no |
| [111618 gcg302](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcg302.md) — The Pen Is Mightier Than the Spear | 11 | 0, 1, 2 | no |
| [111619 gcg303](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcg303.md) — Woes of the Botanist | 10 | 0, 1, 2 | no |
| [111620 gcg304](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcg304.md) — Gone with the Wind | 13 | 0, 1, 2 | no |
| [111621 gcg501](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcg501.md) — [en] | 0 | none | no |
| [111622 gcg502](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcg502.md) — [en] | 0 | none | no |
| [111623 gcg601](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcg601.md) — [en] | 0 | none | no |
| [111624 gcg602](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcg602.md) — [en] | 0 | none | no |
| [111625 gcg603](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcg603.md) — [en] | 0 | none | no |
| [111626 gcg305](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcg305.md) — A Taste for Death | 7 | 0, 1 | no |
| [111627 gcg102](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcg102.md) — Two Vans are Better than One | 20 | 0, 1, 2, 3, 4, 5 | no |
| [111628 gcg701](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcg701.md) — You Don't Have the Rite | 17 | 0, 1, 2, 3, 4 | no |
| [111629 gcg103](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcg103.md) — Shadow of the Raven | 10 | 0, 5, 10 | no |
| [111630 gcg104](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcg104.md) — In for Garuda Wakening (Gridania) | 24 | 0, 5, 10, 15, 20, 25, 30 | no |
| [111631 gcg105](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcg105.md) — Don't Hate the Messenger (Gridania) | 51 | 0, 3, 5, 10, 15, 20, 25, 28, 30, 35, 40, 45, 50, 55, 60 | no |
| [111632 gcg106](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcg106.md) — United We Stand (Gridania) | 13 | 0, 5, 20, 25 | no |
| [111633 gcg107](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcg107.md) — To Kill a Raven (Gridania) | 25 | 0, 5, 10, 15, 20, 25, 30, 35 | no |
| [111634 gcg702](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcg702.md) — Cure for the Common Pox | 10 | 0, 5, 10 | no |
| [111801 com0u1](../../outputs/grand-company-second-decomp-20260926/journals/readable/com0u1.md) — Career Opportunities | 16 | 0, 1, 2, 3 | yes |
| [111802 com0u2](../../outputs/grand-company-second-decomp-20260926/journals/readable/com0u2.md) — Kindling a Flame | 3 | 0 | no |
| [111803 com0u3](../../outputs/grand-company-second-decomp-20260926/journals/readable/com0u3.md) — Burning a Hole in One's Pocket | 3 | 0 | no |
| [111804 com0u4](../../outputs/grand-company-second-decomp-20260926/journals/readable/com0u4.md) — Arms Race | 16 | 0, 1, 2, 3 | no |
| [111805 com0u5](../../outputs/grand-company-second-decomp-20260926/journals/readable/com0u5.md) — Burning Man | 16 | 0, 1, 2, 3, 4 | no |
| [111806 com0u6](../../outputs/grand-company-second-decomp-20260926/journals/readable/com0u6.md) — Know Your Enemy | 10 | 0, 1, 2 | no |
| [111807 com0u7](../../outputs/grand-company-second-decomp-20260926/journals/readable/com0u7.md) — By Fire Reborn | 3 | 0 | no |
| [111808 com0u8](../../outputs/grand-company-second-decomp-20260926/journals/readable/com0u8.md) — [en] | 0 | none | no |
| [111809 com0u9](../../outputs/grand-company-second-decomp-20260926/journals/readable/com0u9.md) — [en] | 0 | none | no |
| [111810 com5u0](../../outputs/grand-company-second-decomp-20260926/journals/readable/com5u0.md) — Imperial Devices (Ul'dah) | 18 | 0, 1, 2, 3, 4 | no |
| [111811 com5u1](../../outputs/grand-company-second-decomp-20260926/journals/readable/com5u1.md) — Into the Dark (Ul'dah) | 18 | 0, 1, 2, 3, 4 | no |
| [111812 com5u2](../../outputs/grand-company-second-decomp-20260926/journals/readable/com5u2.md) — [en] | 0 | none | no |
| [111813 com5u3](../../outputs/grand-company-second-decomp-20260926/journals/readable/com5u3.md) — [en] | 0 | none | no |
| [111814 com5u4](../../outputs/grand-company-second-decomp-20260926/journals/readable/com5u4.md) — [en] | 0 | none | no |
| [111815 com5u5](../../outputs/grand-company-second-decomp-20260926/journals/readable/com5u5.md) — [en] | 0 | none | no |
| [111816 gcu101](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcu101.md) — It Kills with Fire (Ul'dah) | 34 | 0, 1, 2, 3, 4, 5, 6, 7 | no |
| [111817 gcu301](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcu301.md) — Prying Eyes | 10 | 0, 1 | no |
| [111818 gcu302](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcu302.md) — Different Strokes | 13 | 0, 1, 2, 3 | no |
| [111819 gcu303](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcu303.md) — A Weaver and a Mummer | 7 | 0, 1 | no |
| [111820 gcu304](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcu304.md) — When Alchemists Cry | 11 | 0, 1, 2 | no |
| [111821 gcu501](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcu501.md) — [en] | 0 | none | no |
| [111822 gcu502](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcu502.md) — [en] | 0 | none | no |
| [111823 gcu601](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcu601.md) — [en] | 0 | none | no |
| [111824 gcu602](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcu602.md) — [en] | 0 | none | no |
| [111825 gcu603](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcu603.md) — [en] | 0 | none | no |
| [111826 gcu305](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcu305.md) — Challenge Accepted | 7 | 0, 1 | no |
| [111827 gcu102](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcu102.md) — Like Father, Like Son | 17 | 0, 1, 2, 3, 4 | no |
| [111828 gcu701](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcu701.md) — Gore a Lizard, Hurry | 17 | 0, 1, 2, 3, 4 | no |
| [111829 gcu103](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcu103.md) — Careless Whispers | 13 | 0, 5, 10, 20 | no |
| [111830 gcu104](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcu104.md) — In for Garuda Wakening (Ul'dah) | 24 | 0, 5, 10, 15, 20, 25, 30 | no |
| [111831 gcu105](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcu105.md) — Don't Hate the Messenger (Ul'dah) | 51 | 0, 3, 5, 10, 15, 20, 25, 28, 30, 35, 40, 45, 50, 55, 60 | no |
| [111832 gcu106](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcu106.md) — United We Stand (Ul'dah) | 13 | 0, 5, 20, 25 | no |
| [111833 gcu107](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcu107.md) — To Kill a Raven (Ul'dah) | 25 | 0, 5, 10, 15, 20, 25, 30, 35 | no |
| [111834 gcu702](../../outputs/grand-company-second-decomp-20260926/journals/readable/gcu702.md) — Mess with the Goat, Get the Horns | 10 | 0, 5, 10 | no |

## Reproduction

```powershell
python -B tools/build_gc_second_journals.py build
python -B tools/build_gc_second_journals.py check
python -B tools/test_gc_second_journals.py
```

The parser rejects malformed macros and unclosed argument lists, retains empty IF arms, and proves every top-level source span reconstructs the original field. Tests cover nested alternate branches, false-arm predicates, sparse selectors, argument/locale separation and lossless Unicode spans. The check command regenerates in memory and rejects stale output. [English reference table](../../outputs/grand-company-second-decomp-20260926/journals/english-references.csv); [source hashes](../../outputs/grand-company-second-decomp-20260926/journals/source-manifest.json).
