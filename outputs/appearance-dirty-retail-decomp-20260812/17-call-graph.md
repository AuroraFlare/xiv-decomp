# Caller/callee inventory

Addresses are image-base virtual addresses for the verified binary in
`00-README.md`. “Direct” means an encoded `E8`/`E9` edge. Vtable and message
dispatch edges are labeled separately.

## Actor dirty reader

### `FUN_0058DF90` — first per-frame owner

- incoming: no direct `E8`/`E9` edge found; vtable entry `0x00FA7C68` stores
  `0x0058DF90`.
- path-relevant outgoing: `0x0058DFB3 -> FUN_00585D70`.
- all direct calls in its recovered first body:

```text
0058DFA5 -> 00586150
0058DFB3 -> 00585D70
0058DFBA -> 0058A090
0058DFC1 -> 005861B0
0058DFC8 -> 0058DA10
0058DFD3 -> 0058B1B0
0058DFDA -> 0058AEF0
0058DFE1 -> 005893F0
0058DFFB -> 004CFE30
0058E003 -> 005886B0
0058E00A -> 0058A8E0
0058E011 -> 00588ED0
0058E018 -> 00588F60
0058E02A -> 004D86B0
0058E04F -> 004D7980
0058E05D -> 00587800
0058E06A -> 004D73C0
0058E071 -> 004B4EB0
0058E094 -> indirect vcall
0058E09E -> indirect vcall
0058E0A6 -> 00796D50
```

### `FUN_00585D70` — sole `actor+0xB20` reader

- sole direct incoming call: `0x0058DFB3`.
- direct callees:

| callsite | callee | role in this function |
|---:|---:|---|
| `0x00585D83` | `0x004D7330` | resolve pending appearance source owner |
| `0x00585D92` | `0x005670D0` | initialize temporary 0x74-byte block |
| `0x00585DA5` | `0x0055D2B0` | fill temporary appearance block |
| `0x00585DEE` | `0x004D7980` | publish event 8 with actor+AAC, length 0x74 |
| `0x00585E04` | `0x00585930` | special-model AA8 update; not a fade launch |

## D6/D7 flag helpers

### `FUN_0058EBD0`

- sole direct incoming call: `0x0058D10E`, in the D6/D7 arm of
  `FUN_0058CCA0`.
- call arguments: `ECX=EDI=actor`, stack argument `1`.
- callees: none; leaf.
- no direct tail jump and no initialized absolute pointer to this function
  were found.

### `FUN_0058EBB0`

- sole direct incoming call: `0x0058D14E`, in the same D6/D7 arm.
- call arguments: `ECX=EDI=actor`; stack argument is the return of
  `FUN_00443E40(FUN_004D73B0([actor+0x7C]), 7, 0x1E, 0)`.
- callees: none; leaf.
- no direct tail jump and no initialized absolute pointer to this function
  were found.

## Event-to-renderer handoff

The actor event bus is indirect. For opcode/event 8, the CharaActor dispatch
case is `0x00663808`:

```text
event 8 dispatch at 00663808
  -> direct call 0066380B -> FUN_006623F0
  -> direct call 00662407 -> FUN_0065D730
```

### `FUN_006623F0`

- direct incoming: `0x0066380B`.
- direct outgoing: `0x00662407 -> FUN_0065D730`.
- effect: copies 29 dwords to renderer `+0x13C8` before the call.

### `FUN_0065D730`

- path incoming: `0x00662407`.
- outgoing calls: none.
- effect: first-bank zero-field backfill, flag-bit 0/1 conditional backfill,
  and renderer `+0x2B70` low-nibble arm to 1.

Additional appearance setter paths also invoke this shared backfill routine;
the broader recovered functions are preserved in
`12-renderer-and-property-consumers-decomp.txt`. The event-8 edge above is
the one reached from the B20 gate.

## Renderer per-frame phase and resource queue

### `FUN_00666720`

- sole direct incoming call: `0x006680C6`, inside per-frame
  `FUN_006679C0`.
- direct/indirect outgoing edges:

| callsite | callee |
|---:|---|
| `0x0066672C` | indirect vfunc `+0x268` gate |
| `0x0066673C` | `FUN_007A71E0` gate |
| `0x0066678F` | `FUN_007D1C80` queue submit |
| `0x0066679B` | `FUN_00665E40` synchronous fallback apply |
| `0x006667AA` | `FUN_007D1AF0` readiness poll |
| `0x006667C1` | `FUN_007D1B30` ready-bank retrieval |
| `0x006667D9` | indirect vfunc `+0x2D8` completion notification |
| `0x006667E2` | `FUN_00665E40` ready-bank apply |

### Queue leaves

| function | sole direct caller | direct callees |
|---:|---:|---|
| `FUN_007D1C80` | `0x0066678F` | none |
| `FUN_007D1AF0` | `0x006667AA` | none |
| `FUN_007D1B30` | `0x006667C1` | none |

## One-bank apply and model helper

### `FUN_00665E40`

- direct incoming calls: `0x0066679B` and `0x006667E2`.
- outgoing edges:

| callsite | callee | purpose |
|---:|---:|---|
| `0x00665E58` | `FUN_004181E0` | compatibility/apply-mode query |
| `0x00665E68` | `FUN_00664460` | renderer refresh preparation |
| `0x00665E7F` | `FUN_007BF4D0` | conditional renderer state update |
| `0x00665E9E` | `FUN_00846590` | copy B1C bit 0 to seven equipment entry flags |
| `0x00665EAD` | `FUN_008465C0` | set seven equipment dwords |
| `0x00665EE0` | `FUN_007A48F0` | obtain value for helper vfunc `+0x68` |
| `0x00665EEE` | indirect helper vfunc `+0x68` |
| `0x00665F0D` | indirect helper vfunc `+0x64`, resolved to `0x006B7840` |
| `0x00665F3C` | `FUN_008506C0` | conditional post-apply update |

### `FUN_006B7840` — model-helper vfunc `+0x64`

- incoming: indirect call at `0x00665F0D`; primary helper vtable
  `0x00FD3ED4 + 0x64` (`0x00FD3F38`) stores `0x006B7840`.
- outgoing:

```text
006B79E5 -> indirect vfunc +0x58
006B79F6 -> 00447450
006B7A07 -> 00446F50
006B7A0E -> 006B6850
006B7A24 -> 00632540
```

### `FUN_006B6850`

- sole direct incoming call: `0x006B7A0E`.
- direct callees: `FUN_006306F0`, `FUN_006306A0`, `FUN_00630660`, and
  `0x00CA7D70` at the final part-ID submissions.
- BODYGEAR uses helper `+0x9C` and produces one slot-0 resource ID.

## B1C bit-specific renderer consumers

### Bit 1

`FUN_0065BB00` sets renderer `+0x2830` bit `0x2`; no direct caller was
found. The apply wrapper performs the same bit replacement inline at
`0x00665EBD..0x00665ECF`.

`FUN_0065BB20` reads renderer `+0x2830` bit `0x2`:

- sole direct incoming call: `0x00832470` in `FUN_00832420`.
- callees: none.

`FUN_00832420` has no direct caller in the initialized executable, so its
owner is indirect/callback-driven. Its direct callees are:

```text
00832459 -> indirect callback
0083245C -> 009DA6CC
00832470 -> 0065BB20
008324A4 -> 009D6090
008324C3 -> 009D4F08
008324EC -> 00A08A80
00832501 -> 009D6090
00832513 -> 009D6090
00832525 -> 009D6090
00832544 -> 009D4F08
0083256D -> 00A08A80
0083259B -> 00A08A80
008325AA -> 009D20F4
```

### Bit 2

`FUN_006B5B60` contains the first helper `+0x40 & 0x4000` branch at
`0x006B5D41`:

- direct incoming: `0x006B8AAE`.
- relevant callees: string/path builders `0x009D4F83` / `0x00447260`,
  resource probe `0x00D39290`, and resource slot submit `0x006320C0`.

`FUN_006B5E40` contains the second branch at `0x006B60D9`:

- direct incoming calls: `0x006B8AC2`, `0x006B8ACF`, and loop call
  `0x006B8AE9`.
- relevant callees: the same path/resource helpers plus packed-selector
  decoders `0x00630660` / `0x006306A0`.

Both branches build the `%s9998` plus `.bin` supplemental path and submit it
to special slots (`0xD` or `0xE`) when found.
