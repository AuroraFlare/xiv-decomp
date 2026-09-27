# Behest And Guildleve Seed Notes

This note is a working reference for two different reconstruction jobs:

- the Behest framework currently wired into the server
- mined mob/name recovery for regional battle guildleves

It is intentionally conservative. If a site has archived evidence for level band or enemies, that is called out directly. If a site only has location and battlewarden evidence, it is marked as inferred or low confidence.

## Behest objective lifetime

Each spawned Behest target has one life. `BehestDirector.SpawnWaveMob` binds
the target to the director's one-shot lifecycle before publication, then clears
the ordinary respawn timer after applying its species profile. Death retains
the normal corpse/fade presentation and permanently removes the target from
the area and director roster, even if its presentation content group is absent.
Later configured waves create distinct actors.

Progress remains cumulative spawned targets minus living targets. Corpse
removal preserves kill credit; an inherited ordinary respawn timer could make
an earlier kill disappear from that calculation. The reported live respawn's
exact path has not been captured, and this correction still needs a client
retest after deploying the rebuilt server. Ordinary world mob profiles and
respawn rules are unchanged.

## Behest Level Sync

`behest_level_sync_enabled` in `Data/map_config.ini` controls server-owned
Behest level sync and defaults to `true`. The adjacent
`behest_level_sync_grace_levels` setting defaults to `5`. At battle start,
registered combat classes/jobs above the frozen enemy level plus that grace
are temporarily reduced to the resulting cap (level-14 enemies sync players
above level 19 down to level 19); players already at or below it are unchanged.
While synchronized, the level beside the EXP bar displays that effective level;
the permanent class level and EXP progression remain unchanged underneath and
are restored to the client when sync ends. The temporary level
is removed on completion, failure, logout, class/job change, director cleanup,
or when a dead player reaches the end of the recovery window without revival.
A Raise or immediate revival before that timeout preserves the active Behest
sync. If social-party level sync was active beforehand, it is reconciled again
after the Behest-owned context ends.

The Battlewarden derives its displayed levels from the site's standard enemy
ceiling: party minimum is four levels below it and solo recommendation is one
level below it. For example, a level-14 enemy ceiling displays party level 10
and solo level 13. Eligibility uses the active combat class/job's permanent
level, not its temporary synced level. Non-combat classes and players below
the listed party minimum cannot register. The same check covers instant test
signup and is run again when recruitment closes, preventing a high-level
registration followed by a low-level class swap before the operation begins.

## Behest Sites Currently Wired In Server Code

These are the standard late-1.x Behest sites currently seeded in [Map Server/Behests/BehestManager.cs](</C:/Users/drime/source/repos/AuroraFlare/FF14-Memory/Map Server/Behests/BehestManager.cs:158>). The list is intentionally limited to sites with `PopulaceRequestWarden` actor classes present in the game data.

Only the eight pre-existing Battlewarden SQL rows should be treated as stronger position evidence. The newly added Battlewarden rows are provisional placements near camp or gate anchors until exact retail positions are validated in game.

