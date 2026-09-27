# Garuda stone-pillar section-state follow-up

Date: 2026-09-07. Scope: installed FFXIV 1.23b m526 rock model, BID/WSS
schedulers, and the corresponding native client code. This is presentation
evidence, not a recovery of server-side rock HP, shelter width, or placements.

## Conclusion and implemented correction

The pillar has three separately masked sections. Breaking it is not a uniform
scale reduction. The server now keeps the initial appearance **2209509** and
publishes cumulative model-state bits instead of replacing it with the smaller
2209508/2209507 appearances. Initial actor positions and initial size are unchanged.

| Remaining sections | Published `SubState.mode` | Native scheduler effect |
|---:|---:|---|
| 3 | `0x00` | Fresh, complete model |
| 2 | `0x10` | `init_msb4_1`: clear groups 1 and 2, the upper section |
| 1 | `0x30` | Retain bit 4; `init_msb5_1` clears groups 3 and 4, the middle section |
| 0, ordinary last break | `0x70` | Retain bits 4/5; `init_msb6_1` clears groups 5 and 6, the base |
| 0, whole-pillar collapse | `0x80` | `init_msb7_1` clears all six groups |

Cumulative bits matter for a newly loaded client: sending only `0x20` after two
breaks would request the middle-section state without requesting the already
missing top. A continuously loaded model happens to retain earlier cleared
node bits, but that is not a complete reconnect snapshot.

The encounter's three damage budgets, shelter accounting, one-second break
staging, and delayed final despawn remain unchanged. Those timing/gameplay
values are reconstruction, not values established by these model resources.

## Direct model evidence

Source: `client/chara/mon/m526/equ/e001/top_mdl/0001`.
SHA-256: `eb9723b10763b589e06c17ef03eedfc3c7cdafff4cfc909c968cae7fcaa5fc9d`.
The six MDL names and their authored local-space AABBs identify the sections:

| Node group | MDL name | Material | Local Y minimum–maximum |
|---:|---|---|---:|
| 1 | `o_top_01grp` | `mtm526e001tc_a` | 2.466287–5.142537 |
| 2 | `o_top_02grp` | `mtm526e001tc_b` | 2.461997–5.103673 |
| 3 | `o_top_03grp` | `mtm526e001tc_a` | 1.318027–2.958860 |
| 4 | `o_top_04grp` | `mtm526e001tc_b` | 1.313568–2.963551 |
| 5 | `o_top_05grp` | `mtm526e001tc_a` | −0.290804–1.755384 |
| 6 | `o_top_06grp` | `mtm526e001tc_b` | 0.418690–1.755974 |

The upper/middle/base pairing agrees independently with WSS1–3 effect resource
names `rock_top01`, `rock_mdl01`, and `rock_low01`; WSS4 owns `rock_all01`.
Full XYZ bounds, MDL offsets, and raw metadata windows are retained in
`outputs/garuda-rock-state-followup-20260907/model_groups.json`.

## Native mask semantics

Verified installed `ffxivgame.exe` SHA-256:
`9341f2b4567440b310a4d494f5cc5599ca334ba51c8042247317ff466492f2e9`.
The external client-struct catalog supplied an address hint; the executable
itself supplies the following vtables, instructions, and decompilation.

| Native address | Recovered operation |
|---|---|
| `0x0101EBC4` | `RaptureCharaNodeGroupMaskClip` vtable, 42 entries |
| `0x00825B20` | Derived entry handler; reads actor index at clip-data `+3`, group at `+0x10`, flag at `+0x11` |
| `0x0065E5B0` | Validates actor and forwards group/flag to its model-mask operation |
| `0x0065C020` | Gets the current mask; flag 0 ORs `1 << group`; flag nonzero clears that bit |
| `0x008DE2A0` | RaptureModelObject mask getter; reconstructs set bits from currently enabled node groups |
| `0x008DE2D0` | Stores the updated mask at model object `+0x294`, then applies it to render groups |
| `0x00C3A310` | Applies the supplied mask across the model's group table |
| `0x00C32F10` | Tests each group's bit and writes 0/1 into that group's render primitives at `+0x132` |

The relevant operation is equivalently:

```text
bit = 1 << (group & 31)
newMask = flag == 0 ? currentMask | bit : currentMask & ~bit
setModelNodeMask(newMask)
```

