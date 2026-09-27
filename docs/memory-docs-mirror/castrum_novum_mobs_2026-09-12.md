# Castrum Novum public population — 2026-09-12

**Current override:** the [September 13 reduction](population_reduction_2026-09-13.md)
leaves **84** actors (74 ordinary, ten protected). The original 133-post
evidence below remains frozen; current exports and previews show survivors.

Zone **190**, native Mor Dhona MapNavi **3500**. The public garrison uses
the new 9,279-node / 4,212-edge recording. All 133 enemy posts and three coffer
candidates use exact source-local recorded XYZ. No ground interpolation or new
navmesh links are generated. The lower Mor Dhona paths beneath/beside the fort
are excluded by reviewed sector bounds and elevation ranges.

## Public roster and the United We Stand boundary

| Population | Level | Count |
| --- | --- | --- |
| Imperial Secutor, Hoplomachus, Laquearius, Eques, Sagittarius, Medicus, Signifer | 55 | 13 each / 91 |
| Imperial War Hound | 54–55 | 13 |
| VIIth Legion Centurion | 57 | 13 |
| Magitek Vanguard | 58 | 6 |
| Elite variants of the seven Imperial roles | 56 | 1 each / 7 |
| Magitek Vanguard H-I | 61, 62, 63 | 1 each / 3 |

