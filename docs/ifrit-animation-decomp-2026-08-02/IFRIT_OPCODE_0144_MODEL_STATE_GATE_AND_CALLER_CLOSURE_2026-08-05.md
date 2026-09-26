# Ifrit opcode 0x0144 model-state gate and caller closure

Audit date: 2026-08-05  
Client: retail FFXIV 1.23b `ffxivgame.exe`, image base `0x00400000`

## Result

The Plume/Eruption model-state invocation is now traced from the inbound
opcode payload through its deferred queue, the action-time state kick, the
model-resource gates, exact SCB name construction, lookup, scheduler creation,
and cleanup.

The decisive facts are:

1. Opcode `0x0144` payload byte `+4`—the server's `mode` field—is the low byte
   of the model-state word. It is not payload byte `+0` (`breakage`).
2. Receiving `0x0144` does not immediately launch the state scheduler. The
   concrete character handler queues the mode word as event type `3`.
3. `RaptureActionSubStatusSchKickClip` consumes that queued event at action
   time and calls `0x7A82F0`.
4. `0x7A82F0` only launches `init_msbN_1` when the actor's currently loaded
   model metadata advertises state `N` and the active model-resource root can
   resolve that SCB.
5. The earlier raw clear/set/clear tests were therefore incomplete even when
   the actor was instantiated and known: writing `breakage` queued type `2`,
   while writing `mode` without a real SubStatusKick only leaves type `3`
   pending.

This is why `!playanimation` and standalone `0x0144` publication both appear
to do nothing.

## 1. Network dispatch

The generic opcode switch covers resolved opcodes `0x0143..0x01A8`:

```text
0x004DCFE3  subtract 0x143 from resolved opcode
0x004DCFE8  range-check <= 0x65
0x004DCFF1  read byte selector table at 0x004DD5B4
0x004DCFF8  jump through target table at 0x004DD4F8
```

Both resolved opcode `0x0144` and `0x0145` select the branch at
`0x004DCFFF`:

```text
0x004DCFFF  push actor ID / lookup key from [EBP+8]
0x004DD003  actor manager in ECX
0x004DD005  call 0x004D9910 to resolve actor
0x004DD00A  reject null actor
0x004DD012  load actor vtable
0x004DD016  load virtual slot +0x24
0x004DD019  push payload pointer in ESI
0x004DD01A  call concrete actor packet handler
```

At the requested `0x004DD01A` breakpoint:

- `ECX` is the resolved actor object;
- `[ESP]` is the eight-byte substate payload pointer after accounting for the
  call return address convention;
- `[EBP+8]` in the outer dispatcher is the actor lookup key used by
  `0x004D9910`.

## 2. Concrete character handler and exact payload split

The concrete handler is `0x00662D30`. Its subtype `0x3B` branch begins at
`0x006638A4` and consumes the eight-byte payload exactly as follows:

| packet offset | server serialization | native consumer | queue/action |
| ---: | --- | --- | --- |
| `+0..+3` | breakage, chantId, guard, waste | `0x7BF270` | type `2`; separate substatus update |
| `+4..+5` | mode, zero | `0x7B4440` | type `3`; deferred model-state word |
| `+6..+7` | motionPack | `0x7A5260` | immediate/store motion pack |

Exact instructions:

```text
0x006638A4  MOV EDX,[ESI]
0x006638A6  ADD EDI,0x1110
0x006638AC  PUSH EDX
0x006638AF  CALL 0x007BF270

0x006638B4  MOVZX EAX,word ptr [ESI+4]
0x006638B8  PUSH EAX
0x006638BB  CALL 0x007B4440

0x006638C0  MOVZX ECX,word ptr [ESI+6]
0x006638C4  PUSH ECX
0x006638C7  CALL 0x007A5260
```

`EDI + 0x1110` is the actor's substatus queue component.

The server packet definition independently serializes:

```text
+0 breakage
+1 chantId
+2 guard
+3 waste
+4 mode
+5 zero
+6..7 motionPack
```

Therefore a model-state test must put `0x10`, `0x20`, or `0x80` in byte `+4`.

## 3. Why the state is deferred

`0x7B4440` does not call the model-state selector. It creates a queue record:

```text
record timestamp = queue +0x54
record type      = 3
record payload   = uint16 mode word
insert into ring = 0x7C7C20(queue +0x3C, record)
queue time       = global 0x00FA5128
```

By comparison, `0x7BF270` creates type `2` from payload `+0..+3` and
`0x7A5260` stores the motion pack at queue `+0x12` and actor `+0xC20`.

