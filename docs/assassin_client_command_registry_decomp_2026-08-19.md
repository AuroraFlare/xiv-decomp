# Assassin Custom Command Client Decomp

Date: 2026-08-19  
Status: root cause and registry writer format recovered; retail pilot pending

## Question

Why can custom Assassin action rows `29743` through `29760` render in
`ActionSettingWidget`, but crash the 1.x client when a value such as
`0xA0F0742F` (`29743`) enters a live `charaWork.command` slot?

The crash is now explained at the missing layer: the retail client has a
separate static-actor registry, `/StaticActor.san`, stored in this installation
as `client\script\rq9q1797qvs.san`. The installed registry contains command
records through ID `29742`, but no record for `29743` or the rest of the custom
Assassin range. DAT rows can describe an action, but they do not create the
static actor that a packed live-work value must resolve to.

This investigation keeps four related failure points separate:

1. a hardcoded command-ID band or upper bound in native code;
2. a missing native `GameCommand` object despite readable DAT rows;
3. an acquisition-array/index contract that differs from the server's model.
4. a missing static-actor ID-to-class-path record in `/StaticActor.san`.

## Exact Client Under Analysis

- Path: `C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV\ffxivgame.exe`
- Size: `15,996,808` bytes
- SHA-256: `9341f2b4567440b310a4d494f5cc5599ca334ba51c8042247317ff466492f2e9`
- PE machine: x86
- Image base: `0x00400000`
- Link timestamp: `2012-09-11 12:30:23` (PE timestamp rendering in local time)
- Entry point: `0x009D4BAA`
- Code range: `0x00401000..0x00F3C56C`
- Embedded PDB path:
  `D:\rapture\src\Application\Rapture\project\client\Windows\WinRapture\WinRapture_ReleaseMT\ffxivgame.pdb`

The repo's `Client Sourcecode Decomp/ffxivgame.exe.c` export uses the same
address space and is useful for recovered pseudocode, while the installed PE
is the instruction-level authority.

## Recovered Runtime Path

The live action bar does not read the command DAT directly from widget Lua.
The recovered path is:

```text
0x0137 actor-property update
  -> packed static-actor ID is resolved/objectized for charaWork.command[32..61]
  -> charaWork.command[] contains an actor object reference
  -> DesktopWidget.updateActionMenuWidget
  -> ActionMenuWidget.updateMainSlot (30 slots)
  -> DesktopWidget.getPlayerEquippedCustomCommand(slot)
  -> Lua CharaBaseClass.getCustomCommand(slot)
  -> returns charaWork.command[commandBorder + slot]
  -> ActionMenuWidget.addSlot(commandObject, ...)
```

Relevant recovered Lua anchors:

- `ActionMenuWidget.updateMainSlot`: `actionmenuwidget.lua:656-666`
- `DesktopWidget.getPlayerEquippedCustomCommand`:
  `desktopwidget_connector.lua:6687-6716`
- `CharaBaseClass.getCustomCommand`: `chara/charabaseclass_cliprog.lua:166-182`
- cost/cast/recast calls on the returned object:
  `desktopwidget_connector.lua:6718-6814`
- `DesktopWidget.getPlayerActionCommandData` calls the actor method
  `getGameCommandBasicData`: `desktopwidget_connector.lua:8347-8353`

This narrows the dangerous boundary. `getCustomCommand` is not the native
factory: it only reads an already-objectized work value. Merely rendering a
command through `ActionSettingWidget` does not prove that the actor-work
deserializer/static-actor system can resolve the same ID into a live command
object.

## Acquisition Contract

The server models `commandAcquired` as 4096 booleans and indexes it with:

```text
index = commandId - 26000
```

For `29743`, the server-side index is `3743`, which is inside `0..4095`.
The recovered client Lua schema also declares `commandAcquired` as a 4096-entry
array. `CharaBaseClass.isCommandAcquired` computes the same `id - 26000` index
for IDs below `30000`; IDs at or above `30000` are treated as acquired. Thus
`29743 -> 3743` is valid on both sides.

Observed experiment state in the current worktree:

- custom Assassin `commandAcquired` updates are quarantined;
- the reported live-slot attempt had `acquired=0`;
- the crash still occurred after the command value entered
  `charaWork.command`.

