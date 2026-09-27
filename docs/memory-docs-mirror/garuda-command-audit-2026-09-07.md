# Garuda command-data and presentation audit — 2026-09-07

Scope: the private Hard encounter commands, their stock-client presentation IDs,
cast times, damage attributes, and retained client range contract. No initial mob
placements, client DATs, live database, or running server were changed by this
audit. Native WSS package inspection is tracked separately; this document does
not infer a named WSS from its numeric command ID.

## Direct installed-client evidence

The following files were read from the installed 1.23b client at
`C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV`:

| Sheet | Relative DAT | Fixed row size | SHA-256 of complete DAT |
|---|---|---:|---|
| gameCommandBasic | `data/01/03/04/A6.DAT` | 26 | `1d11651de5a1a3f0479f702b9c8df0ad02b50b7c33c8963f26ff359da96a3a11` |
| gameCommand | `data/01/03/00/97.DAT` | 180 | `54a8221c7d542793879c6c57d1ed259e5046fd5eed04495f55f502e220801790` |

Ranges and fixed rows were located with the existing read-only helpers in
`tools/actions/build_assassin_action_overlay.py` (`discover_rows`,
`source_fixed_row`) and `build_action_icon_swap_overlay.py` (`find_triple`,
`catalog_offset`). No overlay builder was run. Cast/recast/MP/TP are little-endian
`float,float,int16,int16` at byte 13 of a basic row. The 180-byte game row field
offsets were reconstructed from the type row in `docs/Dat Mining/gameCommand.csv`.
The decoded values agree with both the separated CSV sheets and the joined
`AI Scripts/command.csv` export.

Retained Lua supplies semantic names, not merely guessed column labels:

| Retained method | Sheet field | Joined raw CSV index (ID occupies index 0) |
|---|---:|---:|
| `GameCommandBaseClass.getRange` | gameCommand 64 | 65 |
| `getMinimumRange` | gameCommand 66 | 67 |
| `getEffectRange` | gameCommand 67 | 68 |
| `getCastTime` | gameCommandBasic 76 | 77 |
| `getRecastTime` | gameCommandBasic 79 | 80 |
| `getCommandDamageAttribute` | gameCommand 108 | 109 |
| `getCommandDamageElem` | gameCommand 110 | 111 |

Source: `tools/outputs/lpb/decomp_further_20260617/lua/command/game/gamecommandbaseclass.lua`,
especially lines 256–269, 337–355, 768–773, and 834–846. Header labels in the CSV
are zero-based sheet fields; raw array indexes are one greater. Confusing those
two conventions gives incorrect cast/element conclusions.

## Verified canonical rows

Attribute 3 is blunt physical. Attribute 13 plus element 7 is neutral-property,
Wind-element magic. `-1/-1` carries no damage attribute/element. These are not
potency values and do not establish retail damage amounts.

| Canonical ID | Name | Cast seconds | Range | Minimum | Attribute / element | Private ID |
|---:|---|---:|---:|---:|---|---:|
| 23537 | Downburst | 1 | 10 | 0 | 3 / -1 | 23991 |
| 23538 | Wicked Wheel | 1 | 10 | 0 | 3 / -1 | 23989 |
| 23539 | Slipstream | 3 | 10 | 0 | 13 / 7 | 23990 |
| 23540 | Mistral Song | 0 | 30 | 0 | 13 / 7 | 23992 |
| 23541 | Mistral Shriek | 0 | 22 | 0 | 13 / 7 | 23993 |
| 23546 | Aerial Blast | 3 | 50 | 0 | 13 / 7 | 23996 |
| 23550 | Featherlance | 0 | 8 | 0 | 13 / 7 | 23995 |
| 23552 | Thermal Tumult | 0 | 5 | 0 | -1 / -1 | 23999 |
| 23556 | Great Whirlwind | 0 | 12 | 0 | 13 / 7 | 23998 |
| 23559 | Eye of the Storm | 0 | 44 | 12 | 13 / 7 | 23997 |
| 23568 | Mistral Song | 1 | 30 | 0 | 13 / 7 | 23994 |
| 23569 | Mistral Shriek | 2 | 22 | 0 | 13 / 7 | unselected variant |
| 23570 | Aerial Blast | 3 | 50 | 0 | 13 / 7 | unselected variant |
| 23571 | Aerial Blast | 3 | 50 | 0 | 13 / 7 | unselected variant |
| 23572 | Aerial Blast | 3 | 50 | 0 | 13 / 7 | unselected variant |

