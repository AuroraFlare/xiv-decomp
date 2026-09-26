# Food, potion, and death/Return animation decomp — 2026-09-04

The previous food/drink implementation omitted a required item-effect bank. Death Return
uses a spawn type whose recovered renderer path fades the actor in; it does not
select a resurrection motion. These are concrete decomp findings. **The food
path and the Return resurrection motion have now been confirmed working
in-game by the user.** The user reported delayed, duplicate Return get-up;
the ordering correction below still needs in-game retesting. Potion/Ether
attempts were made at full resources, so their playback remains unconfirmed.

## Implementation follow-up

`ItemCommand.lua` now sends `0x05FA3065` for food, `0x05FA2066` for
drink-class food, and `0x05FA1001` for restorative/stat/cure medicine.
These combine the character motion and the item effect bank that provides its
`main` entry point. Bread is a deliberate default food prop; the original
per-item prop mapping has not been recovered. Harmful thrown medicine keeps
its previous separate mapping and is outside this animation fix.
Successful use still consumes one exact stack and releases the item event
before animation playback; failed use emits no animation.

Raise and death Return use `0x01000066`, whose `mgc/0102` scheduler includes
`cbnm_revive`, without the old generic casting bank. Return restores HP/MP and
server PASSIVE state silently, clearing the pending State update so it cannot
trigger a separate quick stand-up. The local destination snapshot retains the
dead pose; immediately after player `/_init`, the same publication phase queues
PASSIVE followed by `cbnm_revive`. Same-area Return queues that pair after its
position/resource packets and EventFinish. No movement, `0x010A`, or visibility
timer triggers Return animation anymore. New warps, another death, a changed
area, or disconnect invalidate a pending arrival. The existing map-load and
peer/group visibility barriers remain separate from this local animation.

The previous client-ready implementation was visibly wrong: the September 4
log shows zone completion at 17:53:03.954, then movement-triggered animation at
17:53:11.453 (7.5 seconds later), following a native quick stand-up. The new
ordering removes that additional wait and the delayed second rise.

Death Return now also uses the living Return confirmation/departure schedulers:
`0x04000FFA` before `eventConfirm`, then `0x04000FFB` only after Yes. The old
`not isDead` guards suppressed both effects on corpses. Removing those guards
does not change HP or death state at departure; cancellation ends the event
without playing the departure animation or zoning. Executable Lua tests cover
living, DEAD1 and DEAD2 confirmation/cancel flows for homepoint, inn and leve
destinations (18 cases). Visual playback on a corpse still needs confirmation.

Regression coverage lives in `Fishing Tests/Program.cs`: executable Lua item-use
cases verify eat/drink/potion IDs, consumption and event order, failed use, and
controller use. C# cases exercise arrival playback with visibility closed,
adjacent state/animation packets, the one-shot claim, destination changes,
death, disconnect, and new-warp cancellation.

Validation: isolated `dotnet build` succeeded with zero errors; both
`--raise-party-bonuses-only` and `--post-landing-ready-only` passed. The full
harness stopped at the unrelated `TestFisherHotbarClientMetadataGuard`
assertion ("metadata-less duplicate is rejected individually"). NuGet's
vulnerability feed was unreachable; existing cached dependencies built successfully.

Live acceptance still required: eat food, drink juice, use a potion while hurt,
then die and Return both within the same area and across areas. Confirm the
motion and props on the local character and a nearby observer. Also verify
Raise/Reraise and an ordinary living teleport. No live server restart or game
packet injection is part of this implementation.

## Evidence and reproduction

- Installed 1.23b executable SHA-256:
  `9341f2b4567440b310a4d494f5cc5599ca334ba51c8042247317ff466492f2e9`.
- [Evidence directory](../outputs/consumable-return-animation-decomp-20260904/):
  196 files, 1,933 recursive resources, 342 schedulers, 1,442 clips,
  139 motion headers, zero parse failures. This is the selected relevant bank
  set across installed PC models, all item VFX banks, all POP banks, and the
  two compared magic VFX banks; it is not an inventory of every game animation.
- `python tools/build_consumable_return_animation_decomp.py` reconstructs the
  asset evidence, checks the executable hash before reading native offsets,
  and asserts the critical motion/child-scheduler relationships.
- `powershell -File tools/decompile_consumable_return_animation.ps1` reruns
  targeted Ghidra decompilation against the existing `ffxivgame-ifrit.exe`
  project, with `-readOnly -noanalysis`. Override its Ghidra/JDK parameters as
  needed. See `native-verified-targets.txt` for code and instruction listings.
