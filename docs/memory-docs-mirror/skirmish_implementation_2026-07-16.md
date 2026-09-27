# Skirmish implementation (2026-07-16)

## Scope and sources

This implements both patch 1.23 Skirmishes as isolated party instances while
leaving world-space placement in one replaceable data layer.

Primary sources:

- FFXIV Classic Wiki region/territory table (retail region `108`, Fields 04/05):
  http://ffxivclassic.fragmenterworks.com/wiki/index.php/Regions
- FFXIV Classic Wiki points of interest (territories and XYZ landings):
  http://ffxivclassic.fragmenterworks.com/wiki/index.php/Points_of_interest
- Elemen dated archive, complete rules/rosters/action notes:
  http://elemen.sakura.ne.jp/ff14_dated_archives/gamecontents/etc/Skirmish.html
- Official patch 1.23 notes, eligibility, areas, NPC, and Giantsgall list:
  https://forum.square-enix.com/ffxiv/threads/50278
- Archived Gamer Escape overview, party size, level, enemy strength, and uncommon
  weapon wording:
  https://web.archive.org/web/20121026030422id_/http://ffxiv.gamerescape.com/wiki/Skirmish
- Historical Giantsgall acquisition page:
  https://web.archive.org/web/20121026030422id_/http://ffxiv.gamerescape.com/wiki/Giantsgall_Claws
- Preserved 1.0 monster-table compilation, including level 55 for every
  Skirmish variant:
  https://ff14.huijiwiki.com/wiki/博客:怪物分布列表/1.0
- Release-window mechanics and reward discussion (including timed Turtleback
  overlap, random coffer assignment, and reports of two weapons):
  https://forum.square-enix.com/ffxiv/threads/50334-Skirmish-how?p=766018&viewfull=1
- Project Meteor client music-ID reference (`9`, The Seventh Gate):
  https://wiki.ffxivrp.org/pages/Music

Local client data supplies the two native content-information directors,
`QuestDirectorNMRush01` and `QuestDirectorNMRush02`, and their titles 51143 and
51144. Local DAT/SQL data supplies the actor classes, appearances, family skill
lists, same-place zone groups 236/269 and 237/270, and all seven Giantsgall item IDs. The installed client
also supplies the shared coffer model's two-phase activation motion at
`chara/bgobj/b923/act/cmn/lib/base/0201`.

## Recovered retail contract

- Party: 4-8 players. Only the leader initiates.
- Every member: level 45+ Disciple of War/Magic and enlisted in any Grand
  Company. Mixed Grand Companies are valid.
- Time limit: 30 minutes.
- Retry: 15 minutes after victory, 5 minutes after defeat.
- Entry NPC: Storm Captain Loetahlsyn in Limsa Lominsa Lower Decks (X5, Y7).
- Entry uses a normal targeted NPC conversation, not a cutscene. Loetahlsyn
  introduces himself and his training, the client shows the party-leader
  requirement, and the recovered menu offers No, Locke's Lie, or Turtleback
  Island. Choosing an island runs the authoritative party validator and enters
  the instance.
- Actor class `1002087` uses the captured Lower Decks world transform
  `(-640.400, 1.023, 406.023)` with rotation `1.604`, within the sourced map
  grid (5,7).

Locke's Lie is the offensive scenario. The northeastern, northwestern,
southeastern, and southwestern forces are active together. Great Elm appears at
the center after all four fronts are clear.

- Territory `236`, retail region `108`, scene `sea1Field04`. The location-list
  landing `(950, 1, 1040)` was visually confirmed in the retail scene and normal
  NPC entry to Locke's Lie is enabled.

| Front | Recovered roster | Existing family/action data used by the server |
|---|---|---|
| Northeast | Akoman; 4 Akoman's daewas | Aural Vacuum, Caterwaul (Japanese/player `Catawall`), Tail Whip, Level 5 Petrify |
| Northwest | Aetherbound Slave | Inferno Drop, Elbow Drop, Bellow, Bonebreaker |
| Southeast | Eurylochus; Princess of Pestilence; Cactuar Jaques | Squeal, Reckless Charge, Hair-Raising; Thunderstorm, Thunderstrike, Dissolve; Solar Needles, Tender Thrust, 1000 Needles |
| Southwest | Elder Longhorn; 2 Longhorn Billygoats; 2 Longhorn Nannygoats | Alpine Fury, Head Butt |
| Center | Great Elm | Arboreal Storm, Canopy, Switch Swipe, Bough Down (the remembered `Bow Down`), Backhand Blow, Pinecone Bomb, Rise and Fall |

