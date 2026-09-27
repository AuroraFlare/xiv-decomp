# Opening Grand Company NPC restoration — 2026-09-16

**Implementation prepared; all 11 world placements recorded in main SQL.** All eleven actor
definitions now have a usable client class and talk binding in the main SQL.
Their existing appearance rows match the native graphic export in all 40 fields.
No new public spawn is published until its floor and facing have been checked.
No live database update, server restart, quest enablement, or successful client
NPC interaction is claimed by this pass.

The earlier [readiness audit](gc_opening_quests_readiness_2026-09-16.md) was a
pre-restoration snapshot. Its missing-class findings are addressed here; its
missing-spawn findings are addressed in main SQL. Live installation, NPC
rendering/interaction and full quest playthrough remain open.

Raaka Maaka's user-adjusted capture is now published as main-SQL spawn row
**3232** in zone **230**: X **-842.657532**, Y **3.104267**, Z **270.509735**,
rotation **-2.446702**. The user completed the requested height/facing correction
and capture, then replied `done :D`. The exact log receipt is pinned in
`Data/quest_npcs/evidence/raaka_maaka_floor_20260916.json`. These are user-standing
coordinates and chosen facing, not recovered retail actor XYZ. The native NPC's
rendering and dialogue have not yet been tested.

Bamponcet's subsequent user-confirmed capture is published as main-SQL spawn
row **3233** in zone **230**: X **-853.559998**, Y **4.000000**, Z **268.119995**,
rotation **-2.446702**. The exact receipt is pinned in
`Data/quest_npcs/evidence/bamponcet_floor_20260916.json`. The same user-standing
coordinate/facing and untested NPC-rendering scope applies.

C'ndanya's user-confirmed capture completes the three Limsa contract contacts:
main-SQL row **3231**, zone **230**, X **-828.913147**, Y **6.000000**,
Z **256.318420**, rotation **-0.731768**. Its receipt is
`Data/quest_npcs/evidence/c_ndanya_floor_20260916.json`. These remain user-standing
placements with chosen facing; model rendering and dialogue are untested.

Urianger's Ul'dah variant has a user-confirmed Western Thanalan capture:
main-SQL row **3228**, zone **172**, X **-1722.310059**, Y **56.414021**,
Z **102.220001**, rotation **-0.731768**. Its exact receipt is pinned in
`Data/quest_npcs/evidence/urianger_uldah_floor_20260916.json`. The user corrected
the starting height and confirmed completion of the floor/facing capture. The
native marker is a search/interaction point; this accepted standing position
does not establish the retail visible-actor presentation. NPC rendering and
dialogue remain untested.

Urianger's Limsa variant has a user-confirmed Eastern La Noscea capture:
main-SQL row **3226**, zone **130**, X **1528.579956**, Y **60.752934**,
Z **-1258.280029**, rotation **2.474215**. Its exact receipt is pinned in
`Data/quest_npcs/evidence/urianger_limsa_floor_20260916.json`. The user confirmed
completion of the floor/facing review and capture. The search-marker and
reconstructed visible-actor limitations above also apply here; native NPC
rendering and dialogue are untested.

Urianger's Gridania variant completes the three search-point captures:
main-SQL row **3227**, zone **154**, X **1195.693359**, Y **0.075892**,
Z **1090.483887**, rotation **1.427706**. Its exact receipt is pinned in
`Data/quest_npcs/evidence/urianger_gridania_floor_20260916.json`. The user
adjusted the starting position/height and confirmed the floor/facing capture.
The search-marker and reconstructed visible-actor limitations also apply here;
native NPC rendering and dialogue are untested.

Ailith's user-confirmed Quarrymill capture is published as main-SQL row
**3229**, zone **154**, X **1415.915771**, Y **-14.134044**, Z **929.076660**,
rotation **1.377785**. Its exact receipt is pinned in
`Data/quest_npcs/evidence/ailith_floor_20260916.json`. The user completed the
direct target jump, height/facing correction and capture. These are accepted
user-standing coordinates and chosen facing; NPC rendering and dialogue remain
untested.

Ebrelnaux's user-confirmed Millers' Glade capture is published as main-SQL row
**3230**, zone **145**, X **1335.983643**, Y **227.415268**, Z **1336.344849**,
rotation **0.788632**. Its exact receipt is pinned in
`Data/quest_npcs/evidence/ebrelnaux_floor_20260916.json`. The user completed the
direct target jump, floor/facing review and capture. These are accepted
user-standing coordinates and chosen facing; NPC rendering and dialogue remain
untested.

Quiliane's user-confirmed Owl's Nest capture is published as main-SQL row
**3234**, zone **145**, X **2555.627686**, Y **173.186462**, Z **1279.944946**,
rotation **-1.884829**. Its exact receipt is pinned in
`Data/quest_npcs/evidence/quiliane_floor_20260916.json`. The user corrected the
starting position/height and confirmed the floor/facing capture. These are
accepted user-standing coordinates and chosen facing; native NPC rendering
and dialogue remain untested.