The action scheduler's `RaptureActionSubStatusSchKickClip` then emits the
substatus-consume event. `0x7BF2E0` drains entries at or before the action
timestamp. Its type-`3` branch obtains the queued uint16 and calls
`0x7A82F0` on actor model-state component `actor + 0xB80`.

There are four direct machine-code call sites to `0x7A82F0` in the complete
PE `.text` section:

| call site | role |
| --- | --- |
| `0x007ABEE6` | immediate model-state-word thunk used by subtype `0x3F`; writes component `+0x10`, then calls selector |
| `0x007BB8E2` | component reset/cleanup; old state -> zero |
| `0x007BF3E2` | queued type-`3` consume path with caller-supplied flag |
| `0x007BF5F8` | alternate queued type-`3` consume path |

The `.text` scan found no fifth direct call and no raw function-pointer record
to `0x7A82F0`. Normal opcode `0x0144` subtype `0x3B` reaches it through the
queued type-`3` consume path, not the subtype-`0x3F` immediate thunk.

## 4. Exact `0x7A82F0` state transition

Inputs:

```text
ECX = actor + 0xB80 model-state component
[EBP+8] = new uint16/uint32 state word
```

Persistent fields:

| component offset | meaning |
| ---: | --- |
| `+0x00` | owning actor pointer |
| `+0x24 + 4*N` | active scheduler handle for model-state bit N |
| `+0x44` | active high-byte `init_msn` scheduler handle |
| `+0x4C` | current state word/mask |

The function first computes:

```text
changed = old_state XOR new_state
component->state = new_state
```

It then reads two bytes from the active model's metadata.

### Metadata gate A—advertised state count

`0x65BE50(actor)` follows:

```text
actor +0x2B10
-> object +0x04
-> model metadata interface at +0x40
-> virtual method +0x04
-> metadata record
```

It returns zero unless metadata flag byte `+0x03` contains `0x80`. When valid,
it returns metadata byte `+0x35`.

`0x7A82F0` converts values `0..8` into these lower-state validity masks:

| metadata `+0x35` | usable lower mask |
| ---: | ---: |
| 0 | `0x00` |
| 1 | `0x01` |
| 2 | `0x03` |
| 3 | `0x07` |
| 4 | `0x0F` |
| 5 | `0x1F` |
| 6 | `0x3F` |
| 7 | `0x7F` |
| 8 | `0xFF` |

Thus state 5 requires the active model metadata to advertise at least six
lower states.

### Metadata gate B—supported-state mask

`0x65C550(actor)` follows the same model-metadata chain and flag check, but
returns byte `+0x3B`.

For each lower bit `N = 0..7`, `0x7A82F0` proceeds only when all are true:

```text
(old XOR new) contains bit N
metadata +0x35 validity mask contains bit N
metadata +0x3B supported-state mask contains bit N
```

For Plume/Eruption:

| carrier/state | required validity | required supported bit |
| --- | --- | ---: |
| native m999 Plume state 4 | metadata `+0x35 >= 5` | `+0x3B & 0x10` |
| native m999 or m852 Eruption state 5 | metadata `+0x35 >= 6` | `+0x3B & 0x20` |
| canonical m852 imported Plume state 7 | metadata `+0x35 >= 8` | `+0x3B & 0x80` |

If the carrier has no loaded model object at actor `+0x2B10`, the metadata
interface is null, the `0x80` metadata flag is absent, or either byte rejects
the bit, no SCB lookup occurs.

## 5. Exact SCB request and scheduler creation

For each changed supported lower bit:

```text
new bit set   -> format "init_msb%u_1"
new bit clear -> format "init_msb%u_0"
```

Format strings:

| address | value |
| --- | --- |
| `0x00FE75BC` | `init_msb%u_1` |
| `0x00FE75CC` | `init_msb%u_0` |

The separate high byte uses:

| address | value |
| --- | --- |
| `0x00FE75DC` | `init_msn000` |
| `0x00FE75E8` | `init_msn%03u` |

The lower-state resource path is:

```text
actor +0x114 -> scheduler/model factory
actor +0x12F0 -> active model-resource root
build resource key type "scb" plus formatted init_msb name
virtual lookup at 0x7A8455
0x7A8457 tests lookup result
build scheduler owner/transform context
factory virtual +0x6C prepares launch object
active-root virtual call at 0x7A852A creates scheduler
0x7A852C stores returned handle at component +0x24 + 4*N
```

