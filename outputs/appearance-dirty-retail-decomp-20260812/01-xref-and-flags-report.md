# Priority reverse-engineering report: 0x58EBD0 / 0x58EBB0 and actor appearance flags

Binary: `ffxivgame-ifrit.exe` (image base `0x00400000`). This pass was read-only; only generated notes/scripts under `tmp/server-color-contract-agent/` were created.

## 1. Statically encoded caller/callee census

### Result

There is exactly one statically encoded reference to each target, and both are in the D6/D7 case of `FUN_0058CCA0`:

| target | sole callsite | enclosing recovered function | callees |
|---|---:|---|---|
| `0x0058EBD0` | `0x0058D10E` | `FUN_0058CCA0` | none (leaf) |
| `0x0058EBB0` | `0x0058D14E` | `FUN_0058CCA0` | none (leaf) |

Exhaustiveness checks:

- Linear Capstone sweep of every executable block found exactly those two `E8 rel32` calls.
- Independent raw `E8 rel32` byte census found exactly those two calls.
- Raw `E9 rel32` census found no tail jump to either target.
- Ghidra reference reconstruction found one unconditional-call reference to each target.
- Bytewise scan of every initialized memory block found zero absolute little-endian pointers to either target, so there is no static function-pointer table entry for either helper.

Evidence: `02-helper-caller-callee-census.txt` lines 3-12 and 14-23; raw bytes and arguments in `03-raw-b20-b1c-listings.txt` lines 3-46; recovered caller in `04-d6-d7-callers-callees-decomp.txt` lines 218-254; leaf callees in the same file lines 646-693.

Ghidra reports `caller=<none>` / calling-function count zero in the transient reference census because the persisted project has a deliberately sparse/discontinuous function body around this jump-table arm. The independently recovered switch decompile places both sites in `FUN_0058CCA0`; the raw call census is not dependent on Ghidra function ownership.

### Exact call arguments

`0x0058D10E -> 0x0058EBD0`:

```text
0058D10A  PUSH 1
0058D10C  MOV  ECX,EDI
0058D10E  CALL 0058EBD0
```

Therefore `this = EDI` (the actor) and the only stack argument is exactly `1`.

`0x0058D14E -> 0x0058EBB0`:

```text
0058D136  MOV  ECX,[EDI+7C]
0058D139  CALL 004D73B0              ; EAX = return
0058D13E  PUSH 0
0058D140  PUSH 1E
0058D142  PUSH 7
0058D144  MOV  ECX,EAX
0058D146  CALL 00443E40              ; EAX = return
0058D14B  PUSH EAX
0058D14C  MOV  ECX,EDI
0058D14E  CALL 0058EBB0
```

Therefore `this = EDI` and the stack argument is exactly:

```text
FUN_00443E40(this = FUN_004D73B0([actor+0x7C]), 7, 0x1E, 0)
```

Only its low bit survives in `0x58EBB0`. Raw evidence is `03-raw-b20-b1c-listings.txt` lines 24-45.

### Exact helper effects

- `FUN_0058EBD0(actor, x)` sets `[actor+0xB20] = 1` and replaces `[actor+0xB1C].bit1` with `x & 1`. With its sole caller's `x=1`, it forces bit 1 on.
- `FUN_0058EBB0(actor, x)` sets `[actor+0xB20] = 1` and replaces `[actor+0xB1C].bit0` with `x & 1`.
- Both are leaves.

Evidence: `04-d6-d7-callers-callees-decomp.txt` lines 652-669 and 677-692; byte-identical listing in `03-raw-b20-b1c-listings.txt` lines 48-60.

The enclosing D6/D7 arm then explicitly clears bit 2 at `0x0058D113`, marks B20 dirty, and invokes the bit-0 provider chain above. Net D6/D7 flag operation:

```text
bit1 = 1
bit2 = 0
bit0 = FUN_00443E40(..., 7, 0x1E, 0) & 1
B20  = 1
```

The D6/D7 appearance-entry loop itself takes `(wireField, value)` from packet records and calls `0x00586870(this=actor, wireField, value)` before these flag operations (`03-raw-b20-b1c-listings.txt` lines 13-23).

## 2. Exhaustive actor+0xB1C displacement census

Raw `.text` contains 26 instances of little-endian displacement `1C 0B 00 00`:

- 16 aligned actor-field memory operations:
  `58D113`, `58EBB0`, `58EBC4`, `58EBD7`, `58EBE7`, `6A7731`, `6A7763`, `6A8D19`, `6A8D3B`, `6A8D51`, `6ACECA`, `6ACEEE`, `6ACEFB`, `6ACF0A`, `D55E83`, `D56312`.
- 2 unrelated stack-frame LEAs: `5272E7`, `55118E`.
- 3 address-only combined-base LEAs, with no value read/test: `B63072`, `B637EE`, `B63F43`.
- 5 byte-pattern hits that are not a memory-displacement decode: raw hits at `6F9343`, `7B7758`, `806814`, `8FA1BD`, `B6B366` (immediates/branch encodings).

The actor operations divide as follows:

- D6/D7/helper cluster: `58D113` clears bit2; `58EBB0/58EBC4` replace bit0; `58EBD7/58EBE7` replace bit1.
- Creation/import cluster: `6A7731` sets bits1+2; `6A7763` ORs the initialization value (context establishes the usual bit0 value).
- Appearance import `6A8D19..6A8D51`: clear bit1, replace bit0 from the `4D73B0 -> 443E40` query, force bit2.
- Appearance apply `6ACECA..6ACF0A`: clear bit1, replace bit0 from the same query, force bit2.
- `D55E83` and `D56312` read the whole word for the serialization/compression family; neither branches on individual bits (`05-actor-flag-consumers-decomp.txt` lines 362-456 and 457-683).

No aligned instruction anywhere in `.text` directly `TEST`s or `CMP`s `[actor+0xB1C]` against bits 0/1/2. The actor-side word is assembled, copied/serialized, and handed downstream. This excludes only direct displacement consumers; a copied value can and does have downstream consumers (section 4).

Key recovered import evidence: `05-actor-flag-consumers-decomp.txt` lines 182-187 and raw lines 294-314; the second application path is in `03-raw-b20-b1c-listings.txt` lines 183-211.

## 3. Exhaustive actor+0xB20 displacement census

Raw `.text` contains 67 instances of little-endian displacement `20 0B 00 00`:

- 61 actor-byte accesses. Exactly one is a read/branch gate: `00585DD8 CMP byte ptr [actor+0xB20],0`. The other 60 are writes (dirty/set/reset operations).
- 1 unrelated stack LEA: `0055116E LEA ECX,[ESP+0xB20]`.
- 1 unrelated wide-field write in a different structure: `00D55BC4 MOV dword ptr [EDX+0xB20],0x130F458`.
- 4 byte-pattern hits that are not a memory-displacement decode: raw hits at `4E0336`, `4FA172`, `931532`, `E1D19C`.

All 61 actor-byte sites, grouped compactly:

```text
585DC2 585DD8 585E10
586893 586917 586B2C 586B3C 586B68 586B7E 586D08 586D3A 586D95 586DFD 586E47
58B6D5 58D125 58EBBA 58EBDD
6A7754 6A777A 6A779B 6A77BE 6A780A 6A786C 6A78AE
6A8B40 6A8B49 6A8B6A 6A8B84 6A8B93 6A8BA2 6A8BB7 6A8BC6 6A8BD5 6A8BE4
6A8BF3 6A8C02 6A8C11 6A8C20 6A8C2F 6A8C41 6A8C53 6A8C65 6A8C77 6A8C89
6A8C9B 6A8CAD 6A8CBF 6A8CD1 6A8CE3 6A8CF5 6A8D07 6A8D20 6A8D5B
6AA4BF 6AA4E1 6AA577 6AA609
6ACED1 6ACF01 6ACF18
```

`FUN_00585D70` proves B20 is the actor appearance-dirty/rebuild gate:

1. If a pending source at B24 successfully resolves, it copies 29 dwords (`0x74` bytes) into actor+AAC, sets B20=1, clears B24, and returns.
2. Otherwise, if B20 != 0, it dispatches `(type=8, data=actor+AAC, length=0x74)`, invokes `FUN_00585930(0.0,1)`, and clears B20.

Evidence: `05-actor-flag-consumers-decomp.txt` lines 19-44 and raw lines 50-103; the sole read is also `03-raw-b20-b1c-listings.txt` lines 97-113.

## 4. Proven renderer handoff and exact B1C-bit destinations