All these basic rows have recast 0 and MP cost 0. Downburst, Wicked Wheel, and
Slipstream have TP cost 1000; the others have TP cost 0. The scripted encounter
deliberately owns ability cadence and bypasses resource/recast gates; it should
not derive an automatic ten-second rotation from the old generic SQL recast.
Every listed gameCommand row has `getEffectRange` field 67/raw CSV 68 equal to
zero (verified directly at byte 35); there is no additional nonzero effect-radius
field to add to the maximum or minimum.

### Variant and radius boundary

The chosen private-to-canonical joins preserve the action names and select the
instant base Mistral actions for sheltered attacks, the one-second Song variant
after Aerial, and the base Aerial command. Their **retail phase-to-ID join is not
recovered**; duplicate names alone do not prove which phase used 23568/23569 or
23570–23572. WSS assignment is a separate problem.

For Eye, `getCommandRangeLength` returns `(getRange(), getMinimumRange())`, hence
`(44, 12)`. It does not add them to 56 or expose a raw outer value of 32. The
server represents these as outer/inner radii. Exact original native range-consumer
behavior is not reconstructed here, but calling raw field 66 an unknown effect
radius is incorrect: the retained method calls it minimum range.

The private defaults now use Eye 12–44 and Great Whirlwind radius 12. The director
retains an explicitly unmeasured initial west eye of 30, then uses 12 for final
west, to preserve contemporary evidence of a shrinking safe area. The numeric
initial override and assigning the canonical minimum to final west remain
reconstruction choices, not additional DAT facts.

## Concrete defects corrected in this pass

1. `BattleCommand.GetClientPresentationId` previously returned nonexistent private
   Garuda IDs for every action except the two winds. It now sends the canonical
   IDs above for start, interrupt, and result packets while keeping the original
   private ID for damage, scripts, geometry, and completion acknowledgments.
2. Most private rows inherited Lightning magic (`actionType=2`, `actionProperty=9`)
   from a generic donor. Downburst/Wicked Wheel now use physical/blunt; damaging
   wind actions use magic/Wind. Thermal Tumult uses neutral status metadata; its
   existing archive behavior remains non-damaging Sleep.
3. Inherited three-second casts are replaced by the verified selected basic-row
   casts. The Aerial archive override must agree at 3000 ms; animation duration,
   director telegraph delay, and cast duration are separate clocks.
4. Private wind geometry defaults now agree with the verified range/minimum
   fields. Initial/final director overrides are described above.
5. Wicked Wheel now uses radius 10, Thermal Tumult radius 5, and both Mistral
   Songs damage reach 30. The selected-player Mistral anchor remains 50, separate
   from damage reach. Matching director contact and tower geometry are updated
   by the encounter implementation task.

Files: `Map Server/Actors/Chara/Ai/BattleCommand.cs`, private rows in
`Data/sql/server_battle_commands.sql`, and
`Data/sql/live migrations/garuda_hard_contact_20260907.sql`. The migration is
idempotent and prepared only; no live DB was modified. Shared canonical legacy
SQL rows were not changed by this scoped pass.

## Remaining boundaries and follow-up evidence

- The old canonical SQL rows are mostly generic imports, with incorrect family
  comments such as Downburst → bomb_boss, Wicked Wheel → titan_2, Mistral → slug.
  Those comments and `tools/monster_command_audit.csv` are not authoritative
  actor-family or animation joins. Their generic Lightning/cast metadata remains
  outside the private encounter correction.
- `GetClientPresentationAnimationId` is independent from the command-ID alias.
  Packet animation selectors can choose WSS directly. Existing WSS1 fallbacks
  for multiple distinct boss/plume actions are not validated by finding their
  canonical command names. Native package evidence and a rendered-client check
  are still needed for exact named-action WSS joins.
  Subsequent [full-key motion/video comparison](garuda-motion-followup-2026-09-07.md)
  replaces private Wicked Wheel's WSS1 with WSS3 as an explicitly labeled
  inference. This does not validate the remaining ordinary/plume fallbacks.
  The subsequent [pose comparison](garuda-pose-comparison-2026-09-07.md) also
  implements Downburst/WSS2, Slipstream/WSS4 and Shriek/WSS5 as explicit
  video/motion inferences; Song, Plumage and plume-selector uncertainty remains.
- `GarudaAttackWeaponSkill` and `GarudaOthers` recovered client Lua are identity
  stubs. The [installed-bytecode follow-up](garuda-range-followup-2026-09-07.md)
  proves `BattleCommandBaseClass.getCommandRangeCode/getRangeAngle` are empty
  returns, not identified native thunks. The generic GameCommand default 120 cannot establish
  Garuda's exact cone. Server `ConfigureTargetFind` consumes SQL geometry, not
  native data-shape selectors; current private 90-degree cones remain an explicit
  reconstruction, despite their tested mathematical implementation.