| Site | Zone | Battlewarden Actor Class | Battlewarden Position | Recommended Level | Mob Seed Status | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| Bearded Rock | 128 | 1500013 | `(56.43, 45.34, -40.84)` | 5 | screenshot-derived randomized pool | Late-1.x band is explicit in the Behest research doc. A UI capture confirms `Bark Weevil` and `Naked Mole`. |
| Cedarwood | 128 | 1500018 | `(590.47, 54.52, -1.2)` | 35 | screenshot-derived randomized pool | Standard La Noscea site with a request-warden actor class. A UI capture confirms `Lowland Nannygoat`, `Nutcracker Squirrel`, `Fevered Doe`, and `Water Elemental`. |
| Skull Valley | 129 | 1500014 | `(-1006.957, 61.608, -1137.576)` | 15 | screenshot-derived randomized pool | Late-1.x band is explicit in the Behest research doc. A UI capture confirms `Carrier Ladybug`, `Curious Galago`, `Stray Dodo`, and `Syrphid Cloud`. The Battlewarden position and `-0.369` facing were verified in game. |
| Bald Knoll | 129 | 1500015 | `(-1873.47, 53.77, -1372.68)` | 45 | no preserved Behest roster | Standard La Noscea site with a request-warden actor class. Position is seeded from the Bald Knoll camp anchor. |
| Bloodshore | 130 | 1500016 | `(1110.33, 46.51, -925.96)` | 25 | probable screenshot-derived randomized pool | Best archival Behest site in local notes. Preserved enemy set includes `Downcast Hippocerf` and `Ice Elemental`; likely Bloodshore UI captures add `Wind Elemental`, `Fire Elemental`, and `Lowland Billygoat`. Preserved gil value `1,373` is wired as a split completion payout. |
| Cassiopeia Hollow | 132 | 1500021 | `(1351.5, -54.38, -870.84)` | 35 | partial screenshot roster | Standard La Noscea site with a request-warden actor class. A UI capture confirms at least one roll with `Giant Slug`, `Feral Dodo`, and `Lowland Nannygoat`, but the count denominators are not clear enough to seed. |
| Iron Lake | 135 | 1500017 | `(-284.793, 77.866, -2277.5)` | 45 | screenshot-derived randomized pool | Rank/level band is inferred strongly from late-1.x ladder and relic-step corroboration. Captured target names and count denominators seed a random objective pool in code. |
| Bentbranch | 150 | 1500034 | `(298, 4, -543.928)` | 5 | screenshot-derived randomized pool | Standard Black Shroud site with a request-warden actor class. A captured objective roll confirms `Bee Cloud`, `Fumbling Funguar`, `Stumbling Funguar`, and `Spriggan`; the local Behest research PDF also preserves a broader generic pool hint of `Firefly`, `Funguar`, `Spriggan`, and `Mole`, but the screenshot is used for the seeded late-style names/counts. The final three player-captured circles provide 17 unique points and a captured guide destination. |
| Tam-Tara Deepcroft | 158 | 1500043 | `(307.5, -35, -176)` | 10 | locality/quest-derived single-family pool | The Warden is owned by the dungeon Area, beside the interior aetherial node. The final three player-captured encounter circles provide 19 exact dungeon-floor points and a captured guide destination. The main spawn SQL and runtime site both assign this Warden to zone 158. |
| Humblehearth | 150 | 1500039 | `(-86.07, 4, -543.16)` | 35 | no preserved Behest roster | Standard Black Shroud site with a request-warden actor class. Position is seeded from the Humblehearth gate anchor. The final three player-captured circles provide 17 unique points and a captured guide destination. |
| Nine Ivies | 151 | 1500035 | `(1712, 20, -862)` | 45 | partial preserved roster | Standard Black Shroud site with a request-warden actor class. Position is seeded from the Nine Ivies camp anchor. The final three player-captured circles provide 20 unique points and a captured guide destination. |
| Emerald Moss | 152 | 1500036 | `(-1042, 20.6, -1760)` | 15 | screenshot-derived randomized pool | Standard Black Shroud site with a request-warden actor class. Captures confirm `Bee Cloud`, `Evenfall Firefly`, `Carrier Ladybug`, and duplicate/single `Curious Galago` rolls. The final three player-captured circles provide 16 unique points and a captured guide destination. |
| Treespeak | 152 | 1500040 | `(-880.943, 32.694, -2184.196)` | 45 | partial preserved roster | Standard Black Shroud site with a request-warden actor class. Position is seeded from the Treespeak gate anchor. The final three player-captured circles provide 18 unique points and a captured guide destination. |
| Mun-Tuy Cellars | 157 | 1500042 | `(-681, -15, -2065)` | 35 | no preserved Behest roster | The Warden is on the dungeon side of the seamless zone line. The final three player-captured encounter circles provide 21 exact dungeon-floor points and a captured guide destination. |
| Tranquil | 154 | 1500038 | `(740.8, -11.15, 1140.14)` | 25 | screenshot-derived randomized pool | Late-1.x band is explicit in the Behest research doc. A captured objective roll seeds a random objective pool in code. Three populated player-captured circles provide 17 unique points and a captured guide destination. |
| Black Brush | 170 | 1500023 | `(45.806, 200, -479.864)` | 5 | no preserved Behest roster | Standard Thanalan site with a request-warden actor class. Position is seeded from the Black Brush camp anchor. The final three player-captured circles provide 19 unique points and a captured guide destination. |
| Nanawa Mines | 176 | 1500031 | `(88.5, 169, -1268.5)` | 35 | screenshot-derived randomized pool | Standard Thanalan dungeon site with a request-warden actor class. The old zone-170 Warden import was incorrect; the zone graph, dungeon door, aetheryte routing, and ambient rows all identify `wil0Dungeon02`/zone 176. A UI capture confirms `Bog Yarzon`, `Deepground Puk`, `Ill-tempered Pteroc`, and `Antling Worker`. |
| Drybone | 171 | 1500024 | `(1259.81, 264, -544.045)` | 15 | screenshot-derived randomized pool | Standard Thanalan site with a request-warden actor class. Captured target names and count denominators seed a small one/two-objective pool in code. The final three player-captured circles provide 20 unique points and a captured guide destination. |
| Halatali | 171 | 1500028 | `(1607, 259, -233)` | 45 | no preserved Behest roster | Standard Thanalan site with a request-warden actor class. Position is seeded from the Halatali gate anchor. |
| Horizon's Edge | 172 | 1500025 | `(-1308.15, 56.001, -159.49)` | 25 | screenshot-derived randomized pool | Camp/site is explicit; this is the level 25 Thanalan anchor in late-1.x references. Multiple captures confirm the site can roll different target sets. The final three player-captured circles provide 19 unique points and a captured guide destination. |
| Nophica's Wells | 172 | 1500029 | `(-873.823, 89.404, 376.162)` | 35 | screenshot-derived randomized pool | Level band is inferred from the late-1.x ladder and recruit-interface evidence. German UI captures confirm `Wandering Wisp`, `Bog Yarzon`, `Deepground Puk`, and `Rubyscale Pteroc`; another capture preserves extra names but not clear counts. The final three player-captured circles provide 19 unique points and a captured guide destination. |
| Broken Water | 174 | 1500027 | `(1700.14, 296, 984.321)` | 45 | screenshot-derived randomized pool | Rank/level band is explicit on preserved Broken Water Behest references. One captured objective roll seeds a random objective pool in code. The final three player-captured circles provide 19 unique points and a captured guide destination. |

## Behest Data We Can Trust

- Exact battlewarden camp anchors are present in [server_eventnpc_spawn_locations.sql](</C:/Users/drime/source/repos/AuroraFlare/FF14-Memory/Data/sql/server_eventnpc_spawn_locations.sql:909>).
- `Data/sql/server_eventnpc_spawn_locations.sql`
  defines the dungeon Warden ownership: Nanawa `176`,
  Mun-Tuy `157`, and Tam-Tara `158`. `BehestManager` rejects a Battlewarden
  whose loaded Area does not match its configured site, preventing stale field
  copies from registering or rewarding a dungeon Behest.
