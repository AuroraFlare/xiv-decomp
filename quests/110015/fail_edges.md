# Man300 fail edges and SEQ audit

## Handled (verified in code/engine)

- Timeout: 30:00 director loop (`TIMEOUT_SECONDS`, Man-standard) →
  `failBattlefield` → all holders to SEQ_020 + party warp to public mesa.
- Death: owner `IsDead` → fail immediately. Helper death does not fail (party
  continues; retail-parallel: only the owner's defeat ends the attempt).
- Disconnect: session rebind each tick (`getDirectorPlayerById` +
  `IsSamePlayerSession`, Man308 pattern); 120s missing grace, 120s
  out-of-area grace; landing timers restart; notice queues re-arm while
  weakened/spawned/withdrawing/parley progress is preserved (actors persist
  in the static area). Opening-event death during disconnect re-kicks `pE40`
  after landing instead of failing.
- Left battlefield (teleport/return/β): out-of-area 120s grace → fail to
  SEQ_020 + warp. `SetLoginDirector` routes relogins back into the copy.
- Abandon: engine-side — MSQ cannot be abandoned (msg 25233) and no quest can
  be abandoned inside an instance (25235). `onFinish` clears the briefing flag.
- Chocobo/mount: engine-side — `IsMountRestrictedArea` is true for every
  private area; `DoZoneChange` auto-dismounts (`EnforceMountRestriction…`) and
  `CanMountInCurrentArea`/`SetMountState` refuse summons. No Lua needed.
- Escort: not applicable — no escort exists; Nananoby/Almxio/Zoxio are static.
- Busy battlefield: exclusive-director rejection with retry message; owner
  marker assigned only after admission.
- Landing: all-humans-landed gate before companions; 30s companion/landing
  timeout; 10s opening-notice timeout; 5s completion fallback to direct `pE50`.
- Never stranded: fail resets EVERY member holding SEQ_025/030 (not just the
  owner); ownerless fail with members warps the party (static cleanup ends
  the director); ownerless fail with zero members ends the empty director.

## SEQ/event audit (no loopholes)

- ACCEPT: Minfilia only pre-briefing; Tataru only post-briefing; accept via
  `isQuestInfoAccepted`, else stays pre-accept. No other NPC advances.
- 000: push market trigger only; Tataru talk is flavor. Double-push impossible
  (sequence moves + warp in the same handler).
- 010: Hedyn `pE20` + SEQ_015 + warp; six exposition talks are pure turns.
- 015: Drybone trigger sets counter 5 + Path LS; RE-PUSH GUARDED (added this
  pass — previously re-sent the LS pack). `onNpcLS` gates (from==6, SEQ_015);
  completing 302+303 → SEQ_020. Journal/marker split on counter==5.
- 020: mesa trigger only; entry failure stays on 020 with message. Post-entry
  pushes no-op (sequence is 025+).
- 025/030: director-owned; quest script exposes only Nananoby `040_2` flavor
  (SEQ_030). Combat and parley converge on one completion gate; both
  representatives required for parley; parley without intro talk is rejected.
- 035: Hedyn `pE60` + reward window + LS + `CompleteQuest` + warp; six
  reaction talks are pure turns. Rewards auto-grant once via SQL; the script
  never double-grants (gil intentionally absent from the script).

## Fixes applied this pass (memory tree)

1. `Data/scripts/quests/man/man300.lua` — Drybone trigger re-push guard.
2. `Data/scripts/directors/Quest/QuestDirectorMan30001.lua` — owner session
   rebind + reconnect recovery (progress-preserving), 120s missing/absence
   grace, all-holders SEQ reset on fail, ownerless-with-members party warp.
3. This folder — indepth decomp notes (actors, triggers, AI, edges).

## Open captures (not code gaps)

- Quest-specific Parley tile values (generic deterministic board in use).
- `man30050` Asien/Crystal are cutscene-only; no persistent spawns expected.