- The broad selected-player Mistral command anchor must stay distinct from its
  actual damage geometry. Radius corrections do not prove exact native cone
  angles, tower hitbox padding, or which retail action variant was used.
- Canonical 23544 is Plumage (no damage, instant); legacy Garuda skill list 30
  lists it with Slipstream. Direct plume spawns are not themselves a recovered
  Plumage presentation. A feather-release WSS candidate must be joined by
  additional evidence, not automatically called Featherlance (the plume attack).
- The older battlefield audit identifies m851 Garuda/sisters, m527 plumes, m526
  rocks, and m999 runtime wind carriers. Bristle appearance 2209510 uses
  head/body 1024/1024; Silky 2209512 uses 2048/1024. Unknown extra m527 appearance
  variants do not prove additional fight mechanics.
- Reward delivery is already guarded and implemented, but the exact retail
  reward chest actor, per-item roll table, and packet order remain unproven.
  The earlier implementation note explains the historical Headdress/Totem naming
  correction; no reward-table changes follow from this command audit.

## Verification

`tools/garuda-cast-tests/Program.cs` now tests all 11 production client-ID aliases,
authoritative ID preservation, unrelated-action pass-through, selected cast and
damage metadata, and both wind radius defaults, alongside existing completion,
displacement snapshot, and strict geometry tests. Its SQL checks validate the
seed, not a live database. Native WSS rendering and retail damage magnitudes are
not claimed by these tests.

The harness also invokes production `CalculatePhysicalDamageTaken` and
`CalculateSpellDamageTaken` against isolated BattleNpc fixtures. A 90-percent
PhysicalDamageTakenDown or MagicDamageTakenDown reduces only its corresponding
landed damage channel; clearing it restores baseline. Merely setting MagicEvasion
does not reduce already-landed magic damage. These checks support the director's
sister-resistance implementation without substituting a mock damage formula.

Verified after the corrections: isolated Map build succeeded with zero errors
and four pre-existing NuGet advisory warnings; harness build succeeded without
warnings; all **248 checks passed**. Commands used:

```powershell
dotnet build 'Map Server/Map Server.csproj' --no-restore --no-dependencies --nologo -v:q -p:OutputPath=C:/Users/drime/source/repos/AuroraFlare/FF14-Memory/.codex-build/garuda-20260907/map/ -p:IntermediateOutputPath=C:/Users/drime/source/repos/AuroraFlare/FF14-Memory/.codex-build/garuda-20260907/obj/map/
dotnet build 'tools/garuda-cast-tests/GarudaCastTests.csproj' --no-restore --nologo -v:q -p:UseAppHost=false
dotnet 'tools/garuda-cast-tests/bin/Debug/net10.0/GarudaCastTests.dll' 'C:/Users/drime/source/repos/AuroraFlare/FF14-Memory/.codex-build/garuda-20260907/map/Map Server.dll'
```

Separate compile-only compatibility repair: concurrent route work introduced an
ambiguous `Math.Max(1, mob.HP)` call in `Map Server/Dungeons/LegacyRaidRuntime.cs`.
After coordination and an immediate re-read, this pass added only the explicit
`(int)mob.HP` cast to select the integer overload. No route behavior was changed.

## Reproducible command DAT bundle

The installed-client verification is preserved in
`tools/build_garuda_command_decomp.py` and
`outputs/garuda-command-decomp-20260907/`. Regenerate and verify deterministically:

```powershell
python tools/build_garuda_command_decomp.py
python tools/build_garuda_command_decomp.py --check
```

Use `--client-root 'C:\path\to\FINAL FANTASY XIV'` for another installation.
The generator reads client DATs but never patches them, and `--check` performs
no writes. Its only generated files are:

- `decoded_rows.json`: canonical summaries, exact row bytes and offsets, every
  typed field, and the current private aliases/seed values with uncertainty labels.
- `field_schema.json`: raw CSV indexes versus native sheet fields, types,
  little-endian formats, byte offsets, and established semantic names.
- `source_hashes.json`: client data/range/offset DAT hashes, repository input and
  helper hashes, and verification counts.

Coverage is 31 IDs / 62 typed DAT rows: 23537–23559 and 23568–23575, including
Plumage 23544 and unnamed neighboring slots. Completeness checking additionally
identified **Featherlance 23573**, a duplicate named variant with the same
zero-second cast, range 8, and Wind attribute as 23550. It is preserved without
inventing a retail phase/plume join. All typed native values are cross-checked
against their separated CSV sheet exports before any report is written.
