# Darkhold placement correction from original 1.x recordings

This review supersedes the room assignments and counts in the first grounded
placement pass. That pass preserved floor samples but distributed an inferred
roster incorrectly: the entrance was crowded, Grand Hall contained skeletons,
the Gullet's circles were in Grand Hall, and long corridors were empty.

## Evidence and limits

Primary footage reviewed directly in the browser:

- [Order of The Blue Garter — Dzemael Darkhold (SR5C)](https://www.youtube.com/watch?v=WsaKqBbe4kY), supplied by the user; 13:20 duration.
- [FFXIV 1.0 Dzemael Darkhold 15min](https://www.youtube.com/watch?v=WmJxkVbowSI), Sylvarion Ryulong; 15:01 duration.

Timestamps below are video playback times, not the dungeon's countdown.
The later clock audit in `Data/raidroutes/dzemael_video_clock_review.json`
finds 1.8 in-game seconds per playback second over Blue Garter's sampled
7:30–10:00 span. Do not use these seek labels directly as encounter durations
or apply that factor to the separate Chain Bearer timing source.
The first recording includes frame blending: duplicated text from adjacent
frames is not evidence of two enemies. Yellow names can also belong to enemies
returning home after a pull. Neither footage nor its uncalibrated minimap gives
an exact server XYZ or a complete spawn-count table.

| Manifest evidence key | Observation and source | Placement decision |
| --- | --- | --- |
| bg-opening | BG approximately 0:35–1:00: hippogryphs along the approach, then a Bone Nix; second run 1:30 also shows the toad and returning hippogryphs | Six spaced hippogryphs and an approach toad; remove entrance Eye/orobon |
| bg-stables | BG 1:20: Orobon in the Stables and a pulled Nix; 1:40: hippogryphs along the outside corridor | Orobon group inside, hippogryphs outside; pulled toad not used as an inside-room anchor |
| bg-first-gate | BG 1:00 approach circle, 1:20 chat confirms the Stables gate unlock | Add a terminal before door 1406 |
| bg-second-gate | BG 1:40–1:55 exterior circle and Gullet unlock | Add a terminal along the outside connector before 1408 |
| bg-gullet | BG 2:10: two circles, several Bone Nix and Diamond-tooth Hedgemoles; 2:15 Grand Hall unlock | Move the 2/6 circle pair into the Gullet and expand its mole/toad group |
| bg-grandhall | BG 2:25 and second run 3:00: Imperial Myrmillos, Imperial Veles and Alpgrot Orobons around the three circles | Replace early skeleton/ghost groups with guards and orobons |
| bg-devils | BG 2:35–3:20, second run 4:30–6:00: post-field corridors and returning moles, hippogryphs, orobons, toads | Populate the previously empty first-map corridor sector; individual spacing remains reconstruction |
| bg-transporter | BG 4:00: Hellsbound Warriors at the transporter approach | Add two late first-map warriors, before the excluded wall branch |
| second-falls | Second run between transport and the Feasting Hall, including 7:30 combat log | Add map-two approach toad/ghost groups; offsets and counts remain authored |
| bg-deepvoid | BG 6:40: Deepvoid and Chain Bearers on the arena floor/ledge | Move Deepvoid farther inside; distribute eight Chain Bearers across recorded nearby floor/ledge points |
| bg-granary | BG 8:00–8:30: northern room, later Warlock's Buckler loot and a Nix on departure | Retain three objective drakes; replace unsupported Granary moles with ghosts/toads |
| second-knights | BG 9:20 and second run 10:30–10:50: Forsaken Souls and Soulgazer in Knights' Quarters | Replace the Knights' imperial group with ghosts, Soulgazer and an approach Nix |
| second-knights-wave | Later room seal/skeleton sequence, supported by the existing recovered ten-warrior encounter | Ten Hellsbound Warrior wave points in Knights' Quarters, spawned by its added seal |
| eye-walk | User explicitly requested walking without attacks; period NM page identifies progress-dependent patrol sectors | One Grand Hall actor, 83 consecutive recorded points, ping-pong traversal |
| retained-side-room | Captain's Quarters not established by the sampled main-route footage | Retain its earlier five placements without promoting their evidence |
| retained-arena | Existing recorded Batraal/add/terminal evidence | Preserve those points and the inactive later Soulgazer anchor |

The [2011 participant speed-run guide](https://forum.square-enix.com/ffxiv/threads/19663-Dzemeal-Darkhold-Speed-Run-Guide)
corroborates the 2/6 and 2/2/4 circle split, the subsequent corridor species,
and skeletons appearing after the later circles. Its strategies describe pulls,
so a combat location is not treated as an original spawn location.

Counts and rotations remain authored approximations, not a retail spawn dump.
The two new approach terminals use the existing six-person circle model/count;
the Knights' seal uses the existing four-person ten-warrior trigger. Exact
retail occupancy requirements, additional lower-room terminals, and their full
barrier sequence remain unresolved. GM solo tests scale these requirements to
one player. Ordinary lower barriers retain their previous Deepvoid release rule.

## Recorded ground and runtime

There are now **89 staged enemy placements**, one inactive Soulgazer relocation
anchor, **22 wave points** (12 Batraal adds and 10 Knights' skeletons), 10 devices,
six regular/objective coffers, five possible victory coffers, two GM landing
points and three portal sources: **138 active-manifest positions** in total.
Of these, 135 positions preserve one complete XYZ from the frozen 1,409-node
capture. The first two gate devices and upper-route Bone Nix now use the subsequent
user-supplied screenshot points described below.
The historical `(69.994, 178.620, 142.770)` floor observation is retained exactly
as evidence, but no longer used to put the Gullet's large circle in Grand Hall.
The user-excluded nodes **599–613** remain excluded from placements and patrols.

The manifest is `Data/raidroutes/dzemael_grounded_positions.json`; the generated
runtime is `Map Server/Dungeons/DzemaelGroundedPositions.cs`. Neither changes
public-zone SQL or the reviewed BNPC/profile IDs. Existing coffer/portal
coordinates remain preserved; this review does not revalidate their exact
retail offsets.

Entry now publishes the approach, then Stables after its terminal, then the
Gullet after the outside terminal. Both Gullet circles unlock Grand Hall and
withdraw surviving early foes. All five reward circles unlock the later route.
The three ordinary doors start locked and resume their instance-owned proximity
controller when their terminal conditions are met. Closed unused branches keep
their prior policy. Late-join barrier replay cannot override ordinary doors.

## All-seeing Eye walking route

`Data/actorroutes/dzemael_all_seeing_eye.json` follows consecutive capture nodes
**294–376**, reverses over the same path, and stays inside Grand Hall. It starts
at its exact first point when Grand Hall publishes and survives the next mob
withdrawal. It never crosses a gate or transport gap. The original later patrol
sectors and timing are still unresolved; this is a bounded authored patrol.

`recordedWaypoints` navigation interpolates small 3-D steps between adjacent
reviewed samples, carries recorded-ground movement ownership inside a private
instance, and retains normal collision/floor guards. Schema validation rejects
sample gaps above eight yalms and arrival radii above half a yalm. Runtime
refuses a distant start/relocation rather than walking a new straight line.
This avoids the ordinary private-instance path fallback ignoring recorded Y.

The Eye's recovered profile is validated before its active skill list is
cleared and auto-attacks are disabled. Its route has no action keys or cast
holds, and the manager also ignores Eye stop actions. Soulgazer retains its
existing behavior and does not acquire this walking-only override.

## Verification and client follow-up

Verification passed: 16 placement tests, 18 map-coordinate tests, scripted-route
ordering/schema tests, 69 traversal checks, 112 production Npc/Lua door checks,
and 6,142 Eye steps through the production floor guard in both directions.
The static validator parsed all five Lua files; shared door proximity tests
passed. The Release build passed with zero errors and four existing package
warnings. A local integration harness additionally has an existing NuGet
vulnerability-feed warning.
Updated maps are in `docs/maps/dzemael-grounded-20260908/`; traversal maps are in
`docs/maps/dzemael-traversal-20260908/`, each with its own coordinate frame.

For a fresh GM test, restart the updated Map Server and use `!dzemael enter nocs`.
Walk the first two terminals, the Gullet pair, and Grand Hall; inspect the Eye
with `!dzemael diag hazards`. Use `!dzemael diag portals` for the two map links.
The next client run must confirm model clearance, actual movement and door
schedulers. Offline floor checks do not establish those client observations.

Installed on 2026-09-08 after the Map Server stopped. The Release DLL and PDB
match the tested staging output. DLL SHA256:
`AFAE967AFD53E38A0794C00FAA2C619066C99E77BD343EEC4A9D6B7C1825F67C`.
Previous binaries: `.tmp/dzemael-before-video-install-20260908-192254/`.
Post-installation client testing has not yet been observed.

### Entrance follow-up

The user's subsequent `!mypos` screenshot supplies zone 231,
`(-90.073, 222.002, 239.891)`, rotation `1.542`, in private area `Dzemael`
(type `1000000`). All initial entrants now share this exact point and facing;
the previous `(-96, 228, 253)` entry and sideways party offsets were replaced.
This is the user's likely shared entrance, not a separately confirmed floor
test or proof of the retail spawn for every player. The original screenshot is
preserved at `Data/raidroutes/evidence/dzemael-20260908/entrance-mypos.png`, with
the scoped observation in `tools/mobspawns/map_coordinate_validations.json`.
Recorded route nodes and inter-map destinations remain as reviewed above.

The follow-up Release build passed with zero errors and the same four package
warnings; all 16 placement tests, 18 coordinate tests and the static/Lua checks
passed. Installed while Map Server was stopped, with DLL/PDB hashes verified
against staging. The current DLL SHA256 is
`06F201666D0E24F3B39A3308FA0B1ADFA250E125DB470E50B60894E79D7E1ACD`.
Backup: `.tmp/dzemael-before-entrance-install-20260908-192937/`.
The new entrance still needs a fresh client entry after restart.

### First gate device follow-up

The user identified the first door-opening device as too high and supplied
zone-231 XYZ `(65.563, 180.500, 199.840)` in private area `Dzemael`. The
`stablesgate` device now uses that exact point with no added visual Y offset.
It previously used node 106 `(64.421524, 181.27937, 207.26906)` plus `2.63`,
placing its actor at `Y=183.90937`. The original capture remains unchanged.
The screenshot is saved at
`Data/raidroutes/evidence/dzemael-20260908/first-magitek-mypos.png` and is linked
from the scoped `dzemael_first_magitek_device` observation in
`tools/mobspawns/map_coordinate_validations.json`.

Every device now has an explicit `visual_y_offset` in the placement manifest.
This first-device-only staging pass retained the other nine `+2.63` offsets.
The subsequent [complete noncombat correction](dzemael_noncombat_placements_2026-09-08.md)
supersedes it: all device, portal and GM-probe height lifts are removed.
The player's screenshot rotation
`-2.006` is preserved as evidence, without treating it as the device's facing.
This report does not infer a heightmap or validate other devices from this point.

Verification passed: 18 placement tests, 18 coordinate tests, static/Lua checks,
123 compiled device/door checks, and the existing 6,142 Eye movement checks.
The Release build passed with zero errors and the existing package/feed warnings.
Staged DLL SHA256:
`33B24747A023CAFD40961B0817A5F006E8B0151317EC99C0422BB8D385D2A185`.
Staging: `.tmp/dzemael-device-height-build/`. This first-device-only binary was
not installed; the complete noncombat build supersedes it. Its installation
status is tracked in the noncombat review linked above.

### Upper-route Bone Nix follow-up

The user identified `dzemael_mob_uppernix_7`, actor class `2303101`, in an actor
inspection screenshot. Its displayed position matches the former node-100
placement `(65.560814, 184.00458, 238.37323)` after rounding. Their second
`!mypos` screenshot supplies the requested replacement in zone 231:
`(62.911, 184.359, 240.074)`. Only `mob.upper_nix` moves. Its reviewed Bone Nix
BNPC profile `3134`, encounter stage and existing facing remain unchanged.
The player's facing `-0.542` is saved as screenshot evidence, not a requested
mob rotation.

Both images are preserved in `Data/raidroutes/evidence/dzemael-20260908/` as
`upper-nix-before.png` and `upper-nix-mypos.png`. The exact requested point is
registered as `dzemael_upper_nix` in `map_coordinate_validations.json`; it is
not labelled as a new ground-height test. The raw movement capture remains
unchanged. The rendered first-map overlay is updated.

The combined Release build passed with zero errors and existing package/feed
warnings. The static/Lua validator, 19 placement tests, 266 compiled placement
and door checks, and 6,142 Eye movement checks passed. The new build is staged
in `.tmp/dzemael-upper-nix-build/`; DLL SHA256:
`4EEAA1705A6AC982BD6F2FEA7958168F150A04220182E28857BB079771466E25`.
The running Map Server still uses the installed noncombat build; installation
of this Nix correction awaits closure of that process.

### Second gate terminal follow-up

The user supplied `(128.901, 180.046, 200.182)` in zone 231 as the likely second
magitek terminal location. `device.gulletgate` now uses this exact XYZ with no
height adjustment, replacing node 120 `(100.66533, 180.12949, 206.56374)`.
It lies before the native Gullet door (1408), consistent with its existing
unlock role. The screenshot and scoped `dzemael_second_magitek_device`
observation are saved under the same evidence/validation paths as the earlier
corrections. This remains a user-proposed location; it is not recorded as a
confirmed retail placement or separate floor test. The screenshot's player
facing `0.080` does not change the terminal's rotation.

The combined build in `.tmp/dzemael-second-terminal-build/` includes this move
and the pending upper Bone Nix move. Release build, static/Lua validation,
19 placement tests, 266 compiled placement/door checks, and 6,142 Eye movement
checks pass. DLL SHA256:
`C4FD4AB278CF69A9F727ED13E4396A0550F1415C7AD2340B14BAC55252D88C5E`.
This supersedes the Nix-only staging build; installation awaits Map Server
closure. The installed Release DLL still matches the earlier noncombat build.