- Behest dialogue confirms the client gets target-area map guidance in [populaceRequestWarden.csv](</C:/Users/drime/source/repos/AuroraFlare/FF14-Memory/docs/Dat Mining/populaceRequestWarden.csv:51>).
- The map sheets that likely back those markers are [2Dmap_marker.csv](</C:/Users/drime/source/repos/AuroraFlare/FF14-Memory/docs/Dat Mining/2Dmap_marker.csv:31>) and [2Dmap_data.csv](</C:/Users/drime/source/repos/AuroraFlare/FF14-Memory/docs/Dat Mining/2Dmap_data.csv:1>).

## Behest Data Still Missing

- There is no trustworthy local sheet that gives complete retail Behest mob XYZ placement. Skull Valley contributes 18 unique points from its final three captured circles. Bearded Rock contributes 19 earlier manual points, Cedarwood contributes 21 points from its final three captured circles, Bald Knoll contributes 19 unique points from three captured circles, Bloodshore contributes 23 unique points from three captured circles, Iron Lake contributes 26 points from its final three captured circles, Cassiopeia Hollow contributes 21 points from its final three captured circles, Bentbranch and Humblehearth contribute 17 unique points each from their final three captured circles, Nine Ivies contributes 20 unique points from its final three captured circles, Emerald Moss contributes 16 unique points from its final three captured circles, Treespeak contributes 18 unique points from its final three captured circles, Tranquil contributes 17 unique points from its three populated captured circles, Black Brush, Horizon's Edge, Nophica's Wells, and Broken Water contribute 19 unique points each from their final three captured circles, Drybone contributes 20 unique points from its final three captured circles, Tam-Tara contributes 19 points from its final three captured circles, Mun-Tuy contributes 21 from its final three captured circles, Nanawa Mines contributes 29 from its final three captured circles, and Halatali contributes 23 from its final three captured circles. All 22 sites now have exact player-captured encounter terrain, giving `440` exact points in source. Their pairing to retail Behest waves remains provisional.
- Cassiopeia Hollow now uses its final three captured circles across the verified dungeon floors at Y≈-68 to -78; its older seven-point route and discarded entrance capture at Y≈-54 are intentionally excluded. Halatali now uses its verified 23-point three-circle route; its old broad ambient clusters are intentionally excluded. Every site now uses the client's larger 64-yalm encounter marker. Nanawa Mines now uses its verified three-circle route in zone 176; its earlier compact 12-point ambient cluster and seven captures accidentally taken in zone 170 are intentionally excluded. Mun-Tuy now uses its verified zone-157 dungeon-floor route; its first six-point attempt and older zone-152 terrain points are intentionally excluded. Iron Lake now uses its final three captured circles and 26 player-floor points in zone 135; its older broad four-point route is intentionally excluded.
- Cedarwood now uses the final three of four captured circles and 21 player-floor points in zone 128; its first captured circle and older two-cluster ambient route are intentionally excluded. Bentbranch and Humblehearth now use their final three captured circles and 17 unique player-floor points each in zone 150; one repeated center click per site and their older 30- and 24-point ambient routes are intentionally excluded. Nine Ivies now uses its final three captured circles and 20 unique player-floor points in zone 151; one repeated center click and its older 29-point ambient route are intentionally excluded. Emerald Moss now uses its final three captured circles and 16 unique player-floor points in zone 152; three repeated center clicks and its older 25-point ambient route are intentionally excluded. Treespeak now uses its final three captured circles and 18 unique player-floor points in zone 152; its older 24-point ambient route is intentionally excluded. Tranquil now uses its three populated captured circles and 17 unique player-floor points in zone 154; the empty circle at `(766.087, -0.129, 1171.357)`, one repeated center click, and its older 32-point ambient route are intentionally excluded. Black Brush now uses its final three captured circles and 19 unique player-floor points in zone 170; one repeated center click and its older 36-point ambient route are intentionally excluded. Drybone now uses its final three captured circles and 20 unique player-floor points in zone 171; its older two-circle, 21-point ambient route is intentionally excluded. Horizon's Edge now uses its final three captured circles and 19 unique player-floor points in zone 172; two repeated center clicks and its older 34-point ambient route are intentionally excluded. Nophica's Wells now uses its final three captured circles and 19 unique player-floor points in zone 172; three repeated center clicks and its older 34-point ambient route are intentionally excluded. Broken Water now uses its final three captured circles and 19 unique player-floor points in zone 174; three repeated center clicks and its older two-circle, 14-point ambient route are intentionally excluded.
- Bald Knoll and Bloodshore now use three player-captured circles each in zones 129 and 130. Three repeated center clicks were excluded, along with their older ambient routes of 27 points each. Skull Valley now uses its final three player-captured circles in zone 129 with 18 unique points; three repeated center clicks and its old 36-point ambient route are intentionally excluded.
- The permanent camp Battlewarden handles registration only. The objective phase begins immediately without spawning a temporary guide Warden; successful completion creates the participant-only aetherial return node.
- Every supported site now has a randomized regional objective pool. Screenshot-preserved Behest rosters are preferred; where they are incomplete, the pool is conservatively supplemented from that camp's battle-guildleve roster and archival locality evidence.
- Behest mobs remain participant-private scripted event spawns. Ambient rows supply terrain-tested coordinates only; their mob identities are not copied into the Behest roster. If a randomized roll exceeds the number of unique points, those points are safely reused in later waves rather than clipping the requested counts or stacking two live mobs at one point.
- During the active battle phase, unrelated ambient mobs do not automatically aggro registered Behest participants. Behest targets still aggro normally, capture previews grant no protection, and an ambient mob can retaliate if a participant deliberately attacks it.
- Behest difficulty freezes when the battle opens. One participant uses the authored target counts and HP; through eight participants, each additional participant adds 20% to every target count and 5% to enemy HP. Target-count scaling stops at eight players. Regional Behests accept up to 32 participants; every complete pair beyond eight adds one enemy level, extends the normal recommended-level-plus-nine cap by one, and adds another 5% enemy HP.
- Every registered participant within the normal 40-yalm party EXP range shares per-kill EXP, gil, loot, and kill credit from a Behest target, even when the participants arrived in different social parties. Unregistered party members remain excluded because they cannot see or attack the participant-private target.
- Completion EXP uses archive-backed level tiers for levels 5, 15, 25, 35, and 45, including the archived ten-minute early-clear payout, player-level scaling, and accumulated uncleared-cycle bonuses. Level 10 remains explicitly marked as estimated because no exact retail payout has been recovered. After those adjustments, each qualifying player's final gil and EXP use the frozen starting participant count: 72%, 76%, 80%, 84%, 88%, 92%, 96%, and 100% for one through eight participants. Every complete pair beyond eight adds 2% completion EXP; completion gil remains capped at 100%. Mob-kill rewards are unaffected.
- Completion eligibility requires each registered player to deal at least 5% of the combined maximum HP of all objective mobs. Direct damage and applied damage-over-time ticks count; damage from a player's pet credits its owner. This is an anti-idle gameplay rule, not a recovered retail threshold.
- Talking to a supported Battlewarden now saves discovery of the Attributes / Timers Behests row before any dialogue choice, even when signup is declined or unavailable. This preserves existing cooldowns and refreshes the saved recruitment schedule. The native client currently loads these timer values on player-actor initialization, so relog if the row has not appeared yet.
- Accepted registration starts a fixed 25-minute personal Behest wait, for both successful and failed operations. Cancelling registration restores the exact prior timer. The Status-widget Behests row also refreshes against the shared half-hour schedule whenever the Timers tab is requested; outside the three-minute recruitment window it counts down to the next real signup when that is later, so it renders `Available` only when that player can actually register.
- The archived Eastern La Noscea roster names `Drifting Mine` for an unspecified Behest, but no matching display-name/actor row is currently recoverable, so it remains unseeded rather than being guessed.

