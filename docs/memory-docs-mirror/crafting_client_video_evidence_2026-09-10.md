# Crafting client and video evidence

Target: installed 1.23b client. Research date: 2026-09-10.
Supplement to `crafting_retail_reconstruction.md`. Observations, native wire
decoding, and authored reconstruction choices are distinguished below.

## Directly inspected footage

[FFXIV Crafting, Jason Jones](https://www.youtube.com/watch?v=RvokR8yT-yg),
3:02 long. The description refers to recording before 2.0; the ability set
identifies post-1.22 crafting. Exact recording date is not established.
Frames were inspected directly in the browser, checking the player time.
Timestamps identify the displayed frame/log; log entries can precede the frame.

Xylia Magi, level 50 Goldsmith, makes an electrum ring from one HQ electrum
ingot, six wind shards, and six fire shards. Cream cheese and other status
icons are visible; equipment stats and total EXP modifiers are unknown.

| Frame | Progress | Durability | Quality | HQ % | Visible log observation |
| --- | ---: | ---: | ---: | ---: | --- |
| 0:00 | 0 | 100 | 500 | 7 | Initial values after HQ ingredient consumption |
| 1:13 | 8 | 105 | 579 | 14 | Manipulation restores 20; two Careful actions cost 8/7, gain 20/59 quality |
| 1:31 | 16 | 87 | 616 | 20 | Failed Careful actions each add 4 progress, cost 9, gain 22/15 quality; Culmination activated |
| 1:49 | 45 | 62 | 702 | 39 | Culmination Careful adds 4 progress/41 quality, costs 7; ordinary Careful adds 4/21, costs 9; great Standard adds 21/24, costs 9 |
| 2:05 | 65 | 33 | 758 | 55 | Failed Standard adds 11 progress, costs 12, no quality; Careful adds 4/34 and 5/22, costs 9/8 |
| 2:11 | 69 | 24 | 779 | 62 | Ordinary Careful adds 4/21, costs 9 |
| 2:26 | 73 | 14 | 788 | 65 | Failed Careful adds 4/9, costs 10; Comfort Zone activated |
| 2:44 | 84 | 14 | 834 | 74 | Three Careful actions add 3/16, 4/12, 4/18 with no durability loss; Comfort Zone expires |
| 2:54 | 88 | 5 | 851 | 78 | Careful adds 4/17, costs 9; By the Book selected |
| 2:59 | 100 | — | 851 | — | By the Book adds remaining 12 progress; HQ ring; 280% quality bonus; 1746 EXP displayed |

Durability can exceed 100: Manipulation takes it to 120 before spending 15.
Standard failure retains partial progress; one observation does not prove the
failure fraction, so 0.5 remains a fallback. Careful progress/durability vary.
WorldMaster 40108 distinguishes ordinary success (blank suffix), great success
(`succeeds!`), and failure with switch values 1/2/3.

Quality delta 351 predicts the observed 280% bonus under the complete-tens
rule. Durability is not an input to that rule. Unknown additional EXP modifiers
prevent deriving a recipe rank from the displayed total. The HQ curve now
passes through these HUD pairs; interpolation and full stat formulas remain
reconstructions. The supplied video `kbFHBCP7oXE` is botany and was excluded.

The Careful base-quality preset was reduced toward the footage's approximate
20-25 white-equivalent range, with a doubled great result. Standard's great
base is calibrated separately and no longer receives a second generic 1.25
multiplier. These are magnitude estimates, not a statistical fit: unknown
equipment and small sample size do not establish the stat coefficients.

## Native presentation contract

Executable SHA256:
`9341f2b4567440b310a4d494f5cc5599ca334ba51c8042247317ff466492f2e9`.

Tools: `build_crafting_client_evidence.py` inventories the installed client;
`decompile_crafting_client.ps1` reads the existing Ghidra project;
`inspect_crafting_native.py` supplies hash-checked x86 probes.
Outputs: `outputs/crafting-client-evidence-20260910/`.
Inventory: 875 files, 1453 schedulers, 7884 clips, 864 motion headers, zero parse
failures. These tools read the client; they do not patch it.

### Motions and timing

Craft category 16 resolves each bank against the actor's class/tool directory:
`alc_alc`, `arm_arm`, `blk_blk`, `cok_cok`, `gld_gld`, `lth_lth`, `sew_sew`,
`wod_wod`. ID layout: category bits 24-31, motion bank bits 12-23, effect bank
bits 0-11.

| Motion | Main bank | Off-hand bank | Native duration at 30 fps |
| --- | ---: | ---: | --- |
| Rapid | 1 | 4 | 150 frames |
| Standard | 2 | 5 | 150 frames |
| Careful | 3 | 6 | 150 frames |
| Ability B | 9 | 10 | 80 frames |
| Completion joy | 101 | 101 | 135 frames |
| Completion upset | 102 | 102 | 240 frames |

Runtime corrects off-hand banks, normalizes recipe menu IDs to tool modes, and
uses `craftCommandUI` mode 5/6 because Wait is supplied separately. Ability B
retains effect bank 2. Joy/upset and completion effects follow resolution.
Clip duration does not prove retail UI unlock timing: basic actions still
resolve after three seconds; ability/completion waits use full clip durations
as authored choices. All class/character combinations need in-game validation.

### Persistent material and element state

`native-craft-orb-state.txt`, 0x65ffb0 and 0x65ac70:

- `(packed >> 14) & 3` selects IDs 902-905.
- `(packed >> 12) & 3` selects 900 (clear) or 906-908.
- `(packed >> 8) & 15` selects 900 (clear) or 909-924.
- Actor fields +0x117c/+0x1180/+0x1184 and dirty bits are updated.

Input is the first uint of opcode 0x144, queued via 0x7bf270, applied via
0x7bb740. Byte 1 is the server's `SubState.chantId`. Native resolver 0x7987f0
uses the table at 0xfe4498; its 900-based entry points at 0x12c4658:

| IDs | Names |
| --- | --- |
| 902-905 | `cft_base`, `cft_base_md`, `cft_base_lg`, `cft_base_ch` |
| 906-908 | `gkrs_md`, `gkrs_bg`, `gkrs_gg` |
| 909-914 | `gkab_fire`, `gkab_ice`, `gkab_wind`, `gkab_eart`, `gkab_thun`, `gkab_wate` |

**Material variants 0/1/2/3 mapped to white/yellow/red/prismatic are still a
candidate reconstruction.** Names alone do not prove colors; the secondary
group could also matter and is left neutral. Do not claim successful visual
synchronization until the actual colors and transitions are tested in-game.

Runtime persists/publishes the byte, preserves other substate fields, and
commits queued state with the existing neutral action result, including Wait.
It clears the crafting byte and returns to selection stance on normal exits.
Exact historical publish/commit cadence remains unverified.

Additional native tracing (`native-craft-material-dispatch.txt`) establishes
that 0x65ad20 consumes the three dirty actor fields. It packs category 127,
motion 0, and the selected effect ID via 0x798330, then queues request types
22/23/24 via 0x846080. Thus these are independent material, spark and element
scheduler requests. Resolver 0x7987f0's 900-based table has format flag zero:
the `cft_base`/`gkrs`/`gkab` names are passed unchanged. The branch replacing a
name's first character with `2` belongs to the 1200-based table, not crafting.
0x798470 routes categories >=111 through the already-loaded scheduler's
name-based entry point. This explains why decoding ordinary category-16
motion files alone cannot establish their appearance. The packed resident banks
have since been located (see "Packed resident orb assets" below); their runtime
selection and rendered material colors remain unresolved.

`decompile_crafting_client.ps1 -Scalars` now exposes the existing read-only
scalar-reference script. Its results only cover Ghidra's defined instructions;
the 0x65ad20 consumer was recovered separately from executable byte probes.

### Transient results

`native-craft-effect-routing.txt`, 0x7a1810, decodes crafting effect type 12
(`0x60000000`) from `CommandResult.effectId`:

- bits 8-13: 1=`gkra_succ`, 2=`gkra_grea`, 3=`gkra_faul`.
- bits 5-7 equal 1, low five bits: 1=`gkac_nq`, 2=`gkac_hq1`, 5=`gkac_cf`.

These are encoded separately from combat hit flags. Other native variants
exist but are not guessed into ability outcomes.

## Abilities and recovered recipe ranks

All 52 synthesis descriptions in `docs/Dat Mining/xtx_command.csv` (English
column 24) were checked against the runtime duration/percentage branches.
Corrections: Bold Endeavor and Ingenuity's treatment of easier recipes. Direct
gain/restoration magnitudes are generally not supplied numerically there.

[Square Enix's Bold Endeavor correction](https://forum.square-enix.com/ffxiv/threads/44999-Vortex-Totems-and-Headdresses?goto=nextnewest)
acknowledges the three-great-success description as a copy/paste error. The
correct effect guarantees one successful step. This later clarification and
the client text supersede the initial 1.22 notes. Natural great success remains
possible. [1.22 notes](https://forum.square-enix.com/ffxiv/threads/43599) specify
up to five equipped abilities, randomly selected if more are equipped. Empty
slots no longer receive learned but unequipped commands automatically.

Recovered ranks match output/quantities/class/crystals/ingredient multiset and
the old lower anchor; corrected database ranks take precedence:

| Catalog ID | Version | Rank | Evidence |
| ---: | --- | ---: | --- |
| 4284 | Dated Velveteen Shirt Front | 46 | [January 2012 report](https://forum.square-enix.com/ffxiv/printthread.php?pp=10&t=34807), corroborated by 2011 guide |
| 3446 | Dated Cotton Shirt Back | 25 | [2011 Weaver guide](https://forum.square-enix.com/ffxiv/threads/3882?page=2), matching retained recipe |
| 3604 | Dated Undyed Canvas | 29 | Same guide, matching retained recipe |

The latter two assume retained dated ranks did not subsequently change.
Current Linen Yarn/Undyed Linen/Velveteen Tights have different recipes and
cannot inherit the guide's old ranks. The overlay applies before difficulty
and EXP read the recipe, preserving tiers and the database. Other ranks retain
their lower-band fallback; this is not full recipe-rank recovery.

## Quality attributes (follow-up)

[Bayohne's October 26, 2011 explanation, post 56](https://forum.square-enix.com/ffxiv/threads/26648-Stats-And-You%21?p=415358&viewfull=1)
explicitly maps each tool to its quality attribute. The same mapping appears
in April and August 2012 discussions. Runtime now snapshots the appropriate
current attribute through `GetMod`, including equipment/status contributions:

| Class | Main hand | Off hand |
| --- | --- | --- |
| Carpenter | VIT | DEX |
| Blacksmith | STR | MND |
| Armorer | VIT | STR |
| Goldsmith | DEX | INT |
| Leatherworker | VIT | INT |
| Weaver | DEX | MND |
| Alchemist | INT | PIE |
| Culinarian | MND | PIE |

It boosts ordinary and direct quality gains, so it can increase earned-quality
EXP and final HQ odds. It does not directly multiply progress, durability or
EXP. Initial material quality stays separate. Clean Slate retains the same
stat snapshot; repeated local-leve attempts take a new snapshot for the same
selected tool.

The coefficient remains authored: `1 + attribute * 0.001`. A
[June–July 2012 testing discussion](https://forum.square-enix.com/ffxiv/threads/48420-Questions-Regarding-Synthesis-Gathering-Stats?p=737305&viewfull=1)
disputes a universal 0.1% slope and suggests dependence on craftsmanship and
recipe difficulty. We implement the confirmed direction/tool mapping with a
conservative estimate, not a claim of recovering that dependence.

An expanded read-only asset search found no literal `cft_base`, `gkrs`, or
`gkab` resource IDs in 844 VFX/c001-idle candidates, 8063 weapon/c001 candidates,
three shared/c999 candidates, or 3885 monster/background-object candidates.
Some models have declared-size mismatches and sound files are not PWIB resource
containers, so this is not proof that those effects are absent. The candidate
orb-color mapping still requires either a verified asset path or live rendering.

## Heavy darksteel armor capture

[Leonesaurus: Final Fantasy XIV 1.0 - Crafting Heavy Darksteel Armor](https://www.youtube.com/watch?v=vnvVgchnqZA)
is a second, 4:35 retail recording, inspected directly in the browser. The
character is a level-50 Armorer using the main hand. Times below are approximate
seek positions; log entries can describe actions shortly before the frame.

| Time | Progress | Durability | Quality | HQ | Evidence |
|---|---:|---:|---:|---:|---|
| 0:55 | 0 | 100 | 343 | 1% | One NQ flawless darksteel breastplate, one HQ rose gold nugget, two HQ darksteel plates, one HQ silver ingot; one earth and one ice cluster. |
| 1:22 | 18 | 67 | 455 | 4% | Careful failure +4 progress/-9 durability/+17 quality; subsequent ordinary attempts +5/-8/+31 and +5/-8/+29. |
| 1:50 | 51 | 83 | 467 | 4% | Piece by Piece +30 progress; Manipulation +20 durability; Meticulous Mind; Careful failure +3/-4/+12; earth becomes unstable. |
| 2:17 | 85 | 71 | 526 | 8% | By the Book +30 progress; unstable Careful ordinary +2/-4/+23 and great +2/-8/+36. |
| 2:45 | 93 | 26 | 584 | 15% | Two chaotic-element outcomes in the recent log. The latest charges 10 durability, gives no progress/quality, then stabilizes earth. An intervening Careful failure gains +4/-9/+8 and destabilizes earth again. |
| 2:59 | 100 | 8 | 610 | — | Final two failures gain +5/-9/+12 and +2/-9/+14. HUD already displays 10% associated with the upcoming Double Down assessment. |
| 3:04 | complete | — | — | — | Finish / Double Down menu, 10% Double Down odds. |
| 3:09 | complete | — | — | — | Finish chosen, NQ result; displayed quality bonus 208%; 2357 EXP (+53%). |

The two direct progress abilities each produce an unclipped 30-point gain despite
different progress states; By the Book also ignores the active instability.
This supports replacing their stat-derived fallback with 30 points. Normal
Careful's 2-point gains in this clip occur under instability, so they do not
contradict the ordinary 3–5 range.

The HQ HUD adds observed anchors (343,1), (455,4), (467,4), (526,8), (584,15).
Interpolation remains an approximation. The 10% Double Down display is not an
ordinary HQ anchor: the original assessment has already run. Equipment and
rounding are not established. This clip does not show failed Double Down EXP.

Chaotic outcomes are directly observed, and `docs/Dat Mining/worldMaster.csv`
row 40108 confirms switch value 4. Native type-12 step selector 4 is `gkra_fafa`.
Runtime now implements the observed zero progress/quality and element recovery,
preserving accumulated quality per official 1.21. A 25% trigger on a failed
unstable synthesis is an authored fallback, not a measured rate; guarantees
prevent it because the model only triggers it on failure. Other-action costs
follow their ordinary failure rules, generalizing the observed Careful behavior.
Control reduces onset chance with `12 / (1 + control * 0.005)` and chaotic
chance on an unstable failed action with `25 / (1 + control * 0.005)`.
[Official 1.22b notes](https://forum.square-enix.com/ffxiv/threads/47128), dev1434,
explicitly say increased Control reduces unstable and chaotic rates. Both
numeric curves remain authored, as the notes publish no coefficients.
The retained three-step recovery timer
remains a fallback requiring further duration evidence.

The final quality is shown as 610 and matches 584+12+14. Subtracting initial quality 343
gives 267 earned quality, matching floor(267/10)*8=208% exactly. With the displayed
53% other bonus, base 500 produces 1540 quality-adjusted EXP plus ceil(1540*0.53)
=2357. This infers recipe rank 55 from the reconstructed base-EXP table at player
rank 50; the rank itself is not displayed. The exact ingredient fingerprint
matches catalog recipe 1171, whose stored band anchor is 51. Only that ingredient
version receives the inferred rank; dyed variants do not inherit it.

## Steel hatchet comparison capture

[Lirion: FFXIV 1.0 vs ARR (2.0), Crafting](https://www.youtube.com/watch?v=CEVOCgSoOAs)
contains a separate late-1.x craft before its 1:50 switch to ARR. Only the legacy
segment is used. The visible crafter is Blacksmith level 35, using the main hand.

| Time | Observation |
|---|---|
| 0:30 | Consumes six fire shards, three earth shards, one NQ walnut lumber and one NQ steel ingot. |
| 0:35–0:40 | First ordinary Standard Synthesis +19 progress, -9 durability, +10 quality; HUD 19/91/10, HQ 0%. |
| 1:40 | HUD 98 progress, 21 durability, 175 quality, HQ 0%. Recent white Careful failure +4/-9/+14; great Careful +3/-8/+44. |
| 1:45 | Final Careful failure +2 progress (clipped), -8 durability, +10 quality. HUD 100/13/185, HQ 0%. |
| ~1:46 | NQ Steel Hatchet; 144% quality bonus; 1281 EXP (+50%). Experience bar moves 48398 to 49679, independently confirming the 1281 total. |

Initial quality 0 follows from the first +10 gain and quality-10 HUD. The final
185 earned quality predicts 144%. Base EXP 350 yields floor(350*2.44)=854,
then +50% gives 1281, inferring recipe rank 37 at player rank 35. The exact
ingredient/crystal fingerprint matches catalog recipe 648, stored anchor 31.
The overlay is restricted to this version and class. As with the armor, the
rank is inferred from EXP rather than read from a recipe-level display.

The ordinary Standard base-quality fallback is now `8 + floor(control/60)`,
before primary attribute, orb and diminishing modifiers, to accommodate the
observed 10-point magnitude. Gear is unknown, so this is not a recovered fit.
The zero HQ chance means this capture provides no failed Double Down evidence.

## Hamlet Defense exception

The [1.22b notes](https://forum.square-enix.com/ffxiv/threads/47128) explicitly
retain Hamlet Defense background music while synthesizing. `changeCraftingMusic`
now checks the player's existing Hamlet director (`HasStarted`/`HasEnded`) on
both craft entry and menu exit. Active battles keep their music; no director,
not-started directors and ended battles retain the normal crafting/area music
behavior. Focused tests cover these branches. This does not establish full
Hamlet recipe or reward fidelity.

## Period ability observations and expiry messages

[July 30, 2012 firsthand accounts](https://www.ffxivpro.com/forum/topic/32239/tips-for-hq-crafting/)
report Master's Mend restoring 30 durability, replacing the previous +40 fallback.
They describe Byregot followed by Perfection and one Careful action leaving two
Byregot turns, corroborating that ability activation does not tick other buffs.
Culmination with Rapid reportedly yields 25-40 progress depending on difficulty.
The Rapid ceiling is now 40; extending this to ordinary Rapid and retaining the
existing stat formula are reconstruction choices, not established by that account.

The native WorldMaster table supplies message 40127 for an ability fading.
Synthesis, Wait, replacement and Clean Slate now report expired effects once
per ability, even when the ability owns multiple internal buff entries. Tests
cover independent durations, one-message expiry, and durability above 100.
Same-family stacking/overwrite precedence remains unverified.

The 1.22 ability list and native tooltip for Elemental Appeal specify prevention
of both onset and worsening. The chaotic-failure branch now respects its active
protection, including the third covered step. Tests distinguish Aspect Balance,
which only maintains white glow, and verify that chaos can recur after expiry.
WorldMaster 40133 now reports missing activation conditions for High Return,
Improvise and Magnum Opus. Existing once-per-synthesis consumption is retained;
the native message alone does not establish whether retail consumed such uses.
Hasty Hand failure now selects WorldMaster 40108's failed-attempt suffix.

The [September 2012 Rose Gold discussion](https://forum.square-enix.com/ffxiv/threads/54053/?page=2)
also corroborates Byregot/Perfection duration handling. Its posters disagree
about whether Careful can cost over 10 durability on difficult recipes or only
chaotic failures; this does not justify replacing the directly observed range
with a newly claimed exact rule. High-level durability costs remain unresolved.

## Named HQ component results

The high-difficulty recipe tables in [1.22](https://forum.square-enix.com/ffxiv/threads/43599-patch1.22-Patch-1.22-Notes/page2)
and [1.22a](https://forum.square-enix.com/ffxiv/threads/45067) explicitly name
separate Flawless HQ components. `xtx_itemName.csv` supplies their distinct IDs,
and the recipe catalog requires those IDs for the final gear. Previously,
`AddCraftedItem` awarded quality 2 of the NQ component ID, leaving those chains
unreachable through synthesis. `Recipe.GetResultItemId/GetResultQuality` now
resolve the assessment consistently for inventory-space checks, awards and logs.

| Component | NQ ID | Flawless ID |
| --- | ---: | ---: |
| Mailbreaker Blade | 10011178 | 10011159 |
| Avenger Grips | 10011179 | 10011160 |
| Rampager Head | 10011180 | 10011161 |
| Obelisk Head | 10011181 | 10011162 |
| Sarnga Limb | 10011182 | 10011163 |
| Suspended Trillium Flower | 10011183 | 10011164 |
| Astrolabe Clinometer | 10011184 | 10011165 |
| Vanya Silk Hat Lining | 10011185 | 10011166 |
| Vanya Silk Robe Lining | 10011186 | 10011167 |
| Vanya Silk Glove Lining | 10011187 | 10011168 |
| Vanya Silk Crakow Lining | 10011188 | 10011169 |
| Gryphonskin Shoulder Guards | 10011189 | 10011170 |
| Gryphonskin Shin Guards | 10011190 | 10011171 |
| Gryphonskin Elbow Pads | 10011191 | 10011172 |
| Gryphonskin Knee Pads | 10011192 | 10011173 |
| Darksteel Breastplate | 10011193 | 10011174 |
| Darksteel Gauntlet Plates | 10011194 | 10011175 |
| Darksteel Couters | 10011195 | 10011176 |
| Rose Gold Clasps | 10011196 | 10011177 |

Flawless results use inventory quality 1: the distinction is in the catalog ID.
The armor footage above shows a Flawless Breastplate without an extra +1, while
the other ingredients have their HQ flags. This also preserves its observed
starting-quality contribution when consumed in a subsequent craft. The HQ
assessment still selects the HQ completion effect and existing quality-derived
EXP. Successful Double Down takes the same result path. Ordinary materials and
equipment retain their usual HQ flag. Existing incorrectly awarded NQ-component
+1 instances are not migrated by this change.

`CraftingResultTests` checks all 19 mappings against native names and verifies
that each resulting ID is consumed by a catalog recipe. Production Lua tests
cover the creation log, HQ effects, EXP and successful Double Down. Thirteen
additional checks exercise production Player/ItemPackage methods with temporary
in-memory stacks: full inventory rejects the wrong NQ-ID stack, existing
Flawless stacks accept HQ, and ordinary HQ/NQ stacking is preserved. These
fixtures make no database writes. This proves the result policy, inventory
routing and catalog connection, not an end-to-end live client craft.

## Additional period ranks and Grand Design

[Katella's July 24, 2012 crafting diary](https://katella.wordpress.com/2012/07/24/one-decision-down-next-crafting-focus-chosen/)
reports Grand Design adding 20 progress and gives a leather progression table.
Grand Design now uses that fixed amount; its level/stat-dependent fallback is
removed. This is a firsthand report, not a recovered server formula. Unerring
Hand and Tricks of the Trade retain their separate estimates.

The following reported recipe ranks replace catalog band anchors only for the
single-skin (or wing) plus Alumen recipe versions:

| Item | SQL recipe | Stored anchor | Reported rank |
| --- | ---: | ---: | ---: |
| Sheep Leather | 1775 | 1 | 4 |
| Aldgoat Leather | 1918 | 11 | 18 |
| Toad Leather | 2156 | 21 | 27 |
| Boar Leather | 2251 | 31 | 32 |
| Hippogryph Leather | 2478 | 41 | 50 |
| Dodore Leather | 2562 | 41 | 46 |
| Raptor Leather | 2578 | 41 | 46 |

The source's Dodo/Peiste ranks already match catalog values. Its "Deodore" spelling
is normalized to the native Dodore item name. These ranks are period-reported,
not independently measured. Batch recipes and dated tanning variants remain
unresolved and do not inherit them.

[Pesh's May 18, 2012 post](https://forum.square-enix.com/ffxiv/threads/45428-Need-2012-VerGuide-for-Amror-Leveling?goto=nextnewest)
explicitly identifies Iron Scale Mail as a level-24 recipe with Iron Plate,
two Aldgoat Leathers and Silver Ingot, while distinguishing equipment level 22.
Matching SQL recipe 889 changes from anchor 21 to 24.

The existing recipe resolver guards class, result quantity, complete material
multiset, crystals and stored anchor. Forty-five additional compiled assertions
exercise the actual SQL catalog, resulting base EXP, precise-rank precedence,
and batch/dated/recycling/class/crystal exclusions. Seven new production Lua
assertions cover Grand Design's fixed gain, completion clipping, durability,
and independence from difficulty, stats, instability and progress buffs.

## Packed resident orb assets

`tools/inspect_crafting_resident_assets.py` inventories the previously missing
shared effects in `data/15/D9/00/00.DAT` and `01.DAT`. It verifies both file hashes
and records resource hashes, paths, scheduler references, and authored labels in
`outputs/crafting-client-evidence-20260910/resident-assets.json`. It does not copy
client payloads. The banks contain 1,177 and 279 resources respectively; 159 and
31 resource paths belong to the inspected crafting families.

Both banks independently contain these layer labels:

| Native variant | Scheduler | Authored VEFF layer |
| --- | --- | --- |
| 0 | `cft_base` | `cft_base1` |
| 1 | `cft_base_md` | `cft_orange1` |
| 2 | `cft_base_lg` | `cft_red1` |
| 3 | `cft_base_ch` | `cft_rainbow1` |

These strengthen the existing variant ordering. Red and rainbow are explicitly
named. Base-white and the correspondence between the orange asset label and the
yellow gameplay condition still require rendered validation. The bank selection
at runtime is unresolved; `01.DAT` includes an `InGame_test` nested resource bank.
Neither labels nor resource availability prove that the server's state-change
packets currently render the correct transition on a live client. No gameplay
mapping was changed based on these labels. Spark schedulers `gkrs_*` and elemental
schedulers `gkab_*` are present; their gameplay triggers remain a separate question.

The accompanying `native-craft-resident-owner.txt` traces the named effect through
`0x798470` to its queue parent and `0x844660`. The latter constructs a 16-byte
resource key through `0x62e2d0` and looks up resource type `scb` in the actor's
resource bank. This connects the native effect-name lookup to resident schedulers;
it does not establish which of the two packed banks is loaded in a given session.

Reproduce with `python -B tools/inspect_crafting_resident_assets.py`.

The inventory also validates the four orb VEFF root identities in each bank.
Their serialized pointers use the SEDB body at payload offset `0x30` as origin:
adding it to the header's root pointer reaches the version, matching resource ID,
and `ffev` tag. The first allocation descriptor independently agrees with that
pointer. `00.DAT` has version 29 roots with stride `0x110`; `01.DAT` has version
28 roots with stride `0x100`. Thus the generic VEFF scanner's single-version
assumption is unsuitable for comparing these banks. No control graph or RGBA
values are claimed from the header check, and version order does not establish
runtime bank selection.

## Brand quality calibration

[Allard's June 15, 2012 firsthand report, post 15,387](https://www.neogaf.com/threads/final-fantasy-xiv-ot-arr-alpha-closed-beta-mid-feb.407774/page-308#post-38922090)
describes a matching Brand giving 100 quality after an Improvise/Perfection
sequence. The full post was read in the browser after the web reader failed.
It is a period player report, not an independently measured video frame.

The archived `docs/Dat Mining/gameCommand.csv` has these fields (the numeric
header labels, excluding the row-ID column):

| Command IDs | Field 84 | Field 87 | Field 88 |
| --- | --- | --- | --- |
| 29521-29526, fire through water | 20 | 7-12 respectively | 80 |

Those element IDs match the native text parameters. Interpreting 20 as base
quality and 80 as the matching-element addition reproduces the reported 100.
The client column schema and stat independence have not been decoded; the
20-quality nonmatching/stable case remains an inference. This replaces the less
supported level/control/attribute formula and its arbitrary 1.4 matching factor.
Eye for Detail retains its separate estimated scaling.

All Brands still cure any unstable element, with the extra gain only for a
matching one, following the [official ability list](https://forum.square-enix.com/ffxiv/threads/43599?p=660467).
They bypass quality buffs and diminishing gains as specified for direct quality
abilities in 1.22. They preserve progress, durability and pending buff durations.
Quality clips at 1000; the message and earned-quality EXP use the actual gain.
Tests cover all six elements in matching, nonmatching and stable conditions,
the cap, and the EXP boundary excluding initial material quality.

## Reproducible in-game presentation probe

`Data/scripts/commands/gm/craftvisual.lua` adds a GM-only self preview through
the production `SetCraftingOrb`, `PlayCraftingStepResult`, and
`PlayCraftingCompletion` helpers. Run it while standing idle on the crafting
class with the main/off-hand tools to be inspected equipped. It does not open
a recipe, change music, consume items, wear equipment, or award EXP.

Examples:

```text
!craftvisual main orbs
!craftvisual off orbs fire
!craftvisual main standard
!craftvisual off rapid
!craftvisual main careful
!craftvisual off ability
!craftvisual main nq
!craftvisual main hq
!craftvisual off lost
```

The optional final element is `none`, `fire`, `ice`, `wind`, `earth`, `lightning`,
or `water`. `orbs` requests white, yellow, red, and rainbow for three seconds
each. Each basic action previews success, great success, failure, and chaotic
failure, resolving the result after the production three-second delay; an
additional 1.5-second inspection pause separates cases. Ability and completion
previews use the current runtime clip waits. The initial 0.8-second stance wait
and inspection pauses are probe setup, not evidence of retail timing.

Repeat with both hands on Carpenter, Blacksmith, Armorer, Goldsmith,
Leatherworker, Weaver, Alchemist, and Culinarian. Record the client build,
race/sex, equipped tools, command, and video timestamp with each observation.
Check orb hue and transition, elemental effects, tool/motion alignment, step
outcome effects, completion effects, and removal on return to standing. Repeat
with a second client observing when possible; actor visibility/reconnect
snapshots need their own live check. Then compare normal synthesis against the
probe to verify event/UI integration and cadence.

The probe refuses an existing event, non-passive stance, enmity, death, or
nonzero chant state. It checks area, class, stance, event ownership, death, and
enmity after every wait. An interruption stops further results and avoids
overwriting the newer actor state. A normal finish clears the orb and restores
the original passive stance. A server exception or disconnect is not a proven
cleanup path for this diagnostic.

`tools/validate_crafting_retail.ps1` now runs 443 probe assertions alongside the
249 synthesis assertions. The probe checks compare motion and command selection
against the production Lua helpers across all eight classes and both hands,
and cover input rejection and interrupted action delays. They verify emitted
requests and sequencing using player doubles; no rendered observation is
recorded as passed by these tests.

### User follow-up on the live probes

After the initial completion audit below, the user reported that the suggested
probes were working, but `main standard` and `main hq` did not seem different.
This is a qualitative live report; class, tools, individual orb colors, timing,
and observer/reconnect behavior were not separately reported. It does not yet
establish that the HQ completion effect renders correctly.

`standard` previews four Standard Synthesis step outcomes; it is not the NQ
completion mode. Compare `main nq` with `main hq` for completion effects. Both
successful completion modes currently request the same body animation
(`0x10065000`); their result-effect selectors differ (`0x60000021` for NQ and
`0x60000022` for HQ). The visible distinction between those effects remains
pending a direct NQ/HQ comparison. No gameplay or effect values were changed
on the basis of this report.

The user subsequently accepted the completion visuals as looking good and
suggested that their similarity may be intentional. Record this as user
acceptance of the observed presentation, with no visual correction requested.
It does not independently verify the historical NQ/HQ distinction or expand
coverage to unreported classes, tools, timing, or observer/reconnect behavior.

## Recipes panel follow-up

The user reported that opening Recipes briefly showed an empty Recent Recipes
panel before it closed. `craftStartWidgetOpen` was never set to true: its only
true assignment was inside a branch requiring it to already be true. After
loading history, the next `start` therefore sent the facility ID again instead
of resuming the existing widget with `-1`.

The recovered `judge/craft/craftjudge.luac` `start` bytecode confirms that `-1`
calls `selectCraftItemSelectWidget` without initialization; `-2` supplies the
selected recipe's materials; other values open and initialize CraftStartWidget.
The server now marks the window open after `start` returns, while the existing
close helper clears that flag.

`tools/crafting_recipe_menu_tests.lua` reproduced the incorrect second `start`
before the fix. Its 93 passing assertions cover empty/populated history, both
tabs, material prefilling, detail returns, Cancel, and subsequent events using
the production event handler and a client protocol fixture. Live confirmation
of the fixed panel remains pending. History storage is unchanged: Player keeps
up to eight recent recipes in memory for the login session, and successful
ordinary crafts/dyeing add entries. GM visual probes do not add recipes, and
history is not currently persisted across logins.

## Limits of the archived direct-ability table

A field-by-field comparison of `docs/Dat Mining/gameCommand.csv` found that all
140 data fields for Grand Design (29505), Piece by Piece (29503), By the Book
(29506), Unerring Hand (29507), Tricks of the Trade (29508), Master's Mend
(29529), Make the Most (29540), and Manipulation (29550) are identical. The row
IDs differ. File SHA-256:
`c1a02577eb207b395610976151f17898939bc21087674e19863280a9a278f997`.

These rows encompass independently supported +20/+30 progress and +20/+30
durability effects, so equality of these client fields cannot establish equal
server effects. In particular, Grand Design's measured amount must not be
transferred to Unerring Hand or Tricks solely on this basis. This CSV cannot
resolve their remaining amounts or Make the Most's restoration amount.

Eye for Detail has 50 in numeric field 84, but this field also contains the
percentage amounts of quality buffs and the inferred flat base gain of Brands.
Without its command-specific interpretation, that number alone cannot establish
a flat +50 quality or a 50% multiplier. Its progress reduction is not established
by this table either. Existing estimates remain explicitly unverified; a usable
next calibration source must show actual outcomes or decode the server logic.

The [official 1.21 Double Down rules](https://forum.square-enix.com/ffxiv/threads/39024-patch1.21-Patch-1.21-Notes?mode=hybrid)
establish item loss on failure but do not specify EXP after that failure. The
separate quality-EXP paragraph does not resolve this edge case. No new EXP rule
was inferred from the English or Japanese searches in this audit.

## Low-level Culinarian footage

[sambonz, Let's Play Part 53: The Craft](https://www.youtube.com/watch?v=Z0CZBG_S2HY)
is a 60:50 recording linked by its author in a
[May 23, 2012 forum post](https://forum.square-enix.com/ffxiv/threads/8321-New-Let-s-Play-FFXIV-Video-Series?p=699403&viewfull=1).
The late segment shows Seraphis Thrallwyn making a Boiled Egg with a frying pan.
The recipe preview is visible around 44:25; the material-use log lists one fire
shard, a chicken egg, and a bottle of mineral water. This is post-1.22 footage,
not the similarly named ARR crafting system.

| Timestamp | Visible evidence |
| --- | --- |
| 46:25 | Initial progress 0, durability 100, quality 0; basic commands and Wait, with no crafting abilities listed |
| 47:06.03-47:10.03 | One-second frame-step samples: Standard highlighted at 06.03; commands dim and values unchanged at 07.03/08.03; result values appear at 09.03; command list is bright again at 10.03 |
| 47:20-47:30 | First result: progress 25, durability 92, quality 20; log explicitly reports durability loss 8 and quality gain 20, followed by the rainbow condition message |
| 48:55 | Progress 48, durability 82, quality 49; the next Standard log reports +23 progress, -10 durability, +29 quality |
| 54:45 | Craft is over and a 72% quality EXP bonus is visible; the total EXP digits were not resolved confidently enough to fit a recipe rank |

The first result disproves the previous 9-point lower bound for Standard. The
fallback now permits 8-12; the upper bound comes from earlier footage. Uniform
sampling and applying that combined range across recipe levels remain authored.
The clip does not establish that 8 is the absolute retail minimum. The sampled
action cadence is consistent with the current three-second resolution delay,
but sampling, client response and network timing prevent an exact server-delay
claim. No stat curve, recipe rank, or failed Double Down EXP rule was inferred
from these samples. Tests retain equal outcome-independent cost ranges
and zero-durability failure precedence at the new lower bound.

The material identity matches archived recipe 5208: Culinarian, six Boiled Eggs
(`3010003`), one fire shard (`1000003`), Chicken Egg (`3011015`) and Mineral Water
(`3010609`). Its stored level is the unresolved band anchor 1. The video does not
yet establish an exact rank: neither the player's class level nor the total EXP
was read confidently enough to invert the EXP formula. The visible 72% quality
bonus alone cannot resolve either rank.

The [October 2011 EXP discussion](https://forum.square-enix.com/ffxiv/threads/28357-Calculating-crafting-level-question)
was also checked. Its six-level caveat concerns recipes below the player's rank,
not characters below level six. Its quality multiplier predates the 1.21 change,
so it supplies no evidence for a separate beginner EXP modifier in this footage.
No EXP balance change was made from this ambiguous sample. The post-1.21
[April 2012 account](https://forum.square-enix.com/ffxiv/threads/43470) supports
8% per complete ten quality gained, excluding starting material quality.

## Single-log lumber ranks

[Soldier1's January 8, 2012 table and Fourtoes' February 10 logs](https://forum.square-enix.com/ffxiv/threads/4583-Carpenter-Guides-By-Fellow-Players/page3)
support these ingredient-specific overlays:

| Recipe ID | Result | Rank | Ingredients |
| --- | --- | ---: | --- |
| 95 | Elm Lumber | 16 | Elm Log, 2 Wind Shards |
| 138 | Walnut Lumber | 23 | Walnut Log, 3 Wind Shards |
| 217 | Oak Lumber | 33 | Oak Log, 3 Wind Shards |
| 300 | Rosewood Lumber | 46 | Rosewood Log, 4 Wind Shards |

Walnut/Oak's reported EXP supports these ranks over an earlier tentative 25/32
estimate in that thread. Elm/Rosewood rely on the ingredient table alone. These
are period reports, not server data. No obsolete facility requirement is added.
Existing precise database ranks retain precedence.

Batch recipes 96/139/218/301 keep their separate unresolved ranks.
[Mooglebox's author warned in November 2011](https://forum.square-enix.com/ffxiv/threads/29990-Community-project-Recipe-levels-%28with-a-few-small-prizes%29)
that yields can differ in difficulty, citing Mythril Ingots six ranks apart.
That report supplies no absolute Mythril rank; it supports retaining separate
recipe identities rather than copying ranks across yields.

## Equipment and status input audit

The production Player getters were exercised with the real ModifierContainer,
independent of the Lua harness's player doubles. Twenty-five assertions cover
all eight classes' main/off-hand quality attributes, equipment and allocated
attribute contributions, status removal, equipment removal, and the shared
craftsmanship, magic craftsmanship and control getters. These establish that
already-calculated equipment/status totals reach the next synthesis's input
snapshot. They do not validate equipment loading, HQ equipment stat amounts,
food potency, changes during an already-running synthesis, or retail stat curves.

The native `xtx_text_paramName.csv` row 15104 names Double Down Odds. That supports
the parameter's identity, but does not establish whether its application is
additive or multiplicative; the existing additive fallback remains unverified.
Separately, `HqGearChance` (modifier 150) is a project-specific augment, declared
with `nativeMateriaType: false` in
`docs/dat_mods/item_augments/overlay/item_augment_display_contract.json`.
Its equipment-recipe restriction and percentage-point addition are existing
custom behavior, not evidence of a retail HQ equipment bonus. This audit leaves
that custom feature intact and excludes it from retail calibration claims.

## Additional archive audit

The locally preserved Gamer Escape recipe-category pages contain level-band
navigation, not recovered exact recipe ranks. The `Category:Crafting` capture
has no body content. These pages cannot justify replacing the remaining rank
fallbacks.

[eLeMeN's dated archive](http://elemen.sakura.ne.jp/ff14_dated_archives/)
was retrieved by direct HTTP after browser navigation upgraded it to an HTTPS
hosting setup page. Its linked pre-2.00 Armorer/Culinarian pages repeat the
qualitative ability descriptions; they do not supply Eye for Detail or Make the
Most gain amounts. The linked level/EXP page covers level-up requirements and
battle EXP maximums, which must not be substituted for synthesis base EXP. The
class FAQ adds no synthesis formula. Raw UTF-8 pages, exact URLs, byte counts,
hashes, and these exclusions are retained in
`outputs/crafting-client-evidence-20260910/elemen-crafting-source-audit.json`.

Two Internet Archive availability lookups, for Mooglebox's known recipe-level
page and Gamer Escape's Armorcraft level-21-30 category, returned HTTP 429.
This is an access limitation, not evidence that captures do not exist. Neither
lookup supplied a new rank. No runtime numbers changed from this archive audit.

## Remaining limits

Success/stat coefficients, natural great-success rate, exact quality/diminishing
curves, orb probabilities, exact primary-stat scaling, direct-ability amounts apart
from observed Manipulation/Piece by Piece/By the Book and period-reported Master's
Mend/Grand Design, and special-recipe exceptions remain incomplete. Brand gains
now have the period/native-table calibration above; its stated inference limits
still apply.
Failed Double Down still awards neither item nor EXP; its EXP treatment is a
retained fallback, not verified footage. No server deployment/restart or live
client validation was performed.

## Goal completion audit

The full retail-fidelity goal is **not achieved**. Current-state inspection
supports the following scoped conclusions:

| Requirement | Current evidence | Missing completion evidence |
| --- | --- | --- |
| Physical orb synchronization | Persistent substate broadcast, neutral action commit, native selectors, packed color labels, and GM probe | A rendered four-color transition check, elemental effects, and observer/reconnect behavior |
| Class/tool animations and timing | Native motion inventory; all eight classes/both hands covered by request-selection tests; limited period timing footage | Live rendering and event/UI cadence across the class/tool combinations and completion outcomes |
| Exact recipe difficulty/base EXP | Fifteen period-reported identities and two video-inferred identities; catalog/version guards and EXP checks | Exact ranks for the remaining recipe identities, including distinct batch/dated variants |
| Formula calibration | Documented period ranges, quality/HQ anchors, Control direction, and reproducible authored estimates | Controlled retail observations with known ranks/stats sufficient to determine probabilities and scaling; more tests of the estimates alone cannot supply this |
| Abilities/equipment/special recipes | Documented ability corrections, stat-input tests, and 19 named-HQ component mappings | Remaining direct-gain amounts, disputed buff interactions, equipment scaling, and other special-recipe evidence |
| Failed Double Down EXP | Runtime currently awards no item or EXP; official rules establish item loss | A period outcome record or server evidence that establishes the EXP treatment |

No `ffxiv` or `Map Server` process was found in the latest recheck. The requested
live orb observation is pending user input; the probe is ready but has not been
run in a client. The client-access limitation has persisted through the probe,
archive-audit, and completion-audit passes. A later retry of the Mooglebox
Internet Archive lookup again returned HTTP 429, without a Retry-After header.
There is no live background research job to wait on. Further source-backed
calibration needs additional accessible historical evidence; rendered verification
needs a connected client. The existing estimates remain labeled as estimates.

## Verification

- `tools/validate_crafting_retail.ps1`: 249 production Lua assertions and
  443 visual-probe assertions; neither asserts rendered pixels.
- `tools/local-guildleve-tests`: 124 Lua/C# assertions, including canceled,
  interrupted, failed, retried, successful, and persisted commission attempts.
- `tools/dyeing-tests`: passed with the recipe overlay linked.
- `Fishing Tests --crafting-presentation-only`: 274 packet/difficulty/attribute assertions.
- The same command also runs 25 production Player stat-input assertions across
  all eight crafting classes, with equipment/allotment/status contributions.
- The same command runs 104 named-HQ catalog assertions and 13 production inventory-routing assertions.
- It also runs 65 additional period-rank catalog/EXP/version-guard assertions.
- `Fishing Tests --doh-dol-exp-only`: existing EXP contract passed.
- Full Map Server/Fishing Tests build passed, with existing package/obsolete-API
  warnings. Build output was isolated in `.tmp/crafting-build`.

Reproduce the compiled checks from the repository root:

```powershell
dotnet build 'Fishing Tests/Fishing Tests.csproj' --no-restore -m:1 -p:UseSharedCompilation=false -p:OutputPath="$PWD/.tmp/crafting-build/"
dotnet '.tmp/crafting-build/Fishing Tests.dll' --crafting-presentation-only
dotnet '.tmp/crafting-build/Fishing Tests.dll' --doh-dol-exp-only
```

Packet tests establish field placement and outcome selectors; they do not prove
the resulting rendered color, successful live transition, or retail timings.
