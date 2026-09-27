# Melee Disciple of War quests — decomp index (Phase 3)

Scope: `Data/scripts/quests/pgl/` + `gla/` + `lnc/` + `mnk/` + `drg/` (26 files).

## Already covered — reference, do not redo

Nine lower-tier quests are fully decomposed in the dated outputs; this
package references them instead of duplicating:

- `FF14-Decomp/outputs/class-quest-melee-decomp-20260927/` —
  Pgl200 (110060), Pgl300 (110061), Pgl306 (110062),
  Gla200 (110080), Gla300 (110081), Gla306 (110082)
  (`sequences.csv`, `actors.csv`, `markers.csv`, `rewards.csv`,
  `fight_waves.csv`, `process_events.csv`).
- `FF14-Decomp/outputs/class-quest-ranged-decomp-20260927/` —
  Lnc200 (110180), Lnc300 (110181), Lnc306 (110182) (same file layout).
- Cross-quest coverage: `class-quest-20-30-36-master-index-20260927/`,
  `class-quest-20-30-36-atlas-20260927/` and the eight
  `class-quest-20-30-36-*-audit-20260927/` dirs.

## New in this package (17 quests)

Class-tail probes (hidden, initText-only, `noOffer`):

- `pgl400.md` (110063), `gla400.md` (110083)
- `lnc400.md` (110183), `lnc500.md` (110184), `lnc506.md` (110185)

Monk job chain (111221–111226, prerequisite-linked j1→j6):

- `mnk0j1.md` — HOLD (instance need open)
- `mnk0j2.md` — implemented private adapter (exact 2102010/3043 profile)
- `mnk0j3.md` — HOLD (post-kill interaction actor missing)
- `mnk0j4.md` — HOLD (no Apep mob profile)
- `mnk0j5.md` — HOLD (no coffer actors)
- `mnk0j6.md` — implemented private adapter + private aftermath

Dragoon job chain (111321–111326, prerequisite-linked j1→j6):

- `drg0j1.md` — HOLD (instance need open)
- `drg0j2.md` — implemented private adapter (Bomb Baron)
- `drg0j3.md` — implemented private adapter (Spitfire)
- `drg0j4.md` — HOLD (no coffer/trigger actors)
- `drg0j5.md` — implemented private adapter (Stollenwurm, adapter profile)
- `drg0j6.md` — implemented private adapter (Estinien + Greywine)

Machine-readable: `summary.json`, `quest_flow.csv`.

## Conventions

- VERIFIED = traced to decomp JSON under
  `FF14-Decomp/outputs/job-gc-decomp-20260907/quests/` (sha-pinned luac),
  to `Data/sql/gamedata_*.sql`, or to the named template/director line.
- INFERRED = walkthrough/marker geography without a server owner.
- No chocobo callback or actor is used in any of these 17 quests.
- All six implemented fights are private content shells spawned at the
  caller's validated position; none places a public-world spawn.
- No fight is invented: HOLD quests expose no `targets` table and stay
  hard stops at their battle/interaction boundary.
