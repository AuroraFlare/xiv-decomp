# Man308 fail edges and SEQ audit

## Handled (verified in code/engine)

- Timeout: 30:00 director loop (`TIMEOUT_SECONDS`, Man-standard) →
  `failBattlefield` → owner to SEQ_005 + flag cleared + party warp to the
  public approach anchor `(1134.053, 312.430, 830.706)`.
- Death: owner `IsDead` → fail immediately. Helper death does not fail
  (party continues; retail-parallel: only the owner's defeat ends it).
  Companion-ally KO likewise continues the fight under engine AI.
- Disconnect: session rebind each tick (`getDirectorPlayerById` +
  `IsSamePlayerSession`); 120s missing grace, 120s out-of-area grace;
  landing timers restart and the phase rebuilds from the saved Parley flag
  (flag 0 → ritual re-queued; flag 1 → combat resumed). `SetLoginDirector`
  routes relogins back into the copy.
- Left battlefield (teleport/return): out-of-area 120s grace → fail to
  SEQ_005 + warp. `onPlayerLeft` rewinds an owner holding SEQ_010/015
  immediately; helpers' independent journals are never touched.
- Abandon: engine-side — MSQ cannot be abandoned (msg 25233) and no quest
  can be abandoned inside an instance (25235); verified in `Player.cs`.
- Chocobo/mount: engine-side — `IsMountRestrictedArea` is true for every
  private area (`WorldManager.cs`); `DoZoneChange` auto-dismounts and
  `CanMountInCurrentArea`/`SetMountState` refuse summons. No Lua needed
  (Man300/Man304-line convention).
- Escort: not applicable — no escort exists; the companion talk teleports
  to battle staging. No follow/teleport/aggro rules to author.
- Landing: all-humans-landed gate before the ritual; 120s party-landing
  timeout; 8s ritual/completion notice fallbacks to direct scenes.
- Spawn failure: captive-spawn failure or companion-ally failure fails the
  attempt (never an unwinnable or uninteractable copy).
- Never stranded: fail/completion warp every admitted member; recovery
  re-entry stays open at SEQ_010/015 via the public approach trigger.

## SEQ/event audit (no loopholes)

- ACCEPT: market entrance only warps; court trigger only offers
  (`isQuestInfoAccepted`, else stays pre-accept). No other NPC advances.
- 000: gate trigger only (`pE01` → SEQ_005). Double-push impossible
  (sequence moves in the same handler).
- 005: approach trigger only; entry failure stays on 005 with message.
  Post-entry pushes no-op (sequence is 010+).
- 010: companion talk only, owner-only, in-content-only
  (`advanceMan308RitualFromCompanion` re-checks all three; director
  `onTalkEvent` EndEvents non-owners). Helper with an identical companion
  class cannot advance anyone else's journal. `pE20`+`pE30` → SEQ_015 +
  staging move, atomic in one handler.
- 015: director-owned. Parley win requires ritual-spawned captive +
  owner at SEQ_015, else the attempt fails closed ("invalid parley quest
  state"). Parley loss retries in place. Combat completion requires 3/3
  authoritative defeats. SEQ_015 marker falls back to the approach marker
  outside content (added this pass — previously showed interior captive
  markers to holders outside the copy).
- 020: Minfilia `pE90` + reward window + `CompleteQuest` + warp; market
  entrance routes to the Waking Sands entry. Rewards auto-grant once via
  SQL; the script never double-grants (gil intentionally absent).

## Fixes applied this pass (memory tree)

1. `Data/scripts/quests/man/man308.lua` — SEQ_015 journal markers fall back
   to the Paglth'an approach marker when the holder is outside the content
   copy (mirrors the SEQ_010 branch; interior captive/Amalj'aa markers only
   show inside).
2. `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/man/man308.lua`
   + `tools/decompile_man308_cutscene_setup.py` — mirrored the git-tracked
   recovered client scenario and cutscene decoder into the memory tree
   (SHA-256-identical) so `tools/validate_lord_errant_man308.py` (which
   mandates both) runs instead of crashing on missing prerequisites. The
   decomp tree remains the runnable home (decoder exit 0 there this pass).
   Sibling validators (man304/man406) crash on their own missing mirrors:
   systemic tree condition, out of scope here.
3. This folder — indepth decomp notes (actors, triggers, AI, edges).

## Known shared-pattern edge (documented, not diverged)

Leave-and-re-enter within the 120s absence grace: the stale copy's director
may fire `failBattlefield` while the owner is already in a fresh copy,
yanking the owner to the public anchor with a SEQ_005 reset. Self-healing
(the approach trigger re-enters cleanly; no strand, dupe, or stuck state),
identical in Man402, and a quiet-retire guard would risk stranding helpers
in dead copies — so no per-quest divergence was added.

## Open captures (not code gaps)

- Quest-specific Parley tile values (server generic deterministic board).
- `!quicknavmesh` ground around Paglth'an and the ritual clearing (all ten
  route/combat points are currently unrecorded; heights stay authored).
- `man30820` orphan scene: no wrapper or cut-replay row; no call site
  invented. `pE00`/`020_x`/`090_x` talk flavors: recovered, unwired by
  route audit (no state depends on them).
