# Follow-up review: login groups and regional leve acceptance

Scope: paths adjacent to the reported World login null-name exception and
guildleve evaluation symptoms. This is a local source and regression review,
not an audit of every server feature or a live test on the other installation.

## Additional fixes

1. **Retainer cache lookup raced creation/reload.** The old lookup checked its
   dictionary outside the registration lock. Concurrent first lookups could
   both enter creation, with the second throwing on duplicate registration.
   A reload could also remove an entry between ContainsKey and indexed access.
   Lookup, cache-hit return and creation now use the same existing group lock
   as reload. The database loader has an internal test override; production
   continues to use the same database query.
2. **Group packet counts could disagree with their roster.** Publication first
   captured a member list, then reread mutable group counts for the header,
   begin packet and each fragment. Counts could shrink or grow while the frozen
   list remained unchanged. Both counts and fragment selection now use that
   captured list. Existing packet-builder callers keep their original overload.
3. **Failed leve saves were reported as successful acceptance.** SaveGuildleve
   caught database exceptions without reporting failure; callers still changed
   memory and published the new plate. SaveGuildleve now returns success/failure,
   and ordinary/history-evaluation acceptance saves before mutating or publishing
   the slot. Existing outer acceptance paths can now take their failure/refund
   branch. An injected database rejection reproduced the old defect before the
   production correction.

No SQL data changes, migration, player-history reset or live deployment were
needed. These are additional runtime fixes on top of the earlier null-name,
fresh-completion-flag and evaluation-removal fixes.

## Verification

- Isolated World Server build succeeded. Existing analyzer/dependency warnings
  remain; this change does not update dependencies.
- World party suite passed, including routing, retained offline membership and
  relogin coverage, plus the earlier null-name checks in all four packet sizes.
- Added production publication tests check header/begin counts and every actor
  sent for 0, 1, 8, 9, 16, 17, 32, 33, 64, 65 and 97 members. The test group throws
  if publication attempts to reread its live count.
- Twelve simultaneous retainer cache misses produce one load and one registered
  group. Explicit reload replaces that group and subsequent lookup returns it.
- Isolated Map Server/database harness build succeeded; 509 assertions passed
  in a disposable MySQL schema. Injected INSERT rejection leaves both acceptance
  paths without an accepted in-memory plate or outgoing acceptance packets.
- Targeted `git diff --check` passed.

The affected remote installation still needs rebuilt World and Map Server
binaries and a login/Evaluate retest. Missing remote names and blank remote
leve IDs cannot be identified from this repository alone. These tests establish
the repaired behavior, not the absence of unrelated defects throughout the repo.
