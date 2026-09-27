# Valk B.L.I.T.Z.B.A.L.L. calculator recovery

## Scope and source handling

This is a recovery of the formula data embedded in the inline `jzzf_graph_*`
JavaScript objects on five archived Valk B.L.I.T.Z.B.A.L.L. calculator pages.
It records what the calculators compute, including their inconsistencies; it is
not a claim that the formulas are exact retail behavior.

All five calculators reference ARR-era systems such as Defiance, Shield Oath,
Fey Light/Illumination, and Sacred Soil. They are **not FFXIV 1.0 formulas**
and must not be substituted for the server's 1.0 implementation without a
separate era-appropriate validation pass.

| Archived calculator | Archive URL | Inline graph |
| --- | --- | --- |
| White Mage healing returns | [2013-09-24 capture](https://web.archive.org/web/20130924083013/http://valk.dancing-mad.com/?page_id=279) | `jzzf_graph_6` |
| White Mage healing | [2013-09-24 capture](https://web.archive.org/web/20130924082950/http://valk.dancing-mad.com/?page_id=200) | `jzzf_graph_2` |
| Physical damage return on investment | [2014-03-05 capture](https://web.archive.org/web/20140305075611/http://valk.dancing-mad.com/calculators/return-on-investment/) | `jzzf_graph_4` |
| Physical damage | [2013-09-24 capture](https://web.archive.org/web/20130924082945/http://valk.dancing-mad.com/?page_id=202) | `jzzf_graph_1` |
| Damage mitigation | [2013-09-24 capture](https://web.archive.org/web/20130924082958/http://valk.dancing-mad.com/?page_id=213) | `jzzf_graph_3` |

The pages credit Volpes for a more rigorous statistical analysis of the healing
data. No rounding, flooring, level correction, or valid-range rule is present
in the recovered formula objects, so all expressions below are real-valued
calculator outputs.

## White Mage healing calculator

Let `M` = Mind, `D` = Determination, `W` = Magic Damage, `P` = listed cure
potency, and `R` = Critical Hit Rating. For the calculator's spell-power buffs,
use `M' = M × ClericStance × DivineSeal × FeyIllumination` where the selected
values are `0.80`, `1.30`, and `1.20` respectively (`1` when inactive).

```text
BaseHeal = (P / 400) × (
    (0.0189 × M' + 0.00434 × D + 0.478) × W
    + 0.485 × M' + 0.0855 × D)

CriticalChancePercent = 0.0693 × R - 18.486
CriticalAdjustedHeal = AverageHeal × (1 + CriticalChancePercent / 200)
```

`AverageHeal` is `BaseHeal` multiplied by every selected received-healing
modifier. The calculator exposes these as independent switches, even where
retail status rules may make alternatives mutually exclusive:

| Modifier | Multiplier in calculator |
| --- | ---: |
| Mantra | `1.10` |
| Mantra trait | `1.20` |
| Convalescence | `1.20` |
| Convalescence trait | `1.30` |
| Defiance, five stacks | `1.15` |

The implementation applies Cleric Stance, Divine Seal, and Fey Illumination by
multiplying `M` rather than by multiplying the final result. This is an
important property of the archived calculator, not a generalized stacking rule.

## White Mage healing return calculator

The returns page compares current and new `M`, `D`, `W`, and `R` using the
same unbuffed core heal expression above, and reports:

```text
PercentIncrease = 100 × (NewCritAdjustedHeal / CurrentCritAdjustedHeal - 1)
```

Its separately labeled `Absolute Healing Increase` is not simply the displayed
new minus current heal. The embedded expression changes the `0.478` constant
to `0.487` and uses a distinct critical adjustment. Preserve the page as a
historical calculator artifact, but use the direct difference of the two
displayed healing outputs for a sensible comparison.

## Physical damage calculator

Let `X` = Strength (or Dexterity for Bard/Archer, as the page instructs),
`D` = Determination, `W` = Weapon Damage, `A` = weapon auto-attack value,
`P` = weaponskill potency, `R` = Critical Hit Rating, and `S` = Skill Speed.
The calculator first applies Berserk (`1.50`) and Hawk's Eye (`1.15`) to `X`.

```text
WSBase = (P / 100) × (
    (0.0032 × X + 0.4162) × W
    + 0.1 × X - 0.3529 + 0.035 × (D - 202))

AutoBase = (A / W) × (
    (0.0032 × X + 0.4162) × W
    + 0.1 × X - 0.3529 + 0.1 × (D - 202))
```

Apply the selected damage multipliers multiplicatively to each base result.
The calculator's data table is:

| Effect | Multiplier |
| --- | ---: |
| Fists of Fire | `1.05` |
| Twin Snakes | `1.10` |
| Maim | `1.20` |
| Raging Strikes | `1.20` |
| Blood for Blood / trait | `1.20` / `1.30` |
| Greased Lightning, 3 stacks | `1.21` damage and `1.15` attack-speed multiplier |
| Fight or Flight | `1.30` |
| Power Surge | `1.50` |
| Storm's Eye, Dragon Kick, Disembowel | each `1.111111…` |
| Defiance / Shield Oath | `0.70` / `0.80` |

The formula treats the resistance debuffs above as a `1 / 0.9` damage
multiplier. Its critical calculation is:

```text
CritChancePercent = 0.0693 × (R × crit-rate modifiers) - 18.486
CritAdjustedDamage = Damage × (1 + CritChancePercent / 200)
```

The available critical-rate multipliers are True Strike `1.05`, Straight Shot
`1.10`, Wrath `1.10`, Internal Release `1.20`, and its trait `1.30`.

For the displayed DPS values, the calculator uses:

```text
Recast = 2.49 - ((S × FeyLight - 344) × 0.01 / 10.5)
WeaponskillDPS = GreasedLightningSpeed × WeaponskillDamage / Recast
AutoAttackDPS = GreasedLightningSpeed × AutoAttackDamage / ((A / W) × 3)
```

Fey Light is `1.30` in the Skill Speed term. The calculator applies all enabled
checkboxes independently and therefore does not enforce combo, job, target, or
status exclusivity.

## Damage mitigation calculator

The calculator represents `PDR` as the percentage of physical damage taken,
not damage reduced. Let `DEF` = Defense, `MDEF` = Magic Defense, and `F` be
the Foresight defense multiplier (`1.20` when enabled):

```text
PDR = 100 × RainOfDeath × SacredSoil × EyeForAnEye
      × (1 - ShieldOath) × (1 - Rampart) × (1 - Sentinel)
      × (1 - FistsOfEarth)
      × (1 - 0.000443 × DEF × F)

MagicDamageTaken = 100 × (1 - 0.00043 × MDEF × FeyCovenant)
```

Shield Oath, Rampart, Sentinel, and Fists of Earth are `20%`, `20%`, `40%`,
and `10%` reductions. Rain of Death, Sacred Soil, and Eye for an Eye each
multiply remaining damage by `0.90`. Fey Covenant multiplies Magic Defense by
`1.20`.

The effective-HP model is:

```text
BaseHP = 14.5 × (VIT - 202) + 85 × JobCoefficient
PhysicalEHP = 1.10 × 1.20 × 1.18 × 1.25 × BaseHP / (PDR / 100)
```

The `1.10`, `1.20`, `1.18`, and `1.25` factors are the calculator's normal
Stoneskin, Thrill of Battle, White Mage Stoneskin, and Defiance switches.
These multipliers are applied independently. Job coefficients are: Gladiator
`22`, Marauder `23`, Lancer `22`, Pugilist `21`, Archer `20`, Thaumaturge `20`,
Conjurer `20`, Paladin `24`, Warrior `25`, Dragoon `23`, Monk `22`, Bard `21`,
Black Mage `21`, and White Mage `21`.

For physical damage type `T` (the displayed slashing, piercing, or blunt
resistance, where `100` is neutral):

```text
AdjustedTakenPercent = PDR × 100 / T
TypedEHP = 1.20 × 1.18 × 1.25 × BaseHP / (AdjustedTakenPercent / 100)
```

The typed-EHP expression omits the normal Stoneskin multiplier while the
untyped physical-EHP expression includes it. This is a calculator inconsistency
worth retaining during validation. The original page explicitly labels
elemental resistance and magic effective HP as work in progress.

## Physical damage return-on-investment calculator

This later calculator exposes current/new STR, Determination, Weapon Damage,
weapon auto-attack value, Critical Hit Rating, Skill Speed, and weaponskill
potency. Its valid-looking weaponskill comparison expressions differ from the
physical-damage calculator:

```text
CandidateWS = (P / 100) × (
    (0.00389 × X + 0.0008 × D + 0.01035) × W
    + 0.08034 × X + 0.02622 × D)
    × (1 + (0.0697 × R - 18.437) / 200)

AbsoluteWSIncrease = NewCandidateWS - CurrentCandidateWS
PercentWSIncrease = 100 × (NewCandidateWS / CurrentCandidateWS - 1)
```

This graph is partially broken as archived: two hidden outputs are `null`, and
another hidden formula contains the literal `-30991` (not a plausible decimal
constant). Its auto-attack comparison depends on those hidden values. Keep the
candidate WS formulas as an extracted hypothesis, but do not use this ROI page
for authoritative tuning until reconstructed and cross-validated.

## Enmity tables

The [2013-10-07 Enmity Tables capture](https://web.archive.org/web/20131007053920/http://valk.dancing-mad.com/?page_id=231)
stores its data as four static images, not JavaScript. The page defines combo
potency as cumulative across the combo, uses a base GCD for its time column,
and states that enmity multipliers apply to final damage. The original example
is `100` damage with Rage of Halone at `×10` = `1,000` enmity.

These are ARR-era, level-50 research values. They are not valid inputs for the
FFXIV 1.0 server. `C` means the table's cumulative combo column and `NC` its
non-combo column. A dash means the source image gave no value.

### Level 50 Paladin

| Action | Reported enmity model | C potency | C time | C hate/s | C TP | C hate/TP | NC potency | NC time | NC hate/s | NC TP | NC hate/TP |
| --- | --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| Fast Blade | Damage `×1`, Shield Oath `×2` | 300 | 2.5 | 120 | 70 | 4.29 | 300 | 2.5 | 120 | 70 | 4.29 |
| Savage Blade | Damage `×3`, Shield Oath `×2` | 1,500 | 5.0 | 300 | 130 | 11.54 | 600 | 2.5 | 240 | 60 | 10.00 |
| Rage of Halone | Damage `×5`, Shield Oath `×2` | 4,100 | 7.5 | 547 | 190 | 21.58 | 1,000 | 2.5 | 400 | 60 | 16.67 |
| Riot Blade | Damage `×1`, Shield Oath `×2` | 760 | 5.0 | 152 | 170 | 4.47 | 200 | 2.5 | 80 | 120 | 1.67 |
| Shield Lob | Damage `×3`, Shield Oath `×2` | 720 | 2.5 | 288 | 120 | 6.00 | 720 | 2.5 | 288 | 120 | 6.00 |
| Shield Bash | Damage `×1`, Shield Oath `×2` | 220 | 2.5 | 88 | 150 | 1.47 | 220 | 2.5 | 88 | 150 | 1.47 |
| Shield Swipe | Damage `×1`, Shield Oath `×2` | 420 | 2.5 | 168 | 40 | 10.50 | 420 | 2.5 | 168 | 40 | 10.50 |
| Spirits Within | Damage `×1`, Shield Oath `×2` | 600 | — | — | — | — | 600 | — | — | — | — |
| Circle of Scorn | Damage + DoT, Shield Oath `×2` | 500 | — | — | — | — | 500 | — | — | — | — |

The page's comment thread corrects the non-combo Shield Swipe value to `420`;
the transcribed table above uses that correction. Spirits Within's source note
says its potency falls as the user's HP falls.

| Paladin non-damaging action | Base enmity | With Shield Oath |
| --- | ---: | ---: |
| Rampart, Fight or Flight, Convalescence, Awareness, Cover, Sentinel, Tempered Will, Bulwark, Hallowed Ground | +70 | +140 |
| Sword Oath | +70 plus 50 potency per auto-attack | N/A |
| Shield Oath | +70 | N/A |
| Flash | +550 | +1,100 |
| Provoke | Current top enmity + 1 | N/A |
| Protect | +20 self, +10 per additional party member | +40 self, +20 per additional party member |

### Level 50 Warrior

| Action | Reported enmity model | C potency | C time | C hate/s | C TP | C hate/TP | NC potency | NC time | NC hate/s | NC TP | NC hate/TP |
| --- | --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| Heavy Swing | Damage `×1`, Defiance `×2` | 300 | 2.5 | 120 | 70 | 4.29 | 300 | 2.5 | 120 | 70 | 4.29 |
| Skull Sunder | Damage `×3`, Defiance `×2` | 1,500 | 5.0 | 300 | 130 | 11.54 | 600 | 2.5 | 240 | 60 | 10.00 |
| Butcher's Block | Damage `×5`, Defiance `×2` | 4,300 | 7.5 | 573 | 190 | 22.63 | 1,000 | 2.5 | 400 | 60 | 16.67 |
| Maim | Damage `×1`, Defiance `×2` | 680 | 5.0 | 136 | 130 | 5.23 | 200 | 2.5 | 80 | 60 | 3.33 |
| Storm's Eye | Damage `×1`, Defiance `×2` | 1,220 | 7.5 | 163 | 200 | 6.10 | 200 | 2.5 | 80 | 70 | 2.86 |
| Storm's Path | Damage `×1`, Defiance `×2` | 1,180 | 7.5 | 157 | 220 | 5.36 | 200 | 2.5 | 80 | 90 | 2.22 |
| Tomahawk | Damage `×3`, Defiance `×2` | 780 | 2.5 | 312 | 120 | 6.50 | 780 | 2.5 | 312 | 120 | 6.50 |
| Overpower | Damage `×4`, Defiance `×2` | 960 | 2.5 | 384 | 100 | 9.60 | 960 | 2.5 | 384 | 100 | 9.60 |
| Fracture | Damage + DoT, Defiance `×2` | 600 | 2.5 | 240 | 80 | 7.50 | 600 | 2.5 | 240 | 80 | 7.50 |
| Steel Cyclone | Damage `×1`, Defiance `×2` | 517 | 2.5 | 207 | — | — | 517 | 2.5 | 207 | — | — |
| Inner Beast | Damage `×1`, Defiance `×2` | 857 | 2.5 | 343 | — | — | 857 | 2.5 | 343 | — | — |
| Mercy Stroke | Damage `×1`, Defiance `×2` | 400 | — | — | — | — | 400 | — | — | — | — |
| Brutal Swing | Damage `×1`, Defiance `×2` | 100 | — | — | — | — | 100 | — | — | — | — |

| Warrior non-damaging action | Base enmity | With table's Defiance multiplier |
| --- | ---: | ---: |
| Foresight, Bloodbath, Berserk, Thrill of Battle, Holmgang, Vengeance, Unchained, Infuriate | +70 | +140 |
| Flash | +495 | +990 |
| Provoke | Current top enmity + 1 | N/A |

The source notes that its Flash values were normalized by `1 / 0.65` because
it considered Flash unaffected by Defiance's `0.65` damage multiplier. It also
lists the Warrior test character as `LV50`, `351 STR`, `238 DTR`, and `44 WD`.

### White Mage and cross-action observations

| White Mage action | Reported enmity |
| --- | --- |
| Stone, Aero, Stone II, Aero II, Holy, Fluid Aura | Damage `×1` |
| Cure | HP healed `×0.5` |
| Cure II, Cure III, Medica | HP healed `×0.6` |
| Medica II | Direct heal `×0.1` plus HoT `×0.5` |
| Regen | `+70` plus HoT `×0.5` |
| Benediction | HP healed `×0.6` |
| Protect, Raise, Esuna, Repose, Stoneskin, Cleric Stance, Shroud of Saints, Presence of Mind, Divine Seal | +70 |

| Other observation | Reported enmity |
| --- | --- |
| Cure | HP healed `×0.5` |
| Healing over time | HP healed `×0.5` |
| Thrill of Battle, Convert | +70 |
| HP absorption | 0 |
| Quelling Strike | Damage `×0.5` |
| Elusive Jump | `0.5 ×` total current enmity |

The page attributes the White Mage table to a Japanese source and says the
author independently verified Cure I at `0.5` hate per HP. It reports only
tentative testing for Protect: about `+20` on self and `+10` for each other
party member, which would total `+70` in an eight-member party. Treat the
White Mage and absorption figures as lower confidence than the table's direct
damage-multiplier values.

## Eye for an Eye proc table

The [2013-09-24 Eye for an Eye capture](https://web.archive.org/web/20130924083032/http://valk.dancing-mad.com/?page_id=350)
models a `20%` proc chance for each hit received during a `30 s` buff duration.
For an enemy attacking once every `GCD` seconds, its number of hit opportunities
is `n = 30 / GCD`. It uses the binomial probability of exactly `k` procs:

```text
P(exactly k procs) = C(n, k) × 0.2^k × 0.8^(n-k)
P(at least one proc) = 1 - 0.8^n
```

The calculator's mitigation model earlier in this document treats a triggered
Eye for an Eye as a remaining-damage multiplier of `0.90`; this table only
models the probability of seeing at least one trigger, not expected mitigated
damage or trigger timing.

| Hits in 30 s (`n`) | At least one proc | Hits in 30 s (`n`) | At least one proc | Hits in 30 s (`n`) | At least one proc |
| ---: | ---: | ---: | ---: | ---: | ---: |
| 1 | 20.00% | 11 | 91.41% | 21 | 99.08% |
| 2 | 36.00% | 12 | 93.13% | 22 | 99.26% |
| 3 | 48.80% | 13 | 94.50% | 23 | 99.41% |
| 4 | 59.04% | 14 | 95.60% | 24 | 99.53% |
| 5 | 67.23% | 15 | 96.48% | 25 | 99.62% |
| 6 | 73.79% | 16 | 97.19% | 26 | 99.70% |
| 7 | 79.03% | 17 | 97.75% | 27 | 99.76% |
| 8 | 83.22% | 18 | 98.20% | 28 | 99.81% |
| 9 | 86.58% | 19 | 98.56% | 29 | 99.85% |
| 10 | 89.26% | 20 | 98.85% | 30 | 99.88% |

The page's worked attack-speed cases are `3.0 s` GCD (`n=10`, `89.26%`),
`2.5 s` (`n=12`, `93.13%`), `2.0 s` (`n=15`, `96.48%`), and `1.5 s`
(`n=20`, `98.85%`). As with the rest of this file, this is ARR-era source
material, not a 1.0 implementation rule.

## L.E.T.A. base-stat table

The [2013-10-07 L.E.T.A. capture](https://web.archive.org/web/20131007211556/http://valk.dancing-mad.com/?page_id=293)
expands to **Level Equivalent Table of Attributes**. It labels the values as
Phase 3 beta base levels for Skill Speed, Spell Speed, Parry, Accuracy, and
Critical Hit Rating. The page marks levels `1–50` as values observed in game
and `51–100` as values extrapolated by an undisclosed formula.

| Levels | In-game base value for each listed secondary stat |
| --- | --- |
| 1–10 | 56, 57, 60, 62, 65, 68, 70, 73, 76, 78 |
| 11–20 | 82, 85, 89, 93, 96, 100, 104, 109, 113, 117 |
| 21–30 | 122, 127, 133, 138, 144, 150, 155, 162, 168, 173 |
| 31–40 | 181, 188, 194, 202, 209, 215, 223, 229, 236, 244 |
| 41–50 | 253, 263, 272, 283, 292, 302, 311, 322, 331, 341 |
| 51–60* | 349, 360, 370, 380, 391, 402, 413, 424, 435, 446 |
| 61–70* | 458, 470, 482, 494, 506, 519, 531, 544, 557, 570 |
| 71–80* | 583, 597, 611, 624, 638, 652, 667, 681, 696, 711 |
| 81–90* | 726, 741, 756, 771, 787, 803, 819, 835, 851, 868 |
| 91–100* | 884, 901, 918, 935, 953, 970, 988, 1,006, 1,024, 1,042 |

`*` Extrapolated, not observed. The source presents level `60`'s `446` value
as a possible Accuracy/Evasion target for a hypothetical level-60 enemy, but
also says there were no ARR level-60 enemies known to the author and calls the
higher-level interpretation theoretical. Use this table only as historical
beta/ARR research data, never as a 1.0 accuracy or secondary-stat formula.

## Patch 1.20 Cure and Cura testing (Kanican)

Source: [Kanican, “Stat Testing – Part I (Cure Formula),” 29 January 2012](https://web.archive.org/web/20131028205054/http://kanican.livejournal.com/54846.html). Unlike the ARR-beta Valk material elsewhere in this file, this is explicitly **FFXIV 1.20** testing, so it is historically closer to the 1.x target. It is still player experimentation, not an extracted server formula.

### Method and limits stated by the author

- Tests repeatedly cast Cure/Cura on the caster, normally rank-50 on rank-50. The controlled/listed variables were caster and target level, caster class/job, Healing Magic Potency, MND, VIT, Magic Critical Hit Rate, and Magic Critical Potency.
- `PREDICT` is `(observed minimum + observed maximum) / 2`; `DEV` is the percentage difference between the maximum and `PREDICT`; `n` is the normal/critical trial count. The author used the trial mean only as a reference, not as the analysis input.
- The 294-cast `Cure_THM50_410H_178V_277M` sample ranged from 440–467 and was interpreted as a uniform integer roll rather than a normal distribution. This is an assumption, not a confirmed RNG implementation.
- The collection cutoff was: finish immediately when `DEV ≥ 3.00%`; when `DEV < 2.91%`, collect at least 100 trials. The author found large trials converged around a 3.00% maximum deviation.

### Raw data retained by the source

The complete published summary table is preserved as the source's [raw Cure/Cura test image](http://i.imgbox.com/aaeV3Z8R.png): it has all trial counts, min/max/predicted/mean values, critical counts, critical rates, and bonuses. The article also links individual evidence images for [class comparison](http://i.imgbox.com/aatXyf3q.png), [potency comparison](http://i.imgbox.com/aax8zLrX.png), [non-CNJ potency series](http://i.imgbox.com/aaj4WFWT.png), and [critical-rate table](http://i.imgbox.com/aalFafMQ.png). Several additional image URLs embedded by the original page no longer resolve outside its archive; their quantitative conclusions below are transcribed from the surviving article text.

| Source order | Original image asset | Evidence described by the article | Recovery state |
| ---: | --- | --- | --- |
| 1 | [aaeV3Z8R](http://i.imgbox.com/aaeV3Z8R.png) | Complete Cure/Cura summary table | Direct image available |
| 2 | [aanr7MzW](http://i.imgbox.com/aanr7MzW.png) | 294-trial Cure frequency chart | Original URL unavailable; findings retained in article text |
| 3 | [aatXyf3q](http://i.imgbox.com/aatXyf3q.png) | CNJ / non-CNJ class comparison | Direct image available |
| 4 | [aag4g9Qg](http://i.imgbox.com/aag4g9Qg.png) | VIT comparison | Original URL unavailable; findings retained in article text |
| 5 | [aax8zLrX](http://i.imgbox.com/aax8zLrX.png) | CNJ potency and level-2 tests | Direct image available |
| 6 | [aaj4WFWT](http://i.imgbox.com/aaj4WFWT.png) | Non-CNJ potency series | Direct image available |
| 7 | [aapz44nn](http://i.imgbox.com/aapz44nn.png) | MND comparison | Original URL unavailable; findings retained in article text |
| 8 | [aayG2wOc](http://i.imgbox.com/aayG2wOc.png) | Critical-potency comparison | Original URL unavailable; findings retained in article text |
| 9 | [aalFafMQ](http://i.imgbox.com/aalFafMQ.png) | Pooled critical-rate table | Direct image available |

Key rows from the published summary, included here as easily searchable anchor points:

| Spell / caster | Healing potency | VIT | MND | Normal range | Predicted normal | Critical range | Predicted critical | Observed critical rate | Critical bonus |
| --- | ---: | ---: | ---: | --- | ---: | --- | ---: | ---: | ---: |
| Cure / CNJ 50 | 424 | 178 | 263 | 515–547 | 531.0 | 628–653 | 640.5 | 7.35% | 120.62% |
| Cure / THM 50 | 424 | 178 | 274 | 455–483 | 469.0 | 575–597 | 586.0 | 10.34% | 124.95% |
| Cure / CNJ 50 | 465 | 178 | 263 | 565–600 | 582.5 | 693–693 | 693.0 | 6.67% | 118.97% |
| Cure / THM 50 (`+58` critical potency) | 410 | 178 | 277 | 440–467 | 453.5 | 544–578 | 561.0 | 17.07% | 123.70% |
| Cura / CNJ 50 | 424 | 178 | 263 | 1,031–1,095 | 1,063.0 | no critical sample | — | 0.00% | — |
| Cura / CNJ 50 | 465 | 178 | 263 | 1,131–1,200 | 1,165.5 | 1,428–1,463 | 1,445.5 | 4.81% | 124.02% |

### Reported conclusions (not exact formula claims)

- On non-CNJ classes, MND itself did not change Cure in the tested data; it still increases Healing Magic Potency at **1 potency per 4 MND**, which in turn affects the cure.
- Raising VIT by 84 in the non-CNJ comparison increased Cure by about 9.5 HP, roughly one Cure HP per 8–10 VIT. This was a low-sample test and is marked modest/imprecise by the author.
- With MND and VIT held constant on CNJ, Healing Magic Potency 424 → 465 (`+41`) increased Cure's predicted average by 51.5 (`≈1.25 HP/potency`) and Cura by 102.5 (`≈2.50 HP/potency`). The author considers potency a proportional/percentage effect rather than a universal flat additive rule.
- The non-CNJ potency series was closer to `≈1.10 HP/potency` for Cure. The level-2 tests also showed the level-50 ratios should not be treated as a global formula.
- On CNJ near the tested level-50 range, `+62 MND` produced about `+15` Cure (`≈0.25` per MND) and `+31.5` Cura (`≈0.50` per MND). Including the 1-per-4-MND potency contribution, the author's practical gear comparisons are: CNJ Cure `1 potency ≈ 1.25`, `1 MND ≈ 0.5625`; CNJ Cura `1 potency ≈ 2.50`, `1 MND ≈ 1.125`; non-CNJ Cure `1 potency ≈ 1.10`, `1 MND ≈ 0.275`.
- For an R50 caster healing an R50 target without critical bonuses, cure criticals were reported at roughly `+22–23%` and roughly `7.8%` frequency. Pooled data showed THM (with the `+10` critical-rate trait) at `10.80%` versus other classes at `7.71%`; the reported chi-squared result was `4.3968`, `p = 0.036`. The author says this establishes an effect but not its exact magnitude.
- A limited `+58` critical-potency test was judged too confounded to quantify cleanly; the article describes the observed critical total increase as moving from about `123.70%` to `133.85%`.

### Requested spreadsheet recovery

Both requested Google Spreadsheet captures return Wayback's explicit **“has not archived that URL”** page, and a CDX lookup finds no successful capture for either original URL. Therefore the workbook cell data cannot be recovered from these links:

- [Damage worksheet requested capture](https://web.archive.org/web/20131028205054/https://docs.google.com/spreadsheet/ccc?key=0As2LEIW2Tu89dEFsSzJFT29EV1JJaVdqZkhGRlVESlE#gid=7)
- [Critical worksheet requested capture](https://web.archive.org/web/20131028205054/https://docs.google.com/spreadsheet/ccc?key=0AjI8PTbz39xPdGNvdzhtT01iMUFST1B2aC12VVdVbWc#gid=0)

The requested headings from “Damage Mechanics And Formula” through “Glossary” correspond to Valk's Methodology-page sections and linked tables. Their recoverable findings are consolidated below under [Methodology, raw tests, and provisional equations](#methodology-raw-tests-and-provisional-equations), with the dedicated [Block and Parry tier table](#block-and-parry-tier-table), [Enmity tables](#enmity-tables), and [Eye for an Eye table](#eye-for-an-eye-proc-table) retained separately.

## Attribute and HP table (Seeker of the Sun, level 50)

The [2013-08-06 Attribute Table capture](https://web.archive.org/web/20130806141055/http://valk.dancing-mad.com/?page_id=266)
contains a **Seeker of the Sun** level-50 job table, translated/adapted from
the linked Archylte source. It does not provide a level-by-level primary-stat
curve: all primary, HP, and MP figures below are level-50 values only.

The page gives this HP calculation, using the job's Base HP from its second
table:

```text
HP = BaseHP + 15 × (VIT - 189)
```

| Job | Base HP | VIT | Level-50 HP | MP |
| --- | ---: | ---: | ---: | ---: |
| GLA | 1,495 | 224 | 2,020 | 1,196 |
| PLD | 1,560 | 244 | 2,385 | 1,474 |
| MRD | 1,560 | 224 | 2,085 | 558 |
| WAR | 1,625 | 244 | 2,450 | 770 |
| LNC | 1,235 | 202 | 1,430 | 904 |
| DRG | 1,300 | 212 | 1,645 | 1,163 |
| PGL | 1,105 | 191 | 1,135 | 745 |
| MNK | 1,170 | 202 | 1,365 | 987 |
| ARC | 1,105 | 191 | 1,135 | 1,674 |
| BRD | 1,170 | 202 | 1,365 | 1,965 |
| CON | 1,105 | 191 | 1,135 | 3,210 |
| WHM | 1,170 | 202 | 1,365 | 3,508 |
| THM | 1,105 | 191 | 1,135 | 3,350 |
| BLM | 1,170 | 202 | 1,365 | 3,571 |

| Job | STR | DEX | VIT | INT | MND | PIE |
| --- | ---: | ---: | ---: | ---: | ---: |
| GLA | 192 | 193 | 224 | 99 | 190 | 161 |
| PLD | 203 | 193 | 244 | 119 | 201 | 171 |
| MRD | 203 | 183 | 224 | 58 | 100 | 80 |
| WAR | 213 | 193 | 244 | 78 | 110 | 90 |
| LNC | 225 | 193 | 202 | 78 | 120 | 141 |
| DRG | 245 | 204 | 212 | 88 | 130 | 151 |
| PGL | 215 | 204 | 191 | 88 | 170 | 121 |
| MNK | 235 | 214 | 202 | 99 | 180 | 131 |
| ARC | 172 | 226 | 191 | 159 | 150 | 161 |
| BRD | 182 | 246 | 202 | 169 | 160 | 171 |
| CON | 102 | 204 | 191 | 200 | 223 | 222 |
| WHM | 112 | 214 | 202 | 210 | 243 | 242 |
| THM | 81 | 193 | 191 | 222 | 201 | 222 |
| BLM | 91 | 204 | 202 | 242 | 211 | 232 |

| Job | Determination | Critical Hit Rating | Accuracy | Attack Power | Attack Magic Potency | Healing Magic Potency |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| GLA | 202 | 341 | 341 | 192 | 99 | 190 |
| PLD | 202 | 341 | 341 | 203 | 119 | 201 |
| MRD | 202 | 341 | 341 | 203 | 58 | 100 |
| WAR | 202 | 341 | 341 | 213 | 78 | 110 |
| LNC | 202 | 341 | 341 | 225 | 78 | 120 |
| DRG | 202 | 341 | 341 | 245 | 88 | 130 |
| PGL | 202 | 341 | 341 | 215 | 88 | 170 |
| MNK | 202 | 341 | 341 | 235 | 99 | 180 |
| ARC | 202 | 341 | 341 | 172 | 159 | 150 |
| BRD | 202 | 341 | 341 | 182 | 169 | 160 |
| CON | 202 | 341 | 341 | 102 | 200 | 223 |
| WHM | 202 | 341 | 341 | 112 | 210 | 243 |
| THM | 202 | 341 | 341 | 81 | 222 | 201 |
| BLM | 202 | 341 | 341 | 91 | 242 | 211 |

Every listed job has Skill Speed, Spell Speed, Parry, and hypothesized Evasion
of `341`; its displayed Defense and Magic Defense are `0`; physical resistances
are `100`; and each elemental resistance is `269`. Those fields are the page's
un-equipped base presentation, not final character-sheet values. This table is
ARR beta-era data and must remain separate from FFXIV 1.0 HP/stat calculations.

## Level-50 race tables

The [Hyur capture](https://web.archive.org/web/20160616151344/http://valk.dancing-mad.com/tables/attribute-table/hyur/),
[Elezen capture](https://web.archive.org/web/20160501221747/http://valk.dancing-mad.com/tables/attribute-table/elezen/),
[Lalafell capture](https://web.archive.org/web/20140206030650/http://valk.dancing-mad.com/tables/attribute-table/lalafell/),
[Miqo'te capture](https://web.archive.org/web/20160618150207/http://valk.dancing-mad.com/tables/attribute-table/miqote/),
and [Roegadyn capture](https://web.archive.org/web/20130924115120/http://valk.dancing-mad.com/?page_id=385)
provide direct level-50 HP and primary-stat values for all ten clans. The repeated
Roegadyn URL supplied for this recovery was identical and is represented once.

These clan images do not include the parent page's derived/offense values. The
Hyur, Elezen, and Lalafell pages explicitly say MP data is unavailable; the
Miqo'te page says Keeper of the Moon MP is unavailable; and the Roegadyn page
says Sea Wolf MP is unavailable while displaying Hellsguard MP. Their fractional
HP values and different archive dates mean they must not be mechanically merged
with the Seeker of the Sun HP formula above without version-specific testing.

### Midlander Hyur

| Job | HP | MP | STR | DEX | VIT | INT | MND | PIE |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| GLA | 2,044 | — | 192 | 180 | 214 | 102 | 189 | 162 |
| PLD | 2,504 | — | 203 | 190 | 234 | 122 | 200 | 172 |
| MRD | 2,129 | — | 203 | 180 | 214 | 61 | 99 | 81 |
| WAR | 2,589 | — | 213 | 190 | 234 | 81 | 109 | 91 |
| LNC | 1,870 | — | 225 | 190 | 202 | 81 | 119 | 142 |
| DRG | 2,100 | — | 245 | 201 | 212 | 91 | 129 | 152 |
| PGL | 1,625.5 | — | 215 | 201 | 191 | 91 | 169 | 122 |
| MNK | 1,870 | — | 235 | 211 | 202 | 102 | 179 | 132 |
| ARC | 1,540.5 | — | 172 | 223 | 191 | 162 | 149 | 162 |
| BRD | 1,785 | — | 182 | 243 | 202 | 172 | 159 | 172 |
| CON | 1,540.5 | — | 102 | 201 | 191 | 203 | 222 | 223 |
| WHM | 1,785 | — | 112 | 211 | 202 | 213 | 242 | 233 |
| THM | 1,540.5 | — | 81 | 190 | 191 | 225 | 139 | 233 |
| BLM | 1,785 | — | 91 | 201 | 202 | 245 | 149 | 243 |

### Highlander Hyur

| Job | HP | MP | STR | DEX | VIT | INT | MND | PIE |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| GLA | 2,073 | — | 194 | 181 | 216 | 99 | 191 | 158 |
| PLD | 2,533 | — | 205 | 191 | 236 | 119 | 202 | 168 |
| MRD | 2,158 | — | 205 | 181 | 216 | 58 | 101 | 77 |
| WAR | 2,618 | — | 215 | 191 | 236 | 78 | 111 | 87 |
| LNC | 1,899 | — | 227 | 191 | 204 | 78 | 121 | 138 |
| DRG | 2,129 | — | 247 | 202 | 214 | 88 | 131 | 148 |
| PGL | 1,654.5 | — | 217 | 202 | 193 | 88 | 171 | 118 |
| MNK | 1,899 | — | 237 | 212 | 204 | 99 | 181 | 128 |
| ARC | 1,569.5 | — | 174 | 224 | 193 | 159 | 151 | 158 |
| BRD | 1,814 | — | 184 | 244 | 204 | 169 | 161 | 168 |
| CON | 1,569.5 | — | 104 | 202 | 193 | 200 | 224 | 219 |
| WHM | 1,814 | — | 114 | 212 | 204 | 210 | 244 | 229 |
| THM | 1,569.5 | — | 83 | 191 | 193 | 222 | 141 | 229 |
| BLM | 1,814 | — | 93 | 202 | 204 | 242 | 151 | 239 |

### Wildwood Elezen

| Job | HP | MP | STR | DEX | VIT | INT | MND | PIE |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| GLA | 2,015 | — | 190 | 184 | 212 | 103 | 188 | 162 |
| PLD | 2,475 | — | 201 | 194 | 232 | 123 | 199 | 172 |
| MRD | 2,100 | — | 201 | 184 | 212 | 62 | 98 | 81 |
| WAR | 2,560 | — | 211 | 194 | 232 | 82 | 108 | 91 |
| LNC | 1,841 | — | 223 | 194 | 200 | 82 | 118 | 142 |
| DRG | 2,071 | — | 243 | 205 | 210 | 92 | 128 | 152 |
| PGL | 1,596.5 | — | 213 | 205 | 189 | 92 | 168 | 122 |
| MNK | 1,841 | — | 233 | 215 | 200 | 103 | 178 | 132 |
| ARC | 1,511.5 | — | 170 | 227 | 189 | 163 | 148 | 162 |
| BRD | 1,756 | — | 180 | 247 | 200 | 173 | 158 | 172 |
| CON | 1,511.5 | — | 100 | 205 | 189 | 204 | 221 | 223 |
| WHM | 1,756 | — | 110 | 215 | 200 | 214 | 241 | 243 |
| THM | 1,511.5 | — | 79 | 194 | 189 | 226 | 138 | 233 |
| BLM | 1,756 | — | 89 | 205 | 200 | 246 | 148 | 243 |

### Duskwight Elezen

| Job | HP | MP | STR | DEX | VIT | INT | MND | PIE |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| GLA | 2,029.5 | — | 191 | 181 | 213 | 104 | 191 | 159 |
| PLD | 2,489.5 | — | 202 | 191 | 233 | 124 | 202 | 169 |
| MRD | 2,114.5 | — | 202 | 181 | 213 | 63 | 101 | 78 |
| WAR | 2,574.5 | — | 212 | 191 | 233 | 83 | 111 | 88 |
| LNC | 1,855.5 | — | 224 | 191 | 201 | 83 | 121 | 139 |
| DRG | 2,085.5 | — | 244 | 202 | 211 | 93 | 131 | 149 |
| PGL | 1,611 | — | 214 | 202 | 190 | 93 | 171 | 119 |
| MNK | 1,855.5 | — | 234 | 212 | 201 | 104 | 181 | 129 |
| ARC | 1,526 | — | 171 | 224 | 190 | 164 | 151 | 159 |
| BRD | 1,770.5 | — | 181 | 244 | 201 | 174 | 161 | 169 |
| CON | 1,526 | — | 101 | 202 | 190 | 205 | 224 | 220 |
| WHM | 1,770.5 | — | 111 | 212 | 201 | 215 | 244 | 240 |
| THM | 1,526 | — | 80 | 191 | 190 | 227 | 141 | 230 |
| BLM | 1,770.5 | — | 90 | 202 | 201 | 247 | 151 | 240 |

### Seeker of the Sun Miqo'te

| Job | HP | MP | STR | DEX | VIT | INT | MND | PIE |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| GLA | 2,044 | 1,196 | 192 | 183 | 214 | 99 | 190 | 161 |
| PLD | 2,504 | 1,474 | 203 | 193 | 234 | 119 | 201 | 171 |
| MRD | 2,129 | 558 | 203 | 183 | 214 | 58 | 100 | 80 |
| WAR | 2,589 | 770 | 213 | 193 | 234 | 78 | 110 | 90 |
| LNC | 1,870 | 904 | 225 | 193 | 202 | 78 | 120 | 141 |
| DRG | 2,100 | 1,163 | 245 | 204 | 212 | 88 | 130 | 151 |
| PGL | 1,625.5 | 745 | 215 | 204 | 191 | 88 | 170 | 121 |
| MNK | 1,870 | 987 | 235 | 214 | 202 | 99 | 180 | 131 |
| ARC | 1,540.5 | 1,674 | 172 | 226 | 191 | 159 | 150 | 161 |
| BRD | 1,785 | 1,965 | 182 | 246 | 202 | 169 | 160 | 171 |
| CON | 1,540.5 | 3,210 | 102 | 204 | 191 | 200 | 223 | 222 |
| WHM | 1,785 | 3,508 | 112 | 214 | 202 | 210 | 243 | 242 |
| THM | 1,540.5 | 3,350 | 81 | 193 | 191 | 222 | 140 | 232 |
| BLM | 1,785 | 3,571 | 91 | 204 | 202 | 242 | 150 | 242 |

### Keeper of the Moon Miqo'te

| Job | HP | MP | STR | DEX | VIT | INT | MND | PIE |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| GLA | 2,000.5 | — | 189 | 182 | 211 | 100 | 194 | 163 |
| PLD | 2,460.5 | — | 200 | 192 | 231 | 120 | 205 | 173 |
| MRD | 2,085.5 | — | 200 | 182 | 211 | 59 | 104 | 82 |
| WAR | 2,545.5 | — | 210 | 192 | 231 | 79 | 114 | 92 |
| LNC | 1,826.5 | — | 222 | 192 | 199 | 79 | 124 | 143 |
| DRG | 2,056.5 | — | 242 | 203 | 209 | 89 | 134 | 153 |
| PGL | 1,582 | — | 212 | 203 | 188 | 89 | 174 | 123 |
| MNK | 1,826.5 | — | 232 | 213 | 199 | 100 | 184 | 133 |
| ARC | 1,497 | — | 169 | 225 | 188 | 160 | 154 | 163 |
| BRD | 1,741.5 | — | 179 | 245 | 199 | 170 | 164 | 173 |
| CON | 1,497 | — | 99 | 203 | 188 | 201 | 227 | 224 |
| WHM | 1,741.5 | — | 109 | 213 | 199 | 211 | 247 | 244 |
| THM | 1,497 | — | 78 | 192 | 188 | 223 | 144 | 234 |
| BLM | 1,741.5 | — | 88 | 203 | 199 | 243 | 154 | 244 |

### Plainsfolk Lalafell

| Job | HP | MP | STR | DEX | VIT | INT | MND | PIE |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| GLA | 2,015 | — | 189 | 183 | 212 | 102 | 191 | 162 |
| PLD | 2,475 | — | 200 | 193 | 232 | 122 | 202 | 172 |
| MRD | 2,100 | — | 200 | 183 | 212 | 61 | 101 | 81 |
| WAR | 2,560 | — | 210 | 193 | 232 | 81 | 111 | 91 |
| LNC | 1,841 | — | 222 | 193 | 200 | 81 | 121 | 142 |
| DRG | 2,071 | — | 242 | 204 | 210 | 91 | 131 | 152 |
| PGL | 1,596.5 | — | 212 | 204 | 189 | 91 | 171 | 122 |
| MNK | 1,841 | — | 232 | 214 | 200 | 102 | 181 | 132 |
| ARC | 1,511.5 | — | 169 | 226 | 189 | 162 | 151 | 162 |
| BRD | 1,756 | — | 179 | 246 | 200 | 172 | 161 | 172 |
| CON | 1,511.5 | — | 99 | 204 | 189 | 203 | 224 | 225 |
| WHM | 1,756 | — | 109 | 214 | 200 | 213 | 244 | 245 |
| THM | 1,511.5 | — | 78 | 193 | 189 | 225 | 141 | 235 |
| BLM | 1,756 | — | 88 | 204 | 200 | 245 | 151 | 245 |

### Dunesfolk Lalafell

| Job | HP | MP | STR | DEX | VIT | INT | MND | PIE |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| GLA | 2,000.5 | — | 188 | 181 | 211 | 102 | 193 | 164 |
| PLD | 2,460.5 | — | 199 | 191 | 231 | 122 | 204 | 174 |
| MRD | 2,085.5 | — | 199 | 181 | 211 | 61 | 103 | 83 |
| WAR | 2,545.5 | — | 209 | 191 | 231 | 81 | 113 | 93 |
| LNC | 1,826.5 | — | 221 | 191 | 199 | 81 | 123 | 144 |
| DRG | 2,056.5 | — | 241 | 202 | 209 | 91 | 133 | 154 |
| PGL | 1,582 | — | 211 | 202 | 188 | 91 | 173 | 124 |
| MNK | 1,826.5 | — | 231 | 212 | 199 | 102 | 183 | 134 |
| ARC | 1,497 | — | 168 | 224 | 188 | 162 | 153 | 164 |
| BRD | 1,741.5 | — | 178 | 244 | 199 | 172 | 163 | 174 |
| CON | 1,497 | — | 98 | 202 | 188 | 203 | 226 | 225 |
| WHM | 1,741.5 | — | 108 | 212 | 199 | 213 | 246 | 245 |
| THM | 1,497 | — | 77 | 191 | 188 | 225 | 143 | 235 |
| BLM | 1,741.5 | — | 87 | 202 | 199 | 245 | 153 | 245 |

### Sea Wolf Roegadyn

| Job | HP | MP | STR | DEX | VIT | INT | MND | PIE |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| GLA | 2,087.5 | — | 193 | 179 | 217 | 98 | 192 | 160 |
| PLD | 2,547.5 | — | 204 | 189 | 237 | 118 | 203 | 170 |
| MRD | 2,172.5 | — | 204 | 179 | 217 | 57 | 102 | 79 |
| WAR | 2,632.5 | — | 214 | 189 | 237 | 77 | 112 | 89 |
| LNC | 1,913.5 | — | 226 | 189 | 205 | 77 | 122 | 140 |
| DRG | 2,143.5 | — | 246 | 200 | 215 | 87 | 132 | 150 |
| PGL | 1,669 | — | 216 | 200 | 194 | 87 | 172 | 120 |
| MNK | 1,913.5 | — | 236 | 210 | 205 | 98 | 182 | 130 |
| ARC | 1,584 | — | 173 | 222 | 194 | 158 | 152 | 160 |
| BRD | 1,828.5 | — | 183 | 242 | 205 | 168 | 162 | 170 |
| CON | 1,584 | — | 103 | 200 | 194 | 199 | 225 | 221 |
| WHM | 1,828.5 | — | 113 | 210 | 205 | 209 | 245 | 241 |
| THM | 1,584 | — | 82 | 189 | 194 | 221 | 142 | 231 |
| BLM | 1,828.5 | — | 92 | 200 | 205 | 241 | 152 | 241 |

### Hellsguard Roegadyn

| Job | HP | MP | STR | DEX | VIT | INT | MND | PIE |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| GLA | 2,058.5 | 1,196 | 191 | 178 | 215 | 101 | 193 | 161 |
| PLD | 2,518.5 | 1,474 | 202 | 188 | 235 | 121 | 204 | 171 |
| MRD | 2,143.5 | 558 | 202 | 178 | 215 | 60 | 103 | 80 |
| WAR | 2,603.5 | 770 | 212 | 188 | 235 | 80 | 113 | 90 |
| LNC | 1,884.5 | 904 | 224 | 188 | 203 | 80 | 123 | 141 |
| DRG | 2,114.5 | 1,163 | 244 | 199 | 213 | 90 | 133 | 151 |
| PGL | 1,640 | 745 | 214 | 199 | 192 | 90 | 173 | 121 |
| MNK | 1,884.5 | 987 | 234 | 209 | 203 | 101 | 183 | 131 |
| ARC | 1,555 | 1,674 | 171 | 221 | 192 | 161 | 153 | 161 |
| BRD | 1,799.5 | 1,965 | 181 | 241 | 203 | 171 | 163 | 171 |
| CON | 1,555 | 3,210 | 101 | 199 | 192 | 202 | 226 | 222 |
| WHM | 1,799.5 | 3,508 | 111 | 209 | 203 | 212 | 246 | 242 |
| THM | 1,555 | 3,350 | 80 | 188 | 192 | 224 | 143 | 232 |
| BLM | 1,799.5 | 3,571 | 90 | 199 | 203 | 244 | 153 | 242 |

## Block and Parry tier table

Source: [Valk's archived Block and Parry page (6 August 2013)](https://web.archive.org/web/20130806141046/http://valk.dancing-mad.com/?page_id=227), including its [image-only table](https://i.imgur.com/e6R5rvB.png). This is an **ARR beta / early ARR** reference, not a 1.0 mechanic.

The source says Block and Parry operate in STR thresholds (tiers). Meeting or exceeding the STR in the left column activates that row. `Parry` and the Shield Block columns are the percentage of damage reduced **when that event occurs**, not the chance to parry/block. Shield Block is described as linear and supposedly rounded to the nearest whole number in-game; the displayed decimals are retained to show rounding error. The author rates the table as an expected result within **±1 percentage point**, rather than an exact in-game result.

| STR tier begins at | Parry reduction | Shield Block 0 | 50 | 100 | 150 | 200 | 250 | 300 | 350 |
| ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| 243 | 11% | 5% | 7.29% | 10.21% | 13.12% | 16.04% | 18.95% | 21.87% | 24.78% |
| 270 | 11% | 6% | 8.29% | 11.21% | 14.12% | 17.04% | 19.95% | 22.87% | 25.78% |
| 283 | 12% | 6% | 8.29% | 11.21% | 14.12% | 17.04% | 19.95% | 22.87% | 25.78% |
| 324 | 13% | 6% | 8.29% | 11.21% | 14.12% | 17.04% | 19.95% | 22.87% | 25.78% |
| 337 | 13% | 7% | 9.29% | 12.21% | 15.12% | 18.04% | 20.95% | 23.87% | 26.78% |
| 363 | 14% | 7% | 9.29% | 12.21% | 15.12% | 18.04% | 20.95% | 23.87% | 26.78% |
| 404 | 14% | 8% | 10.29% | 13.21% | 16.12% | 19.04% | 21.95% | 24.87% | 27.78% |
| 405 | 15% | 8% | 10.29% | 13.21% | 16.12% | 19.04% | 21.95% | 24.87% | 27.78% |
| 444 | 16% | 8% | 10.29% | 13.21% | 16.12% | 19.04% | 21.95% | 24.87% | 27.78% |
| 471 | 16% | 9% | 11.29% | 14.21% | 17.12% | 20.04% | 22.95% | 25.87% | 28.78% |

For example, the source explicitly explains that `270 STR / 200 Shield Block` reduces the same amount as `336 STR / 200 Shield Block`; `337 STR / 200 Shield Block` is one block-reduction percentage point higher. Credit in the original page is given to Khagen Dragnir for much of the source data.

## Methodology, raw tests, and provisional equations

Source: [Valk's archived Methodology page (6 August 2013)](https://web.archive.org/web/20130806141039/http://valk.dancing-mad.com/?page_id=179). This is **ARR beta / early ARR research**, not evidence for the 1.0-era server mechanics in this repository. The author explicitly describes these as experimentally fitted working equations, rather than the game's exact internal formulae. Where the source calls a result approximate, incomplete, or unverified, that status is retained below.

### Test protocol and randomness

- Most level-50 damage testing used Water Sprites. A variable was changed while the others were held fixed, repeated samples were averaged, and the result was checked with linear-regression plots. The sample methodology image and underlying data/graph images are preserved in the manifest below.
- Direct-damage and incoming-damage rolls were observed in a uniform-looking **±5%** band around the average (`min = average × 0.95`, `max = average × 1.05`). The page contrasts this with the author's earlier 1.20 observation of ±8%.
- Healing rolls were observed in a **±3%** band (`min = average × 0.97`, `max = average × 1.03`).

### Level-50 physical damage (Dragoon working fit)

Observed directly relevant statistics were Weapon Damage (`WD`), Strength (`STR`), and Determination (`DTR`); the source reports no independent direct-damage effect from DEX, VIT, INT, MND, or PIE in those tests. One stated regression example (weathered spear; `DTR = 202`; `STR = 270–350`) was `y = 0.1018x + 6.8066`, `R² = 0.9961`.

The preliminary base term was:

```text
base = (0.0032 × STR + 0.4162) × WD + (0.1001 × STR − 0.3529)
```

The final working level-50 Dragoon equations use `0.1 × STR` in the additive term, apply separate Determination scaling to auto-attacks and weaponskills, and include the *expected-value* critical term:

```text
critRatePercent = 0.0693 × CRT − 18.486

AA = (WAA / WD) × [
       (0.0032 × STR + 0.4162) × WD
       + (0.1 × STR − 0.3529)
       + (DTR − 202) × 0.11
     ] × (1 + 0.5 × critRatePercent / 100)

WS = (Potency / 100) × [
       (0.0032 × STR + 0.4162) × WD
       + (0.1 × STR − 0.3529)
       + (DTR − 202) × 0.035
     ] × (1 + 0.5 × critRatePercent / 100)
```

`WAA` is the weapon's auto-attack value and `Potency` is the action potency. The page reports a 150% critical-damage multiplier and notes the fit can be systematically off by roughly one or two damage points. Do not generalize this job/level/era-specific fit to other eras without validation.

### Damage taken, defense, and effective health

- The tests found no VIT-dependent change in incoming damage for the compared cases (PLD at 261 VIT versus GLA at 241 VIT).
- Reported linear reductions were approximately **0.044% per PDEF** for physical damage and **0.0445% per MDEF** for magical damage. The source's displayed shorthand, `1 − (0.044 × DEF)`, treats `0.044` as a percentage-point quantity; as a decimal multiplier that is approximately `1 − 0.00044 × DEF`.
- The author says the result appeared independent of enemy level in the available tests. Elemental-resistance data were expressly marked incomplete and likely inaccurate at the highest potion values; it suggested better returns than MDEF for the single corresponding element only.
- The given effective-health relationship is `EHP = HP × 100 / (100 − reductionPercent)`. The page also gives a VIT-comparison form using `BaseHP + 15 × ΔVIT`, with illustrative level-50 values PLD `2400 HP / 245 VIT` and WAR `2465 HP / 245 VIT`.

### Blocking and parrying (provisional)

The source cites the beta manual's claimed relationships: STR plus Shield Block controls block mitigation; DEX plus Block Rate controls block chance; STR controls parry mitigation; and DEX plus Parry controls parry chance. Its observations and caveats are:

- Blocks and parries were observed on physical damage only. Magic blocks were not observed. Direction may matter for blocks, but was not settled.
- Block rate was estimated near a 5% baseline; a 188-DEX/high-Block-Rate case reached roughly 14–15%, with 18–20% expected only for high DEX/high-end shields. Block mitigation appeared to floor around 4–5%.
- At 337 STR, the stated linear Shield Block fit was `blockReduction ≈ 0.000583 × ShieldBlock + 0.063779` (fractional reduction). Reported STR thresholds were 270, 337, and 404, spaced by 67.
- Parry mitigation appeared to have a 10% floor. Listed STR thresholds were 243, 283, 324, 364, and 405; the next two were projected, not measured, as 445 and 486. The author expected a practical ceiling below 16%.
- Whether a simultaneous block/parry situation is mutually exclusive and which event takes precedence was not verified. The source's takeaway is an approximate 23–24% block reduction at 420 STR with about 275 Shield Block, with an explicit ±1 percentage-point caution.

### Level-50 healing working fits

`Pot` is cure potency, `MD` is Magic Damage, `MND` is Mind, and `DTR` is Determination. The source says the following working equations predict average healing by more than 99% over its tested ranges (`MND 272–390`, `DTR 202–280`, `MD 7–65`):

```text
THM average heal = (Pot / 300) × [
  MD × (0.01156 × MND + 0.001314 × DTR + 0.3736)
  + 0.2229 × MND + 0.06071 × DTR + 1.7786
]

WHM average heal = (Pot / 300) × [
  MD × (0.0114 × MND + 0.00145 × DTR + 0.3736)
  + 0.21 × MND + 0.11 × DTR + 0.00011316 × MND × DTR
]
```

The page presents another incomplete alternative WHM expression while discussing a possible `MND × DTR` interaction; it should not be treated as a usable equation. These early fits can differ from the calculator equations captured earlier in this document.

### Enmity observations

- The page's tested relationship is **1 damage = 2 enmity** and **1 HP healed = 1 enmity**—equivalently, healing creates half the enmity of the same amount of damage.
- At equal enmity, the actor who was already first stays first; in the cited example, 60 damage tied but 61 took aggro.
- Healing and buff enmity appeared to be divided across engaged enemies, but the source marks the exact distribution uncertain.
- Actions that apply a buff icon appeared to add a universal 70 damage-equivalent enmity, then receive Shield Oath/Defiance modifiers and multi-enemy division. This is an observation, not a confirmed universal rule.
- Enmity multipliers were observed to stack multiplicatively. Elusive Jump reduced the accumulated total by 50% in testing through 2,000 enmity; no cap was found.
- Flash's available test put it near 495 damage-equivalent enmity for WAR with Moogle Axe (`WD 41`), `STR 353`, and `DTR 238`. The author treats the apparent distribution/nonlinearity report as unconfirmed.

### Image-backed raw evidence manifest

The original page stores much of its numeric evidence as Imgur images. The following source-order manifest preserves every linked chart/table/sample image present in the archived HTML. These links are evidence assets, not independently reprocessed datasets.

| Order | Evidence asset | Topic in source order |
| ---: | --- | --- |
| 1 | [NvSoBIX](https://i.imgur.com/NvSoBIX.png) | Sample collection spreadsheet |
| 2 | [WmtkHjq](https://i.imgur.com/WmtkHjq.png) | Example STR/damage graph |
| 3 | [NytSNgu](https://i.imgur.com/NytSNgu.png) | Weapon Damage slope comparison |
| 4 | [oIl6AQj](https://i.imgur.com/oIl6AQj.png) | STR effect on WD slope |
| 5 | [NytSNgu](https://i.imgur.com/NytSNgu.png) | Reused WD-slope graph |
| 6 | [WA937Ka](https://i.imgur.com/WA937Ka.png) | STR/intercept graph |
| 7 | [vVkDYJe](https://i.imgur.com/vVkDYJe.png) | Determination correction graph |
| 8 | [PDm6MUl](https://i.imgur.com/PDm6MUl.png) | Auto-attack versus weaponskill comparison |
| 9 | [he01K2D](https://i.imgur.com/he01K2D.png) | Critical-rate data/plot |
| 10 | [gOBkahM](https://i.imgur.com/gOBkahM.png) | Integrated critical data |
| 11 | [73TRQJg](https://i.imgur.com/73TRQJg.png) | MDEF test table and graphs |
| 12 | [9n001U1](https://i.imgur.com/9n001U1.png) | Level-28 MDEF comparison |
| 13 | [vopdqJA](https://i.imgur.com/vopdqJA.png) | PDEF/VIT test |
| 14 | [n95QdGC](https://i.imgur.com/n95QdGC.png) | Independent PDEF test |
| 15 | [SWRgGd7](https://i.imgur.com/SWRgGd7.png) | Defense reduction table |
| 16 | [HPO2rKw](https://i.imgur.com/HPO2rKw.png) | Elemental resistance data |
| 17 | [cumXYwU](https://i.imgur.com/cumXYwU.png) | Elemental-resistance graph |
| 18 | [GYTt0AO](https://i.imgur.com/GYTt0AO.png) | Raw block data |
| 19 | [cRhjrCw](https://i.imgur.com/cRhjrCw.png) | Block mitigation table |
| 20 | [We8VtP9](https://i.imgur.com/We8VtP9.png) | Shield Block mitigation graph |
| 21 | [VxH4LdD](https://i.imgur.com/VxH4LdD.png) | Parry mitigation graph |
| 22 | [U8Qrfgw](https://i.imgur.com/U8Qrfgw.png) | Block/parry STR threshold table |
| 23 | [PlGF63Y](https://i.imgur.com/PlGF63Y.png) | Healing test data |
| 24 | [XhuHpcb](https://i.imgur.com/XhuHpcb.png) | Healing WD/MD comparison |
| 25 | [YkzXVwq](https://i.imgur.com/YkzXVwq.png) | Healing MND graph |
| 26 | [tNFxcpq](https://i.imgur.com/tNFxcpq.png) | Healing MND-slope graph |
| 27 | [YkzXVwq](https://i.imgur.com/YkzXVwq.png) | Reused healing MND graph |
| 28 | [aVn9DW7](https://i.imgur.com/aVn9DW7.png) | Healing intercept graph |
| 29 | [N30NCZW](https://i.imgur.com/N30NCZW.png) | Healing DTR/MD graphs |
| 30 | [cTcptuM](https://i.imgur.com/cTcptuM.png) | Healing DTR-rate graph |
| 31 | [aYE1ft1](https://i.imgur.com/aYE1ft1.png) | WHM MND×DTR evidence |
| 32 | [f6505y8](https://i.imgur.com/f6505y8.png) | THM comparison graph |
| 33 | [eQpyYEC](https://i.imgur.com/eQpyYEC.png) | Healing-formula accuracy plot |
| 34 | [mcccXxN](https://i.imgur.com/mcccXxN.png) | Enmity multiplier table |
| 35 | [kQcJbQI](https://i.imgur.com/kQcJbQI.png) | Enmity action evidence |
| 36 | [eojz7cF](https://i.imgur.com/eojz7cF.png) | Enmity supplementary evidence |
