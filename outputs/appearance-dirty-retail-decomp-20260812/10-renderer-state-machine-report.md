# Renderer appearance/BODYGEAR apply path (1.x client)

Scope: independent, read-only analysis of `.tmp/ffxivgame-ifrit.exe`.

- MD5: `09cd478ad1da4379414ead9c282f4bbd`
- PE image base: `0x00400000`
- Full focused Ghidra decompilation and raw listings: `renderer-appearance-focused.txt`
- Ghidra extraction script: `TraceRendererAppearance.java`

## Bottom line

BODYGEAR is staged in a second 0x74-byte appearance bank and may wait for an
asynchronous resource-queue entry to become ready. Once ready, the apply path
directly overwrites the model helper's active appearance fields and rebuilds the
part resource ID. There is no duration, delta-time input, blend weight, curve,
or simultaneous old/new BODYGEAR render state in this path.

Therefore the supported description is **deferred atomic/direct swap when the
resource is ready**, not a visual crossfade. The queue can make the on-screen
change occur later than packet receipt; its latency is not an authored fade
duration.

Confidence: high for the code path and absence of blending in it. A separate
action/shader effect could visually mask a swap, but no such signal is carried
by this appearance-bank path.

## Correct function boundary around 0x65F3xx-0x65F8xx

`0x0065F180-0x0065F913` is a constructor, not the appearance phase update.
Its sole direct constructor call found in the executable is `0x0079FB34`, in
the allocation factory `0x0079FAE0-0x0079FB54`; that factory allocates `0x2BB0`
bytes and passes four arguments.

Relevant constructor instructions:

```asm
0065F412  LEA  ECX,[ESI+1354]       ; initialize first 0x74 appearance bank
0065F41E  CALL 005670D0
0065F423  LEA  ECX,[ESI+13C8]       ; initialize second 0x74 appearance bank
0065F429  CALL 005670D0
0065F7F1  MOV  [ESI+2B70],EBX       ; EBX == 0
0065F820  AND  [ESI+2B70],FFFBFFFF
0065F82A  PUSH 380                  ; allocate model helper
0065F858  CALL 006B7600
0065F86C  MOV  [ESI+2B5C],EAX
0065F913  RET  10
```

`0x006B7600-0x006B7760` constructs the helper and installs primary vtable
`0x00FD3ED4`. Dword `0x00FD3ED4 + 0x64` (`0x00FD3F38`) is `0x006B7840`,
resolving the indirect appearance apply call below.

## CPU-side banks and BODYGEAR offsets

There are two 29-dword/0x74-byte banks:

- first/base bank: `this + 0x1354`
- requested/apply bank: `this + 0x13C8`
- Upstream wire field 14 / actor BODYGEAR slot index 13 lands at renderer-bank
  dword index 14 because the renderer bank includes its model/base dword at
  index 0. Thus BODYGEAR is `0x38` bytes into each bank:
  - first/base BODYGEAR: `this + 0x138C`
  - requested BODYGEAR: `this + 0x1400`

Whole-bank setter `0x006623F0-0x0066240E` copies exactly 29 dwords into
`this+0x13C8`, then calls `0x0065D730`:

```asm
006623F8  LEA  EDI,[EAX+13C8]
006623FE  MOV  ECX,1D
00662403  REP MOVSD
00662407  CALL 0065D730
```

`0x0065D730-0x0065D9C8` fills each first-bank field from the second bank only
when the first-bank field is zero. BODYGEAR is explicit:

```asm
0065D856  CMP  dword ptr [ECX+138C],0
0065D85D  JNZ  0065D86B
0065D85F  MOV  EAX,[ECX+1400]
0065D865  MOV  [ECX+138C],EAX
```

For an already populated actor, a changed `+0x1400` does not overwrite
`+0x138C` here. The old/base value remains while the requested bank is queued.
This is CPU-side value staging/fallback preservation, not evidence of two
rendered variants or interpolation.

The same function arms the phase at 1:

```asm
0065D9B6  MOV  EAX,[ECX+2B70]
0065D9BC  AND  EAX,FFFFFFF1        ; clears low-nibble bits 1..3
0065D9BF  OR   EAX,1
0065D9C2  MOV  [ECX+2B70],EAX
```

## Phase/queue state machine

The actual state machine is `0x00666720-0x006667EA`. It has one direct caller,
`0x006680C6`, inside per-frame method `0x006679C0-0x0066835A`. The renderer
actor vtable contains `0x006679C0` at `0x00FC0F6C`.

Two gates must permit processing: vfunc `+0x268` returns zero and
`0x007A71E0(this+0x590)` returns false. It then treats the low nibble of
`this+0x2B70` as a frame/tick countdown:

```asm
00666749  MOV  ECX,[ESI+2B70]
0066675C  TEST CL,0F
00666761  LEA  EAX,[ECX-1]
00666764  XOR  EAX,ECX
00666766  AND  EAX,0F
00666769  XOR  EAX,ECX             ; replace low nibble with lowNibble-1
0066676D  MOV  [ESI+2B70],EAX
00666773  JNZ  006667A1
00666776  AND  EAX,FFFFFFF0
00666779  MOV  [ESI+2B70],EAX
```

Because the setter arms phase `1`, the next eligible invocation changes it
`1 -> 0` and immediately attempts to submit the requested bank. No time value
or frame delta is read.

Submission and synchronous fallback:

```asm
0066677F  MOV  EAX,[ESI+DC]        ; actor/resource key
00666785  LEA  EBX,[ESI+13C8]      ; requested 0x74-byte bank
0066678F  CALL 007D1C80            ; manager=this+118+D8, (key, bank)
00666794  TEST AL,AL
00666798  PUSH EBX
0066679B  CALL 00665E40            ; only if queue submission returned false
```

`0x007D1C80-0x007D1CEA` searches 1024 queue entries of stride `0x7C`, updates
the matched entry's state, and copies 29 dwords from the requested bank into
that entry. It returns true for a matched entry, false if none was found.

The same frame routine always polls readiness:

```asm
006667AA  CALL 007D1AF0            ; status for actor/resource key
006667AF  CMP  AL,1
006667C1  CALL 007D1B30            ; obtain ready-bank pointer
006667E2  CALL 00665E40            ; apply that one bank
```

`0x007D1AF0-0x007D1B26` returns true when the matched entry's high state bits
are `0x40000000`. `0x007D1B30-0x007D1B96` clears the high state bits and returns the
entry bank at entry `+8` when the low state equals 4; otherwise it supplies a
manager fallback bank. These are readiness/state transitions, not blend phases.

## Apply bridge and resolved model-helper callee

`0x00665E40-0x00665F53` accepts one bank pointer. It copies all 29 dwords to a
stack bank and calls model-helper vfunc `+0x64`:

```asm
00665EF0  MOV  ECX,1D
00665EF5  MOV  ESI,EBP
00665EF7  LEA  EDI,[ESP+14]
00665EFB  REP MOVSD
00665EFD  MOV  ECX,[EBX+2B5C]
00665F03  MOV  EAX,[ECX]
00665F05  MOV  EAX,[EAX+64]
00665F08  LEA  EDX,[ESP+14]
00665F0D  CALL EAX                 ; resolves to 006B7840
00665F15  OR   [EBX+2B74],20
```

`0x006B7840-0x006B7A39` directly overwrites the helper's active appearance
fields from that one bank. Specifically, BODYGEAR source bank `+0x38` is
written to helper `+0x9C`:

```asm
006B78EF  MOV EDX,[EAX+34]         ; preceding field -> helper+98
006B78F2  MOV [ESI+98],EDX
006B78F8  MOV ECX,[EAX+38]         ; BODYGEAR
006B78FB  MOV [ESI+9C],ECX
```

The function continues direct field assignments through bank `+0x6C`, derives
a model mode from the first bank dword, invokes vfunc `+0x58`, calls
`0x006B6850`, and schedules/builds through `0x00632540`. It has no old-bank
argument, transition duration, blend fraction, or lerp loop.

## 0x006B6850 BODYGEAR resource rebuild

`0x006B6850-0x006B6B28` consumes the already-overwritten helper fields and
constructs concrete part resource IDs. BODYGEAR is helper `+0x9C` in both
applicable branches:

- model mode 2: direct `MOV ECX,[ESI+9C]` at `0x006B6878`, decode through
  `0x006306F0`, then `0x00CA7D70(slot=0, resourceId)`;
- ordinary/model mode 0 or 1: the six-slot mapping is `[1,2,3,4,5,0]`;
  iteration 0 therefore reads `helper + 0x98 + 1*4 == helper + 0x9C` at
  `0x006B6949`, decodes it with `0x006306A0`, then calls
  `0x00CA7D70(slot=0, resourceId)`.

Mode 3 exits without this part rebuild. In all branches, the function submits a
single newly calculated ID per slot. It contains no old BODYGEAR value, second
render target, alpha/weight, timer, or transition curve.

## Instant-versus-blend conclusion

1. A request is copied to the requested bank and phase is set to 1.
2. On the next eligible renderer tick, phase reaches 0 and the full bank is
   copied into an async queue entry (or synchronously applied if no entry exists).
3. Once ready, one bank is passed to `0x00665E40`.
4. `0x006B7840` atomically replaces helper fields, including BODYGEAR `+0x9C`.
5. `0x006B6850` derives and submits a single BODY part resource ID.

This is **staging + async readiness + direct replacement**. It does not provide
a native BODYGEAR crossfade. Any desired visual fade must come from a separate
action/material/shader system, with the appearance swap timed to that effect.