The [June 2012 Castrum archive](https://web.archive.org/web/20120624082006/http://ffxiv.gamerescape.com/wiki/Castrum_Novum)
lists both public enemies and event enemies. Its NM category says **None**;
the three H-I key bearers receive the server's boss flag here, without inventing
additional named NMs. The archive uses H-1; the native actor name uses H-I.

**United We Stand has an open-world approach followed by a separate battlefield.**
The saved [Ul'dah quest page](ffxiv-1.0-wiki/regions/United_We_Stand__Ul_dah.html)
describes a four-to-eight-player fight against F-I, the transmitter, generators
and recurring level-55 VIIth Legion reinforcements. The
[VIIth Legion Secutor subpage](https://web.archive.org/web/20120624082006/http://ffxiv.gamerescape.com/wiki/VIIth_Legion_Secutor)
specifically tags its level-55 Castrum entry as United We Stand. These seven
event troop roles, F-I, transmitter and generators are **not added** to zone 190.
The public level-57 Centurion has a separate non-event archive entry and is included.
Public layout 501 is distinct from the Transmission Tower's layout 511 / duty
zones 251 and 264. Existing private encounters and existing Mor Dhona mobs are preserved.

The [Elite Eques page](https://web.archive.org/web/20120816091806/http://ffxiv.gamerescape.com/wiki/Elite_Eques)
identifies it as a level-56 Lancer assisting the level-63 H-I. Sampled frames in
[Raveheart's 1.23b Gold coffer run](https://www.youtube.com/watch?v=HSzTBI0Nwbo)
show the level-63 fight at 0:19, movement along the fortress wall at 8:33–8:48,
and level-56 Elite Eques/Sagittarius linking at 9:08. The uploader reports a
Dalmatica reward. This supports the inner Elite group, but does not establish
an exact retail formation or surveyed chest coordinate.

## Authored placement and combat choices

The entry yard, middle courtyard, northbound corridor and inner lake have mixed
troop posts, with two open pockets and clear space around native gates and
coffers. Ordinary posts are at least 9 yalms apart horizontally on the same
floor; the linked inner boss group uses 8. Posts remain stationary (`roams=0`)
to keep patrol movement from crossing unreviewed walls and closed gates.
Recorded movement establishes ground at each chosen point; it does not prove
every surrounding surface or a complete retail patrol route.

Profiles **39700–39719** are scoped to this population. The native Imperial and
Elite actor appearances/class bindings are retained and hashed alongside exact
reviewed donor profiles. Secutor is Pugilist, Hoplomachus Gladiator, Laquearius
Marauder, Eques Lancer, Sagittarius Archer, Medicus Conjurer and Signifer
Thaumaturge. These use the existing job-specific combat lists: 86, 91, 90, 88,
87, 85/Conjurer spell list 4, and 89/Fire–Thunder spell list 2 respectively.
The wolf uses family list 5062. These are existing server combat kits, not a
claim that every retail stronghold spell or ability has been reconstructed.

Vanguards use family list **5059: Cermet Drill and Drill Cannon**, as supported
by the saved [eLeMeN Vanguard family](http://elemen.sakura.ne.jp/ff14_dated_archives/monster/bestiary/Vanguard.html).
The reviewed guildleve donor's generic list 45 is deliberately overridden only
in the new profiles: list 45 is the Juggernaut's Magitek Cannon. No guildleve,
quest, private encounter or shared donor profile changes.

The inner level-63 H-I and seven Elite guards share `linkGroup=castrum_h1_gold`.
Their `spawnGroup` is empty so all eight actors can coexist. One guard per job,
the group composition and exact locations are authored. The three H-I profiles
use provisional HP of 20,000 / 24,000 / 30,000 and 300-second respawn; ordinary
troops use the existing level-scaled stat fallback and 60-second respawn.

The [2012 H-I spawn discussion](https://forum.square-enix.com/ffxiv/threads/48920-Castrum-Novum-H-1-spawn-system)
contains a time-window theory later contradicted by an all-day spawn. Subsequent
reports describe clearing Garleans inside the lake wall to summon level 63,
but the precise placeholder/reset rules remain unresolved. **This pass uses
fixed respawning key bearers; it does not reconstruct the retail summoning or
day/night patrol systems.**

## Keys and coffers

The later archived roster maps level 61 → Copper key 10011213, 62 → Silver
10011214, and 63 → Gold 10011215. That explicit table is used here; the earlier
conflicting forum report remains documented in [the coffer guide](open_world_coffers.md).
Key drop chance is the existing server's provisional 3% policy, not a recovered
retail rate. Steel Joint/Plate on Vanguards, Fiber/Rubber on Centurions and
Fang/Pineapple on War Hounds are recorded item associations with authored 10%
chances and quantity one. Guards do not inherit donor loot or keys.

Copper and Gold receive active authored ground positions using the existing
coffer framework, lock IDs and provisional sole rewards (Fiber and Imperial
Operative Dalmatica). Their retail XYZ, complete pools and probabilities remain
unverified. **Silver's position is disabled because no reward table was recovered.**
Its key bearer is implemented; the Silver chest will not appear yet. A disabled
candidate cannot consume a player's key.

The migration adds a candidate only when that coffer has no existing position
and its native zone/key/actor identity matches. Existing GM-captured positions,
custom definitions and rewards are retained. No reward-table rewrite or runtime
coffer change is included.

## Files, build and installation

- Manifest: `Data/mobplacements/castrum_novum.json`.
- Frozen movement and research: `Data/mobplacements/evidence/castrum-novum-20260912/`.
- Plans, capture CSV and additive placements: `Data/mobplacements/castrum_novum/`.
- [Interactive preview](maps/castrum-novum-20260912/index.html), with exact enemy/coffer teleport commands.
- Generator: `python -B tools/mobspawns/castrum_novum.py plan|build|check|render`.
- Tests: `python -B -m unittest discover -s tools/mobspawns -p test_castrum_novum.py`.

`plan` writes review artifacts only; `build` also updates the scoped canonical
SQL blocks and [live migration](../Data/sql/live%20migrations/castrum_novum_20260912.sql).
The one-time authoring helper is not a routine regeneration command: later
changes should review and update the pinned manifest deliberately.

For an existing database, ensure the existing `server_open_world_coffers.sql`
schema/definitions are installed, then import **only the new live migration**
and restart the map server to load the population. Reimporting the entire
canonical spawn dump would replace unrelated placements. The migration is
additive and repeatable; a conflicting reserved profile receives neither new
spawns nor drops. Canonical fresh-install spawn IDs are 964000–964132; live
imports allocate IDs normally and retain deterministic placement UIDs.

This work changes project data; it does not import the running database or
restart the user's server. In-game visual/aggro review is still needed at the
specific new posts and coffer locations.

Validation: all 10 Castrum regression tests and 18 map-coordinate tests pass.
The generated-output check passes. The reviewed PNG and browser overlay cover
all selected posts, and the browser's ground-layer toggle was exercised.
Import tests cover repeated imports, unrelated public/private actors, profile
collisions, key isolation, exact recorded floors and existing GM coffer positions.
