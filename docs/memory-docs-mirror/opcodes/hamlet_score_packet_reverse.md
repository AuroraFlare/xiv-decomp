# Hamlet Defense Score Packet Reverse Notes

This note records the local IDA findings for the 1.x
`0x01A8 HamletDefenseScore` client receiver.

The important outcome: the score packet is not shaped like the current guessed
server builder. The client appears to expect a compact score-code list and then
derives score text ids and point values from its local `hamletDefScore` table.

## Scope

- Target binary: `ffxivgame.exe`, 32-bit PE.
- IDA database addresses below are local-analysis addresses. They are useful
  breadcrumbs, not portable source-level symbols.
- This is static local client analysis only. No live retail capture is involved.

## Strings And Classes

Useful strings found in the client:

```text
Window_HamletDefenseWidget
_waitForHamletDefenseScore
_countHamletDefenseScore
_getHamletDefenseScoreAll
_countHamletSupplyRanking
_getHamletSupplyRanking
hamletDefScore
.?AVHamletDefenseScoreReceiver@Network@Command@Client@Script@Lua@Application@@
.?AVHamletSupplyRankingReceiver@Network@Command@Client@Script@Lua@Application@@
```

Useful local IDA breadcrumbs:

| Item | Local address / note |
| --- | --- |
| `HamletDefenseScoreReceiver` type descriptor | `.data:012D8360`, string at `.data:012D8368` |
| `HamletSupplyRankingReceiver` type descriptor | `.data:012D8308`, string at `.data:012D8310` |
| `HamletSupplyRankingReceiver` vtable | likely `.rdata:01057324` |
| `HamletDefenseScoreReceiver` vtable | `.rdata:01057330` |
| Score receiver deleting destructor | `sub_8A1030` |
| Score receiver receive/decode method | `sub_89E420` |
| Score payload parser candidate | `sub_6F1480` |
| Score state constructor | `sub_6EEFE0` |
| Score state cleanup | `sub_6E8800` |
| Score-id table bounds | `dword_134B76C` through `dword_134B770` |

The RTTI xref path that found the vtable:

```text
TypeDescriptor at 012D8360
  raw pointer bytes found at .rdata:01172CF8
  CompleteObjectLocator begins near .rdata:01172CEC
  vtable RTTI pointer at .rdata:0105732C
  first vtable function at .rdata:01057330
```

## Lua Binding Trail

`_getHamletDefenseScoreAll` has a single string xref in `sub_7413A0`. That
function is a Lua/client-script binding wrapper. It passes a tiny virtual-call
thunk, `sub_71E730`, into a generic binding helper.

`sub_71E730` decompiles to a vtable call at offset `524`:

```text
return this->vfunc_524();
```

That vtable is probably the script/native object used by the Lua binding, not
the small `HamletDefenseScoreReceiver` vtable found above. The binding trail is
still useful because it confirms the client exposes score data through named
native functions, but it is not the packet parser itself.

## Receiver Trail

The `HamletDefenseScoreReceiver` vtable contains a receive/decode method:

```text
sub_89E420(this, packetLike, arg)
  sub_CC7510(packetLike)
  sub_6F2210(packetLike, this + 8, ...)
```

IDA's exact prototype around this call is probably imperfect, but the behavior
is clear enough: the receiver attaches or refreshes a score-state object, then
dispatches to `sub_6F1480`, which parses the score payload.

The score-state object initialized by `sub_6EEFE0` has at least these fields:

| Offset | Meaning |
| ---: | --- |
| `+0x04` | dynamic row-vector begin or related vector state |
| `+0x08` | dynamic row-vector end or related vector state |
| `+0x0C` | dynamic row-vector capacity or related vector state |
| `+0x10` | total score accumulator |
| `+0x14` | copied packet `u32` header field |
| `+0x18` | copied packet `u8` header field |

## Probable 0x01A8 Payload Shape

`sub_6F1480` copies and parses the payload in this pattern:

```text
payload + 0x00 : u32 header/value copied to state + 0x14
payload + 0x04 : u8  header/value copied to state + 0x18
payload + 0x05 : u8[128] score row codes, zero-terminated
payload + 0x85 : u8[128] row counts/multipliers
```