### In-Game Encounter-Circle Capture

Use `!pos` to inspect a candidate battlefield. Walk to each open, reachable mob position and record the exact floor point with:

```text
!behestcapture <site_key> [radius]
```

Run `!behestcapture list` in the current zone to see valid short keys, recommended levels, configured circle counts, and exact-point counts. Captures reject unknown keys and incorrect zones. For example, `!behestcapture nanawa_mines 64` stores the current zone, XYZ, radius, and rotation in `c:\serverdata\behest_captures.csv`, registers that exact point with the in-memory Behest manager immediately, and prints a ready-to-paste `SpawnPoint(...)`. CSV rows are capture output rather than startup configuration: validated points become permanent after they are promoted into `BehestManager.cs`. Nearby points are grouped into one encounter circle and duplicates within 0.25 yalms are ignored. Use underscore-separated short keys such as `cassiopeia_hollow` and `nanawa_mines`.

To place a visible encounter area, stand at its intended center and run `!behestcapture circle <site_key>`. Every Behest now uses the client's larger 64-yalm map circle, and the command records the center as mob point 1/6. Walk to five more safe floor points inside it and use the radius printed by the command when running `!behestcapture <site_key> <radius>`. Move to the next encounter area and run the `circle` form again; it replaces the prior preview while preserving every saved point. Use `!behestcapture clear` when finished. A capture preview cannot overlap an active live or test Behest.

For GM testing, `!behestsignup [site_key]` immediately starts a private Behest using the selected site's configured circles and mob points, regardless of the public schedule or player cooldown. With no key it selects the nearest configured Battlewarden in the current zone. Use `!testbehest cancel` to stop the test and clean up its spawned actors.

If a site's runtime captures need to be redone, use `!behestcapture reset <site_key>`. It removes only that site's rows from the runtime CSV, clears its in-memory capture additions, and restores the source-defined route; it refuses to run while that site has a live, registered, or test Behest.

```text
!behestcapture circle tam_tara
!behestcapture tam_tara 32
!behestcapture clear
!behestcapture reset tam_tara
```

For future site corrections, capture several points in one open battlefield, ideally 4-12 yalms apart, and a second group if another suitable patch is nearby. The radius is retained as grouping metadata; spawning uses every captured XYZ exactly, so slopes do not inherit one flat center Y. Captures should be promoted into source only after their zone and terrain are independently validated.

### Shared Participation And Reward Test

