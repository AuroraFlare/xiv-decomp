# Regional Guildleve Server Implementation

This file documents the server behavior implemented from the archived FFXIV
1.x regional-guildleve evidence. It deliberately separates captured facts from
reconstructed fallback behavior.

## Scope and coverage

- All **619** level-1+ guildleve rows in `gamedata_guildleves.sql` have offer
  and completion-reward metadata.
- Battlecraft (`classType=1`), fieldcraft (`classType=2`), and mission/company
  style (`classType=4`) leves are covered by the bonus-chest framework.
- Existing mob placements remain unchanged. A data-driven encounter layer now
  provides reusable waves, link groups, random branches and wave selection,
  interaction and automatic patrol-arrival points, decoy/reveal actions, targeted emotes and content
  commands, escort/protect and stealth-follow routes, ally AI, HP phases, timed
  survival, and tagged mob movement without requiring per-leve C# code. See
  [Regional Guildleve Encounter Framework](encounter-framework.md).
- All **53 faction leves** have objective-aware runtime configs. The 39 combat
  contracts preserve archived waves, links, drops, pursuits, bosses, and ally
  behavior; the 14 Horn and Hand contracts provide collection, stealth-follow,
  and timed-arrival transactions. Their exact placements remain explicitly
  provisional area-anchor reconstructions pending `!glbuild` capture.
- The chest validator pins the normalized mob-row hash so reward work cannot
  silently rewrite captured placements.
- The 41 surviving/captured chest coordinates remain authoritative. The other
  **578** level-1+ leves use runtime fallback placement, not claimed historical
  coordinates.
- All **99 unique client fieldcraft leves** (108 eLeMeN table rows because the
  tutorial/start rows repeat IDs) have complete location data: **198** private
  Miner/Botanist objective actors and **90** Fisher area-anchor rows. Fisher
  anchors are server-only and never become fishing actors or objective circles.
  All 99 are enabled at their correct city publishers as of 2026-09-10; see
  [gathering implementation and validation](../fieldcraft_guildleves_2026-09-10.md).

Run the coverage check with:

```powershell
python tools/validate_guildleve_chests_and_rewards.py
python tools/validate_local_and_fieldcraft_guildleves.py
```

## Fieldcraft locations and objective transactions

The archive provides the named camp/field and point count, but no world
coordinate for an individual Miner, Botanist, or Fisher leve. The 288 stored
location rows therefore use the strongest existing local evidence:

| Placement source | Slots |
|---|---:|
| Existing enabled Miner/Botanist coordinate in the named area | 96 |
| Existing Fisher-area spearfishing coordinate, retained as a server-only area anchor | 31 |
| Recorded quick-navmesh XYZ in the named area, including Iron Lake | 161 |
| **Total** | **288** |

For Miner and Botanist, all 198 rows are intentionally stable and shared by the
live minimap circle and spawned director-owned gathering actor. For Fisher, the
server resolves marker zero to a named `FishingArea`; none of the 90 Fisher rows
is sent as an objective marker or spawned as actor `1200056`. The extra Fisher
rows remain in the audited dataset but do not create artificial fishing holes.
These are source-backed area placements, not a claim that eLeMeN preserved the
exact retail spot. Iron Lake's 17 former placeholders now use whole XYZ from
the frozen zone-135 recording. There are no remaining fieldcraft placeholders.

The 99 client rows divide into **54 exact-item objectives** (`11021`) and **45
survey objectives** (`11011`, `11013`, or `11014`):

- Miner and Botanist use the normal Mine/Fell target-and-strike widget. Clicking
  a point no longer increments the leve.
- Fisher uses the stock player-owned free-water command and the normal
  bait/lure, depth, bite, and jig transaction. A cast is leve-eligible only when
  its resolved `FishingArea` matches the active leve's server-side anchor.
- Progress commits only after a successful gather/catch and after any item was
  added successfully. Failure or cancellation releases the point for retry.
- An exact-item objective gives its temporary item priority on each successful
  action. The configurable reconstruction default is **75%**; a failed target
  roll produces ordinary regional bycatch when a recovered pool exists.
  Target items are quantity 1 and normal quality, while bycatch retains ordinary
  yield and HQ rules. Only the target advances an exact-item objective.
- A survey objective accepts any successful result. Where a matching authored
  regional pool exists it also gives that ordinary gather/catch; places with no
  recovered land pool still count the successful survey without inventing one.
- Every spawned Miner/Botanist point is reserved per player transaction and
  consumed once on an objective-valid success, preventing click spam and double
  progression; its yellow circle is cleared when consumed. Missing marker slots
  fail the leve instead of inventing positions beside the player. Fisher has no shared node reservation: every player's cast,
  bait, catch roll, inventory commit, and anti-replay state is private.
- A director accepts progress only from its own member roster. Independent
  solo/party leve directors therefore cannot affect one another. Members who
  intentionally share the same active leve director retain the existing shared
  objective counter; a player who already owns another active leve is not
  attached to it.