Minimum native payload size for the full fixed arrays is therefore:

```text
0x05 + 0x80 + 0x80 = 0x105 bytes
```

Parser behavior, simplified:

```text
for i in 0..127:
    rowCode = payload[0x05 + i]
    if rowCode == 0:
        break

    scoreId = scoreIdTable[rowCode - 1]
    basePoints = hamletDefScore[scoreId].points
    count = payload[0x85 + i]

    points = basePoints
    if count != 0:
        points = basePoints * count

    totalScore += points
    appendRow(points, scoreId, count)
```

The appended display row appears to be 12 bytes:

```text
u32 points
u32 scoreId-or-scoreIdWord
u32 count
```

The score id lookup goes through `sub_725F50`, which behaves like a keyed table
lookup. It returns a structure field at offset `+14`, read as `s16`, matching
the point values in `docs/Dat Mining/hamletDefScore.csv`.

`sub_7231A0` appends the 12-byte row record to a dynamic vector.

## Relation To Local DATs

Local score resources:

```text
docs/Dat Mining/hamletDefScore.csv
docs/Dat Mining/xtx_hamletDefScore.csv
```

`hamletDefScore.csv` rows look like:

```text
scoreId,points,hasCount
12003,10,true
16008,500,true
16009,1500,false
```

The client parser strongly suggests the packet does not send these score ids
directly. It sends compact row codes, and the client maps those row codes to
score ids through the table at `dword_134B76C`.

That table still needs to be dumped before the server can prove the row-code
mapping. The current repo-side `native` probe uses `hamletDefScore.csv` row
order as a provisional mapping because the client appears to build the compact
score-id vector from this sheet.

## Current Server Builder Mismatch

The current debug builder in
`Map Server/Packets/Send/Hamlet/HamletDefenseScorePacket.cs` writes:

```text
u32 displayGuildleveId
u16 supplyRating
u16 victory
s32 finalScore
u16 rowCount
...
per row:
  u32 textId
  s32 count
  s32 points
  u16 hasCount
```

That does not match the parser above. The client-side parser computes the final
score itself from score row codes and count bytes.

This likely explains why the old `single/current/full` probes could be accepted
without crashing but did not populate or open the retail score UI.

## Native Probe Builder

The repo now keeps the old guessed debug builder and adds an explicit compact
debug variant:

```text
!testhamlet scoremenu native
```

Candidate builder behavior:

```text
byte[0x105] payload
write u32 header/value at 0x00
write u8 header/value at 0x04
write row codes at 0x05, zero-terminated
write counts at 0x85
```

The initial safe single-row probe uses one known count-style score row:

```text
12003 Total Beastmen Dispatched, points 10, count-style true
```

The row-code mapping is still provisional. Before enabling automatic sends or
removing the old debug shape, dump `dword_134B76C` and map row code `1..N` to
score ids.

## Remaining IDA Tasks

1. Dump `dword_134B76C` through `dword_134B770`.
   - The parser treats it like a contiguous array of `u16` score ids.
   - `rowCode - 1` indexes into this array.
2. Find xrefs to `dword_134B76C` and its initializer/loader.
   - This may reveal whether the row-code table is built from
     `hamletDefScore.csv` order or from another client table.
3. Decompile the sibling Lua bindings:
   - `_countHamletDefenseScore`
   - `_getHamletDefenseScore`
   - `_waitForHamletDefenseScore`
4. Use `hamlet_supply_ranking_packet_reverse.md` for the recovered
   `HamletSupplyRankingReceiver` parser. Its native `0x01A6` payload is
   `20 * 0x4C = 0x5F0` bytes; the remaining work is field-label validation and
   a gated one-row live probe.

## Working Hypothesis

`0x01A8 HamletDefenseScore` is a compact score-result data packet:

- It stores a small header and up to 128 score row codes.
- Row code `0` terminates the list.
- Counts are stored in a parallel byte array.
- The client maps row codes to `hamletDefScore` ids and computes points locally.
- The score UI reads the parsed rows through the native Hamlet score Lua
  bindings.

This is strong enough to justify a new `native` score-packet debug variant, but
not enough to remove the old debug builder or enable automatic score UI sends
without a successful local probe.