`CharaBaseClass.updateCommandAcquired` only calls `_updateWork`; its process
callback performs UI notification and does not construct a command actor.
That evidence makes acquisition state an unlikely constructor for a registry
entry that does not exist.

## DAT Integrity Check

The generated Assassin overlay extends all three fixed sheets and four command
text sheets:

- `command`, row size 11;
- `gameCommand`, row size 180;
- `gameCommandBasic`, row size 26;
- German, English, French, and Japanese command text.

For each generated sheet:

- the final range is `(29743, 28)`;
- the inferred base remains `27002`;
- the final boundary offset equals the exact data-file length;
- IDs resolve through `29770`;
- all 20 Assassin package tests pass.

This rules out a simple truncated data DAT or final-offset mismatch. It does not
prove that every native consumer accepts a newly appended sparse range.

## Proven External Static-Actor Registry

The exact registry used by this installation is:

```text
C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV\client\script\rq9q1797qvs.san
```

It is byte-for-byte identical to both configured server copies:

```text
Map Server\bin\Debug\staticactors.bin
Map Server\bin\Release\staticactors.bin
```

All three files have:

- size `108,911` bytes;
- SHA-256
  `bb7306461b1728493242016a16d9dd5257d7512c60e423b017de5ec7aced3d14`;
- header bytes `73 61 6E 65 00 01 A9 66 FF 73 73 79 8F`;
- a `108,898`-byte payload beginning at file offset 13.

As external corroboration, the Project Meteor setup documentation explicitly
instructs operators to copy this exact client file and rename it to
`staticactors.bin`: <https://wiki.ffxivrp.org/pages/Compiling>.

The header starts with ASCII `sane`. Every payload byte is XOR-encrypted with
`0x73`. After decryption the file is a sequence of:

```text
uint32_be actorIdLow
utf8 classPath
byte 0x00
```

The runtime actor ID is `0xA0F00000 | actorIdLow`. This format is independently
confirmed by `Map Server/Actors/StaticActors.cs`; decoding the retail file
produces exactly 2,812 well-formed records.

The EXE does not contain the obfuscated loose filename. It constructs the
logical resource name from the adjacent strings `/StaticActor` and `.san` at
`0x00FE0F8C` and `0x00FE0F9C`, referenced by function `0x007904A0`. The
retail resource layer maps that logical name to `rq9q1797qvs.san`.

### Decoded command evidence

The decoded registry contains 1,661 `/Command/...` records distributed as:

| Low-ID range | Command records |
| --- | ---: |
| below `26000` | 824 |
| `26000..26499` | 1 |
| `26500..29999` | 835 |
| `30000` and above | 1 |

The relevant tail is decisive:

```text
29721..29742 -> /Command/Game/Ability/DummyCommand
29743        -> absent
...
29770        -> absent
29801        -> /Command/Game/Ability/PointSearchAbility
29862        -> /Command/Game/Ability/CmnCrafterAbility
30101        -> /Command/DebugInputCommand
```

The first custom Assassin ID begins immediately after the last registered ID.
The packed work value for the pilot action is:

```text
29743 decimal       = 0x0000742F
runtime static ID   = 0xA0F0742F
registry lookup     = missing
```

This is the concrete difference between “visible in Actions & Traits” and
“safe in `charaWork.command`.” The former can use the appended DAT rows. The
latter must objectize `0xA0F0742F` into a command actor, which requires a
registry class path that the retail file does not contain.

### Donor class paths for the proposed records

The Assassin overlay clones existing native command rows. The matching native
static-actor class paths are:

| New ID | Donor ID | Proposed class path |
| ---: | ---: | --- |
| 29743 | 26814 | `/Command/Game/WeaponSkill/CmnAttackWeaponSkill` |
| 29744 | 26511 | `/Command/Game/Ability/CmnAbility` |
| 29745 | 26858 | `/Command/Game/AttackCommand` |
| 29746 | 26859 | `/Command/Game/AttackCommand` |
| 29747 | 29876 | `/Command/Game/Ability/GathererStealthAbility` |
| 29748 | 26858 | `/Command/Game/AttackCommand` |
| 29749 | 26859 | `/Command/Game/AttackCommand` |
| 29750 | 26793 | `/Command/Game/WeaponSkill/CmnAttackWeaponSkill` |
| 29751 | 26859 | `/Command/Game/AttackCommand` |
| 29752 | 26802 | `/Command/Game/WeaponSkill/CmnAttackWeaponSkill` |
| 29753 | 27415 | `/Command/Game/Ability/CmnAbility` |
| 29754 | 26793 | `/Command/Game/WeaponSkill/CmnAttackWeaponSkill` |
| 29755 | 26802 | `/Command/Game/WeaponSkill/CmnAttackWeaponSkill` |
| 29756 | 26817 | `/Command/Game/WeaponSkill/CmnAttackWeaponSkill` |
| 29757 | 26857 | `/Command/Game/AttackCommand` |
| 29758 | 26795 | `/Command/Game/WeaponSkill/CmnAttackWeaponSkill` |
| 29759 | 26701 | `/Command/Game/Ability/CmnAbility` |
| 29760 | 26698 | `/Command/Game/Ability/CmnAbility` |

