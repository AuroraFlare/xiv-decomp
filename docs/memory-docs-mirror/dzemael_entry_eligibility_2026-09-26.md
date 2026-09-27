# Darkhold normal-entry eligibility, 2026-09-26

The normal entrance gate previously treated a nonnull `Session.GetActor()` as
proof that a party member was online. Production disconnect and supersession
retain that Player object until cleanup, so a stale actor could count toward
the four-player minimum, receive a retry timer and be passed to content zoning.
The old gate also counted duplicate member IDs and did not verify that the
event caller was the server's current leader object.

`DzemaelManager.TryGetEligibleParty` now validates one roster snapshot of four
to eight distinct IDs. Every candidate must have the exact connected,
nonsuperseded Session, matching Player/ID/party binding, and exact registration
in the captured public entrance area. A same-ID replacement cannot inherit an
old leader's entrance event. The gate rechecks roster, leader, session and area
identities before returning its complete entrant list. Rejected candidates do
not produce a partial entrant list for the caller.

The existing combat-class, level-45, quest-access and retry-timer requirements
are unchanged. This does not add death or combat restrictions, change admission
size, move the entrance, or alter GM-solo admission. These are validation-time
checks; no transaction-wide party/session lock is held through area allocation
and zoning. A later disconnect remains possible and is handled by the existing
instance and session lifecycles.

The technical population-count notice is now restricted to GM solo diagnostics.
Ordinary parties retain their entrance and duty-time feedback.

## Production regression

`tools/dzemael-encounter-tests/EntryEligibilityChecks.cs` invokes the actual
private entrance gate with production Party and Session behavior. It exercises
valid four/eight-member parties, actual `MarkDisconnected`/`MarkSuperseded`,
wrong session or actor binding, replaced area registration, stale party
membership, a replaced leader event caller, duplicate IDs, size boundaries and
nonleader rejection. No database, network server or live player is involved.

All **13 checks pass** after the correction. The same harness produces **eight
failures** against the prior tested DLL, SHA-256
`803FD1042C6F1C94C898DE1710536CDBB2DCF055D2A9F895D3D5F014F136E7F1`,
preserved at `.tmp/dzemael-audit-20260925/before-entry-runtime/Map Server.dll`.
The former disconnected/superseded actors are still present in their session
and area fixtures, reproducing the interval before cleanup rather than merely
checking a new helper's return value.

Run `dotnet <isolated-encounter-harness.dll> --entry-eligibility-only` against
the isolated runtime. The full encounter harness also includes these checks.
They prove deterministic stale-state rejection, not transaction-wide concurrency
safety or native client acceptance. No live server or database change is part
of this correction.