- `packet-dispatch.asm` preserves IDA's opcode-to-handler edges;
  `native-windows.asm` preserves the category table and loader instructions.
  Other `native-*.txt` files are intermediate exploratory dumps. In particular,
  the attempted `0x00798540` entry in `native-action-routing.txt` is invalid and
  is **not evidence** for any conclusion here.

The original decomp investigation sent no game packets or restarted servers.

## Food and potion: the missing low field

The packed value is:

```text
ID = (category << 24) | (character_bank << 12) | effect_bank
```

`0x00798470` extracts these fields and independently loads the character bank
through vtable `+0x54` and the effect bank through `+0x58`. The table at
`0x00FE32D8`, read by `0x007982D0` and `0x00798640`, distinguishes these routes:

| Category | Table name | Route kind | Result |
| --- | --- | --- | --- |
| 5 | `emt` | 7 | Choose `em1`/`em2`/`em3` from the actor's posture; VFX uses `itm` |
| 6 | `em1` | 6 | Explicit standing bank; VFX uses `itm` |
| 7 | `em2` | 6 | Explicit seated bank; VFX uses `itm` |
| 8 | `em3` | 6 | Explicit ground-seated bank; VFX uses `itm` |
| 1 | `mgc` | 9 | Magic character bank and magic VFX |
| 4 | `lib` | 1 | Library character bank and library VFX |

`0x00798BF0` implements posture selection. Its kind-7 cases `0,2,15,91` select
`em1`, `11` selects `em2`, and `13,14` select `em3`. Unsupported posture values
do not load the normal item character bank. `0x00799C90` sends route kinds 6/7
to `/client/vfx/itm/%04d.bin`, **only when the low field is greater than zero**.

The existing `ItemCommand.lua` sends `0x05FA2000` and `0x05FA3000`. These load
the drink/eat character bank, but skip the item VFX loader entirely.

For c001 (and the other inventoried PC variants):

| Character bank | Scheduler | Motion |
| --- | --- | --- |
| `cmn/em1/base/4001` | `itm00` | `cbnm_itm_slf` |
| `cmn/em1/base/4002` | `itm00` | `cbnm_drink` |
| `cmn/em1/base/4003` | `itm00` | `cbnm_eat` |
| `cmn/em1/base/4004` | `itm00` | throw motion; see inventory |

The eat/drink banks have **no `main` scheduler**. Their `itm00` also calls
`food_vfx`, which is supplied by the separately loaded item-effect bank.

The missing parent is visible directly in `client/vfx/itm/0101` and `0102`:

```text
item VFX bank: main
  -> item_main       # completion sound/status visual
  -> itm00           # from the character bank
       -> MotionClip cbnm_eat / cbnm_drink
       -> food_vfx   # from the item VFX bank: bread, drink prop, etc.
```

`0x00844330` searches loaded resources for `main` and then an empty-name
fallback. With low field zero, the authored item parent is absent. This
explains a missing animation without assuming that the motion is missing from
the client or that a different packet opcode is needed.

`0x00DA` is appropriate to test this complete ID: dispatcher `0x0058CFFA`
reads the first payload dword and calls `0x0058CAD0 -> 0x0058C690`. The client
itself builds an internal single-target action context. Its second on-wire
dword is not read on this route. Do not manufacture a battle-command result
packet to compensate for the missing low field.

## Exact test selectors

The existing `!anim` command accepts **category, effect, motion**, all decimal.
Target your character first. Test one selector at a time on a settled actor,
initially standing and outside an event. These are asset-derived probes, not
confirmed production fixes or verified catalog-item mappings.

| Probe | Packed ID | Existing GM command |
| --- | --- | --- |
| Eating with bread prop/status visual | `0x05FA3065` | `!anim 5 101 4003` |
| Drinking with drink prop/status visual | `0x05FA2066` | `!anim 5 102 4002` |
| Generic self-item motion with potion effect 1 | `0x05FA1001` | `!anim 5 1 4001` |
| Same effect with drinking motion, for comparison | `0x05FA2001` | `!anim 5 1 4002` |

The potion VFX identity is explicit: bank `itm/0001` preserves authored paths
`item\\drug\\potion1` and `itm1_pot_f.veff`. See `authored_paths.csv`. The
generic-item motion paired with it is the first potion candidate and must be compared with
retail footage before asserting that every medicine uses drinking, as the
previous script assumed. There is no recovered catalog-ID-to-animation table
in this evidence pack. Food's `WellFed` status and consumption presentation
are separate: recovered `FoodStatus` merely inherits `StatusBaseClass`.

The drink bank's authored prop path is `item\\mesi\\drink1\\veff\\bottle0.veff`.
The assets preserve many distinct food props. For example, item-effect banks
101/102 contain `e_pan1`/`drink_1`; 105 `meat01`; 106 `cake01`; 110 `salad1`;
112 `boil_egg1`; 113 `soup1`; 115 `apple0`; 120 `cheese1`; 121 `h_cookie`.
The complete exact resource names are in `schedulers.json`. Do not assign
bread effect 101 to every food as though that were a recovered retail mapping.