IDs `29761..29770` clone trait/constant donors and map to
`/Command/Game/Constance/CmnConstance`.

The nearby `29701..29742` records must not be treated as disposable merely
because their class path says `DummyCommand`: the current server uses those
IDs for active gathering commands. A native-ID reuse plan needs an actual
reachability/use audit, not just a suspicious class name.

## Proven Native Static-Command Preload Registry

Function region `0x0076ACF1..0x0076AD9A` enumerates the `command` sheet. The
sheet name is proven by the string reference at `0x0076ABDE` to ASCII
`"command"` at `0x00FD8610`.

The loop contains these explicit accepted bands before it reads row field
offset `0x1C` and inserts selected IDs into a vector rooted at `0x0134B778`:

```text
12000..12999
21000..21999
24000..24999
26000..26499
>= 30000
```

It then narrows the high band to `<= 30000` or exactly `30101` before vector
insertion. IDs `26500..29999`, including the custom Assassin range, bypass this
preload-building path.

The consumer has now been identified:

```text
JudgeMaster._onInit
  -> Lua _prepareAllCommandStaticActor()
  -> native binding wrapper at 0x0073C7xx
     (callback address loaded as 0x006E2000)
  -> native callback 0x006E2000
  -> iterate [0x0134B77C, 0x0134B780)
  -> resolve/create wrapper for each selected command ID
  -> register it through 0x00767100
```

The callback identity is established by the registration wrapper containing
the name `_prepareAllCommandStaticActor_cpp` at `0x00FD7398` and loading
`ESI = 0x006E2000` before the generic native-binding registration calls.

At `0x006E203B..0x006E2110`, that callback iterates the selected-ID vector. Its
missing/unregistered-object path reaches `0x00767100`; that function is a thin
wrapper over map insertion/lookup routine `0x00582BC0` on a registry at object
offset `+0x20`.

This proves that the native band filter is directly tied to command static
actors and that `29743` is absent from the eager preload. The decoded `.san`
table supplies the other half of the answer: ordinary game-command IDs in
`26500..29999` can resolve lazily because they still have static-actor records;
`29743` cannot, because it has neither eager admission nor an underlying
registry record.

### Exact comparisons

```text
0x0076ACF1  cmp esi, 0x2EE0   ; 12000
0x0076ACF9  cmp esi, 0x32C7   ; 12999
0x0076AD01  cmp esi, 0x5208   ; 21000
0x0076AD09  cmp esi, 0x55EF   ; 21999
0x0076AD11  cmp esi, 0x5DC0   ; 24000
0x0076AD19  cmp esi, 0x61A7   ; 24999
0x0076AD21  cmp esi, 0x6590   ; 26000
0x0076AD29  cmp esi, 0x6783   ; 26499
0x0076AD31  cmp esi, 0x7530   ; 30000
0x0076AD77  cmp esi, 0x7530   ; admit 30000
0x0076AD7F  cmp esi, 0x7595   ; admit special 30101
0x0076AD8C  mov ecx, 0x0134B778
0x0076AD95  call 0x00723C60   ; append selected ID
```

## `_getStaticActor` Is a Wrapper Cache, Not a Class-Path Factory

The Lua global `_getStaticActor` is registered through the native wrapper at
`0x00741B1A`. Its callback chain is:

```text
0x006DCDF0
  -> 0x0078CC30
     -> lookup cached wrapper
     -> on cache miss allocate 16-byte wrapper
     -> construct via 0x0078D800
     -> cache via 0x00CD2860
```

