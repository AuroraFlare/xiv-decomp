# Garuda command-range consumer follow-up — 2026-09-07

## Result

This bounded pass did **not** recover a native shape-selector or intersection
consumer. It establishes a more precise missing join: the installed client
really contains empty `BattleCommandBaseClass` range-code and angle methods.
Calling them “native stubs” must not imply that a corresponding native function
has been located. No production geometry change is supported by this pass.

The existing private 90-degree cones remain reconstruction choices. The generic
120 constant does not justify changing them to 120 degrees. Likewise, the
retained max/min getters provide distance inputs but, without their intersection
consumer, do not independently prove radius-versus-diameter semantics.

## Evidence checked

Exactly five known installed LPB resources were decoded read-only and compared
byte-for-byte with their retained Lua bytecode:

- `command/game/gamecommandbaseclass`
- `command/game/battlecommandbaseclass`
- `command/game/weaponskill/weaponskillbaseclass`
- `command/game/weaponskill/garudaattackweaponskill`
- `command/game/basic/garudaothers`

All five match. Their encoded installed paths, complete source hashes, decoded
hashes, class inheritance, and selected method metadata are recorded in
`outputs/garuda-range-followup-20260907/findings.json`. The corresponding exact
class-registration and range-method instructions are in
`command-range-disassembly.txt` alongside that report.

| Verified shipped method | Bytecode evidence | What it proves |
| --- | --- | --- |
| `BattleCommandBaseClass.getCommandRangeCode` | Decoded chunk offset `0x52E`: one `RETURN A=0 B=1 C=0`, no constants | Returns zero values; no getter, dispatch, or native call is encoded here. |
| `BattleCommandBaseClass.getRangeAngle` | Decoded chunk offset `0x55A`: one `RETURN A=0 B=1 C=0`, no constants | Also returns zero values; no command-specific angle exists in this method. |
| `GameCommandBaseClass.getRangeAngle` | Constant `120` returned by the ancestor implementation | A generic ancestor default only, overridden by the empty BattleCommand method. Its number alone does not establish the consumer's unit or Garuda's angle. |
| `GameCommandBaseClass.getCommandRangeShape` | Dynamic calls to range-code, angle, rotation, and effect-range getters | A tuple-producing wrapper, not the geometric hit test. |
| `GameCommandBaseClass.getCommandRangeLength` | Non-weapon branch returns `getRange()` and `getMinimumRange()` separately | No min-plus-max addition or diameter conversion occurs in this wrapper; the next consumer remains missing. |

`GarudaAttackWeaponSkill` has no method closures and inherits
`WeaponSkillBaseClass → BattleCommandBaseClass → GameCommandBaseClass`.
`GarudaOthers` also has no method closures and inherits BattleCommand directly.
WeaponSkillBaseClass only supplies its weapon-skill identity/type methods. These
retained class chains therefore supply no hidden Garuda angle override.

This is a class-consumer audit for the canonical `23537..23559` family, not a new
command-ID-to-class binding proof. It does not repeat the already recovered DAT
field types or derive undocumented selectors from generic server SQL.

## Bounded native lookup

The installed `ffxivgame.exe` was verified against SHA-256
`9341f2b4567440b310a4d494f5cc5599ca334ba51c8042247317ff466492f2e9`
(15,996,808 bytes). Twelve exact method/class/shape names were checked in ASCII
and UTF-16LE, including `getCommandRangeCode`, `getRangeAngle`,
`getCommandRangeShape`, `getCommandRangeLength`, `BattleCommandBaseClass`,
`GarudaAttackWeaponSkill`, `CommandRange`, and `RangeShape`.

All twelve have zero matches in both encodings. Thus there is no named string
reference from this pass from which to disassemble the requested consumer.
Incidental `RaptureCommands.*` names refer to movement, camera, targeting, and
input commands, not a proven battle-range implementation.

This negative result does not prove there is no stripped, unnamed, encoded,
indirect, or server-side implementation. No broad DLL/resource scan or speculative
function hunt was performed.

## Narrow missing join

Further exact geometry work needs both of these:

1. A command-specific implementation or runtime override of
   `BattleCommandBaseClass.getCommandRangeCode/getRangeAngle`, including any
   actual data-field lookup and selector values.
2. The evaluator consuming `getCommandRangeShape/getCommandRangeLength`, or a
   suitably controlled retail observation establishing its angle and distance
   interpretation.

Until that join exists, neither a VFX mesh's visual bounds nor the default
ancestor constant can establish the damaging cone. The current cone and
phase-radius uncertainties should remain explicit.

## Reproduce

```powershell
python tools/garuda-range-followup/build.py
python tools/garuda-range-followup/build.py --check
```

The first command writes only the two reports in its output directory. The
second performs a read-only equality check. Both passed: five installed LPBs,
20 selected range methods, and twelve named native probes. No game client,
server source, SQL, running process, or live database was changed.
