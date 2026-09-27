# Class quests 20/30/36 — sequence / counter / journal truth — 2026-09-27

Data: `outputs/class-quest-20-30-36-sequence-journal-audit-20260927/sequence_journal.csv` (31 bespoke files).
Sources: per-quest Lua (`SEQ_*`/`EXC306_SEQ_*` constants, `COUNTER_*`/`FLAG_*` slots,
`getJournalInformation` returns, `110xxxYY` marker tokens). Stubs (21 files) carry none of this;
their truth is in `class_quest_template.lua` (see reward/marker/event audit).

## 1. Battle sequences (retail numbering preserved)

- Pgl200: 0/5/10/15/25/30/35 with coin + two branch counters in journal.
- Exc300: dense dialogue chain 0/5/7/8/9/10/11/12/15/16…​ (item-theft/delivery, valuables + funds in journal).
- Exc306: 0 door, 1 survival (internal), 2 warehouse (internal), 5/10/15/20 talks, 25 rematch door, 26 rematch (internal), 30 report, 35 reward. Journal carries the register flag.
- Arc300: 0/5/10/15/16/20 ambush/21 battle (internal)/25/30. Arc306: 0 ask, 6 escape, 7 return, 8 duel, 10/15/20.
- Cnj306: 0 brief, 5 request, 15 meet, 16 escort, 25 echo, 30 cave, 31 defense, 40 report, 45 return.

## 2. Craft/gather counters and journal shapes

- Standard craft journal: `(sequence, gain|held, 0, 0, required)` with snapshot baselines
  (`COUNTER_BASELINE`) — Wdk/Bsm/Gld/Tan/Wvr/Alc/Cul all follow it; Cul200 uses branch slots 2/3 with
  `(sequence, done, 0, 0, 2)`; Cul306 tracks foul/devil belly, spice, recipe, meat + echo flags.
- Parley quests surface parley wins in journal slot 1 with the required count in slot 4
  (Wdk300: 3, Gld200: 3, Wvr300: 4).
- Fsh200: `(caught, 0, 0, 0, 5)` with `COUNTER_BASELINE` + `FLAG_ROD_GRANTED` retry guard.
  Fsh300: emote rounds + barrel-catch flag; Fsh306: timed base with deadline low/high counters + 3 echo flags.
- Tan306: prep-quality probe (`tan306_bestPrep`) plus vintage counter and novice/beli/echo flags.

## 3. Clarified gap: Wvr306's instance tail is interaction-only, with unresolved trigger actors

The template documents `QuestDirectorWvr30601` as `recoveredEmpty` with `sqbDoesNotImplyCombat`
(likely a private silk-removal interaction, not combat), so no battle-director file is expected.
The real gap is in `wvr306.lua` itself: the Copperbell on-site synthesis (ten Luxurious Gloves,
one-at-a-time Thanalan Spider Silk beside Chuchumu) has no interaction owner for silk removal,
and the Copperbell/Gold Court trigger actors are unresolved. Do not ship Wvr306 as 100% until
those trigger owners exist or the hold is explicitly re-scoped — there is no combat to write here.
