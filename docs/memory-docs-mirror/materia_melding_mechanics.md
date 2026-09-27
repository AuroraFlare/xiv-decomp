# FFXIV 1.0 Materia Melding Mechanics

Sources:

- `C:\Users\drime\Downloads\Final Fantasy XIV 1.0 Crafting and Materia Melding Mechanics.pdf`
- Gamer Escape archive compatibility table: `docs/materia_meld_compatibility.md`
- eLeMeN dated 1.x materia archive: http://elemen.sakura.ne.jp/ff14_dated_archives/gamecontents/Materia/index.html

This note captures the implementation-relevant findings from the supplied research PDF. It is a mechanics guide, not a complete item-by-item database. Confidence labels follow the source report: high means primary or strongly corroborated evidence, medium means strong community evidence aligned with official rules, and low means unresolved or inferential.

## System Timeline

| Date | Change | Implementation relevance |
| --- | --- | --- |
| 2011-09, patch 1.19 | Materia, spiritbond, conversion, melding, catalysts, and forbidden melding introduced. | Base 1.0 rules. |
| 2011-12, patch 1.20 | Item help began showing repair and materia-melding requirements. Incompatible gear and materia were filtered in selection UI. | Requirements were intended to be visible and enforced per item pair. |
| 2012-05, patch 1.22 era | Attachment-part display changed to icons. | Existing client slot flags are meaningful UI data. |
| 2013-06, ARR revision | Gear-type restrictions abolished, accessories became meldable, and advanced-meld failure no longer destroyed gear. | Do not use ARR rules as 1.0 behavior. |

## Equipment-Wide Stat Caps

1.0 described each parameter as having an upper limit across all equipped
materia. This is a cap on the combined materia bonus, not an ARR-style cap on
each host item and not a cap on native equipment stats. Tiers I-IV therefore
need no separate limits: their rolled values all accumulate in the same output
parameter bucket. Both components of hybrid materia accumulate independently
against their corresponding parameter caps.

The only recovered published example is HP +280. The released client data has
the materia roll values but no cap table, so the remaining server values are a
provisional reconstruction of four times the strongest released grade-IV roll
for each parameter. `Map Server/Actors/Chara/MateriaStatCaps.cs` centralizes
those values, and `materia_stat_caps_enabled` can disable their enforcement
without changing materia rolls or meld eligibility. Unrecovered parameters are
left uncapped rather than assigned an invented value.

## Class And Level Checks

1.0 self-melding required all of the following:

- The player had the Materia Melder key item from `Waking the Spirit`.
- The player was on the matching Disciple of the Hand class for crafting or repairing the host item.
- The matching crafter level was higher than the host item's equip requirement.
- The quest unlock floor was level 18.
- Culinarian and Alchemist were excluded from the 1.19 self-meld quest.

Best-available class-level model:

| Host equip requirement | Minimum matching crafter level | Confidence |
| ---: | ---: | --- |
| 1-17 | 18 | High |
| 18 | 19 | Medium |
| 20 | 21 | Medium |
| 30 | 31 | Medium |
| 40 | 41 | Medium |
| 45 | 46 | Medium |
| 49 | 50 | Medium |
| 50 | Unresolved | Low |

The unresolved level-50 edge comes from the official wording requiring the crafter level to be higher than the equip requirement, while the cap was level 50. Treat that as a source gap until a primary exception or clean retail log is found.

## Gear And Materia Compatibility

1.0 materia compatibility was slot-coded and stat-coded. It was not ARR's later broad socket model.

Eligible 1.0 gear areas:

- Main weapons, primary tools, secondary tools, and shields
- Head
- Body
- Hands
- Legs
- Feet
- Belt

Accessories, smallclothes, arrows, bait, and lures were not valid host items under the 1.0 rule set.

Representative compatibility map from the recovered archival data:

| Host slot | Representative compatible materia types | Confidence |
| --- | --- | --- |
| Main weapon, main tool, shield | Main weapons and tools were heavily class-coded. DoH and DoL stats were listed for corresponding DoH and DoL main tools. Shields accepted HP, HP/MP, Defense, and elemental resistance. | Medium |
| Head | Intelligence, Mind, Manathirst, Hell's Eye, Manaflight, Healer's Hand, Sound of Certainty, Pixie Tongue, Coeurl Eye. | Medium |
| Body | Vitality, Piety, Bloodthirst, Manathirst, Savage Might, Bloodflight, Bloodwall, elemental Veils. | Medium |
| Hands | Strength, Dexterity, Heavens' Fist, Heavens' Eye, Evenflow, Sagacious Might, Sound of Suffering, Battledance, Swiftwall, Wyvern Skin, Bomb Blood. | Medium |
| Legs | Lifethirst, Ironman's Will, Swordsman's Cry, Watchman's Vigil, Loresman's Wit, Wise Man's Vision, Vestryman's Faith, Savage Aim, several status-resistance materia. | Medium |
| Feet | Hells' Fist, Sound of Serenity, Bloodflight, elemental attack-potency materia, several status-resistance materia. | Medium |
| Waist | Manathirst, Sanguinary Might, Stellar Might, Touch of Rage, Touch of Serenity, elemental resistance materia. | Medium |

The server already has DAT-derived compatibility booleans in `gamedata_items_materia.meldable1` through `meldable38` and corresponding fields in `MateriaItem`. `docs/materia_meld_compatibility.md` maps those flags to the archived Gamer Escape gear targets, and `docs/materia_meld_compatibility.csv` preserves the per-tier catalyst/effect/target rows. The current melding path uses those flags instead of only checking whether the target can generally accept materia.

Host eligibility comes from `gamedata_items_equipment.materiaBindPermission`.
Durability does not imply meldability, and `materializeTable` only authorizes
conversion. This distinction rejects most special Unique/Untradeable gear while
preserving the explicit late-1.0 exceptions whose DAT permission bit was enabled.
The compatible target flags are family-level data, not tier-specific rules; the
single contradictory Sagacious Might archive entry is documented but not encoded.

## Spiritbond Conversion

1.0 conversion required the Materia Assimilator key item, 100% spiritbonded equipment, and gear that could materialize into materia. The recovered data does not expose the exact retail materialization pools, but the server should not collapse all conversion into a single `materializeTable` materia type. That table value is treated as a conversion-capability gate and fallback.

Current conversion rolls the tier from item level, then builds a materia-family pool from every implemented materia type that can legally meld to the spiritbonded gear's host slot. This lets newly implemented families such as Sagacious Aim, Bloodflow, Manaflow, Mettleflow, Sorcerer's Step, Sprinter's Step, and the type 82-88 hybrid/potency materia appear from spiritbond conversion when their gear slot is compatible. Unsupported or client-unsafe families remain excluded until they have valid enum/data support.

After selecting the named tier, conversion also rolls one of its four potency
sub-grades. The catalog ID identifies tier I-IV and the persistent inventory
`quality` byte stores sub-grade 1-4, which the client already serializes and the
database already preserves. When melded, that value becomes exact attached grade
0-15 and is used for stats and forbidden-meld odds. No retail sub-grade weighting
has been recovered, so conversion currently gives the four rolls equal weight.

The eLeMeN archive also states that equipment resets to zero spiritbond when either given or received through player trade. `TradeTransaction` now applies that reset to the preserved equipment instance before sending the receiver's inventory update.

## Overmelding

High-confidence 1.0 behavior:

- First meld on an eligible item was guaranteed.
- Multiple materia required the Augmented Materia Melder.
- Eight successful materia attachments made a player eligible to exchange the regular Materia Melder for the augmented version at Mutamix.
- One item could hold up to five materia.
- Forbidden-meld success rate decreased after the first meld.
- Failed forbidden melding destroyed the host gear and all involved items, except the key item.
- Purging materia at Mutamix did not destroy the gear, but the purged materia was lost.

