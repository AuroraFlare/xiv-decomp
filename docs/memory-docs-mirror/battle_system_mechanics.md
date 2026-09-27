# Battle System Mechanics

This document provides a high-level and mathematical breakdown of how the battle system currently calculates TP, HP, stats, and weaknesses for both Players and Mobs in Project Meteor.

> **Era boundary:** [Valk ARR calculator recovery](valk_arr_calculator_recovery.md)
> preserves formulas recovered from 2013–2014 archived calculators. Those
> formulas are intentionally isolated because they target ARR-era systems, not
> this project's FFXIV 1.0 rules.

## 1. TP Mechanics (Tactical Points)

### Initialization & Limits
*   **Max TP:** Capped at 3000 for all characters (Players and Mobs).
*   **Min TP:** Typically 0, but can be locked higher via `Modifier.MinimumTpLock`.
*   **Initialization:** Players are initialized with 3000 TP on spawn (or through GM testing commands). For mobs, TP starts relative to what is requested in their spawn data, typically 0.

### TP Generation (In Combat)
*   **Auto-Attacks & Abilities:** TP is *only* gained from auto-attacks and abilities when you hit the target (misses do not grant TP).
    *   **Formula:** `TP Gained = Weapon Delay * 100 * StoreTPPercent`
    *   *Weapon Delay* is calculated as `Modifier.Delay / 1000.0`.
    *   *Store TP* adds 0.1% per point of the `Modifier.StoreTp` stat (`1 + (StoreTp * 0.001)`).
*   **Taking Damage:** Characters gain TP when they receive damage.
    *   **Formula:** `TP Gained = 5 * e^(-0.0667 * DefenderLevel) * DamageTaken` (rounded up). The codebase notes this is accurate for level 50 but slightly off at lower levels.

### TP Regeneration/Decay (Out of Combat/Passive)
*   TP ticks over time using the `Modifier.Regain` stat (Tick rate runs inside `StatusEffectContainer.cs`).
*   **Out of Combat Decay:** By default, `Regain` drops to -90 out of combat, causing TP to decay rapidly. Abilities like Invigorate can push this to +100 to regenerate TP even out of combat.

### Using TP
*   Skills and Abilities cost TP defined in their `tpCost` (loaded from `server_battle_commands` in the DB).
*   **Combo Cost Reduction:** For Players, if a weapon skill is part of an active combo, the `tpCost` is reduced: `Cost = ceiling(tpCost * (1 - comboCostBonusRate))`.
*   Mobs do not currently consume TP using the combo system, but they still pay the base `tpCost` to execute abilities.

---

## 2. Mob HP & Stat Calculations

### Database Definition
*   A Mob's base stats, delays, and levels are defined in `Data/sql/server_battlenpc_mob_types.sql` (columns include `hpMax`, `str`, `vit`, `dex`, `def`, `eva`, etc.).
*   Its spawn configuration (like base HP/MP/TP percentages, whether it roams, etc.) is located in `Data/sql/server_battlenpc_spawn_locations.sql`.

### Stat Overrides and Scaling
*   When a Mob spawns (`BattleNpc.cs`), it applies its database values as base modifiers.
*   **HP Scaling:** Base HP is multiplied by a percentage modifier if one exists: `MaxHP = (BaseHp) * (HpPercent / 100)`.
*   *Historical Note:* While historical data suggests an exponential formula for Mob HP `125 * (1.12 ^ (level - 1))`, the actual C# codebase in `Character.cs` relies on the database-provided `hpMax` values modified by HP Percentages and base modifiers. There is currently no hardcoded `1.12 ^ level` exponential scaling function in `CalculateStats()`. The exponential formula is likely how Square Enix originally generated the base values stored inside the SQL tables.

### Player Stat Scaling
*   Players derive their stats via an intricate scaling formula in `Character.cs` -> `GetJobLevelAdjustedMod()`.
*   **Formula:** `Result = StartValue + (EndValue - StartValue) * ((Level - 1) / 49)^(1 / GrowthRate)`
*   Growth curves are predefined. For example, a Gladiator's HP scales from 120 to 2044 with a 0.45 growth rate.

### Player idle HP regeneration (retail observation)

The following is a single observed retail trace, retained as data rather than a
confirmed general formula. The player had `956` maximum HP and remained idle.
The capture timing and the HP value immediately before `307` are not yet known.

