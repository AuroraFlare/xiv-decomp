# Ferry door resource and native-client decomp — 2026-08-27

## Result

The failed live probes used the right zone-200 layout/instance bindings but the
wrong animation names and dispatch surface. `sdef_door_l_open` and
`sdef_door_l_clos` are `BaseObjects/SE/SEBaseObject` sound definitions. They
are not runnable door schedulers. The actual door unit-tree owners expose the
four-character aliases `open` and `clos`.

The same correction applies to the dock-layout strings
`sdef_door_a_open/clos` and `sdef_door_b_open/clos`: those are sound objects,
not public scheduler aliases.

## Layouts examined

| role | zone | layout/instance | resource token | installed DAT |
| --- | ---: | --- | --- | --- |
| Limsa docked ship | 230 | `196/456` | `sea_s0_lin01` | `data/29/D9/00/17.DAT` |
| Thanalan docked ship | 172 | `496/456` | `wil_w0_lin01` | `data/61/5A/00/1B.DAT` |
| voyage line 1 | 200 | `5142/323`, `5142/326` | `srt_o0_lin01` | `data/89/ED/00/03.DAT` |
| voyage line 2 | 200 | `5143/323`, `5143/326` | `srt_o0_lin02` | `data/89/ED/00/04.DAT` |

The complete decoded records are in
`outputs/ferry-door-scheduler-decomp-20260827/decomp.json` and can be
regenerated with `tools/decomp_ferry_door_schedulers.py`.

## Voyage-deck owners

Each zone-200 door actor is directly bound to a door unit tree. Both line
resources recover the same aliases:

| unit tree | instance | alias | target timeline |
| --- | ---: | --- | --- |
| `sgrp_bg_door_d1` | 323 | `open` | `time_bg_door_d1_open` |
| `sgrp_bg_door_d1` | 323 | `clos` | `time_bg_door_d1_clos` |
| `sgrp_bg_door_d2` | 326 | `open` | `time_bg_door_d2_open` |
| `sgrp_bg_door_d2` | 326 | `clos` | `time_bg_door_d2_clos` |

Those timelines animate the door leaves and switch their collision at the
authored points. The four server actors map to the recovered owners as follows:

| spawn | layout/instance | voyage end |
| ---: | --- | --- |
| 926 | `5143/323` | Thanalan to Limsa |
| 927 | `5143/326` | Thanalan to Limsa |
| 928 | `5142/323` | Limsa to Thanalan |
| 929 | `5142/326` | Limsa to Thanalan |

The original SQL crossed the two mirrored line layouts, assigning one doorway
at each voyage end to line 1 and the other to line 2. A clean stock-client
comparison proved that a crossed binding can still report a resolved
MapObjectForChara handle and accept `0x00D9` while leaving the visible door
closed. At the negative-Z end, `5142/326` moved immediately while `5143/323`
did not; changing the upper door to `5142/323` made both doorways animate.
The route pairs must therefore stay on one active layout: Thanalan-to-Limsa
uses 5143 and Limsa-to-Thanalan uses 5142.

## Native packet contract

The client actor-packet switch at `FUN_0058CCA0` handles the relevant opcodes:

- `0x00D8` reads the instance ID at packet offset `0x10` and the layout ID at
  `0x14`, then creates the actor's map-layout binding.
- `0x00D9` resolves an animation through that binding. `FUN_00585320` copies
  only the first four animation-name bytes and writes a terminator after them.

The binding path (`FUN_0058BF60` -> `FUN_00590230` -> `FUN_0059DF90`) resolves
the exact loaded layout ID, then associates its instance ID with the client
actor. A second `0x00D8` is ignored once the actor already has a binding, which
explains why rebinding guesses were a poor live probe.

The recovered names `open` and `clos` fit the native four-byte `0x00D9` field
exactly. The long `sdef_*` sound names do not.

## Docked-ship limitation

The dock bindings `196/456` and `496/456` directly reference `sgrp_teikisen`.
Its exposed aliases are `spin`, `spot`, `_ex_show`, `_ex_hide`, `_in_show`,
`_in_hide`, `vst1`, `vst2`, `vst3`, and `set0`. It does not expose a standalone
`open` or `clos` door alias at the ship binding.

Door leaf timelines do exist inside the docked-ship resource, and the authored
`spin`/`spot` sequences invoke nested schedulers. That is evidence for the ship
timeline owning dock-side door motion, but not for a safe independent
proximity command. `_ex_show/hide` and `_in_show/hide` affect whole exterior or
interior meshes, so they are not substitutes for opening a door.

The runtime change therefore targets only the four independently bound voyage
doors. Dock-side ship behavior remains under the recovered `spin`/`spot`
visual scheduler until a separately callable dock door owner is proven.

## Runtime behavior

Each voyage door runs the existing dungeon-door proximity state machine:
7-yalm open radius, 10-yalm hold radius, 250 ms scans, and a 2.5-second delayed
close. Each doorway keeps its own state without affecting the doors roughly
267 yalms away at the opposite end. State changes send `open` or `clos` to the
recovered owner through the established `PlayMapObjAnimation` (`0x00D9`) path,
and an already-open state is replayed for late joiners after the map-object
binding exists.