The four fronts distribute their rosters across all nine terrain-tested
captures supplied from the live map. No local cluster contains more than three
actors; multi-mob clusters form a regular ring with five yalms between adjacent
actors. Great Elm reuses the central `(1019.286, 0.670, 1012.389)` capture after
the preliminary fronts clear. This prevents stacked models while preserving
each recorded terrain height and facing.

Turtleback Island is the defensive scenario. Greater Buffalo, Wadjet, Bixie,
and Steropes enter in that order. The next attacker appears when the current
one dies or about six minutes elapse; this permits overlap if a target survives.
Stone Golem appears only after all four preliminary attackers are dead.

- The recovered region/zone table identifies the retail pair directly:
  Locke's Lie is territory `236`, region `108`, `sea_s1_fld04`; Turtleback is
  territory `237`, region `108`, `sea_s1_fld05`. Client RegionResourceData
  independently confirms region `108` contains both Field04 (resource `1314`)
  and Field05 (resource `1315`). Same-place groups associate `236/269` with the
  Locke's Lie map (place `1041`) and `237/270` with the Turtleback map (place
  `1011`), so the alternate territories use the same scenes and region.
- The distinct unmapped `region 135 / sea1Field02` scene found during that
  confirmation is preserved as synthetic research territory `271`, reachable
  with `!warp skirmishcopy`. It is not a third Skirmish.
- Both normal Loetahlsyn travel choices are enabled after their retail scenes
  and landings were visually verified. `!testskirmish lockes` and
  `!testskirmish turtleback` remain available for encounter-system testing.
- A separate SetMap regression from the 2022 zone refactor was corrected: the
  packet must carry the full area-master actor ID, not the plain territory ID.
  The pre-refactor implementation and independent packet research agree on
  this field. That regression can produce a loaded scene with missing or stale
  map context, so rendering must be rechecked after the corrected server build.
- Turtleback's location-list landing `(3050, 40, 500)` was rejected in the
  correct Field05 scene. Client `MapLayoutResourceData` contains the authored
  `s1f2_pos1` marker at local `(-4.847879, 1.285581, 1.734840)`, while
  `mapNavi_data` displaces Field05 by 2048 units from Field04. Live probing
  established that this client map displacement is inverted on the server's
  world X axis. The initial probe `(-1142.848, 1.286, 1001.735)` established
  the correct island. The party landing was then captured farther onto its
  western shore at `(-1098.503, 0.795, 1009.137)`, facing `1.522`; normal NPC
  entry, `!testskirmish turtleback`, and `!warp turtleback` all use it. The alternate probe
  `(905.152, 1.286, -1046.265)` is a separate rock formation retained as
  `!warp randomrocks` for future research.
- A 349-node live navigation capture bounds the walkable Turtleback island at
  approximately `X -1094..-957`, `Z 979..1068`. The reward coffer continues to
  use recorded walkable node 112 near its center, `(-1027.330, 3.834, 1022.994)`.
  Five later live captures now form the enemy spawn pool: `(-1023.774, 3.406,
  1013.191)`, `(-1006.951, 3.465, 1033.836)`, `(-1033.607, 2.828, 1041.958)`,
  `(-1048.301, 3.194, 1036.843)`, and `(-1018.086, 2.125, 1044.797)`, with
  their captured facings retained.
- The authoritative visual discriminator is the map silhouette supplied from
  the client: Turtleback is one compact rounded island. The four-lobed island
  map is Locke's Lie.

| Canonical roster | Recovered target | Notable recovered actions |
|---:|---|---|
| 1 | Greater Buffalo | Onrush, Seismic Rift (Japanese/player `Seismic Lift`), Sonorous Blast, Pulverizing Pound (Japanese/player `Deadly Stomp`) |
| 2 | Wadjet | Sand Breath, Stone Gaze/afterglow, Heavy Stomp, Body Slam |
| 3 | Bixie | Fire/Cold/Thunder Breath, Chaotic Chorus, Scorpion Sting, Bat Descent, Ice/Thunder Roar, Flame Breath |
| 4 | Steropes | 10/100-tonze Swing and Swipe, Animal Instinct, Eye of the Beholder, Glower |
| Final | Stone Golem | Stone Skull, True Grit, Plaincracker, Heavy Heel, Boulder Clap, Molten Core, Landslide |

## Implemented runtime behavior

- Native NMRush01/NMRush02 timer HUD, including the recovered direct `1` start
  and direct `3` finalize signal.
- All Skirmish enemies run at the recovered level 55, matching both the
  preserved monster table and the repository's BNPC min/max-level rows.
- Every Skirmish-spawned enemy is completely immune to Sleep. The resistance
  is applied by the encounter director, so ordinary versions of the same
  monster families outside Skirmish are unchanged.
