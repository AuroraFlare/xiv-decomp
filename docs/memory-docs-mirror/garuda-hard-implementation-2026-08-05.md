# Garuda hard-mode encounter evidence and implementation notes (2026-08-05)

> Live behavior was updated in the [2026-09-07 video implementation pass](garuda-hard-video-implementation-2026-09-07.md). That report supersedes this note's wind layout, contact timing/displacement, Silky lifecycle, and cast-aftermath descriptions. Native decomp evidence below remains applicable.

This note records what is source-backed, what is client-asset-backed, and what remains an explicit server tuning choice for the version 1.0 Howling Eye hard-mode implementation.

## Sources

- [Qi ZiXiao's July 2012 hard-mode clear](https://www.youtube.com/watch?v=rzVsuAo30hs): battle begins at approximately 1:51; Aerial Blast is readied at 5:36; west winds are logged at 5:46 with a go-middle call; south winds are logged at 7:18 with a kite call; and the clear occurs at approximately 8:30.
- [Archived eLeMeN hard-mode guide](https://web.archive.org/web/20151210031726id_/http://elemen.sakura.ne.jp/ff14_dated_archives/gamecontents/PrimalBattle/theHowlingEye_Hard.html): contemporary phase thresholds, plume counts and timers, tower behavior, winds, clones, Silky Plume, rewards, and re-entry timers.
- [Contemporary translated Japanese strategy](https://forum.square-enix.com/ffxiv/threads/44438-Garuda-Strat-from-a-Jp-Lodestone-Blog): the three distinct final patterns, clockwise South-wind tornado movement, fixed mirage layouts, clone HP/weaknesses, the one-minute clone check, and wind knockback.
- [Official 1.22b item-name correction](https://forum.square-enix.com/ffxiv/threads/44999): Square Enix confirmed that Vortex Totem and Vortex Headdress names/descriptions had been mixed up and were corrected.
- [Local Garuda client/battlefield audit](garuda-moogle-coffer-animation-decomp-2026-08-02/GARUDA_CLIENT_AND_BATTLEFIELD_FINDINGS.md): recovered m851 Garuda and m526 rock WSS selectors.
- [Tornado decomp and implementation audit](garuda-tornado-decomp-2026-08-05.md): recovered m999/e003 persistent state bits, WSS15/WSS18 action packages, and helper-owned damage behavior.

## Implemented encounter contract

- Four stone towers begin with three effective tiers each.
- Pre-Aerial Garuda attacks damage only towers inside the resolved skill geometry. Bristle Plumes assigned to towers damage one tier with Feather Lance if they survive for roughly 25 seconds.
- Mistral Song is one 50-yalm cone cast and Mistral Shriek is one circular cast. A player is immune only when a surviving tower lies between that player and Garuda at cast start; the server no longer fakes the mechanic by casting separately on every exposed player.
- Each ordinary tier loss is serialized so the client can present the authored top, middle, and low rock-break banks. Aerial Blast uses the full-collapse bank on every remaining tower before despawn.
- Hard-mode Aerial preparation spawns the contemporary 12-plus-6 staggered plume sequence. Aerial Blast then removes all remaining towers and deals 2,000 damage at 12 surviving tiers up to 9,999 at zero.
- After Aerial Blast, west wind constrains the outer arena. Plumage temporarily suppresses that wind, and post-Aerial Mistral Song/Shriek no longer accepts tower shelter.
- At 40% hard mode begins the three-pattern final cycle. West wind forms the center-safe outer storm and summons Suparna and Chirada. Mirage moves Garuda east or west, forms the corresponding fixed four-tornado layout, and summons both sisters. Suparna is magic-resistant with roughly 9,000 HP, Chirada is physical-resistant with roughly 6,000 HP, and surviving clones converge with Garuda for the one-minute triple Shriek.
- South wind now uses four carrier actors that move clockwise on server-authored position updates while Garuda summons six Bristle Plumes and a mobile Silky Plume. Silky pursues the rear-most player and uses Thermal Tumult; the Bristles retain their 30-second detonation. Subsequent final patterns wait 40-45 seconds and do not immediately repeat the exact same branch.
- Existing 1.0 rewards are retained: one Vortex Totem when the player has Vortex Fletchings, two for an under-ten-minute clear, and Howling Gale for an under-ten-minute deathless relic-quest clear.
- Mandatory health floors prevent a single hit from killing Garuda before Aerial Blast or before the hard-mode final transition. Damage can still push below 40% during Aerial preparation, preserving the documented ability to skip the intermediate west-wind segment.
- Director membership is refreshed during client landing and throughout the encounter. Initial boss/tower and duty-start publication waits for the client's visibility-ready acknowledgement, and loading sessions are excluded from combat targeting. A replacement reconnect session receives the stable original duty timer and participates in reward, cooldown, exit, and wipe checks; loading sessions, pending raises, and valid re-entry participants suppress a premature wipe.
- The finish path has a single-claim guard, closes re-entry before its final player snapshot, cancels or despawns active plumes, sisters, Silky, and tornado carriers, and gives a committed reconnect session up to 30 seconds to finish landing before result packets and the exit delay.

## Explicit tuning and scope

The archive preserves the Aerial endpoints and dependence on the total remaining tower tiers, but not every intermediate value. The server therefore uses a documented linear interpolation from 2,000 to 9,999.

Patch 1.22's initial notes called the eligibility reward Vortex Headdress, but Square Enix later confirmed that the Totem and Headdress names/descriptions had been swapped. The corrected local item table and Rowena exchange contract identify item `10011154` as Vortex Totem, so the existing token reward is retained. The exact retail reward-chest actor/family, roll table, and packet ordering remain unresolved; the director currently uses the server's generated-loot API as a functional approximation.

Garuda m851 WSS12/WSS13 are high-confidence takeoff/landing banks from the client audit. WSS11 is the strongest Aerial Blast candidate and is wired to the private Aerial command. The exact original WSS selectors for every ordinary Garuda and Feather ability have not survived, so unproven mappings were not invented.

The installed m999 bank proves WSS15/WSS18 are the only wind-authored action
packages, and command DAT proves both canonical hazards are Wind element. It
does not encode server pursuit behavior. The full recovered hierarchy now closes
that branch: `LentigoGarudaTyphoon` has zero methods, `LentigoBaseClass` only
hides its talk/map marker, `MonsterBaseClass` is identity-only, and the generic
battle mixin contains metadata/accessors but no movement callback. Confirmed
movement packets publish server-authored endpoints (`0x00CF`) and speed profiles
(`0x00D0`), not target or retarget policy. The current South-wind helpers are
therefore moved clockwise by the encounter director, matching the contemporary
strategy record. A 40-second orbit is still an explicit reconstruction: exact
speed, path radius, lifetime, damage cadence, and knockback distance remain
capture-dependent. The same source establishes that contact knocked players
back, so the two private wind commands now use the server's conservative default
four-yalm displacement.

The client presentation transform is now resolved independently of that server
behavior. Persistent small wind uses scale `1.2 / 1.0 / 1.2`; persistent large
wind is raised `0.75` client units and uses scale `1.2 / 1.1 / 1.2` while
active. Every audited tornado leaf has a zero static angle. A primary-record
VEFF graph join proves none of the eight tornado graphs instantiates a generated-
angle control; its two appearances are dependencies in target-hit graphs, while
the two joined world-angle controls only compose owner orientation. The visible
swirl remains particle/draw-resource/material presentation. Eleven joined
position generators are translational rather than orbital: two belong to WSS18
main and nine to persistent small wind. WSS15 main instead contains five
movement-distance particle emitters, while persistent large wind has only draw
resource dispatch at this layer. The 22 position/emitter records contain 165
nested relocation/link records rather than a flat coefficient block. Native
consumer offsets now identify generated-position base/direction/speed/
acceleration fields and emitter probability/count/travel-spacing fields. Its
generic input resolver uses signed 16-bit node/component handles; 28 secondary
words match that layout, while ten are distinct `0x10000000` sentinels. The
native client also registers standard/random immediate, linear, parabolical,
and polynomial scalar evaluators in two complete 64-slot tables. The container
builder exposes 74 shifted group descriptors: serialized pair 2 maps to the
standard table and pair 3 to random, followed by
`base + uint16_type*0x30`. A strict walk of all eight VEFF parameter trees now
preserves 1,194 records: 367 polynomial type records, 800 terminal descriptors,
23 inline native-type candidates, and four unresolved records, plus 1,068 raw
terminal DWORDs. `0x00010033` therefore splits into type `0x0033`, graph
overflow ID `1`, and reserved high byte `0`; the constructor validates the ID
as zero or one and copies it to runtime record `+0x24`. The overflow behavior
and exact property-to-runtime-input join remain unresolved, so no leaf is
promoted to a named speed, acceleration, interval, or lifetime. Their raw maps
are preserved without inventing server behavior. The active persistent-large
draw resolves to `37QyJuring03m` using `TechCgfxShader2`,
smoke/fire textures, distortion `0.200000003`, UV scroll `(0,0,0)`, and UV scale
`(1,1)`. This rules out a serialized material UV-scroll spin but leaves baked
texture/mesh motion or higher runtime shader animation open. None is actor
pursuit, hazard yaw, or collision. Recovered VMDL extents and the shared 40-unit
VEFF root envelope are render/culling bounds, not collision evidence; they do
not change the implemented server damage geometry.

Initial mob placement was intentionally left outside this change, as requested. Existing encounter spawn positions remain the placement source of truth.
