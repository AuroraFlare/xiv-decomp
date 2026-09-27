# Player and chocobo movement-speed audit (2026-09-07)

## Result

The normal mount command ignored `chocobo_speed_multiplier = 1.2` in
`Data/map_config.ini`, sending a run speed of **9.0** instead of **10.8**.
Rental/lender arrival used the multiplier, so the two entry paths disagreed.
The fix makes normal mounting use the same configured profile: a **20% increase**
over the old normal-mount command with this checkout's settings.

Player speed had separate consistency problems. This checkout previously used
`player_speed_multiplier = 1.1`, giving **5.5** running speed, but command-driven
dismount and teleport dismount forced **5.0**. The shared character modifier
calculation also changed walking from its declared `2 / 5` ratio to `1 / 2`,
making ordinary configured walking **2.75** instead of **2.2**.

Following the requested speed adjustment, `player_speed_multiplier` is now
**1.2**, giving **2.4 walk / 6.0 run** to match the ARR reference. Chocobos
retain their configured **10.8 run**. Base-speed constants remain unchanged.
Both settings are in the root **`Data/map_config.ini`**. The Map Server resolves
that file through `ServerConfigPath`; `Data/local` is not a configuration source.

## Causes and fixes

| Path | Previous behavior | Fixed behavior |
| --- | --- | --- |
| Normal/company/classic chocobo mount command | Lua forced `0, 3.6, 9, 9`, ignoring configuration | `SetMountState` selects the configured mount profile |
| Lender/rental arrival | C# applied the chocobo multiplier | Uses the same calculation as ordinary mounting |
| Buff expiry or equipment/status stat rebuild while riding | `Character.CalculateMovementSpeedModifier` rebuilt speeds from the on-foot movement modifier | Player override retains mounted speed and any active Lamed slowdown |
| Command/teleport dismount | Lua forced `0, 2, 5, 5`, ignoring configuration and active foot modifiers | Mount-state transition restores configured foot speed plus current modifiers |
| C# dismount | Applied configuration but discarded active foot modifiers until another recalculation | Restores the same effective foot profile |
| Player construction/reset/modifier changes | Recalculated walk at half run speed | Preserves the declared `DEFAULT_WALK / DEFAULT_RUN` ratio |
| Server `Player.GetSpeed()` | Reported the foot modifier even when mount/GM speeds were sent to the client | Reports the actual run-speed slot, keeping trust following consistent |
| GM speed reset | Forced `0, 2, 5, 5` | Restores the configured profile for the current mount state |

The common NPC calculation is unchanged. `CalculateMovementSpeedModifier` is
virtual so only players select this policy. The foot movement modifier remains
on foot throughout mounting; existing buffs can expire during a ride without
changing mount speed, and still-active foot modifiers resume on dismount.

The existing Goobbue policy is retained: both Goobbue variants use `3.6 / 9.0`
without the chocobo-only multiplier. The existing Lamed multiplier remains
`0.8`; its retail magnitude is still unverified.

## ARR / 2.0 comparison

The repository's earlier NPC audit used the
[ARR-era ModelSkeleton dump](https://github.com/kelhor/ffxiv_data_dump/blob/master/ModelSkeleton.txt).
This audit retrieved the same source and checked relevant profiles against the
[later ModelSkeleton table](https://github.com/thewakingsands/ffxiv-datamining-tc/blob/master/ModelSkeleton.csv).
The older file contains float movement values, while the later table represents
the corresponding values in hundredths (`600` corresponds to `6.0`).

The ARR-compatible server's
[BNpc implementation](https://github.com/SapphireServer/Sapphire/blob/master/src/world/Actor/BNpc.cpp)
names these fields `WalkSpeed` and `RunSpeed` and resolves them through the
model's skeleton. The older dump's columns, counting its row ID as column zero,
are walk at column 5 and run at column 6. Relevant excerpts:

| Skeleton row | Walk | Run |
| --- | ---: | ---: |
| 0, default humanoid | 2.4 | 6.0 |
| 20101, 20201, and other adult player race profiles | 2.4 | 6.0 |
| 10001, chocobo mount profile | 3.2 | 9.0 |
| 10002, Goobbue mount profile | 3.2 | 9.0 |

These are ARR-era reference profiles, not a newly verified capture from the
exact patch-2.0 launch client, and are not evidence for later mount-speed
upgrades or flying. The older dump's SHA-256 is
`92644cca30989351087b16592f4e2d835da0aae01be09cec2b1e7dc490e9829b`.

| Movement | Existing 1.x server base | This checkout after the fix | ARR reference |
| --- | ---: | ---: | ---: |
| Player walk | 2.0 | 2.4 | 2.4 |
| Player run / active | 5.0 | 6.0 | 6.0 |
| Chocobo walk | 3.6 | 4.32 | 3.2 |
| Chocobo run / active | 9.0 | 10.8 | 9.0 |

The server's underlying player run constant is `5.0`. Increasing the configured
multiplier from `1.1` to `1.2` raises running from **5.5 to 6.0** (a **9.1%**
increase) and closes the previous **8.3%** gap to ARR. This is an explicit
ARR-style tuning choice rather than a claim about original 1.x retail timing.

The ARR comparison does **not** establish the exact original 1.x player base
speed. The local server's defaults are implementation choices; the recovered
chocobo command Lua handles eligibility and presentation, without proving a
numeric server-authoritative movement baseline. No retail 1.x speed capture or
measured in-game traversal was recovered in this audit. The verified defects
are the inconsistent application and overwriting of the configured speeds.

An additional fidelity gap predates this fix: the archived
[official patch 1.19 notes](https://forum.square-enix.com/ffxiv/threads/24910-patch1.19-Patch-1.19-Notes)
(`docs/patches/Patch_1.19.md`) say personal chocobos are faster than rentals.
Both currently share the same base profile. The notes do not supply a numeric
ratio, so this change does not invent a rental penalty.

## Verification and rollout

- `dotnet build "Fishing Tests/Fishing Tests.csproj" --no-restore -m:1 -nr:false`
  with an isolated output directory: passed, with existing warnings.
- `--movement-speed-only`: passed. Covers configured foot movement, Sprint
  application/expiry, slowdown, equipment modifiers, rental/personal arrival,
  all four mount variants, Lamed/recovery, retained foot buffs after dismount,
  GM reset, and serialized movement-speed values.
- Lua execution checks cover ordinary mounting/dismounting for all variants,
  teleport dismount (including partially transitioned state), and GM Goobbue
  mounting. They reject any command attempting to overwrite the C# speed.
- `--chocobo-rental-only`: passed, including lender arrival, rental timer,
  area restrictions, and mount damage contracts.
- `--teleport-handoff-only`: passed, including 20 consecutive company-warp
  selections.
- `--mount-damage-only`: the new movement tests pass, then the broader suite
  fails an existing `Fade to White grants the classic Chocobo Whistle and
  exposes reward slot 3` source assertion. The same failure was reproduced
  using the pre-change `.codex-tmp/chocobo-lender-build/Fishing Tests.dll`.
- `git diff --check`: passed.
- Root config resolution tests: passed (29 assertions), including rejection
  of `Data/local`, stale build-output INIs, and fallback when root Data is missing.

The isolated validation build is in `.codex-tmp/movement-speed-build`. Applying
this to a running server requires deploying the rebuilt Map Server together
with the changed Lua command scripts and restarting it. No running server was
restarted or updated by this audit. In-game traversal timing remains untested.
