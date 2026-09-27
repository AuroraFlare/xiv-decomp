# Dzemael entry crash: 2026-09-19 native evidence

The 11:43 entry failed in the client's native layout-instance transform path.
The evidence does not establish that an opening cutscene ran, or that a missing
occupancy director directly caused the fault. Opening scene and duty-widget
acceptance remain unrecorded.

The later 12:12 fresh-entry retest reached the instance without the earlier
crash, but the user saw neither the opening scene nor the duty widget. At
12:12:23 the server captured the original opening request with `cutscene=True`;
subsequent delivery diagnostics stayed at `ownerKnown=False`, with the same
session, actor generation `3/3`, valid area, no zone change, and event owner zero.
This is successful fresh-entry observation, not scene/widget acceptance. It
exposes a separate director publication/visibility-bookkeeping failure after
landing; the guarded scene sender correctly refused an unknown event owner.

The production `Session.UpdateInstance` missing-actor sweep explains that new
blocker: live publication registers the director in the Session actor roster,
but the next spatial actor list excludes directors and removes the registered
owner without changing actor generation. Earlier scene fixtures seeded only
the known-ID set, so they did not exercise this sweep. The follow-up correction
retains an already-published, nondeleted director only for the current Session,
exact current area and reciprocal exact-object player/director membership.
Explicit retirement and invalid relationships still remove it. Scene ownership,
session, generation, busy-event and deadline checks remain intact. This
bookkeeping correction still requires a new scene/widget retest.

The expanded production encounter harness passes **2,421 checks** on isolated
DLL SHA-256 `381D04654A2B44B160D5ED008905F0FA38551570243D1B88FF74F4C9596C6476`.
The same harness fails its owned-director retention assertion against the prior
entry-fix DLL `94EC5D58F3A743CE0F7AD8CF7E65F102AAF9355156A437445DD6ED67674AE60C`.
The regression registers the director through production Session tracking,
runs the real spatial refresh twice, then exercises the scene invitation and
claim for both cutscene and widget-only entry. It verifies no remove/respawn
loop, the unchanged deadline, explicit retirement, invalid ownership, equal-ID
replacement objects, and session/generation/event-slot protections. It does not
simulate native rendering or the full Lua-backed director spawn transport.

## Frozen inputs

- Local WER dump: `C:\Users\drime\AppData\Local\CrashDumps\ffxivgame.exe.63124.dmp`.
  SHA-256: `B8384FD78B9B9BC66A31FB16D0D40306EBF9AC0F6A2A643D9EB80BC7D48FB7A6`.
  Do not commit the raw dump; it contains process memory.
- Server log supplied as attachment `f6614b82-6919-4855-99f5-5bca374b16f4/Pasted text.txt`.
- Dump executable module: `ffxivgame.exe`, image base `0x00400000`, timestamp
  `0x504F671F`, image size `0x00F99000`.
- Existing mapped executable used for native inspection: `.tmp/ffxivgame-ifrit.exe`,
  SHA-256 `9341F2B4567440B310A4D494F5CC5599CA334BA51C8042247317FF466492F2E9`.
  The fault-function instructions match the bytes included in the dump. This
  does not claim that every byte of the live image was compared.

## Observations

The log publishes destination SetMap at 11:43:16.088, local player at 17.103,
player initialization at 17.387, area master at 17.432, debug actor at 17.534,
and world master at 17.643. Cleanup follows at 21.586. The final `scene-directors`
snapshot phase does not emit the inter-phase log, so the last logged phase does
not prove that director packets were never sent. No director-ready or opening
invitation is recorded. The Eye starts its server-side held action at 17.198;
that log alone does not establish delivery of an action packet to the loading
client.

The same existing private instance was subsequently reattached during the
11:50+ reconnect. The server recorded one connected session and an entry-area
movement checkpoint at 11:51:53, with Eye broadcasts active. This distinguishes
the failed fresh-entry transition from a successful server-observed reconnect;
it does not validate a new-entry correction or establish visual acceptance.

The exception stream identifies thread `0x108CC`, access violation `0xC0000005`,
instruction `0x00ABA0BE` (module offset `0x006BA0BE`), reading `0xD4010396`.
The exception context, rather than the later exception-handler thread context,
contains these registers:

| Register | Value |
| --- | --- |
| EIP | `0x00ABA0BE` |
| EAX | `0xD4010382` |
| ESI | `0x07A8B1E4` |
| EDI / ECX | `0x07A87844` |
| EDX | `0x00A29AA0` |
| ESP | `0x113FF9A0` |
| EBP | `0x113FFDC0` |

At `0x00ABA0A0`, a virtual call at slot `+0x4C` resolves to `0x00A29AA0`,
which returns the parent's stored pointer at `+0x10`. The returned child is
`0x07A8B1E4`. Reading its first word produces the invalid vtable value
`0xD4010382`; `mov edx,[eax+0x14]` then faults. This is a nonzero invalid
vtable, not a demonstrated null pointer or cleared-to-zero vtable.

The native stack and verified call instructions establish this chain:

```text
00650400 -> 006443B0 -> virtual slot +120 / 007FF440
         -> 00A99FE0 -> 00ABA0A0 -> fault at 00ABA0BE
```

The `0x007FF440` method pointer at `0x00FF28BC` belongs to vtable `0x00FF279C`.
Its complete-object locator at `0x0116386C` names type descriptor `0x012C74C0`:

```text
Application::Scene::Actor::Map::Layout::RaptureLayoutInstanceObject
```

The diagnostic string at `0x010A8898`, decoded as CP932, describes issuing an
`EnvironmentTransformAction` to an Instance type that does not support applying
an environment matrix. That diagnostic branch was not reached; it identifies
the routine's purpose, not the observed error message.

## Interpretation and limits

The direct failure is a stale or corrupted native layout-instance child during
environment transform processing. The minidump excludes both relevant heap
objects, so it cannot reveal the layout instance ID, resource, actor owner,
allocation history, or the packet that invalidated the object. A use-after-free
is consistent with the evidence but is not independently proven.

`ZoneConnection.cs` already documents a historical July failure at the same
offset. That recurrence motivates inspecting actor/layout teardown and rebuild
ordering, but the old comment does not prove today's trigger or fix.

In the failing build, populated Dzemael advertises the instance-raid area flag while deferring
its content director until landing. Successful Toto-Rak uses destination director
publication during bootstrap. Aligning those contracts is a candidate correction;
the dump does not identify the invalid layout object as a director. Keep any
such correction's claimed scope separate from live crash resolution. Preserve
the opening invitation's ownership, generation, session and event-slot gates,
and the director-suppressed empty diagnostic path.

## Reproduction of the offline inspection

Use Python `minidump` to parse the exception stream's `ThreadContext` as
`WOW64_CONTEXT`; the thread-list context is the later exception handler and
does not contain the fault registers. `capstone` can disassemble the dump's
fault-code range. `pefile` can inspect the existing mapped executable's call
sites, vtable, RTTI and CP932 diagnostic string. Read-only Ghidra exports used
`tools/ghidra/DecompileGarudaVerifiedTargets.java` against the existing
`ghidra-ifrit-targeted` project. Local scratch exports are
`.tmp/dzemael-entry-crash-native.txt`, `.tmp/dzemael-entry-crash-callers.txt`
and `.tmp/dzemael-entry-crash-strings.txt`; their recovered mid-function
boundaries were corrected using the actual prologues and call instructions
listed above.