Yuhelmeric's user-confirmed Owl's Nest capture is published as main-SQL row
**3235**, zone **145**, X **2550.820068**, Y **175.351761**, Z **1304.719971**,
rotation **-2.269449**. Its exact receipt is pinned in
`Data/quest_npcs/evidence/yuhelmeric_floor_20260916.json`. The user completed the
direct target jump, height/facing correction and capture. These are accepted
user-standing coordinates and chosen facing; native NPC rendering and dialogue
remain untested.

Vairemont's Owl's Nest capture completes the placement set. His original standing
capture is zone **145**, X **2632.379150**, Y **175.228470**, Z **1368.479736**,
rotation **-2.375754**. Its exact receipt and location comparison are pinned in
`Data/quest_npcs/evidence/vairemont_floor_20260916.json`. The capture arrived
after a reminder, and the user then asked whether the target was right. It is
**0.247 yalms** from native Into the Dark marker **11175003**, which names
Vairemont (**1200019**). Native `com5u1.csv` rows 7/13 place this interaction at
Owl's Nest, and rows 14/15 identify the contact as Vairemont. Another quest-family
marker, **11016103**, uses the same name **82.403 yalms** away at
`(2565.75,1319.579956)`. Keep this reconstructed home scoped to the selected
quest marker; neither marker recovers a universal retail actor home or facing.
The saved Y/facing are the user's capture, and NPC rendering/dialogue are untested.

The user subsequently authorized correcting the horizontal position while keeping
the feet height. Main-SQL row **3236** therefore uses native marker X
**2632.199951** and Z **1368.310059**, retaining exact captured Y **175.228470**
and rotation **-2.375754**. The 0.247-yalm adjustment and authorization are
recorded separately in the manifest and evidence; the raw log receipt is unchanged.
This adjusted X/Z has no separate client floor check. The other ten homes retain
their complete captured XYZ and facing.

## Recovered locations

The native `quest_marker.csv` retains older quest numbering. Looking up only the
server quest IDs misses real markers and can instead return placeholder Baderon
aliases. These selected rows have the expected display names, region/map and
quest-family context. They are map targets, **not recovered actor XYZ/facing**.
In particular, the three Urianger markers are named `???`; their exact world
presentation/trigger remains reconstructed. Scene-local actor positions have not
been silently substituted for these public interaction targets.

| Actor | Actor ID | Quest / visible sequences | Native marker | Zone | Target X / Z |
|---|---:|---|---:|---:|---|
| Urianger, Limsa | 1500204 | 111401 / 20, 30 | 11150002 | 130 | 1528.579956 / -1258.280029 |
| Urianger, Gridania | 1500314 | 111601 / 20, 30 | 11160002 | 154 | 1196.359985 / 1090.579956 |
| Urianger, Ul'dah | 1060009 | 111801 / 20, 30 | 11170002 | 172 | -1722.310059 / 102.220001 |
| Ailith | 1001628 | Permanent default talk; 111601 objectives 10, 40 | 11160001 | 154 | 1415.5 / 929 |
| Ebrelnaux | 1060011 | 111404 / 30 | 11150303 | 145 | 1337 / 1337 |
| C'ndanya | 1001632 | 111804 / 30 | 11170306 | 230 | -828.25 / 255.580002 |
| Raaka Maaka | 1001631 | 111804 / 30 | 11170305 | 230 | -842.25 / 271 |
| Bamponcet | 1001633 | 111804 / 30 | 11170304 | 230 | -853.559998 / 268.119995 |
| Quiliane | 1001635 | 111411 / 20, 40 | 11155004 | 145 | 2556.629883 / 1280.260010 |
| Yuhelmeric | 1000370 | 111611 / 10, 40 | 11165003 | 145 | 2550.820068 / 1304.719971 |
| Vairemont | 1000586 | 111811 / 10, 30 | 11175003 | 145 | 2632.199951 / 1368.310059 |

The native `Com5l1`, `Com5g1`, and `Com5u1` dialogue independently places the
three dungeon contacts at Owl's Nest. `Com0l4` places Ebrelnaux at the Millers'
Glade windmill on Briar Lake. Ailith's existing `DftFst` binding supplies her
ordinary dialogue. The other ten variants use an explicit active-quest policy
because no ordinary dialogue binding has been established for these IDs.
This is a conservative server policy, not proof of retail disappearance rules.