- `python tools/audit_behest_config.py` validates all 22 randomized rosters, the low/high difficulty-band invariant, terrain-helper references, all exact helper points against the ambient spawn SQL, and valid runtime points in `c:\serverdata\behest_captures.csv`. Add `--require-all-placements` for the final gate; a site completed only through runtime capture needs at least eight unique points. Use `--capture-file <path>` to audit a copied capture file.
- A live Battlewarden cycle creates one shared Behest director for everyone who finished signup in that zone. It does not create a separate mob set per player.
- Objective mobs, their actor updates, combat packets, aggro, and targeting are restricted to the registered director members. A nearby unregistered client should not see or interact with them.
- `!testbehest site cedarwood` starts the configured Cedarwood encounter for a quick single-player visibility/combat check. Use a second nearby client to confirm the targets remain absent there.
- `!testbehest status` reports the current objective state, contribution, and the live tuning roll in the form `family x count / difficulty / actual level range`. Talking to the live Battlewarden during battle also reports the player's damage contribution against the 5% requirement.
- Every Battlewarden reports a party minimum four levels below the standard enemy ceiling and a solo recommendation one level below it. Both use the level-50 player ceiling, and the native registration window shows the derived party minimum.
- On success, qualifying registered players claim the completion payout from the aetherial current or the permanent Battlewarden. The current opens the guildleve-style reward window, grants the scaled EXP and gil on the server, prints the exact awarded payout, waits one second for those packets to display, closes the event, and then returns the player to camp. A capped class receives `0 EXP (level cap)` instead of a misleading EXP award. Explicit site gil overrides are preserved; sites without one use estimated level-tier gil anchored to Bloodshore's recovered 1,373-gil level-25 payout.
- A Behest encounter now follows a forward dungeon-like route. The nearest area to the Battlewarden or captured guide destination is stage 1; every pack in that area must be cleared before stage 2 activates, and the route never returns to a cleared area.
- The objective-family count establishes the minimum number of route stages. Larger randomized encounters add more stages at roughly six mobs per area, so a heavier roll can naturally continue through stage 4, stage 5, or beyond.
- Broad exact-point collections are split dynamically into smaller route areas. If one area has too few safe points for its assigned mobs, it runs multiple sequential packs at those points before opening the next area rather than stacking mobs or backtracking.
- Behest uses the configured 64-yalm objective circle independently of ordinary Guildleve marker sizing. Only the active pack's circle is visible; clearing it replaces that marker with the next circle at the same moment the next mob wave spawns.

## Preserved Behest Enemy Sets

Behests appear to select objective targets from a site pool and then show those targets in the objective UI. The denominators visible in screenshots are treated as captured examples for count ranges, not universal counts for every run.