## Death Return: why spawn type 1 does not supply the motion

`TeleportCommand.lua` selects `SPAWNTYPE_PLAYERWAKE = 1` after death.
`WorldManager.ApplyReturnReviveIfNeeded` restores HP/MP and PASSIVE state
before building the destination actor snapshot. Its comments explicitly
record crashes from an earlier delayed `PlayAnimation(0x01001094)` attempt.

Recovered position path:

1. `0x0058CE03` handles wire `0x00CE`. The payload's `+0x24` spawn type and
   `+0x26` zoning flag are distinct fields; both reach `0x0058B2A0`.
2. `0x0058ADC0` stores them as actor `+0xE4` and `+0xE6`. If `+0xE6` is
   already 1, that function updates the destination without replacing the
   existing arrival type. Packet history therefore matters.
3. `0x0058A090` advances the fade/zone/actor-ready stages. Stage 14 emits
   internal actor message `0x27` with `{2, spawnType}`. This is an internal
   message ID, **not a proposed network opcode**.
4. Renderer `0x006631CE` selects a POP effect only for types 2 through 10,
   plus type 23 remapped to 2. `0x0065AAB0 -> 0x0065AAD0` packs
   `(category=15, character_bank=0, effect=spawnType)` for those cases.
5. Type **1** instead goes through `0x00663201 -> 0x00661AB0(20)`, a color
   fade setup. No get-up motion is selected by that branch. The installed POP
   set also has no `0001` bank.

The name `PLAYERWAKE` in server code is consequently not evidence of a retail
get-up selector. Publishing a healthy PASSIVE replacement actor and asking
for this arrival type is insufficient to request the missing motion.

## Recovered revival and slower get-up candidates

| Asset | Exact contents | Probe |
| --- | --- | --- |
| `client/vfx/mgc/0102` | `main` includes `MotionClip cbnm_revive`, movement-stop clips, `initf_idle`, a substatus scheduler kick, and child `abi2reis1tar` with fade/sound/effect | `0x01000066`, `!anim 1 102 0` |
| `client/vfx/mgc/0148` | `mag_main` and `0148_tar` effect; no `MotionClip` | This is the low-field bank selected by old `0x01001094` |
| `pc/c001/act/cmn/lib/base/0290` | `main -> cbfm_getting_up`; MTB header 235 frames at 30 fps | `0x04122000`, `!anim 4 0 290` |
| `pc/c001/act/cmn/lib/base/0291` | `main -> cbfm_body_up`; MTB header 190 frames at 30 fps | `0x04123000`, `!anim 4 0 291` |

`0x01001094` also loads `cmn/mgc/base/0001`, whose casting/release wrapper has
`main`, `sht00`, and `sht_nor0`. It does not select the recovered
`cbnm_revive` bank. This disproves the existing comment's claim that it is an
established in-place resurrection motion; it does **not** establish the cause
of the old client crash.

For `0x01000066`, a zero character bank intentionally avoids loading the generic
magic-release wrapper: the VFX bank already contains the movement and its own
`main`. It is a substantially different probe from replaying the old ID.
The library candidates isolate the two slow body motions without magic VFX.
Their names alone do not prove either is the death/Return motion.

First compare these on an existing, fully loaded actor. After identifying the
correct motion, test Return integration at a demonstrated client-ready boundary,
including same-area, different-area, and map-server handoffs and another
player's view. Do not introduce another fixed-delay post-zone callback without
that evidence. Whether the retail sequence uses the original dead actor state,
a replacement actor plus a separate scheduler request, or another presentation
state remains unresolved by the recovered call edges here.

## Timing and remaining verification

The pre-existing scheduler parser labels raw units divided by 1,000,000 as
seconds. This pass deliberately removes that conversion from its output:
`cbfm_getting_up` has 235 MTB frames at 30 fps, while its SCB block stores
2,350,000 units. Those are inconsistent under an unqualified microsecond
interpretation. Frame metadata is preserved separately; actual playback
duration/rate needs native timing or visible playback confirmation.

What remains: visually confirm the probe IDs; identify the precise retail
Return motion; recover or deliberately define item-specific effect mappings;
then verify the implemented client-ready ordering in a running client.
Static extraction and the focused server regressions succeeded; in-game
playback and client crash regression tests were not performed.

YouTube verification was assigned only to a Luna helper at maximum reasoning,
as requested. No visually verified timestamp was obtained in this pass, so no
video is used as evidence for the Return identification.
