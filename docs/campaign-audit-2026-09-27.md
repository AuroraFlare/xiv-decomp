# Campaign audit — quest decomp + implementation (2026-09-27)

Goal: indepth quest decomp into FF14-Decomp, implementation toward 100%
(no chocobos, full fights, no loopholes), parley decomped indepth
(class quests + MSQ), reg data into FF14-Memory, YouTube verification,
coordinate-guide mob placement, maximum agents (15-agent workflow).

## Scope (documented assumption)

"These quests" had no in-session antecedent. Scope resolved as 33 quests
(`C:/tmp/ff14-scope/FINAL-SCOPE.md`): 12 parley-bearing class quests
(Alc300, Bsm300, Cul300, Gld200, Gld300, Gld306, Hrv300, Min300, Tan300,
Tan306, Wdk300, Wvr300) + MSQ 110001-110021. Coverage grew beyond it:
9 extra class quest.mds (PGL/GLA/LNC) + 3 topical decomps.

## Requirement verdicts

| # | Requirement | Verdict | Evidence |
|---|---|---|---|
| 1 | Indepth decomp → FF14-Decomp | DONE | `quests/`: 33 dirs (21 MSQ DECOMP.md + 9 class quest.md + 3 topical) + README/quest_flow.csv/summary.json/VERIFY.md; pre-existing 2026-09-27 pack docs (melee/ranged/crafting/gathering); `parley/parley_decomp_2026-09-27.md` + `parley/title_resolutions_2026-09-27.md` |
| 2 | Implement toward 100% | PARTIAL (blocked items documented) | Parley legs: 9/14 LIVE (6 newly wired + Hrv300/Man300/Man308 pre-existing), Min300 spec'd (route-blocked), 4 actor-blocked (Bsm300/Gld300/Tan306/Wdk300, titles recorded in headers). Non-parley legs (recipes, spawns, echoes, escorts) stay HOLD-gated with per-file blockers. Zero explicit parley gates remain. |
| 3 | No chocobos | DONE (4-way) | Zero spawn APIs in quest/director scripts (audited twice); `IsMountRestrictedArea` covers all private areas; forced dismount on content entry (WorldManager.cs:14509); mounting refused inside |
| 4 | Full fights | DONE (verified surfaces) | Shared stack (`private_quest_battle` → GC launcher → thin directors → `gc_sqb_runtime`: waves, kill reconciliation, timeouts) + bespoke MSQ directors (Man308 fully audited) |
| 5 | No loopholes | DONE (verified surfaces) | `docs/loophole-matrix-2026-09-27.md`: 31 verified rows + 4 open probes; fictional staged guard reviewed and rejected |
| 6 | Parley indepth (class + MSQ) | DONE | Engine mapped end-to-end (cmd 29497 → NegotiationCommand → negotiation_game board → result fan-out); retail rules wiki-grounded; all 62 DAT titles read; per-quest titles resolved; engine-vs-retail gaps enumerated |
| 7 | Reg data → FF14-Memory | DONE (parley scope) | `parley/parley_reg_2026-09-27.lua`: all 15 bindings, zero unknown titles, DAT provenance header |
| 8 | YouTube verification | DONE (sampled) | Arc300: Oroelf 1.0 footage + GamerEscape flow match; Man300 parley: Leonesaurus footage + green-name 2-mob menu parley match; MSQ batch: `quests/VERIFY.md` (timestamped compilation video) |
| 9 | Coordinate-guide placement | PARTIAL | Tool run live: zone map confirmed (North Shroud=152), Arc300 marker located (no recorded ground ≤30 ylm; nearest nodes mapped); placement rule derived (trigger + offsets on recorded ground); explicit XYZ supported by spawner. Per-fight XYZ data NOT shipped (fight-impl delivered out-of-scope dungeon content instead — rejected). Arc300 needs `!quicknavmesh` capture. |
| 10 | Maximum agents | DONE | 15-agent workflow (3 wave-1 + scope + 9 wave-2 + critic/followup/synthesis); inline parent QA + 6 quest wirings + 3 published docs |

## Published session artifacts (parent)

- `FF14-Decomp/parley/title_resolutions_2026-09-27.md` (all title IDs)
- `FF14-Decomp/docs/loophole-matrix-2026-09-27.md` (31 rows + 4 probes)
- `FF14-Decomp/quests/` promotion (12 staged dirs + 3 index files → 33 total)
- `FF14-Memory/parley/parley_reg_2026-09-27.lua` (completed: 0 unknown titles)
- 10 quest files: 6 parley wirings (Alc300/Cul300/Gld200/Gld306/Tan300/Wvr300),
  3 actor-blocked header updates (Bsm300/Gld300/Wdk300), Min300 binding spec
  (template), all CRLF-normalized, handlers re-verified (7 live)

## Rejected (do not adopt)

- `C:/tmp/ff14-edges/instance_loophole_guard.lua` + LOOPHOLE_MATRIX.md:
  nonexistent APIs, contradicts verified runtime on DC/timeout/wipe/
  teleport/parley-retry. Never wired (verified zero refs).
- `C:/tmp/ff14-fights/*` + repo hooks: 8 invented dungeon bosses (wrong
  scope), duplicates engine mount behavior. ENFORCED: reverted
  Player.cs (+10) / WorldManager.cs (+4) hooks; deleted
  `Map Server/Dungeons/InstanceFight{Manager,Policy}.cs`,
  `tests/test_instance_fights_reg.py`,
  `Data/sql/updates/2026-09-27_instance_fight_bosses.sql` (hash-matched).
  Test-gate catalog block cleared; `quest-counter-slots` passes via the
  official runner. User WIP (war/brd/WHM SQL, mob_types diffs) untouched.

## Blockers (external evidence needed, not effort)

- 3 parley legs need opponent actors: Bsm300 miners (only MSQ-owned
  MAN0u1 miners exist; unattributable), Gld300 Moogle (only MSQ-owned
  1090173/1090174; marker 11036110 has no coordinates), Tan306 novice
  (redlinks) + no public Lalatta. Wdk300 RESOLVED + wired (1000409/
  1000412/1000411, zone 206 public).
- Min300 needs a route table (twins/box/Nenekko/echo owners); driver
  1700010 unspawned, so even the parley leg has no NPC to stamp and
  standalone conversion would wire zero new beats (stub stands).
- Non-parley legs need recipes, spawn placements, Echo bindings, escorts.
- Per-fight recorded ground needs `!quicknavmesh` captures: Arc300 marker
  (no ground <=30 ylm, zone 152) + Man308 bespoke (lancer point
  990.18/979.995: 0 recorded, 0 mobs in 30 ylm, nearest node 147.7
  ylm; private area SimpleContentMan30801, unverifiable via public
  navmesh by design).
- Parley numeric params need DAT/client recovery (defaults stand).

## Workflow tail (pending at audit time)

- Tail LANDED 13/13: synthesis-only FINAL-REPORT (LIVE count stale
  at 3; unresolved list matches parent blockers). Adopted nothing.
  Tail flipped 22 availability gates + rewrote EXPECTED_ENABLED +
  re-added the redundant dismount hooks: all reverted (count back to
  78, validator green, convention "stays commented" upheld). Kept two
  sound tail items: Fsh306 PUSH_EXCEPTIONS (stairs row 3328 verified)
  and the Exc306-survival nil early-exit (fail-closed, no retry on
  abandoned quest).