| Site | Objective Roll | Code Seed Status | Source Notes |
| --- | --- | --- | --- |
| Bloodshore | `Wind Elemental` x6, `Ice Elemental` x6, `Fire Elemental` x6, `Downcast Hippocerf` x12 | seeded as probable pool/ranges | Screenshot was identified as Limsa and likely Bloodshore; `Downcast Hippocerf` and `Ice Elemental` also match archived Bloodshore evidence. |
| Bloodshore | `Wind Elemental`, `Fire Elemental`, `Lowland Billygoat`, `Ice Elemental` | seeded as probable pool/ranges | Additional Limsa-area capture confirms `Lowland Billygoat` belongs in the probable Bloodshore/La Noscea pool. |
| Bloodshore archive-only pool hints | possible finisher `Lightning Elemental` | not seeded | Archived text preserves names and reward gil, but not objective counts. |
| Cassiopeia Hollow | `Giant Slug`, `Feral Dodo`, `Lowland Nannygoat` | not seeded | Screenshot-confirmed names; denominators are too blurred to seed safely. Archived pages preserve a different possible pool: `Fevered Doe`, `Lightning Elemental`, `Lowland Nannygoat`, `Nutcracker Squirrel`, `Water Elemental`; bosses `Mottled Eft`, `Greedy Orobon`, `Megalocrab`. |
| Bearded Rock | `Bark Weevil` x9, `Naked Mole` x22 | seeded as pool/ranges | Screenshot-confirmed denominator examples seed the camp pool. |
| Cedarwood | `Lowland Nannygoat` x15, `Nutcracker Squirrel` x7, `Fevered Doe` x14, `Water Elemental` x21 | seeded as pool/ranges | Screenshot-confirmed denominator examples seed the camp pool. |
| Skull Valley | `Carrier Ladybug` x2, `Curious Galago` x2, `Stray Dodo` x2, `Syrphid Cloud` x2 | seeded as pool/ranges | Screenshot-confirmed denominator examples seed the camp pool. |
| Iron Lake | `Fachan` x3, `Sure-footed Billygoat` x2, `Brimstone Bomb` x2, `Bile Gnat` x6 | seeded as pool/ranges | Screenshot-confirmed denominator examples seed the camp pool. |
| Iron Lake | `Brimstone Bomb` x3, `Sure-footed Billygoat` x3, `Fachan` x8, `Bile Gnat` x4 | seeded as pool/ranges | Second screenshot confirms random count variance for the same Iron Lake pool. |
| Iron Lake | `Fachan` x6, `Sure-footed Billygoat` x2, `Brimstone Bomb` x3 | seeded as pool/ranges | Japanese capture confirms the same pool and count variance. |
| Iron Lake | `Rockbite Peiste` x2 | seeded as pool/ranges | Screenshot-confirmed single-objective roll. |
| Bentbranch | `Bee Cloud` x4, `Fumbling Funguar`, `Stumbling Funguar`, `Spriggan` x6 | seeded as pool/ranges | Screenshot-confirmed target names; repeated capture clarified `Bee Cloud` as a four-target row. |
| Emerald Moss | `Curious Galago` x2, `Curious Galago` x2, `Bee Cloud` x2 | seeded as pool/ranges | Screenshot confirms duplicate objective rows can happen. |
| Emerald Moss | `Bee Cloud` x10, `Evenfall Firefly` x10, `Carrier Ladybug` x6, `Curious Galago` x8 | seeded as pool/ranges | Later capture confirms the broader Emerald Moss pool and larger count variance. |
| Tranquil | `Karakul Ewe` x3, `Fevered Doe` x4, `Water Elemental` x8, `Vile Gnat` x8 | seeded as pool/ranges | Screenshot-confirmed denominator examples seed the camp pool. |
| Tranquil | `Dire Dormouse` x5, `Nutcracker Squirrel` x5, `Lowland Nannygoat` x6, `Lowland Billygoat` x4 | seeded as pool/ranges | Second Tranquil capture confirms random/objective-pool behavior. |
| Horizon's Edge | `Longclaw Galago` x8, `Downcast Hippocerf` x24, `Lowland Nannygoat` x8, `Fire Elemental` x8 | seeded as pool/ranges | Screenshot-confirmed denominator examples seed the camp pool. |
| Horizon's Edge | `Fire Bomb` x4, `Fire Elemental` x4, `Gorged Djigga` x9 | seeded as pool/ranges | Second Horizon screenshot confirms random/objective-pool behavior. |
| Horizon's Edge | `Lowland Nannygoat`, `Fire Elemental`, `Gorged Djigga`, `Longclaw Galago` | seeded as pool/ranges | Additional capture reconfirms the same pool; overlay obscures some denominators. |
| Nophica's Wells | `Megalocrab`, `Darkwing Devilet`, `Fire Elemental`, `Deepground Puk` | not seeded | German screenshot maps `Megalokrabbe`, `Schattenschwingen-Eufel`, `Feuerelementar`, and `geschuppt[a] Puk` through `xtx_displayName.csv`; counts need a clearer capture. |
| Nophica's Wells | `Wandering Wisp` x4, `Bog Yarzon` x4, `Deepground Puk` x4, `Rubyscale Pteroc` x3 | seeded as pool/ranges | German capture maps `wanderndes Irrlicht`, `Sumpf-Yarzon`, `geschuppt[a] Puk`, and `Rubinschuppen-Pterosaurus`. |
| Nanawa Mines | `Bog Yarzon` x8, `Deepground Puk` x4, `Ill-tempered Pteroc`, `Antling Worker` x8 | seeded as pool/ranges | Screenshot-confirmed target names; the pteroc denominator is partly obscured, so the code keeps a conservative small range. |
| Broken Water | `Blotched Mongrel` x18, `Darkeye Devilet` x6, `Fachan` x6, `Bile Gnat` x10 | seeded as pool/ranges | Screenshot-confirmed denominator examples seed the camp pool. |
| Drybone | `Common Cactuar` x3, `Stray Dodo` x8 | seeded as pool/ranges | Screenshot-confirmed denominator examples seed the camp pool. |
| Drybone | `Firestarter Imp` x2 | seeded as pool/ranges | Screenshot-confirmed single-objective roll. |
| Unassigned La Noscea capture | `Lowland Billygoat`, `Kobold Supplicant`, `Fire Elemental`, `Fire Bomb` | not seeded | Matches a dat-mined request pool, but the camp is not proven from the capture alone. |
| Unassigned Black Shroud capture | `Tusked Hog` x11, `Fachan` x6, `Darkwing Devilet` x6, `Water Elemental` x6 | not seeded | User identified it as a level-30-ish Black Shroud Behest, but the exact site is not proven from the capture alone. |
| Unassigned Thanalan capture | `Fire Bomb`, `Lowland Nannygoat`, `Longclaw Galago`, `Gorged Djigga` | not seeded | Screenshot was labeled by server/world rather than camp; likely another Thanalan roll but not site-locked yet. |

Current implementation rolls 2-4 objectives from each seeded camp pool depending on the camp. The recovered denominator ranges below are now treated as **standard-mob-equivalent challenge budgets**, rather than blindly spawning the same number regardless of monster family:

The site pools also preserve the regional level ladder: low-rank camps stay on dodos, vermin, and other starter fauna, while ranks 35-45 increasingly draw goats, pterocs, peistes, Fachans/evil eyes, hogs, cockatrices, and similar heavier families appropriate to that region.

A static roster audit confirms that every level 35-45 site has a majority of `Tough`/`Elite` families (`57.1%` to `87.5%` of configured objective entries). The level 5-10 starter sites remain overwhelmingly `Standard`; occasional early yarzon, coblyn, or bogy variants are still reduced by the same challenge-cost rule. Treat this as a maintenance invariant when adding or replacing regional objectives rather than filling high-rank pools with level-scaled starter fauna.

- `Standard` mobs cost 1 point and retain the rolled range.
- `Tough` mobs cost 2 points, spawn at `ceiling(budget / 2)`, and roll one level above the normal site band.
- `Elite` mobs cost 3 points, spawn at `ceiling(budget / 3)`, and roll two levels above the normal site band.
- Difficulty is inferred from the configured English family name, with an explicit per-entry override available for balance corrections. Explicitly pinned mob levels remain pinned.

For example, a `Stray Dodo` 4-8 baseline remains 4-8 Standard mobs. A `Fellbite Peiste` 2-5 baseline becomes 1-3 Tough mobs and averages one level higher. At level-45 Iron Lake, the screenshot pool therefore rolls `Bile Gnat` at levels 44-46, `Rockbite Peiste` and the goat/bomb families at levels 45-47, and `Fachan` at levels 46-48; a Fachan budget of 3-8 becomes only 1-3 live mobs. This keeps the archived objective denominators as tuning evidence while making the live encounter composition account for relative mob difficulty.