ARR changed the failure consequence: failed advanced melding only destroyed the current materia and catalyst, leaving the gear and previously attached materia intact. That is not 1.0 behavior.

## Recovered 1.0 Rate Examples

No complete official 1.0 forbidden-meld success matrix was recovered. The best text-accessible numeric evidence is second-slot-heavy community data. It suggests 1.0 success depended on at least the number of existing materia, existing materia tier or roll strength, new materia tier or roll strength, HQ status, and order.

| Host item example | Existing first materia | Attempted second materia | Displayed rate | Confidence |
| --- | --- | --- | ---: | --- |
| Boarskin Ringband of Flames, lv46 | Tier I STR | Tier I STR | 41.0% | Medium |
| Boarskin Ringband of Flames, lv46 | Tier I STR | Tier II STR | 33.5% | Medium |
| Boarskin Ringband of Flames, lv46 | Tier I STR | Tier III STR | 31.5% | Medium |
| Boarskin Ringband of Tremors, lv46 | Tier II STR | Tier I STR | 38.0% | Medium |
| Boarskin Ringband of Tremors, lv46 | Tier II STR | Tier II STR | 36.5% | Medium |
| Boarskin Ringband of Tremors, lv46 | Tier II STR | Tier III STR | 35.0% | Medium |
| Boarskin Ringband of Tremors, lv46 | Tier II STR | Tier IV STR | 31.5% | Medium |
| Boarskin Ringband of Frost, lv46 | Tier III STR | Tier I STR | 33.5% | Medium |
| Boarskin Ringband of Frost, lv46 | Tier III STR | Tier II STR | 32.0% | Medium |
| Boarskin Ringband of Frost, lv46 | Tier III STR | Tier III STR | 30.0% | Medium |
| Boarskin Ringband of Frost, lv46 | Tier III STR | Tier IV STR | 27.0% | Medium |
| Cobalt Mitt Gauntlets, lv48 | Tier II STR | Tier I STR | 35.0% | Medium |
| Cobalt Mitt Gauntlets, lv48 | Tier II STR | Tier II STR | 33.5% | Medium |
| Cobalt Mitt Gauntlets, lv48 | Tier II STR | Tier III STR | 30.5% | Medium |

Additional recovered community examples:

- Existing 1/4 roll Tier IV plus attempted 4/4 roll Tier IV displayed 16.00%.
- HQ+1 reportedly added 2 percentage points and HQ+2 added 3 percentage points in that example set.
- Strength IV plus Heavens' Fist III on gauntlets was reported at 19.5%.

These examples are not enough to reconstruct the full retail formula.

## Implementation Status

### Player-requested melding (patch 1.22 protocol)

A requester stages exactly one first-socket meld in a four-entry escrow:

| Remote-view slot | Requester-supplied entry |
| ---: | --- |
| 1 | Unmelded equipment |
| 2 | One materia |
| 3 | One compatible catalyst |
| 4 | Fixed gil service fee |

The requester owns this escrow as inventory package `5` (`MELDREQUEST`), whose
capacity is exactly four. A receiver targeting that player opens the recovered
`MateriaAttachAskWidget` in accept mode. It requests the requester's package
`6`, displays nothing unless it receives exactly four entries, and sends the
foreign-actor melding command only after validating the displayed item and its
own crafter requirements. Package `6` is therefore a receiver-side view of the
requester's package `5`, not a second escrow or a general inventory package.

This proves the observed limit is one meld request at a time: there is no space
for a second equipment/materia/catalyst/fee set. The requester supplies and
loses the materia and catalyst on success; the accepting player receives the
fee and returns the successfully melded equipment to the requester.

Player-initiated melding now enforces the major 1.0 gates:

- Materia Assimilator key item and 100% spiritbond requirements for conversion.
- Spiritbond conversion randomizes across implemented, slot-compatible materia families instead of only returning the raw `materializeTable` value.
- Spiritbond conversion rolls and persists all four potency sub-grades inside each tier; self-meld and requested-meld paths attach the exact resulting grade.
- The recovered materialization command now receives the generated materia catalog ID and opens its three-second `MateriaInformWidget` result panel.
- Materia Melder and Augmented Materia Melder key item requirements.
- Matching repair/craft class from item data and the 1.0 level gate.
- Host-slot and materia-type compatibility from `gamedata_items_materia`.
- Strict host eligibility from `materiaBindPermission`, without treating durability or conversion capability as permission to meld.
- Persistent per-instance policies for content-authored equipment that already contains materia. Plain copies of a non-meldable catalog item remain blocked; authored copies may independently allow or deny further forbidden melding and Mutamix removal. Denials are checked before any item or gil consumption. If removal is allowed, purging the final materia resets the policies to ordinary catalog behavior.
- Compatible catalyst requirements and catalyst consumption.
- Guaranteed first melds, forbidden attempts after the first meld, and gear/materia/catalyst destruction on failed forbidden melds.
- Self-melding follows the recovered `CraftJudge` sequence: quote, `MateriaAttachAskWidget` confirmation/caution, authoritative commit, then `MateriaInformWidget` result. Cancelling cannot mutate inventory, and a confirmed quote is rebound to the exact item instances before commit.
- `MateriaMeldRateCommand` opens the recovered read-only rate widget using the same server-side rate used by the meld attempt.
- Command routing covers self-meld (`22014`), rate display (`22015`), requested-meld fulfillment (`22016`), and materialization (`24240`), including synthetic fallback actors when a client-local command has no registered server actor.
- Mutamix materia removal uses a server quote, client confirmation, and revalidated commit rather than changing the item while the preview is open.
- Persistent successful-meld progression in `characters_materia_progress`; successful self-melds and fulfilled request melds both count, with the total capped at eight.
- The regular-to-augmented key-item exchange when an eligible player next speaks to Mutamix. Reaching eight does not remotely grant the augmented melder.

Remaining caveats:

- The exact retail forbidden-meld formula is still unrecovered. The server uses a conservative approximation fitted around the recovered second-slot examples and keeps it isolated in `CalculateMateriaMeldSuccessRate`. It now models slot count, both materia tiers, within-tier potency, weak-to-strong versus strong-to-weak order, and HQ quality; the 5% floor remains an implementation safety bound rather than a claimed retail constant.
- The recovered command/widget contracts are covered by syntax and source-contract tests, but the confirmation, result, conversion, request, and removal panels should still receive one live-client smoke pass against a running server.
- The quest unlock data in this repo currently excludes Culinarian but allows Alchemist. The PDF's class-exclusion evidence should be reconciled against quest-era data before changing quest eligibility.
- Keep generated-loot materia separate from real player melding; generated loot is authored reward generation and should not imply catalysts, class checks, or overmeld risk.

## Source URLs Preserved In The PDF

- https://forum.square-enix.com/ffxiv/threads/24910-patch1.19-Patch-1.19-Notes
- https://forum.square-enix.com/ffxiv/threads/6802/?highlight=materia&page=11
- https://forum.square-enix.com/ffxiv/showthread.php?p=342214
- https://forum.square-enix.com/ffxiv/threads/28915
- https://forum.square-enix.com/ffxiv/threads/90757
- https://finalfantasy.fandom.com/wiki/Materia_%28Final_Fantasy_XIV_version_1.0%29
- https://forum.square-enix.com/ffxiv/threads/32606
- https://www.bluegartr.com/threads/117500-Materia-System-Compiled-Information-Thread
- https://forum.square-enix.com/ffxiv/showthread.php?p=384679
- https://forum.square-enix.com/ffxiv/threads/51535
- https://na.finalfantasyxiv.com/lodestone/freecompany/9236179148295110686/forum/40936/
- https://ffxiv.consolegameswiki.com/wiki/Materia
- https://na.finalfantasyxiv.com/lodestone/playguide/db/quest/494c4ff8e5a/
- https://forum.square-enix.com/ffxiv/threads/22225/?page=18
- https://ffxiv.consolegameswiki.com/wiki/Materia_Melding