- Skirmish enemies finish their death animation, enter the terminal dead state,
  and are then removed from the client and private zone. Encounter resolution
  preserves a dying final boss long enough to complete that sequence.
- Skirmish enemies and participating players use normal nameplates without the
  Guildleve scroll icon; the victory coffer retains its interaction icon.
- Every Skirmish enemy uses a 30-yalm sight aggro range applied by the encounter,
  without changing its ordinary-family counterpart outside Skirmish.
- Steropes' recovered Cyclops actor class ends in a directory slash. Dynamic NPC
  class-path normalization now trims that slash before generating its actor name,
  preventing the fourth Turtleback wave from crashing the zone update thread.
- Dynamic private instance in the correct island zone, return-point recovery,
  party content group, timed re-entry expiry, and automatic return after result.
- Entry fails closed when the loaded zone does not use its expected `sea_s1`
  copy region, preventing a stale database from silently loading La Noscea.
- Party members receive centered, non-overlapping left/right slots across the
  landing instead of stacking at one coordinate.
- Authoritative entry validation plus a solo GM test path.
- Locke's Lie four-front/final-boss lifecycle.
- Turtleback fixed-order kill-or-six-minute sequential lifecycle and final-boss
  gate. Its five-enemy roster divides the 30-minute limit into six-minute arrival
  windows. Each run shuffles the five captured transforms without replacement,
  so timed-overlap enemies use distinct valid positions. A later wiki calls the
  enemy order randomized, but the contemporaneous eLeMeN table and release-window
  observed progression agree on the implemented order.
- Encounter-specific DAT command sets for every variant, so NMRush bosses do
  not fall back to incomplete ordinary-family skill lists.
- Sonorous Blast uses its native client status row `223192`; the earlier
  compatibility-only status ID was removed because it crashed the retail
  client when Greater Buffalo's cast resolved. It is correctly non-damaging:
  the native status and eLeMeN both identify an enmity-generation penalty. The
  30-second duration and 50% reduction are explicit server policy because no
  retail duration or magnitude survives. Its result now uses the generic
  command/status messages instead of falsely reporting a zero-damage hit.
- Recovered ranged-auto-attack behavior for Akoman, Eurylochus, Princess of
  Pestilence, Greater Buffalo, Wadjet, and Stone Golem.
- Radius-aware combat distance for oversized models. Player commands measure
  range to the monster's surface, and large melee monsters stop their chase at
  the edge of their model rather than standing on the player's center. The
  Kujata/buffalo, chimera, basilisk, cyclops, golem, treant, ogre, yak, and boar
  family defaults also apply to those monsters outside Skirmish; encounter data
  can override an individual radius.
- A hard 30-minute failure deadline measured from instance creation, including
  the client landing gate, plus a 10-second all-dead grace before defeat.
- Persisted Skirmish timer row with the recovered 15/5-minute result cooldown.
- Reconnecting participants are rebound to the live NMRush director before the
  login actor bind, receive the current timer/result state after zone-in, and
  are restored to the instance party. The participant reference is also replaced,
  so reconnecting during the initial landing gate cannot strand encounter startup
  on the stale session. Map Server registers that party and the original re-entry
  expiry with World Server, which remains authoritative and
  retains membership across logout—even when every member disconnects. The
  retained party cannot be disbanded or mutated until defeat, individual exit,
  or expiry. A disconnected participant with a valid re-entry ticket does not
  count as a party wipe.
- One shared victory coffer. Opening it assigns one random Giantsgall weapon to
  one connected participant still in the instance; the opener and recipient
  need not be the same player, and dead players remain eligible.
- Victory uses live-captured coffer placements: Locke's Lie at
  `(1035.157, 1.081, 1010.785)`, rotation `-2.636`, and Turtleback at
  `(-1073.992, 2.684, 1022.557)`, rotation `0.882`. On battlefields without a
  captured point, a natural clear uses the final boss's actual death position
  and `!testskirmish win` uses a participant-relative fallback.
- The coffer plays its native `b923/e003` opening motion for all participants
  and remains visibly open for the successful instance. Victory stops the
  encounter timer and does not eject online players, so they can loot at their
  own pace. Guildleve bonus coffers use the same animation path but despawn
  after two seconds.
- The recovered shared coffer actor class (`1200161`) has no property flags.
  Skirmish therefore publishes its targetable bit and interaction icon before
  adding the dynamic actor to area visibility. This keeps both Skirmish coffers
  targetable without changing ordinary Guildleve coffer actor-class behavior.