| Site | Baseline Challenge-Budget Ranges |
| --- | --- |
| Bearded Rock | `Bark Weevil` 4-9, `Naked Mole` 11-22 |
| Cedarwood | `Lowland Nannygoat` 8-15, `Nutcracker Squirrel` 4-7, `Fevered Doe` 7-14, `Water Elemental` 10-21 |
| Skull Valley | `Carrier Ladybug` 1-2, `Curious Galago` 1-2, `Stray Dodo` 1-2, `Syrphid Cloud` 1-2 |
| Iron Lake | `Fachan` 3-8, `Sure-footed Billygoat` 2-4, `Brimstone Bomb` 2-4, `Rockbite Peiste` 1-2, `Bile Gnat` 4-10 |
| Bloodshore | `Wind Elemental` 3-6, `Ice Elemental` 3-6, `Fire Elemental` 3-6, `Lowland Billygoat` 6-12, `Downcast Hippocerf` 6-12 |
| Bentbranch | `Bee Cloud` 2-4, `Fumbling Funguar` 2-4, `Stumbling Funguar` 2-4, `Spriggan` 3-6 |
| Emerald Moss | `Curious Galago` 2-8 plus duplicate small row 2, `Bee Cloud` 2-10, `Evenfall Firefly` 5-10, `Carrier Ladybug` 3-6 |
| Tranquil | `Karakul Ewe` 2-3, `Fevered Doe` 2-4, `Water Elemental` 4-8, `Vile Gnat` 4-8, `Dire Dormouse` 3-5, `Nutcracker Squirrel` 3-5, `Lowland Nannygoat` 3-6, `Lowland Billygoat` 2-4 |
| Drybone | `Common Cactuar` 2-3, `Stray Dodo` 4-8, `Firestarter Imp` 1-2 |
| Nanawa Mines | `Bog Yarzon` 4-8, `Deepground Puk` 2-4, `Ill-tempered Pteroc` 2-3, `Antling Worker` 4-8 |
| Horizon's Edge | `Longclaw Galago` 4-10, `Downcast Hippocerf` 12-24, `Lowland Nannygoat` 8-12, `Fire Elemental` 4-8, `Fire Bomb` 2-4, `Gorged Djigga` 3-9 |
| Nophica's Wells | `Wandering Wisp` 2-4, `Bog Yarzon` 2-4, `Deepground Puk` 2-4, `Rubyscale Pteroc` 2-3 |
| Broken Water | `Blotched Mongrel` 9-18, `Darkeye Devilet` 3-6, `Fachan` 3-6, `Bile Gnat` 5-10 |

## Guildleve Mob Mapping

The mined guildleve sheets are much stronger than the Behest sheets for enemy recovery.

Useful sources:

- leve rows and mob ids: [guildleve.csv](</C:/Users/drime/source/repos/AuroraFlare/FF14-Memory/docs/Dat Mining/guildleve.csv:14>)
- leve titles and descriptions: [xtx_guildleve.csv](</C:/Users/drime/source/repos/AuroraFlare/FF14-Memory/docs/Dat Mining/xtx_guildleve.csv:18>)
- display names for mob ids: [xtx_displayName.csv](</C:/Users/drime/source/repos/AuroraFlare/FF14-Memory/docs/Dat Mining/xtx_displayName.csv:4184>)

The table below is a practical seed reference for the main regional battle guildleves visible in the mined data around ids `1001-1020`.

| Leve ID | Title | Region Hint | Mob IDs | Mob Names |
| --- | --- | --- | --- | --- |
| 1001 | `Operation: Reave-quest` | southern Vylbrand shoreline | `3280203`, `3280207`, `3280211` | `bloodied buccaneer`, `windborn buccaneer`, `bilge-soaked buccaneer` |
| 1002 | `Operation: Kobold as Ice` | Lominsan frontier / kobold route | `3206601` | `kobold supplicant` |
| 1003 | `Operation: Sylph Stalkings` | Camp Tranquil / Black Shroud | `3206701`, `3206702`, `3206703`, `3206704` | `red dewflower sylph`, `turquoise dewflower sylph`, `green dewflower sylph`, `yellow dewflower sylph` |
| 1004 | `Operation: Supplication Denied` | La Noscea / kobold sappers | `3206601`, `3206601` | `kobold supplicant` |
| 1005 | `Operation: Bloody Side Up` | royal hatchery pursuit | `3206301`, `3206301`, `3206301` | `Qiqirn goon` |
| 1006 | `Operation: Reaving Home` | Serpent Reaver hideout | `3280203` | `bloodied buccaneer` |
| 1007 | `Operation: Warm Welcome` | Camp Broken Water | `3206501`, `3206505`, `3206509`, `3206513` | `Amalj'aa transfisticator`, `Amalj'aa transfixer`, `Amalj'aa trooper`, `Amalj'aa transfigurator` |
| 1008 | `Operation: Broken Thunder` | Camp Broken Water | `3206501`, `3206505`, `3206513` | `Amalj'aa transfisticator`, `Amalj'aa transfixer`, `Amalj'aa transfigurator` |
| 1009 | `Operation: Scar and Defeather` | Camp Dragonhead / Ixal raid | `3206401` | `Ixali bravo` |
| 1010 | `Operation: Frame Work` | Camp Nine Ivies / Ixal balloon hunt | `3206401` | `Ixali bravo` |
| 1011 | `Operation: Bloody Scales` | Camp Broken Water / caravan bait | `3202201`, `3202204` | `Zanig'oh`, `guivre` |
| 1012 | `Operation: Under Siege` | Amalj'aa drake base assault | `3206506`, `3202205` | `Amalj'aa inculcator`, `branded drake` |
| 1013 | `Operation: Pulling Fangs` | Camp Broken Water / final hunt | `3206515`, `3202201`, `3206506`, `3202205` | `Goldfang Adebb Chah`, `Zanig'oh`, `Amalj'aa inculcator`, `branded drake` |
| 1014 | `Operation: Wolfsbane` | Black Shroud villages | `3201419`, `3201404` | `war wolf`, `war pup` |
| 1015 | `Operation: Up, Up, and Away` | Black Shroud / Ixali wolf drop | `3201419`, `3201419`, `3206402` | `war wolf`, `war wolf`, `Ixali bombardier` |
| 1016 | `Operation: Shuteye` | Black Shroud / Deadeyes pursuit | `3206403`, `3201405`, `3206402`, `3201419` | `Natali Xlotl the Howler`, `Deadeyes`, `Ixali bombardier`, `war wolf` |
| 1017 | `Operation: Leaving the Nest` | sacred forest / Ixal leader hunt | `3206432`, `3206433`, `3206434`, `3206435` | `Nazel Xlotl the Fleet`, `Ixali bravewing`, `Ixali strongbeak`, `Ixali fogcaller` |
| 1018 | `Operation: Tailspin` | anti-Amalj'aa caravan trap | `3206542`, `3206543`, `3202201` | `Longtail Sebedd Gah`, `true Longtail Sebedd Gah`, `Zanig'oh` |
| 1019 | `Operation: Deepground` | Upper La Noscea / 59th Order raid | `3206624`, `3206622`, `3206623` | `kobold zealot`, `59th Order Matriarch Go Zu`, `Go Zu's sword bearer` |
| 1020 | `Operation: Crosseye` | Upper La Noscea / cyclops retaliation | `3110702`, `3110703` | `Arges`, `Brontes` |