| Sample | HP | Change from prior sample |
| ---: | ---: | ---: |
| 1 | 307 | — |
| 2 | 322 | +15 |
| 3 | 337 | +15 |
| 4 | 395 | +58 |
| 5 | 453 | +58 |
| 6 | 511 | +58 |
| 7 | 569 | +58 |
| 8 | 627 | +58 |
| 9 | 685 | +58 |
| 10 | 743 | +58 |
| 11 | 801 | +58 |
| 12 | 859 | +58 |
| 13 | 917 | +58 |
| 14 | 956 | +39 (capped) |

The trace shows two `+15` increments, followed by ten consecutive `+58`
increments; the final tick is capped at maximum HP. At this maximum HP, the
observed steady-state increment is approximately `6.07%` of max HP per sample
(`58 / 956`), but the sample interval and any idle-state transition are still
unverified. Do not infer rounding behavior or a universal rate from this one
trace.

**Implementation gap:** `Player.RegenHp()` presently adds integer
`MaxHP / 16` while out of combat, which yields `59` for `956` max HP. It also
does not model the initial `+15` increments in the observed trace.

---

## 3. White Mage mechanics (patch 1.22c player-test source)

This section transcribes the mechanical claims from Sol_Aureus's
["White Mage: A Guide" first post](https://forum.square-enix.com/ffxiv/threads/41900-White-Mage-A-Guide),
which identifies itself as version `1.22c` and credits Kaeko's testing for the
Cure/Cura values. It is a detailed player research source, not an official
formula release. Values below are therefore **reported retail observations**
until validated against packet captures or additional tests; they must not
silently replace server formulas.

### Base-stat conversions reported for White Mage

| Base stat | Reported conversion | Affected mechanic |
| --- | --- | --- |
| Mind (MND) | Every 4 MND grants 1 Healing Magic Potency and 1 Magic Accuracy. | Cure/Cura strength; magic accuracy. |
| Vitality (VIT) | Every 1 VIT grants 1 HP; every 4 VIT grants 1 Enhancing Magic Potency. | Maximum HP; Protect, Regen, and Stoneskin. |
| Piety (PIE) | Every 1 PIE grants 1 MP; every 4 PIE grants 1 Enfeebling Magic Potency. | Maximum MP; enfeebling-effect accuracy. |
| Intelligence (INT) | Every 4 INT grants 1 Attack Magic Potency. | Attack-spell damage. |

The guide also reports White Mage trait bonuses of `+18` Healing Magic
Potency, `+8` Enhancing Magic Potency, and `+8` Magic Accuracy. Its two charts
resolve to the same base display rule over their shown ranges:

```text
base magic potency or magic accuracy = 341 + floor(relevant stat / 4)
```

The MND chart shows `168–440` MND mapping to `383–451` base potency, and the
VIT chart shows `136–492` VIT mapping to `375–464` Enhancing Magic Potency.
The reported trait bonuses are additional to those base chart values. This also
confirms `304` and `308` as adjacent MND-to-potency turnovers around `307` MND:
the conversion is discrete rather than fractional on every point.

### Direct healing

The reported linear marginal returns are:

| Spell | Per MND | Per Healing Magic Potency | MND return when the point completes a 4-MND potency turnover |
| --- | ---: | ---: | ---: |
| Cure | about `+0.25 HP` | about `+1.25 HP` | about `+0.5625 HP` |
| Cura | about `+0.50 HP` | about `+2.50 HP` | about `+1.125 HP` |

For a four-MND turnover, the corresponding reported increase is `+2.25` Cure
or `+4.5` Cura HP: the direct MND contribution plus one Healing Magic Potency.
Between turnovers, MND contributes only its direct component. This makes one
point of Healing Magic Potency worth a little more than two MND for direct
healing in this model; the exact result depends on the current MND threshold.

#### Curaga allocation

The guide describes Curaga as a capped healing pool rather than an equal heal
to every target. Let `C` be the spell's total healing cap and `m_i` the missing
HP for each in-range party member, ordered from lowest current HP to highest.

```text
remaining = C
per-target cap = C / 2
for each target in ascending current-HP order:
    heal_i = min(m_i, C / 2, remaining)
    remaining -= heal_i
    stop when remaining = 0
```

Thus, an individual target cannot receive more than half of Curaga's total
cap, but unneeded healing is carried to later targets. Full-HP party members
are still traversed, receiving zero, which can be used to wake sleeping party
members. The source gives Curaga a `10 s` recast.

### Enhancing Magic Potency

The source reports that Enhancing Magic Potency is the sole scaling stat for
Stoneskin and Regen, and scales Protect's defense and elemental-resistance
bonuses. Its Stoneskin chart was explicitly incomplete, so no closed formula
is asserted here: each point reportedly adds either one or two absorbed damage,
usually two. A reported comparison at `398` potency was `534` mitigation
without the White Mage enhancement versus `780` with it.

| Effect | Reported breakpoint behavior |
| --- | --- |
| Protect defense | `+1` defense after a repeating potency interval of `5, 4, 5, 4, 5, 4, 5, 4, 5`; because the period length is odd, the junction between periods produces adjacent `5` intervals. |
| Protect elemental resistance | `+1` all elemental resistance after a repeating interval of `7, 6, 7`. |
| Regen without AF boots | `+1 HP/tick` after each interval in `([1,2,2,1,2] × 3) + ([1,2,1,2,2] × 3)`, then repeat the whole 30-interval cycle. |
| Regen with White Mage AF boots | `+1 HP/tick` after the repeating 18-interval sequence `1,1,2,1,1,1,2,1,1,2,1,1,1,2,1,1,1,2`. |

The boots' reported "Enhances Regen" contribution scales with Enhancing Magic
Potency, adds up to `41 HP/tick`, and changes the breakpoint pattern. At level
50, the guide reports a Regen cap of `203 HP/tick` at `438` Enhancing Magic
Potency with those boots equipped. Treat both the cap and every breakpoint
sequence as high-value verification targets.

### White Mage actions and status interactions

| Action | Reported mechanical behavior |
| --- | --- |
| Regen | Healing-over-time spell; `5 s` recast. Scaled only by Enhancing Magic Potency. |
| Stoneskin | Fixed damage absorption; `30 s` recast. Scaled only by Enhancing Magic Potency. |
| Protect | Party-area defense and elemental-resistance buff; `5 min` duration, `30 s` recast. |
| Esuna | Removes one enfeebling effect; `10 s` recast. |
| Raise | Revives without weakness; `5 min` recast. |
| Benediction | Fully restores in-range party HP; `15 min` recast. It is an ability, so silence does not block it, but amnesia does. |
| Sacred Prism | Converts compatible healing/enhancing magic to area effect; `1 min` recast. Persists until the next compatible spell. Naturally area-effect Protect does not consume it. |
| Blissful Mind | Immediately removes `1/4` maximum HP, charges over time up to MP equal to `1/4` maximum HP, then grants the stored MP when used again. |
| Shroud of Saints | Temporarily halves enmity and restores MP during its `20 s` effect; `2 min` recast. The reported enmity halving ends with the effect rather than permanently reducing accumulated enmity. |
| Presence of Mind | Removes cast and recast time from the next spell; `5 min` recast. |
| Repose | Sleep; no recast. Its reported success rate uses Magic Accuracy only, not Enfeebling Magic Potency; targets have diminishing returns. |
| Stone / Stonera | Earth damage; `6 s` / `30 s` recast. Magic Evasion Down / Heavy secondary-effect success is reported to use Enfeebling Magic Potency. |
| Aero / Aerora | Wind damage; `6 s` / `20 s` recast. Aero's bleed success is reported to use Enfeebling Magic Potency; Aerora dispels each hit target. The reported Aero DoT range on bosses is `2–15` per tick. |
| Holy | Consumes all MP, damages around the White Mage, and may Bind; `5 min` recast. Bind success is reported to use Enfeebling Magic Potency. |
| Cleric Stance | `+20%` attack-spell potency and `−20%` healing-spell potency; `30 s` recast. Remains active until toggled off or death. |

### Reported consumable values

| Item | Reported value/effect |
| --- | --- |
| Mega-Ether | Restores `600 MP`. |
| Elixir | Restores `2,000 HP` and `1,050 MP`. |
| Mega-potion of Mind | `+40 MND` and `+80 Healing Magic Potency` for `60 s`. |
| Nerve Drops | `−80` enmity to all actions for `1 min`. |

The source also states that sitting does not change MP regeneration; it only
prevents movement and casting. This is an observation, not yet a server rule.

---

## 4. Mob Weaknesses & Resistances

### Elemental & Physical Resistances
*   Modifiers exist for physical (`SlashingResistance`, `PiercingResistance`, `BluntResistance`) and elemental (`FireResistance`, `IceResistance`, etc.) defenses.
*   These base resistance values for mobs are hardcoded into the `server_battlenpc_mob_types` SQL table. Columns include `slash`, `pierce`, `h2h` (hand-to-hand), `blunt`, `fire`, `ice`, `wind`, `lightning`, `earth`, and `water`.
*   They act as damage multipliers (e.g., a value of `1` is standard damage, `<1` is resistance, `>1` is a weakness).
*   In combat calculation (`BattleUtils.cs` and `Character.cs`), incoming damage is reduced or increased based on these modifiers interacting with the attack type of the incoming skill.