The renderer apply wrapper `FUN_00665E40(renderer, appearanceBlob)` receives the same 29-dword / `0x74`-byte layout. `appearanceBlob+0x70` is the actor B1C word.

Proven effects:

- **bit0**: passed as the boolean argument to `FUN_00846590(index, bit0)` for each of seven entries at blob offsets `0x18..0x30`; also mapped by the concrete render object into its `+0x40` bit `0x2000`.
- **bit1**: copied into renderer `+0x2830` bit `0x2`.
- **bit2**: mapped by the concrete render object into its `+0x40` bit `0x4000`.
- The entire 29-dword block is copied to a stack snapshot and submitted through the concrete object's vtable slot `+0x64` (`FUN_006B7840`).

Wrapper evidence: `12-renderer-and-property-consumers-decomp.txt` lines 4218-4268 and raw lines 4278-4357. Concrete vtable method evidence: the same file, lines 4974-5005 and raw lines 5084-5097. Specifically:

```text
outFlags.bit13 (0x2000) = B1C.bit0
outFlags.bit14 (0x4000) = B1C.bit2
renderer[0x2830].bit1   = B1C.bit1
```

The wrapper temporarily forces input bit0 when `FUN_004181E0() < 2`, then restores the caller's original bit0 after submission; this is an internal compatibility/apply-mode override, not a mutation persisted back to the actor.

### BODYGEAR / COLORINFO apply split

The downstream queued-property consumer proves distinct property paths:

- property kind 2 stores a 32-bit word and calls `FUN_007BB740` (BODYGEAR path);
- property kind 3 stores a 16-bit word and calls `FUN_007A82F0` (COLORINFO/MSN path);
- property kind 5 copies the equipment array.

Evidence: `12-renderer-and-property-consumers-decomp.txt` lines 5466-5530 (timed queue) and 5685-5735 (forced/full drain).

`FUN_007BB740` has two modes (`12-renderer-and-property-consumers-decomp.txt` lines 5226-5270):

- mode 0 replaces the full 32-bit BODYGEAR word and runs the normal body/model refresh helpers;
- mode 1 selectively notices and applies changes in masks `0xC000`, `0x3000`, and `0x0F00`.

For model metadata kinds `0x1E..0x20`, BODYGEAR changes call `FUN_0065FFB0`, which decodes BODYGEAR bits 8-15 into three resource/state IDs and calls `FUN_0065AC70`; that setter marks renderer `+0x2B70` high dirty bits `0x20000000`, `0x40000000`, and `0x80000000` as the three IDs change (`12-renderer-and-property-consumers-decomp.txt` lines 100-174 in its first `0065AC70` section). This `+0x2B70` word is renderer-local state and must not be confused with actor B20.

## 5. Confidence and exclusions

- **High/proven:** sole statically encoded callsites and exact arguments; helper bit formulas; B20 sole actor read gate; raw displacement counts/classification; renderer destinations for B1C bits 0/1/2; BODYGEAR vs COLORINFO downstream calls.
- **High but naming-derived:** calling the property-kind-2 word BODYGEAR and kind-3 word COLORINFO follows the established appearance layout and their observed consumers. The raw mechanics do not depend on the names.
- **Not claimed:** semantic English names such as “transition”, “rebuild”, or “partial apply” for B1C bits themselves. What is proven is their exact bit plumbing above.
- Census scope is this shipped PE's initialized image and executable blocks. It rules out direct calls, tail calls, and stored absolute pointers. It cannot logically rule out a runtime-generated/computed address, injected code, or a different client build; none is evidenced here.

## Evidence files

- `01-xref-and-flags-report.md` — this synthesis.
- `02-helper-caller-callee-census.txt` — Ghidra references, callers/callees, initialized-image absolute-pointer scan.
- `03-raw-b20-b1c-listings.txt` — raw bytes/disassembly around both calls, both helpers, B20 gate, and main B1C mutation clusters.
- `04-d6-d7-callers-callees-decomp.txt` — recovered D6/D7 switch arm plus both helper decompiles/listings.
- `05-actor-flag-consumers-decomp.txt` — B20 publisher, appearance importer, and whole-word serializers.
- `12-renderer-and-property-consumers-decomp.txt` — renderer wrapper, concrete appearance submit method, BODYGEAR/COLORINFO queues, and `+0x2B70` state functions.