Every m526 BID mask clip uses flag **1**, so it clears/disables its chosen
section; this is not an inferred interpretation of a numeric payload alone.
The native group/flag offsets correspond to scheduler `entry_payload_hex`
offsets **8/9**, after the common serialized prefix. For example, top group 1
is `05 00 a0 00 02 00 00 00 01 01 00 00`.

All twelve mask entries start at 0.020 seconds within their state scheduler.
`init_msb4_0` cancels the corresponding active scheduler but does not contain a
node-group restoration clip. We therefore do not use a mode reset as a rock
repair operation. A fresh encounter creates fresh rock actors.

## Model-state delivery and reconnects

The already-recovered opcode `0x0144` route uses payload byte 4 (`mode`), not
byte 0 (`breakage`), to select `init_msb%u_1` / `_0`; selector `0x007A82F0`
compares the old and new words and schedules changed bits.

The m526 WSS packages also contain `RaptureActionSubStatusSchKickClip`.
Its native handler `0x00829730` obtains an action-event context, checks its
expected type marker, and calls `0x00662C80`, which delegates through
`0x0065A9E0`. It does **not** infer a rock mode from the WSS number. This is why
bare `PlayAnimation` (`0x00DA`) plus a eventually flushed state flag is not the
reliable state-commit path.

The implemented shared `syncModelStatePresentation` follows the existing
Toto-Rak presentation transport:

1. Set the actor's durable `SubState.mode` without replacing its appearance.
2. Bind ready viewers, with neutral spawn mode via
   `DeferInitialModelStateUntilPostSpawn`.
3. After a one-second lead for a newly seen/bound viewer, call
   `PublishSubstateForPlayer`, then `DoBattleActionForPlayer` with the current
   WSS animation and presentation-only command **0**.
4. Mark that viewer's revision delivered only if both sends succeed.

Known viewers receive each new break once. New/reconnected viewers receive
the current cumulative state without replaying old transitions to everyone
else. Disconnected, zoning, or visibility-unready viewers are retried later.
The tracker stores Player identity, Session identity, and the Session's
`ActorInstanceGeneration`, and invalidates skipped or departed viewers. Thus a
replacement connection or a same-connection actor-table reset cannot inherit
a stale delivered revision even if normal visibility already rebound the rock.
Dead players remain eligible to receive visual state.

No canonical command-ID-to-m526-WSS join has been recovered: command 0 and the
one-second post-bind lead are explicit transport policies, not claimed retail
packet values. Actual stock-client rendering and reconnect capture remain the
final live acceptance checks; this report establishes native mechanics and
server packet ordering, not a completed in-client visual test.

## Reproduction and checks

```powershell
python tools/garuda-rock-state-followup/inspect_rock_state.py
./tools/garuda-rock-state-followup/decompile.ps1
dotnet run --no-restore --project tools/garuda-encounter-tests/GarudaEncounterTests.csproj
```

The first command requires the installed client and the parent action-timeline
dump for its compact state-clip extraction. The second uses the existing
read-only Ghidra project; pass `-OutputName` / `-Addresses` to reproduce the
additional exports. Source addresses are listed above and in those exports.

Evidence files under `outputs/garuda-rock-state-followup-20260907`:

- `model_groups.json`, `rock_state_clips.json`: model bounds and twelve decoded
  BID mask payloads, including source hashes.
- `native_vtables.json`, `native_override_windows.txt`: exact vtables and
  independently disassembled handler/mask/primitive-write instructions.
- `native-rock-mask.txt`, `native-rock-routing.txt`,
  `native-rock-substatus.txt`, `native-rock-model.txt`,
  `native-rock-node-visibility.txt`: read-only Ghidra pseudocode plus listings.

Behavioral coverage exercises tier order/cumulative modes, unchanged size,
mode-before-X00 ordering, no duplicate revision, late-ready neutral spawn,
client-local reconnect, same-Player replacement Session, observed readiness
interruptions, rejected publication/kick retry, and whole collapse.
An additional actual MoonSharp CLR interop probe confirms that repeated public
Session field/property accesses compare equal and a replaced Session compares
unequal, while an actor-table generation change is visible without replacing
the Session; these critical checks are not established only with Lua mocks.
The harness executes the production Lua functions; it does not emulate the
native rendering engine.

Verification run on 2026-09-07: **83/83** base encounter cases, **20/20** wind
publication/recipient-readiness cases, and the CLR Session identity probe all
passed (**104 checks total**). The newly authorized Normal/Hard boss-start
coordinates are covered separately in the base suite; they do not relocate
the arena center or these four rock actors.
