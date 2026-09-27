# Open-World Keyed Coffer Framework

**2026-09-16 completion:** [public coffer positions and key bindings](public_coffers_2026-09-16.md)
now supply nine Shposhae and seven U'Ghamaro recorded-ground homes in the main
SQL, plus nine ordinary key-drop associations. Together with existing stronghold
positions, 33 definitions have usable position/reward data; Castrum Silver
remains dormant. Earlier capture TODOs below are historical. These new homes
are authored within source cells, not confirmed retail XYZ; see the linked
report for key-source and event limitations.

## Scope and evidence boundary

Patch 1.19 introduced locked treasure coffers to Shposhae, U'Ghamaro Mines,
and Zahar'ak. The patch notes establish the important server rules: every lock
requires its matching key, a key is consumed on use, a coffer is refilled after
being emptied, each key is unique, and rewards vary by lock tier. The installed
1.x item sheet also contains the Natalan and later Castrum key families.

Sources:

- [Local Patch 1.19 archive](patches/Patch_1.19.md)
- [Official Patch 1.19 forum notes](https://forum.square-enix.com/ffxiv/threads/24910-patch1.19-Patch-1.19-Notes?mode=threaded&p=361385)
- [Archived Shposhae research thread](https://forum.square-enix.com/ffxiv/threads/27525-Shposhae-%28Level-15-20-Dungeon%29-Info-Page.)
- [Translated beastman stronghold source matrix](open_world_coffer_stronghold_sources.md)
- [Official Patch 1.22b notes](https://forum.square-enix.com/ffxiv/threads/47128-patch1.22b-Patch-1.22b-Notes?p=714594&viewfull=1)
- [Official Japanese Patch 1.22b notes](https://forum.square-enix.com/ffxiv/threads/47127-patch1.22b-1.22b%E3%83%91%E3%83%83%E3%83%81%E3%83%8E%E3%83%BC%E3%83%88?p=714584&viewfull=1)
- [Castrum key and coffer field reports](https://forum.square-enix.com/ffxiv/threads/47541-garlean-rubber-castrum-novum-coffer-keys)
- [Castrum Magitek Vanguard H-1 spawn research](https://forum.square-enix.com/ffxiv/threads/48920-Castrum-Novum-H-1-spawn-system)
- [Recorded Gold coffer run](https://www.youtube.com/watch?v=HSzTBI0Nwbo)
- `Data/sql/gamedata_items.sql` for the installed key identities and IDs

The framework therefore seeds definitions for all key families present in our
data. Shposhae pools come from the archived research, while the eLeMeN pages
supply exact physical stronghold chest-to-equipment associations. The source
does not publish stronghold gil bands, common pools, or equipment probabilities,
so their named equipment is explicitly marked as a provisional sole reward.
No world XYZ coordinates are invented.

## Implemented behavior

`OpenWorldCofferManager` owns public-area coffer actors independently of party
and instance content. On server startup it loads three SQL tables, validates
keys/items, and materializes only definitions that have all of the following:

1. an enabled definition;
2. at least one enabled position with positive spawn weight;
3. gil or at least one enabled, valid reward row; and
4. a positive active count.

Incomplete definitions remain visible through `!owcoffer status`, but no actor
is spawned and no key can be consumed by an incomplete reward definition.

When a player opens a coffer, the manager:

1. confirms the actor is still authoritative, public, and within 6 yalms;
2. reserves the shared coffer so simultaneous users cannot both open it;
3. confirms the matching unique key is in the player's inventory;
4. rolls the complete reward and checks loot-list capacity and unique ownership;
5. adds the item reward, consumes exactly one key, and adds gil;
6. plays the known coffer-open animation for nearby players;
7. removes the public actor after the two-second display window; and
8. refills it on its configured timer, optionally choosing another candidate.

An error, invalid reward, ownership conflict, or full loot list leaves both the
key and coffer intact. A GM SQL reload is serialized against active openings.

## SQL model

Install [`Data/sql/server_open_world_coffers.sql`](../Data/sql/server_open_world_coffers.sql)
in the map database. It creates:

- `server_open_world_coffers`: lock/key identity, zone, active count, refill,
  gil band, random-position policy, enable switch, and evidence note;
- `server_open_world_coffer_positions`: any number of weighted XYZ/rotation
  candidates per coffer; and
- `server_open_world_coffer_loot`: weighted exclusive groups and independent
  optional rolls.

Loot semantics:

- `lootGroup > 0`: choose one row from that group by `weight`, after applying
  each row's `chance` and unique-ownership eligibility.
- `lootGroup = 0`: roll every enabled row independently by `chance`.
- quantities are inclusive `minQuantity..maxQuantity`; zero is legitimate and
  supports historical `0-N` entries that may yield only gil.
- `chance` accepts `0.0..1.0`; validation also normalizes legacy percentages
  above 1 through 100.

Position semantics:

- `activeCount` is capped by the number of distinct enabled candidates.
- `spawnWeight` controls weighted selection; zero disables selection without
  deleting the evidence row.
- `rerollPositionOnRefill=0` keeps a coffer at its selected point.
- `rerollPositionOnRefill=1` chooses another unoccupied weighted candidate.

## Fixed positions versus random positions

Random candidate pools are supported, but should be used only where evidence
supports uncertainty or rotation. The Shposhae research identifies one map tile
for each lock tier, which is stronger evidence for a fixed location. For retail
fidelity, capture one XYZ row per Shposhae tier and leave reroll disabled.

| Coffer | Reported tile | Key source |
| --- | --- | --- |
| Copper | 2F (5,4) | Grippers |
| Silver | 2F (4,3) | Shade Lurkers |
| Gold | 2F (4,5) | Silver coffer |
| Brass | 3F (6,5) | Spawning Orobon |
| Mythril | 3F (6,4) | Shadow Lurkers |
| Electrum | 3F (5,4) | Mythril coffer |
| Bronze | 4F (8,5) | Jackal Pups |
| Steel | 5F (6,4) | Gloom Lurkers |
| Rose Gold | 5F (5,5) | Steel coffer |

These are historical map-grid references, not server XYZ coordinates. They are
included to guide capture and must not be entered as world coordinates.

### Castrum Novum recovery

Patch 1.22b places the stronghold in Mor Dhona at historical map tile (6,12)
and says locked coffers are found throughout it. The Japanese notes add that
powerful monsters drop their keys. Surviving field reports narrow that family
to Magitek Vanguard H-1s, but conflict on a strict level-to-key mapping: a
level 61 H-1 is confirmed for Copper, while another level 61 kill reportedly
yielded Gold. The original level 62 = Silver and level 63 = Gold forum mapping
was speculation. The later June 2012 archived Castrum roster explicitly lists
61/Copper, 62/Silver and 63/Gold; the [2026-09-12 public population pass](castrum_novum_mobs_2026-09-12.md)
now uses that table, preserving the earlier disagreement as a source conflict.

| Coffer | Supported key/source evidence | Supported reward | Still missing |
| --- | --- | --- | --- |
| Copper | H-1 level 61 in later archive | Garlean Fiber, 10011250 | Retail XYZ, full pool, quantity/rate |
| Silver | H-1 level 62 in later archive | None recovered | Reward, retail XYZ, quantity/rate |
| Gold | H-1 level 63 in later archive; conflicting earlier 61 report | Garlean Fiber, 10011250; Imperial Operative Dalmatica, 8032829 | Retail XYZ, full pool, quantity/rate |

The Gold video identifies the run and Dalmatica reward in its title/description
and shows the key in the inventory after the H-1 fight, but does not expose a
trustworthy server coordinate. The forum report independently ties Garlean
Fiber to a Gold opening. Neither source establishes shared-pool semantics
or rates. With the user's 2026-09-16 authorization to estimate rates, the main
SQL now uses an authored exclusive Gold pool: 85% one Fiber or 15% one
Dalmatica, when both items are eligible. Copper retains one guaranteed Fiber.
The [rate rationale](castrum_coffer_video_review_2026-09-16.md#implemented-rate-estimate)
distinguishes these choices from historical evidence. A second general-assault
video was reviewed and adds no visible
coffer placement or reward evidence. No Castrum server XYZ is inferred from
either minimap. The later population pass supplies authored, exact-recorded-ground
positions for Copper and Gold and an inactive Silver candidate; these are not
claimed as recovered retail chest coordinates.

The [2026-09-16 YouTube follow-up](castrum_coffer_video_review_2026-09-16.md)
records the inspected videos and timestamps. It retains the Dalmatica
participant report and an additional contemporary Rubber-from-chest report
whose key color is unspecified. Silver's reward remains unresolved; Rubber
is not assigned to a tier. Positions are unchanged.

## Position capture workflow

The GM command is deliberately usable before permanent position rows exist:

```text
!owcoffer status [cofferId]
!owcoffer spawn <cofferId>
!owcoffer key <cofferId>
!owcoffer sql <cofferId> [positionId]
!owcoffer reload
!owcoffer clear
```

Recommended capture loop:

1. Stand at the verified chest point in the correct public zone.
2. Run `!owcoffer spawn shposhae_copper`, then
   `!owcoffer key shposhae_copper` to test the full open path.
3. Adjust your position/rotation and repeat until the actor placement is right.
4. Run `!owcoffer sql shposhae_copper retail` and copy the emitted upsert into
   the SQL position table.
5. Import the row and run `!owcoffer reload` without restarting the server.
6. Use `!owcoffer status shposhae` to confirm readiness and live actor counts.

For a genuinely random pool, capture multiple position IDs such as `candidate_a`,
`candidate_b`, and `candidate_c`, assign evidence-based weights, then enable
`rerollPositionOnRefill` for that definition.

## Seed coverage and remaining data

The seed contains 34 physical coffer definitions across 27 distinct key tiers:

- Shposhae: 9 tiers, with known gil bands and provisional equal-weight main
  reward pools;
- Zahar'ak: 7 physical chests across 4 key tiers;
- U'Ghamaro Mines: 7 physical chests across 5 key tiers;
- Natalan: 8 physical chests across 6 key tiers; and
- Castrum Novum: 3 tiers, with provisional Copper and Gold reward associations.

The Castrum population block now seeds two active recorded-ground positions
(Copper and Gold) and one disabled Silver candidate, preserving any previously
captured positions. The [Zahar'ak/Natalan pass](zahar_natalan_2026-09-12.md) adds
seven Zahar'ak and eight Natalan positions on exact recorded ground, with all
ten key sources wired. These are authored positions; historical grid references
that lack suitable recorded ground remain documented separately. U'Ghamaro's
named equipment is wired but still awaits chest position captures. Castrum's
Silver definition remains dormant because no reward has been recovered.

The Shposhae source lists seven common materials from every tier, but it does
not establish whether they were independent rolls, one shared selection group,
or their probabilities. Those items are documented in the seed comments and
left disabled until better evidence exists. The eLeMeN pages likewise omit the
stronghold common pools, gil bands, and rare-equipment rates; their guaranteed
named reward is a labeled gameplay placeholder rather than a retail-rate claim.
Likewise, only already-supported
mob/NM drops provide keys today; this coffer manager does not manufacture key
drop sources where the corresponding BNPC evidence or spawn is missing.

## Configuration and diagnostics

`open_world_coffers_enabled=true` in `Data/map_config.ini` is the master switch.
Missing SQL tables are treated as an optional feature and logged without
preventing server startup. Important lifecycle events log under
`[OpenWorldCoffer]`, including definition/position IDs, opener, consumed key,
reward summary, refill timing, and temporary-test status.