[Lavren's Arms Race recording](https://www.youtube.com/watch?v=OxWLJFjNA60&t=612s)
shows Bamponcet on a stone pier beside a barrel at 10:12. At 10:27 Raaka Maaka
stands on the separate **wooden** pier beside crates. Copying the nearby stone
pier's height would be unsafe. The 9:28–9:53 approach in
[Engineering Victory, part 2](https://www.youtube.com/watch?v=f2fn4Qff5os&t=568s)
shows the Millers' Glade windmill and its ramp/platform; this supplies landmark
context, not world XYZ or the shipped client's interaction policy. Upload ages
do not establish an exact patch date. No footage establishes numerical facing.

## Implementation

- `Data/sql/gamedata_actor_class.sql`: eleven explicit `PopulaceStandard`
  bindings with property flags 19 and `talkDefault` conditions. The client class
  exists in the recovered native script. Assigning it to these blank rows is a
  server reconstruction; the original actor-to-class table was not recovered.
- `Data/sql/gamedata_actor_appearance.sql`: all eleven complete native models
  and equipment records were already present; the builder verifies rather than
  replaces them.
- `Data/sql/server_eventnpc_spawn_locations.sql`: generated restoration block
  contains all eleven captured homes as active INSERTs. Future unreviewed
  captures remain comments until floor/facing review; the current set has none.
- `activeQuestVisibility` in the existing event-condition JSON allows an OR
  list of accepted quest IDs and sequences. Absent policy preserves ordinary
  NPCs; an empty list hides the actor. Completed, abandoned, unrelated-company,
  and out-of-sequence quests cannot expose the scoped variants.
- Session visibility enforces the policy. Known actors remain until an open
  native event ends, preventing a sequence advance from removing an NPC while
  its dialogue still references it. This grace never reveals an unknown actor.
  Incoming events independently reject ineligible NPCs, preserving unrelated
  open RPCs instead of closing them.
- The affected quest wrappers now return the recovered native map markers.
  Arms Race removes collected-contract markers. Other NPCs/markers and dungeon
  mechanics are outside this restoration.

## Floor and facing capture

`!gcnpc` is GM-only and loaded as a normal Lua command. It requires no new DLL
to collect positions. The visibility feature does require the new server build
before its SQL policies are used in live quests.

1. Use `!gcnpc goto <actorId>` to jump directly to the native target X/Z. It
   preserves your current Y and facing, including across zones; the user then
   corrects the height. This is a positioning aid, not floor evidence. The
   recorded approaches below remain optional. Settle onto the intended floor
   before capture. Use `!mypos` or `!gcnpc info <actorId>` to orient.
2. Stand within five yalms of the native target, checking solid floor, feet and
   clear space. Face the direction the restored NPC should face.
3. Run `!gcnpc capture <actorId>` and retain its `[GcNpcFloor]` chat line (also
   emitted to the debug log when debug logging is enabled). The command
   rejects another zone, a private area, an open event, nonfinite coordinates,
   and distant captures. A distant same-zone capture prints east/west and
   north/south walking offsets; approach points are not automatically accepted
   as NPC homes. It changes neither quests nor database rows.
4. Record the accepted capture and visual/facing review in that actor's
   `placement` entry in `Data/quest_npcs/gc_opening_npcs.json`. A capture is a
   proposal; the command cannot prove collision or visual acceptance itself.
5. Run the builder and checks below. Published rows use captured X/Y/Z/rotation
   by default. Vairemont's separately documented, user-authorized 0.247-yalm
   correction uses marker X/Z while preserving his captured feet Y and facing.
   Never silently replace a captured height or discard the original receipt.

Approaches from recorded movement (not proposed NPC homes):

```text
# Limsa lower docks — walk between the stone, wooden and upper pier levels
!pos 230 -851.1103 4 266.39224
# Eastern La Noscea — Urianger search point
!pos 130 1529.1261 60.752934 -1257.375
# Western Thanalan — Urianger search point
!pos 172 -1719.3662 56.31555 102.21105
# South Shroud — walk east to Urianger, then northeast to Ailith/Quarrymill
!pos 154 1160.3007 -0.566289 1103.932
# Millers' Glade — inspect the windmill contact location/platform
!pos 145 1337.7931 227.41527 1337.6824
```

Before this capture session, Owl's Nest had no close recorded movement in the
inspected zone-145 recording. The session now supplies the three contact captures.
An existing public Janlenoux spawn is at `(2555.74,175.83,1306.52)` in zone 145
and can orient a manual visit. Its Y is **not** a heightmap for the three new
contacts. Primary recordings and the applicable frozen premerge recordings
were inspected separately; no synthetic movement edges or floors were created.

## Reproduction and validation

```powershell
python -B tools/restore_gc_opening_npcs.py build
python -B tools/restore_gc_opening_npcs.py check
python -B -m unittest discover -s tools -p test_restore_gc_opening_npcs.py
dotnet build 'Map Server/Map Server.csproj' -c Release -o .tmp/gc-npc-fix --no-restore
dotnet run --project tools/job-gc-lifecycle-tests -- --server-assembly '.tmp/gc-npc-fix/Map Server.dll'
dotnet run --project tools/ferry-transport-tests -- --server-assembly '.tmp/gc-npc-fix/Map Server.dll'
```

The builder pins the native inputs, checks every appearance field, validates
marker identity, rejects spawn-ID/actor collisions and requires explicit floor
and facing review. All inputs/collisions are checked before writes. The main SQL
remains the complete source for every **published** change; no migration-only
data exists.

This pass: build succeeds with four existing dependency warnings; 197 NPC
binding/visibility/real-Lua-marker checks, floor-capture guards, four builder
regressions, 30 lifecycle cases/526 assertions, compiled scene/transition
guards and 1,139 travel assertions pass. All eleven captured homes are in main
SQL; live installation, rendering, interaction acceptance and exact retail
placement/visibility/trigger fidelity remain pending.