## Fieldcraft action EXP

Patch 1.21 abolished Guardian's Aspect and increased normal fieldcraft
guildleve gathering EXP and completion bonuses to compensate. The exact
post-1.21 per-action formula and survey multiplier did not survive in the
available data, so the implementation keeps the reconstruction explicit:

| Successful action | Default action EXP multiplier |
|---|---:|
| Exact leve target item | 3.0x |
| Exact-item leve regional bycatch | 1.0x |
| Survey-leve gather/catch | 1.5x |

These multipliers are applied after the normal gathering-status EXP bonus and
then multiplied by `guildleve_exp_gain_scale`. Completion EXP, gil, items, and
difficulty bonuses remain in the normal guildleve completion-reward
transaction. HQ affects the ordinary item result but does not independently
multiply action EXP; no surviving 1.x evidence supports an HQ EXP multiplier.
The three defaults are tunable through
`guildleve_fieldcraft_target_item_chance`,
`guildleve_fieldcraft_target_item_exp_multiplier`, and
`guildleve_fieldcraft_survey_exp_multiplier`.

## Bonus-chest lifecycle

Only one bonus-chest roll is made per leve and at most one chest can exist.

1. If the leve has a captured chest row, that row's location, group gate,
   requested tier, chance, and actor override are used.
2. Otherwise, the server remembers the most recent objective actor position.
3. A normal uncovered leve makes its one roll after at least **25%** of the
   configured objective count has been completed.
4. The fallback chest is placed 1.5 yalms in front of the defeated objective or
   gathering point. If no objective anchor survived, the leve owner's position
   is the final completion fallback.
5. Faction objectives `13001`, `13002`, and `13003` are completion-only and
   guaranteed to produce a chest. This is based on the repeated archived
   faction-page instruction that completion spawns a treasure chest.
6. An unopened chest remains for **180 seconds**. An opened chest remains
   visible for the shared coffer animation's **2 seconds**, then despawns.
7. A successful leve no longer deletes its unopened chest during objective
   cleanup. Failure, abandonment, director teardown, or expiry still removes it.

The 25% trigger, 1.5-yalm offset, and 180-second lifetime are explicit
reconstruction policy. They provide complete coverage without inventing
level-20+ mob coordinates.

## Spawn, tier, and party rolls

The exact retail spawn gate did not survive in the available data. The prior
implementation treated the surviving `15 / 25 / 35` tier note as three absolute
percentages in a single 1-100 roll, which made **75%** of solo leves produce a
chest. Live testing showed that was far too frequent. The reconstruction now
uses a separate **25%** solo spawn gate, then applies the surviving values as
relative gold / blue-plated / blue weights only after the gate succeeds.

| Result after a chest spawns | Weight | Conditional chance |
|---|---:|---:|
| Gold | 15 | 20.0% |
| Blue-plated | 25 | 33.3% |
| Blue | 35 | 46.7% |

Secondary 1.x documentation says party participation increased chest chance but
does not preserve the exact curve. The implemented reconstruction adds **5
percentage points of spawn chance per additional active member**, capped at
+15:

| Active members | Any chest |
|---:|---:|
| 1 | 25% |
| 2 | 30% |
| 3 | 35% |
| 4+ | 40% |

The party bonus changes only whether a chest appears; it does not inflate gold
or blue-plated tier weight. A guaranteed faction chest skips the spawn gate and
selects among the same three tier weights.

## Actor, interaction, and Toto-Rak animation

Every default leve chest uses actor class `1200161`,
`/Chara/Npc/Object/GuildleveBonusTreasureBox`, the recovered `b923/e003`
appearance.

The recovered data contains no safe class binding for the other color variants,
so all three server-side reward tiers currently share this one client
appearance. The director logs the actual rolled tier when it spawns; the visible
coffer color alone does not identify its reward tier.

That actor row has no recovered targetable property flags. The director
therefore sets nameplate visibility, targetability, interaction icon, and
content-group ownership before the first spawn packet. This avoids a visible
but unopenable chest.

Because guildleve coffers are created after the leve event has begun, their
`GLCHEST|...` event is bridged directly to the owning guildleve director before
the generic NPC Lua loader runs. The same early route also makes the existing
Toto-Rak and Dzemael dynamic-coffer bridges reachable. Opening is rejected
unless the actor is the director's current chest, the opener is a leve member,
both are in the director's area, the actor ID is registered, and the unique ID
belongs to that leve. A click at or after the 180-second deadline removes the
expired chest without paying a reward.

Opening calls the same centralized coffer animation helper used by the
Toto-Rak-style chest path:

```text
Npc.PlayTreasureCofferOpenAnimation
animation ID 0x04001000
display duration 2000 ms
```

The guildleve director does not duplicate the animation packet or use the
incompatible RaidDungeonTreasureBox scheduler.

## Chest gil and item rewards