## Notes For Seeding

- `guildleve.csv` and `gamedata_guildleves.sql` agree on the mob-id side for these rows.
- For implementation, the guildleve side is strong enough to seed named encounter waves directly from mined data.
- The Behest side is strong enough for site metadata and only partially strong enough for mobs. If Behests are seeded before better captures are found, each site should carry a confidence note in code or docs.

## Guildleve Position Reconstruction

The first reliable positional breakthrough came from `mapNavi_data.csv`, not from `2Dmap_marker.csv`.

For guildleve and navigation rows in a zone region block, the working horizontal conversion is:

- `worldX = navX - regionBaseX`
- `worldZ = navY - regionBaseY`

That rule was validated against known eventnpc and aetheryte anchors in:

- [mapNavi_data.csv](</C:/Users/drime/source/repos/AuroraFlare/FF14-Memory/docs/Dat Mining/mapNavi_data.csv:100>)
- [server_eventnpc_spawn_locations.sql](</C:/Users/drime/source/repos/AuroraFlare/FF14-Memory/Data/sql/server_eventnpc_spawn_locations.sql:779>)

Important caveat:

- `Y` is not cleanly preserved in the mined navigation sheets used so far.
- Practical reconstruction therefore became a two-step workflow:
  - derive the correct horizontal cluster from `mapNavi_data.csv`
  - validate and correct final placements in game with `!pos`

That means the data is strong for `X/Z`, while `Y` and occasional final lane placement still need manual polish.

## Broken Water Validated Guildleve Clusters

The first fully validated camp is Broken Water, zone `174`. These points have all been tested in game and should be treated as the current best seed set.

The SQL reference copy lives in [server_guildleve_position_seed.sql](</C:/Users/drime/source/repos/AuroraFlare/FF14-Memory/Data/sql/server_guildleve_position_seed.sql:1>).

### Broken Water Drake/Base Cluster

Validated points:

- `!pos 174 -635 282.36 -1797`
- `!pos 174 447 262.37 -2158`
- `!pos 174 -710 282.02 -2212`
- `!pos 174 -165 284.68 -1699`

Best current leve-family fit:

- `1011` `Operation: Bloody Scales`
- `1012` `Operation: Under Siege`
- `1013` `Operation: Pulling Fangs`

This cluster association is a best-fit reading from mob families, leve text, and the reconstructed region block. The points themselves are validated; the exact leve-to-point pairing is still not fully proven.

### Broken Water Route/Intercept Cluster

Validated points:

- `!pos 174 1249 263.54 -545`
- `!pos 174 1555 250 -233`
- `!pos 174 710 252.751 -493.724`
- `!pos 174 468.127 280 385.656`

Best current leve-family fit:

- `1007` `Operation: Warm Welcome`
- `1008` `Operation: Broken Thunder`
- `1018` `Operation: Tailspin`

As above, the cluster is validated while the exact one-leve-to-one-point mapping is still interpretive.

## What This Means Going Forward

- Guildleve reconstruction is now data-driven for cluster discovery and manual for final terrain polish.
- The next productive pass is camp by camp:
  - derive a cluster from `mapNavi_data.csv`
  - validate it in game
  - preserve confirmed points in SQL and notes
- Behests can use the same general reconstruction pattern once encounter-area captures are available, but right now their positional evidence is weaker than guildleves.

## Crafting Leve Track

Combat placement reconstruction is currently handled in the position TODO. For crafting/gathering-focused leves, see [crafting_leve_reconstruction_todo.md](/\\daniel-pc\C\Users\drime\source\repos\AuroraFlare\FF14-Memory\docs\crafting_leve_reconstruction_todo.md).