`0x0078D800` stores the runtime context and numeric actor ID. The wrapper's
lazy resolver at `0x0078D880` then asks the underlying static-actor system for
the actor and returns its absent/sentinel result if it cannot be found.

So `_getStaticActor(0xA0F0742F)` can allocate a Lua-facing wrapper for the
number, but it cannot invent the missing mapping from ID `29743` to a concrete
`/Command/Game/...` class. This is why merely observing a non-null wrapper is
not proof that the live command actor exists.

## `gameCommandBasic` Native Load Sites

The exact executable contains two ASCII `gameCommandBasic` sheet-name strings:

- `0x00F93834`, referenced at `0x00521BEF`;
- `0x00F94EE4`, referenced at `0x004F6C48`.

At `0x00521BA0`, native code opens `gameCommandBasic` and populates a view from
a fixed per-mode range table at `0x00F9D2E8`. This appears to be a specialized
UI/catalog loader rather than the per-hotbar-slot factory.

At `0x004F6C00`, a class/object constructor registers `gameCommandBasic` as a
data dependency and retains two constructor arguments at offsets `+0xCF0` and
`+0xCF4`. Its callers and lookup methods still need to be traced.

## Current Confidence Matrix

| Hypothesis | Current confidence | Evidence |
| --- | ---: | --- |
| malformed appended DAT offsets | low | all seven generated sheets have consistent terminal offsets and resolvable IDs |
| server `commandAcquired` array overflow | low | `29743 - 26000 = 3743`, inside the server's 4096 entries |
| absent eager static-command registration for `29743` | high/proven | band filter feeds the vector consumed by native `_prepareAllCommandStaticActor_cpp` callback `0x006E2000` |
| missing static-actor record for `29743` | proven | exact retail `.san` decodes cleanly; the table ends this local run at `29742` and resumes at `29801` |
| acquisition-driven creation can invent a missing class mapping | very low | Lua acquisition update only updates work/UI; ordinary lazy IDs have `.san` records, while custom IDs do not |
| Lua `ActionMenuWidget` nil handling alone | low | Lua reads an actor object already stored in work; failure is more likely during native packed-ID resolution/objectization |

## Patch Feasibility and Recovered Header

The least invasive experimental route is now a registry-asset extension, not
an EXE code cave:

1. decode the existing payload;
2. append records `uint32_be(newId) + utf8(classPath) + 0x00`;
3. XOR the extended payload with `0x73`;
4. update the length and record-count fields in the 13-byte `sane` header;
5. test one pilot ID (`29743`) with a fully reversible client-file swap.

The first eight header bytes are:

```text
73 61 6E 65 00 01 A9 66
s  a  n  e  [big-endian 0x0001A966]
```

`0x1A966 = 108,902`, which equals `decodedPayloadLength + 4` and
`totalFileLength - 9`. The remaining five bytes are `FF 73 73 79 8F`.

The apparent mystery dword is the record count encrypted with the same XOR
key as the payload:

```text
73 73 79 8F XOR 73 73 73 73 = 00 00 0A FC
0x00000AFC                         = 2,812 records
```

This exactly equals the independently parsed record count. The 13-byte header
can therefore be described as:

| Offset | Size | Meaning |
| ---: | ---: | --- |
| `0x00` | 4 | ASCII `sane` |
| `0x04` | 4 | big-endian `payloadLength + 4` |
| `0x08` | 1 | constant/marker `0xFF` |
| `0x09` | 4 | big-endian record count, bytewise XOR `0x73` |
| `0x0D` | rest | registry records, bytewise XOR `0x73` |

For a writer, byte `0x08` can be preserved as `0xFF`; no inferred checksum is
needed. Common CRC32, Adler-32, byte-sum, and CRC16 values did not match the
header dword because it is a count, not an integrity field.

The EXE's `/StaticActor` + `.san` construction reaches the generic resource and
serialization layer; the literal `sane` magic is not embedded in either
`ffxivgame.exe` or `ffxivboot.exe`. Decoding likely occurs in the loose-resource
layer selected by the logical extension/name. The on-disk writer specification
is now internally complete: update big-endian length at `4..7`, preserve
`0xFF` at byte 8, update the XOR-encoded count at `9..12`, then write the
XOR-encoded records. Retail acceptance still requires a reversible runtime
probe, but no unknown checksum remains.

### Exact one-ID pilot bytes

For ID `29743` using its donor-compatible class path, the decrypted record is
51 bytes:

```text
00 00 74 2F
2F 43 6F 6D 6D 61 6E 64 2F 47 61 6D 65 2F 57 65
61 70 6F 6E 53 6B 69 6C 6C 2F 43 6D 6E 41 74 74
61 63 6B 57 65 61 70 6F 6E 53 6B 69 6C 6C 00
```

That is `uint32_be(29743)` followed by
`/Command/Game/WeaponSkill/CmnAttackWeaponSkill\0`. XOR `0x73` produces the
on-disk candidate record:

```text
73 73 07 5C
5C 30 1C 1E 1E 12 1D 17 5C 34 12 1E 16 5C 24 16
12 03 1C 1D 20 18 1A 1F 1F 5C 30 1E 1D 32 07 07
12 10 18 24 16 12 03 1C 1D 20 18 1A 1F 1F 73
```

The resulting candidate dimensions would be:

| Field | Original | One-ID pilot |
| --- | ---: | ---: |
| decoded/encrypted payload length | 108,898 (`0x1A962`) | 108,949 (`0x1A995`) |
| total file length | 108,911 | 108,962 |
| apparent big-endian header length | `0x1A966` | `0x1A999` |
| decoded records | 2,812 | 2,813 |
| encoded count bytes at `9..12` | `73 73 79 8F` | `73 73 79 8E` |

A correct round-trip verifier must prove that records 1 through 2,812 are
byte-identical to retail after decoding, record 2,813 is exactly the pilot
record above, no duplicate low ID exists, and re-encoding changes only header
bytes `4..7`, count bytes `9..12`, plus the appended 51 bytes.

That in-memory round trip now passes. The candidate has 2,813 records, length
108,962, and header:

```text
73 61 6E 65 00 01 A9 99 FF 73 73 79 8E
```

The decoded retail prefix is byte-identical, ID `29743` was not already
present, and the final decoded record exactly matches the pilot bytes above.
No candidate file was written into the installed client.

For completeness, the exact projected dimensions are:

| Added range | Added bytes | Payload | Total file | Length field | Record count | Encoded count |
| --- | ---: | ---: | ---: | ---: | ---: | --- |
| pilot `29743` | 51 | 108,949 | 108,962 | `0x1A999` | 2,813 | `73 73 79 8E` |
| actions `29743..29760` | 746 | 109,644 | 109,657 | `0x1AC50` | 2,830 | `73 73 78 7D` |
| actions/traits `29743..29770` | 1,156 | 110,054 | 110,067 | `0x1ADEA` | 2,840 | `73 73 78 6B` |

## Current Conclusion

The original three-layer diagnosis was correct but can now be made more
precise. The third layer is not just an opaque hardcoded EXE registry. It is a
combination of:

```text
DAT command rows
  + /StaticActor.san ID -> Lua class-path records
  + native eager/lazy preparation and wrapper caches
```

The custom overlay changes the first component only. When `0xA0F0742F` enters
`charaWork.command`, the client can read ID `29743` but has no static-actor
record telling it which command class to instantiate. The resulting missing
underlying actor reaches a path that assumes a valid command object and the
client crashes.

Repurposing an audited unused native ID remains the lowest-risk production
option. Extending `rq9q1797qvs.san` is now the most promising route for true
new IDs and is substantially narrower than patching the executable. A binary
registry/preload patch should be reserved for the case where a correctly
formed extended `.san` is rejected.

## Next Decomp/Probe Targets

1. Generate a workspace-only pilot registry containing ID `29743`, decode it
   back, and prove that all 2,813 records round-trip without disturbing the
   original 2,812.
2. Validate the recovered length/count header by loading the pilot with the
   retail client through a fully reversible file swap.
3. Find all native consumers of the `gameCommandBasic` constructor at
   `0x004F6C00` and its lookup functions near `0x004F6CB0..0x004F6E29`.
4. Obtain the crash exception address/call stack if available and correlate it
   to the exact PE. That would immediately select between the remaining paths.
5. Run the reversible one-ID client probe only after backing up and hashing the
   exact installed registry. Do not expand the `26499` native comparison as a
   first test: it would preload every eligible DAT row through the new bound,
   not merely the Assassin range.

## Safety Note

No executable or installed client file has been modified. The current server
changes in `Player.cs` and `WorldManager.cs` are treated as user-owned
experiments and were not rewritten by this investigation.