Every spawned colored chest contains gil. The 18 rows below use surviving
GamerEscape tooltip values explicitly labeled as average treasure-chest reward.
Where high/low values survived, the server rolls uniformly within that range.
Otherwise the sole observed value is used exactly.

| Guildleve | Title | Chest gil | Contextual bonus candidates |
|---:|---|---:|---|
| 10906 | Keeping the Peace | 556 | Crowned Cake |
| 12523 | Blacksand in Hand | 540 | - |
| 11702 | Cat Eat Dog | 1,036 | Boar Hide |
| 12484 | The Root of the Problem | 504 | - |
| 10863 | To Catch a Thief | 676 | - |
| 4235 | Oak Pillars | 416 | - |
| 11721 | A Terrible Thirst | 1,058-1,252 | Siltstone |
| 12521 | A Toad's Taste | 1,647 | Earth Cluster; Fire Cluster |
| 12508 | All Nine Ivies is a Stage | 3,083 | - |
| 11722 | Hiding Under the Beds | 1,139 | Woolen Cowl |
| 1004 | Operation: Supplication Denied | 3,100 | - |
| 11641 | Sand Yarzon Sweep | 374 | - |
| 11661 | Securing Horizon's Edge | 756 | Fluorite; Velveteen Coatee |
| 1103 | Wanted: Rorogun the Tailtamer | 4,499 | - |
| 10868 | Escape from Cell B17 | 472 | - |
| 12467 | Hidden Behind a Hide | 708 | Fire Crystal; Grade 3 Dark Matter |
| 12228 | Necrologos: Adamantine Wills | 1,627 | - |
| 11687 | Necrologos: Amongst Leaves Most Green | 705 | - |

The item names were adjacent “Possible Bonuses” records. Their association with
the chest is contextual, not explicit, so normal color gating still applies:

- Gold: always rolls a bonus item.
- Blue-plated: 10% bonus-item chance.
- Blue: gil only.
- If a leve-specific candidate exists, select among its candidates.
- Otherwise select one item from the level band `<20`, `20-34`, or `35+`.

For rows with no observed chest-gil value, the documented provisional fallback
is:

```text
gold        floor(50 * level / 1.2)
blue-plated floor(40 * level / 1.2)
blue        floor(30 * level / 1.3)
```

Every active member in the same area receives the chest's gil amount. A bonus
item goes to the opener's loot package. The actor-ID guard makes opening
idempotent, so a chest cannot pay twice. The rolled reward is cached and the
loot package is capacity-checked before the chest opens; a full loot list leaves
the same chest/reward available for retry instead of consuming the item or
rerolling it.

## Offer and completion rewards

`gamedata_guildleves_rewards.sql` contains reward rows for all 619 level-1+
guildleves. Captured source values take priority; comparable-row inferences and
clearly marked guesses fill source gaps. Runtime formulas remain a final
non-zero fallback when an override is zero.

On a valid one-time completion claim, the server can grant:

- up to two configured completion items;
- completion EXP;
- the levequest gil shown in the offer;
- completion gil;
- configured difficulty-bonus gil;
- faction-bonus gil;
- faction credit for qualifying ordinary regional leves.

Inventory capacity is checked before the completion claim is consumed.
Faction-leve acceptance spends its configured non-zero price; the server's
standard level-20/30/40 faction cards are explicitly exempt and therefore do
not consume credit. Level-50 special-operation cards retain their configured
costs, and faction contracts do not award the spent credit back.

With `L=leve level`, `C=objective count capped to 1-10`, `D=selected difficulty
clamped to 1-5`, and `R=remaining-time ratio from 0 to 1`, the completion EXP
fallback is:

```text
(600 + 140L + 45C) * (1 + 0.15(D - 1)) * (1 + 0.12R)
```

The completion-gil fallback is:

```text
30 + 3L + 8(D - 1) + 25R
```

Levequest gil uses the server's documented level-band table plus a level step
and objective-count term. Eligible leve links add a provisional 5% per linked
leve. Global EXP/gil gain-scale configuration is applied after calculation.

These formulas are reconstruction fallbacks, not recovered Square Enix tables.
The source archive also says class mismatch and being 11+ levels above the
recommended level affect completion EXP; exact 1.x penalty values are not
implemented until stronger evidence is recovered.

## Data ownership

- Chest policy and generic item pools:
  `Data/scripts/guildleve_chests.lua`
- Captured chest coordinates:
  `Data/sql/gamedata_guildleve_spawns.sql`
- General rewards and observed chest overrides:
  `Data/sql/gamedata_guildleves_rewards.sql`
- Archived source workbook containing the observed chest tooltips:
  `tools/outputs/guildleves/FFXIV_1x_Guildleves_Wayback_2013.xlsx`
- Runtime lifecycle:
  `Map Server/Actors/Director/GuildleveDirector.cs`
- General reward calculation/grant:
  `Map Server/Actors/Chara/Player/Player.cs`
- Shared coffer animation:
  `Map Server/Actors/Chara/Npc/Npc.cs`