- Victory uses live-captured Berkoeya placements: Locke's Lie at
  `(1038.312, 1.040, 1008.240)`, rotation `0.353`, and Turtleback at
  `(-1080.890, 2.110, 1019.516)`, rotation `-2.352`. The 2.5-yalm
  participant-relative placement remains a fallback for uncaptured fields.
  Recovered actor classes `1002088` and `1002089` are the respective NMRush01
  and NMRush02 island copies of Berkoeya (`1002087` is his Limsa entry copy).
  Speaking with him uses the client class's native `processReturnAsk`
  return-to-Limsa conversation and returns each player to the exact point saved
  on entry. The completed instance is cleaned up after everyone leaves, or
  after all offline re-entry tickets expire.
- Dedicated Skirmish music, The Seventh Gate (client music ID `9`).
  The regional-music inference in the later research report is superseded here
  by the client-oriented music table, which identifies this track specifically
  as Skirmish music.
- Stone Golem's sourced physical/thunder resistance and water weakness profile.
- Missing Akoman-daewa and Longhorn-add BNPC types are added to the consolidated
  NM SQL with their recovered actor classes and family skill lists.

## Explicit reconstructions

No surviving source found during this pass publishes exact Skirmish HP values,
outgoing damage coefficients, resistance multipliers, multi-weapon reward
threshold, or individual mob world coordinates. Battlefield landing coordinates
are now available, and enemy level is no longer unresolved: the preserved
monster table lists all variants at level 55.
Those values are therefore not represented as retail-exact:

- Authored HP is 12,000 for adds, 24,000-30,000 for Locke's Lie named targets,
  and 32,767 for the final/Turtleback bosses. This matches the reports that the
  enemies had unusually large HP pools and respects the 1.x signed-short cap.
- `skirmish_mob_hp_scale` defaults to `1.0`.
- `skirmish_mob_damage_scale` defaults to `1.20` on top of the server's existing
  notorious-monster tuning. Fixed-damage mechanics such as 1000 Needles remain
  fixed.
- Large-model combat radii are reconstructed family values: Greater Buffalo
  `7.5`, Bixie `4.5`, Wadjet `4.0`, Steropes/Stone Golem/Great Elm `3.5`,
  Aetherbound Slave `3.0`, and boar/yak variants `2.5`. They are isolated from
  visual model scale and can be tuned from live spacing tests.
- The base reward is one randomly assigned Giantsgall weapon in one shared
  coffer. Release-window posts also report two weapons on some clears and suggest
  a speed condition, but no trustworthy threshold or formula survives. The
  implementation intentionally does not fabricate that bonus tier yet.
- Locke's Lie uses all nine captured terrain anchors across its four fronts and
  Great Elm, with no more than three actors and five-yalm spacing at any local
  anchor. Turtleback uses five
  live-captured walkable transforms as a randomized no-repeat pool; whether
  these were the exact retail enemy spawn points remains unknown.
- Client same-place groups pair territories `236/269` and `237/270`. The
  installed resource binding proves retail region `108 = sea_s1`, including
  Field04 and Field05; regions `134/135` are copy/debug packs. The archived
  `(3173.087, 0.975, 614.175)` Field02 scene therefore remains research-only.
  The location-list landings `(950, 1, 1040)` and `(3050, 40, 500)` must be
  judged anew in their correct Field04/Field05 scenes.
- Client localization rows now resolve `Catawall` to Caterwaul (`23097`),
  `Seismic Lift` to Seismic Rift (`23298`), `Deadly Stomp` to Pulverizing Pound
  (`23296`), and remembered `Bow Down` to Bough Down (`23439`). `Dissolve` and a
  few other source labels remain unconfirmed rather than receiving invented IDs.
- Stone Golem's `0.25` physical/thunder multipliers and `1.25` water multiplier
  preserve the recovered strong-resistance/weakness relationship, but those
  exact numeric coefficients are reconstruction values.
- Keeping the opened Skirmish coffer available until the successful instance is
  vacated is an intentional server policy; no surviving source supplied a
  separate post-victory timeout. Guildleve coffers use a two-second opened
  display before cleanup.
- The 10-second wipe grace is server lifecycle policy, not a claimed retail
  timing value.

## Test commands

Import `Data/sql/server_battlenpc_mob_types_loot.sql` after updating the server
database, then use:

```text
!testskirmish lockes
!testskirmish turtleback
!testskirmish status
!testskirmish win
!testskirmish fail
!testskirmish timeout
!testskirmish exit
```

The strict production validator can be exercised with a valid party through:

```text
!testskirmish retail lockes
!testskirmish retail turtleback
```

The deterministic data contract is runnable with:

```text
dotnet run --project "Fishing Tests/Fishing Tests.csproj" --no-restore -- --skirmish-only
dotnet build "World Server/World Server.csproj" --no-restore
```