The requested breakpoint semantics are therefore:

| breakpoint | log |
| --- | --- |
| `0x007A82F0` | owner actor from `[ECX]`, old state `[ECX+0x4C]`, new state `[ESP+4]`, active model object/root pointers |
| `0x007A8457` | formatted SCB name buffer, lookup EAX, bit index, owner actor, active root `actor+0x12F0` |
| `0x007A852C` | scheduler result EAX, destination handle slot, owner actor, prepared scheduler context/world transform |

When a bit clears, the prior handle at `+0x24+4*N` is released and zeroed,
then the `_0` SCB is resolved and launched to cancel the `_1` scheduler.

## 6. Confirmed effect-specific invocations

### One localized Radiant Plume

```text
exact m999/e001-compatible owner at desired origin
-> opcode 0x0144 payload +4 mode 0x10
-> WSS4 / command 23595 SubStatusKick
-> queue type 3 calls 0x7A82F0 with bit 4
-> init_msb4_1 -> msb4 Plume package
-> mode 0 + another WSS4 kick
-> init_msb4_0 cancels it
```

### Eruption warning and impact

```text
snapshot target world coordinate
-> exact m999/e001-compatible stationary owner at snapshot
-> opcode 0x0144 payload +4 mode 0x20
-> WSS4 / command 23595 SubStatusKick
-> queue type 3 calls 0x7A82F0 with bit 5
-> init_msb5_1 -> terrain-bound pre-impact formation
-> hold for approximately 3 seconds
-> mode 0 + WSS4 kick
-> init_msb5_0 cancels warning
-> m999 WSS3 / command 23594 impact on same owner/origin
```

`m999` WSS4 and WSS5 contain byte-identical generic SubStatusKick payloads;
WSS4 is preferred because command `23595` provides a recovered mapped route.

### Canonical m852 alternative

The same selector uses:

- `mode 0x20` for byte-identical imported Eruption `init_msb5_*`;
- `mode 0x80` for byte-identical imported Plume `init_msb7_*`.

## 7. Why the earlier carriers were silent

The old negative tests do not disprove the assets:

1. They populated opcode-`0x0144` `breakage`, which the concrete client handler
   routes to type `2`; it cannot reach `0x7A82F0`.
2. A corrected `mode` publication would still only queue type `3`; a real
   SubStatusKick is required to consume it.
3. The forced m999 appearance used HEAD `1024`; the installed m999/e001 donor
   shape is HEAD `0`, BODY `1024`.
4. Any test before the model object/resource root finishes loading returns
   zero at the metadata gates and performs no lookup.

The exact first live visibility test must therefore use all four corrections:

```text
base 10999, size 2, HEAD 0, BODY 1024
wait until actor/model resource is loaded
publish mode bit in payload +4
perform mapped WSS4 / command 23595 SubStatusKick
```

## 8. Ownership boundary

This trace proves how any compatible actor launches the visual. It does not
identify Square Enix's retail helper actor class. The separate exhaustive
class/appearance census found zero Ifrit-class m999 rows. Appearance `1001481`
is an exact generic visual donor, while `2207314` is an Ifrit-class full m852
candidate with byte-identical imports.

A retail packet capture is still required to choose between a generic m999
helper, a hidden/full m852 proxy, or an already-present actor whose appearance
or model root is changed dynamically.

## Reproduction artifacts

- `tools/outputs/ifrit-helper-carrier-census-20260805/state_handler_decompile.txt`
- `tools/outputs/ifrit-helper-carrier-census-20260805/model_state_format_strings.txt`
- `tools/outputs/ifrit-helper-carrier-census-20260805/state_gate_helpers_decompile.txt`
- `tools/outputs/ifrit-helper-carrier-census-20260805/state_handler_xrefs_decompile.txt`
- `tools/outputs/ifrit-helper-carrier-census-20260805/state_handler_direct_callers.txt`
- `tools/outputs/ifrit-helper-carrier-census-20260805/opcode_0144_call_window.txt`
- `tools/outputs/ifrit-helper-carrier-census-20260805/opcode_0144_concrete_handler.txt`
- `tools/outputs/ifrit-helper-carrier-census-20260805/substate_queue_builders.txt`
- `tools/outputs/ifrit-helper-carrier-census-20260805/state_thunk_static_caller.txt`

The exhaustive direct-call list was independently verified by scanning every
`.text` byte for x86 `E8 rel32` instructions whose resolved destination is
`0x007A82F0`.
