# The Thousand Maws of Toto-Rak implementation

Date: 2026-07-18

Current audit and queued-transition/reward-retry corrections:
[2026-09-18 Toto-Rak audit](totorak_audit_2026-09-18.md). Historical deployment
and client observations below do not constitute acceptance of that newer build.

## Current implementation result

The normal `RaidFst0Dungeon03` content director now starts a server-owned
Toto-Rak encounter population after the party lands. The content copy now owns
shared photocells, opened fields, boss-terminal activations, Void Flame kills,
route coffers, and reward conditions. The three bosses spawn only after their
separate terminal is activated, use recovered actor classes and mob-type rows,
replenish the documented infinite add waves, and let Antares, Sargas, or Shaula
finish the expedition.

The recovered `GuildleveBonusTreasureBox` actor class has no default property
flags. Toto-Rak therefore publishes both the nameplate/selection-presence and
targetable bits before each route or reward coffer first enters client
visibility; sending the targetable bit alone renders a chest that the 1.x
client cannot select.

The live marker sessions now supply 46 exact corridor packs containing 99
ordinary enemies. Every actor has a live-captured XYZ, facing, and family:
Prison Pterocs, Mun-Tuy Saplings, Tainted Louse, Mitetraps, Prison Puddings,
Gaoler's Lanterns, Cell Mites, and ordinary Void Flames. The earlier
photocell-centered reconstructions remain in the Lua only as inactive research
notes and cannot leak into the active encounter roster.

Each captured corridor formation has its own server `MonsterParty`, and every
boss shares a separate chamber party with its opening and replenishing adds.
Enemy actors remain owned by the occupancy director for cleanup but are
deliberately excluded from its instance-wide content group. This preserves
local pack assist while preventing a pull in one corridor from engaging distant
packs or another boss chamber. A MoonSharp runtime harness verifies all 46
groups and 99 exact normal-enemy spawns without enemy content-group additions.

The normal roster now uses recovered original levels rather than the former
level-30 fallback: 60 enemies are level 35, 31 are level 32, and 8 are level 39.
All thirteen Prison Puddings also carry a fixed Lightning, Wind, or Fire aspect,
cast the matching Thunder, Aero, or Fire spell, and absorb matching-element
magic damage. Installed-client asset inspection and the live appearance probes
confirm that all three use the same native-white Flan model and texture; the
period purple, green, and orange presentation comes from encounter lighting or
effects rather than a separate model, skin, body variant, or dye lane.

Boss death now creates the fixed reward coffer plus each earned conditional
coffer (Void Flames, all three field levels, under 25 minutes, and all six route
coffers). Completing the route's death scene closes the duty timer, and neither
opening the last coffer nor waiting in the room returns a player automatically.
Each member may loot at their own pace and accept the chamber porter's leave
prompt when ready; the empty content copy is destroyed only after the party has
departed. The exact 2026-07-23 room survey replaces the generic boss-local fan. The five
capture rows for each route are literal placement slots 1 through 5. Earned
coffers retain their normal reward-list ordering (fixed gold, then each earned
condition) and fill those captured slots consecutively. Thus a two-coffer clear
uses captured points 1 and 2 rather than skipping ahead to the semantic slot of
the second reward.

| Route | Slot 1 | Slot 2 | Slot 3 | Slot 4 | Slot 5 |
| --- | --- | --- | --- | --- | --- |
| Antares | `1249.799, -46.950, 929.488, -2.202` | `1252.339, -46.886, 923.245, -2.004` | `1244.223, -46.890, 933.640, -2.290` | `1248.792, -46.945, 923.598, -2.238` | `1245.035, -46.950, 928.491, -2.212` |
| Sargas | `1472.568, -58.950, 638.737, -0.783` | `1468.842, -58.872, 635.089, -0.863` | `1476.255, -58.905, 643.836, -0.869` | `1470.596, -58.932, 645.362, -0.869` | `1466.877, -58.956, 640.445, -0.869` |
| Shaula | `1345.841, -62.950, 543.667, -1.393` | `1344.872, -62.925, 539.307, -1.393` | `1347.008, -62.919, 548.228, -1.393` | `1341.240, -62.895, 547.931, -1.393` | `1340.655, -62.941, 541.604, -1.393` |

The measured boss-to-coffer ranges are `1.9-8.3` yalms for Antares,
`3.6-10.3` for Sargas, and `3.1-9.2` for Shaula. Sargas and Shaula intentionally
use a deeper far row; neither survey contains an isolated or implausible point.

The normal-coffer roll now preserves all three legacy outcomes instead of
guaranteeing the named rare item: an approximately one-in-six unique-equipment
roll, otherwise usually Grade 3 Dark Matter (`10013003`) with gil as the other
fallback. The guaranteed center boss coffer still rolls zero to two pieces from
its four-item armor pool; a zero-piece result becomes the documented gil-only
outcome rather than an empty coffer. Gil is split across the online party, while
equipment and Dark Matter use the shared random-recipient loot allocation.

Coffer opening now has an explicit reservation/commit concurrency boundary. The
progression lock reserves the exact route/reward key in an in-flight set before
animation or loot allocation, so two simultaneous clicks cannot both enter the
award path. The durable opened set is committed only after that path returns
normally, and a `finally` block always releases the in-flight key. This is not a
rollback transaction: if an award throws after a partial side effect but before
commit, releasing the reservation can permit a retry. The reservation/commit
hardening is isolated-build/static coverage, not additional live-client proof.

Bloisirant's working NPC path now enters this party-aware instance by default.
Every entrant advances their matching story step, including the three Imperial
Devices variants. Fields I and II each reveal A-Ruhn-Senna, Pudgy Moogle, and
Teary Moogle at the two archived map locations. The Limsa, Gridania, and Ul'dah
variants now use their recovered dialogue stages, quest items, journal rows,
and exact reward of 2,160 EXP plus 1,000 city seals. The existing GM solo-test
route remains available for capture and debugging.

This is a playable systems pass, not yet a claim that every client-facing detail
has passed a complete party expedition. The six chamber anchors, three final
boss-terminal recaptures, all six route coffers, both conditional Void Flames,
99 normal enemies, the Field II quest-NPC trio, and the Antares and Shaula add
formations are live captures. Field I uses its captured group center plus a
rigidly rotated copy of the exact Field II trio, which surviving period footage
confirms is the correct roster. The user reviewed the Sargas add captures as
close to the existing centered triangle and chose to retain that formation.

The post-grouping deployment audit passed on 2026-07-18: all 11 touched
Toto-Rak Lua files compile through MoonSharp, the live database resolves all 15
encounter mob rows, 35 family-skill references, 10 spell references, and 27
reward items, and the Release Map Server builds with zero errors. The resulting
binary was installed and started on the normal Release path during a verified
zero-session window; startup completed with 4,137 BNPC records loaded and the
zone loop listening normally. `git diff --check` reports no Toto-Rak whitespace
errors (only the repository's existing line-ending conversion notices).

## Source-backed contract

Primary gameplay source:

- http://elemen.sakura.ne.jp/ff14_dated_archives/gamecontents/InstancedRaids/theThousandMawsofToto-Rak.html

Recovered facts used by this pass:

- Level 25 or higher Disciple of War or Magic.
- Party size 2-4.
- 60-minute expedition.
- Retry delay is 15 minutes from the start of the expedition.
- Four Magitek Photocells activate one Magitek Terminal/field.
- Antares is level 38 and is accompanied by three endlessly replenished Horde
  Mites.
- Sargas is level 38 and is accompanied by three endlessly replenished Horde
  Mites.
- Shaula is level 40 and starts with three Bastard Mites. Once an opening Mite
  dies, its exact formation slot becomes an endlessly replenished Widow's
  Suitor slot; every new Suitor immediately joins Shaula's current target.
- Bastard Mites, Horde Mites, Widow's Suitors, and Void Flames are level 39.
- Prison Pterocs, Prison Puddings, Gaoler's Lanterns, and Mun-Tuy Saplings are
  level 35; Tainted Louse and Mitetraps are level 32; Cell Mites are level 39.
- Period material presents purple, green, and orange Prison Puddings as fixed
  elemental variants. The implementation maps them to Lightning, Wind, and Fire
  and gives each its matching spell and same-element magic absorption. The
  installed client contains one native-white Flan mesh/texture set for their
  recovered model row, so no unsupported body-color override is synthesized.
- Diremite actions are Sticky Web, Deadly Thrust, and Shaula's Realm Shaker.
- Two Void Flames near map coordinate `(6,5)` are a conditional reward-chest
  requirement.
- Six route chests and up to five boss-reward chests exist.
- After Field I or II is opened, Imperial Devices quest NPCs appear at map
  `(5,6)` or `(6,4)` and advance all three city variants.

### Surviving period-run evidence

The archive establishes the duty contract and encounter rules. Corridor family,
pack-size, and mixed-pack reconstruction additionally uses these surviving
original-client recordings:

- [July 2012 quest run](https://www.youtube.com/watch?v=7NgBPap5D3g)
- [July 2011 full rank-30 run](https://www.youtube.com/watch?v=QvvDlq0UcPo)
- [August 2011 run, part 1](https://www.youtube.com/watch?v=hkK-j2er95g)
- [August 2011 run, part 2](https://www.youtube.com/watch?v=-i1TkmiJ_Kg)
- [Shaula chamber recording](https://www.youtube.com/watch?v=uPaf1tKP0yQ)
- [Sargas chamber recording](https://www.youtube.com/watch?v=XRrtmxcdvig)

The recordings directly show Mun-Tuy Saplings, large Tainted Louse swarms,
Pteroc/Sapling mixtures, Pudding/Lantern and Pudding/Mitetrap mixtures, and
Shaula beginning with only its three Bastard Mites. The July 2012 quest run also
shows A-Ruhn-Senna, Pudgy Moogle, and Teary Moogle appearing together after the
first terminal is opened. Cell-to-pack assignment and individual spacing are
the closest reconstruction supported by the footage, not claimed original
coordinate data.

## Recovered identity map

| Role | BNPC id | Actor class | Notes |
| --- | ---: | ---: | --- |
| Antares | 3001 | 2301102 | Level 38; dungeon skill list 7101 |
| Sargas | 3093 | 2301103 | Level 38; dungeon skill list 7101 |
| Shaula | 3095 | 2301104 | Level 40; skill list 7102 adds Realm Shaker |
| Bastard Mite | 3121 | 2301105 | New server mob-type row |
| Widow's Suitor | 3122 | 2301106 | New server mob-type row |
| Horde Mite, Antares variant | 3123 | 2301107 | New server mob-type row |
| Horde Mite, Sargas variant | 3124 | 2301108 | New server mob-type row |
| Void Flame | 3125 | 2301601 | Seeded for the conditional chest phase |
| Prison Pteroc | 3126 | 2300101 | Level 35; skill list 77 |
| Cell Mite | 3127 | 2301101 | Level 39; skill list 78 |
| Mitetrap | 3128 | 2302702 | Level 32; skill list 51 |
| Prison Pudding | 3129 | 2303401 | Level 35; fixed-aspect spell profile |
| Tainted Louse | 3130 | 2305601 | Level 32; skill list 75 |
| Gaoler's Lantern | 3131 | 2309901 | Level 35; skill/spell lists 12/1 |
| Mun-Tuy Sapling | 3132 | 2302701 | Level 35; skill list 51 |

The current live database was rechecked after the 2026-07-22 failed run. It
loaded the older 421-row core seed and was missing all 15 Toto-Rak mob types:
the three bosses plus `3121`-`3132`. Actor classes, skill/spell data, items,
and the `7101`/`7102` Diremite lists were present. Import
`Data/sql/live migrations/totorak_bnpc_mob_types.sql` while the Map Server is
stopped, then restart it so the startup cache receives all 15 rows. The
migration is idempotent and also repairs the two Diremite skill lists when
needed.

The active director imports the completed marker session exactly. It no longer
derives groups from photocell centers or generates formation offsets. The two
separate conditional Void Flames remain outside this 99-enemy table because
their deaths are tracked for the first optional boss coffer.

| Captured family | Count | Original level |
| --- | ---: | ---: |
| Prison Pteroc | 20 | 35 |
| Mun-Tuy Sapling | 13 | 35 |
| Tainted Louse | 18 | 32 |
| Mitetrap | 13 | 32 |
| Prison Pudding | 13 | 35 |
| Gaoler's Lantern | 14 | 35 |
| Cell Mite | 5 | 39 |
| Ordinary Void Flame | 3 | 39 |

### Prison Pudding presentation

Live probes ruled out the four apparent palette lanes: actor size, packed
`COLORINFO` skin index, body-graphic variant, and body-graphic color. All
rendered the same white Prison Pudding. The recovered actor-class graphic row
for `2303401` independently specifies base model `10049`, size `2`, and body
graphic `1024` with the default color values.

The installed legacy client confirms that this is intentional. Flan assets are
contained in `client/chara/mon/m049`: equipment `e001` has one body model and
one diffuse/normal/specular texture set. The `top_tex1` and `top_tex2`
containers are low- and high-resolution copies, while their `0000` and `0001`
payloads are byte-identical. The model itself binds the single diffuse resource
`m049e001t_d`. Toto-Rak therefore uses the native white model for all thirteen
Puddings. Their Lightning, Wind, and Fire profiles remain combat behavior
(matching spell and magic absorption), not fabricated appearance dyes.

The two Imperial Devices map centers were captured live beside the recovered
Tornsrest and Foolsrest field gates. The later neutral-marker session supplied
an authoritative actor formation at Field II: Teary Moogle `1000407`, Pudgy
Moogle `1000328`, and A-Ruhn-Senna `1001571`. Surviving original-client footage
confirms that same trio at Field I. Field I therefore uses the captured center
and approach heading with a rigid clockwise transform of the exact Field II
formation; the earlier four-actor identity draft remains research-only.

| Field route | Archive map point | Live world center | Runtime status |
| --- | --- | --- | --- |
| Field I | `(5,6)` | `1128.637, -45.000, 887.796, -2.991` | Confirmed trio; captured center plus rigid transformed formation |
| Field II | `(6,4)` | `1163.039, -49.000, 695.056, 2.925` | Three exact actors active after Field II |

The guide registration uses all sixteen exact photocell positions, the physical
field gates, and the three live chamber terminals. Both Void Flame standing
anchors, floor heights, and approach-facing rotations are now live captures.

The three quest rewards are Storm Seal `1000201`, Serpent Seal `1000202`, or
Flame Seal `1000203` x1,000 plus 2,160 EXP. The server's existing seal helper is
used, so rank caps are respected rather than silently overflowing currency.

## Live chamber anchors

The three bosses and three boss terminals were captured live in zone 159 on
2026-07-18. The table uses the final terminal recapture pass requested after the
normal mob placement session. All six rows are player-position captures, so the
coordinates are exact standing anchors while final object-center/model offsets
remain subject to live visual verification.

| Route | Boss anchor | Activation-terminal anchor |
| --- | --- | --- |
| Antares | `1251.683, -46.946, 929.946, -2.226` | `1210.318, -48.132, 912.115, 1.569` |
| Sargas | `1475.059, -58.909, 636.072, -0.861` | `1456.127, -59.200, 679.066, -3.120` |
| Shaula | `1348.799, -62.943, 542.707, -1.457` | `1304.773, -63.122, 559.313, -1.704` |

The live-verified player landing anchors after each terminal introduction are:

| Route | Post-cutscene player landing |
| --- | --- |
| Antares | `1226.210, -47.258, 911.200, 1.038` |
| Sargas | `1456.439, -59.131, 660.687, 2.474` |
| Shaula | `1321.581, -63.386, 561.516, 1.868` |

The first or solo participant lands on this coordinate exactly. Additional
connected party members receive small offsets around the same anchor before the
boss spawn gate is released.

The 2026-07-23 Antares run also proves the complete server callback path with the
exact anchor installed. `rad0f303` started at `18:51:16`, returned through
`EventUpdate` at `18:51:42`, saved the same-area move at
`1226.210, -47.258, 911.200, 1.038`, and released the Antares spawn gate at
`18:51:43`. The player later teleported out without killing Antares, so
`rad0f306` and the clear/loot return path were not exercised in that run.

The guide and recovered SQL describe two terminal sets that must not be
conflated:

- Seven existing `RaidDungeonBarrier` rows are the server owners/proxies for the
  physical gate map objects, not seven Magitek Device positions. Their recovered
  layout/object links are `313/3580`, `3583`, `3585`, `3587`, `3589`, `3591`,
  and `3593`, grouped into the three 2/2/3 field levels. Two separate Magitek
  Devices consume four shared photocells per activation and send `hide` to every
  gate proxy in the opened field. Device 1 opens Field I; Device 2 opens Field
  II and is reused for Field III.
- Three separate boss-activation terminals are at archive map coordinates
  `(6,6)` for Antares, `(9,4)` for Sargas, and `(7,3)` for Shaula. Their world
  coordinates now use the live captures above.
- Both field consoles and all three boss-activation terminals use actor class
  `1200202`, the replay-backed `b936/e003` device. The seven existing
  `1200228 / b936-e004` rows remain only the physical gate/map-object proxies.
  The shared Lua owner recognizes `totorak_boss_terminal_antares|sargas|shaula`
  and routes those three actors to boss activation.

This gives the recovered 16 photocells a coherent route budget: Antares or
Sargas costs four for its field plus four for its boss terminal, while Shaula
costs four for each of Fields I/II/III plus four for its boss terminal.

Boss-terminal activation also opens the separate chamber DoorStandard map
object: Confession Chamber (`313/3444`) for Antares, Execution Chamber
(`313/3487`) for Sargas, and Interrogation Chamber (`313/3466`) for Shaula.
The open state remains instance-owned and the recovered persistent
`_runBgSchedulerFromMidstream("hide", 5)` state is reapplied when a participant
joins late, reconnects, or re-enters visibility. The latest scheduler path sends
no action for a distant seal that is still unknown to that client's actor table.
If the seal is inside the configured visibility rectangle, it first receives one
atomic spawn/init/status bind and then `hide`; if it remains distant, the hide is
deferred until ordinary visibility creates the actor and its `onSpawn` replays
the persistent state. `DoorStandard.onSpawn` and the shared barrier-state query
both derive the three chamber-door states from the matching boss-terminal
activation, so a late actor cannot fall back to a closed field-barrier record.
This avoids both the legacy RemoveActor-first first bind and a
`RunEventFunction` against an unknown actor while preventing a visible but
non-colliding seal after range culling.

The 2026-07-23 return-path trace confirms that this lifecycle ran in the live
client session. Field I activation emitted two midstream `hide` schedulers at
`18:27:31`. After the player traversed the dungeon and returned through the
culled area, visibility reconstruction emitted two more at `18:33:28`, followed
by the Antares chamber-door scheduler at `18:33:33`. The Map Server now also
logs each exact actor, unique id, layout, instance id, and offset under
`[TotorakSeal]`, so a post-rebuild run can distinguish successful state replay
from a remaining client-rendering fault.

The map contains exactly two field-opening devices in addition to the three boss
terminals. Their final live anchors are:

| Device | Field progression | Live world anchor |
| ---: | --- | --- |
| 1 | Opens Field I | `1103.211, -44.132, 879.967, 1.892` |
| 2 | Opens Field II, then Field III on reuse | `1135.680, -48.132, 688.103, 0.743` |

These final captures supersede the two earlier rough standing anchors. The seven
gate coordinates must not be substituted for either console position.

### Magitek terminal presentation

The 2026-07-22 client test rejected the earlier terminal mapping. Spawning
actor `1200228 / b936-e004` and sending bank `0004` produced the small gold
crescent presentation, while the period Toto-Rak reference shows a broad blue
floor sigil with blue flame-like nodes around its rim. The packet path worked;
the selected appearance and bank were wrong.

Period Toto-Rak replay scenes `rad0f301` and `rad0f302` provide the exact
matching actor dictionary: generic `RaidDungeonBarrier` actor `1200202`,
appearance `b936/e003` (base model `20936`, body variant `3072`). Binary decode
of that model's `@CBIS` graph shows that its embedded persistent
`b936_e03v1` effect is selected when actor `extrastat & 0x80` is nonzero and
killed when the bit is clear.

The live command `!spawnbgmodel b936 e003 - 0x80` confirmed the broad blue
floor sigil and perimeter flames. Dynamic terminals retain their existing
interaction bit `0x01`, so their inactive value is `0x01` and powered value is
`0x81`. Opcode `0x145` is sent before appearance initialization on fresh
spawns, late visibility binds, and `!totorak sync`; state changes repeat that
same extra-stat-then-appearance order. No looping animation replay is needed.
Actor substate `motionPack` remains zero.

Cell consumption now starts a hold keyed by that terminal's unique id, with an
exact UTC deadline five seconds later and a nonzero generation. Presentation
checks the hold before normal usable/activated state, so the same field terminal
can be reused without an older timer extinguishing its newer activation and a
spent boss terminal remains powered for the first five seconds instead of
extinguishing at cell trade. The delayed worker rechecks both generation and
deadline after every wake (including an early `Task.Delay` wake); only the
still-current hold may remove itself and refresh the terminal. A longer scene
continues after that five-second refresh. The earlier live walkthrough proves
the visible five-second baseline, while this deadline/generation race protection
still needs the rebuilt server.

The seven existing zone-159 actor `1200228 / e004` rows remain the server and
map-object proxies for the physical gates. They are not substituted for the
two reconstructed field devices or three boss terminals.

The exit transporter is the separate `1200203 / b936-e004` presentation.
`!spawnbgmodel b936 e004 - 0x80` confirms that extra-stat bit `0x80` selects
its persistent portal. The recovered `RaidDungeonWarp.activateWarpDevice` call
selects e004 bank `0094` with `0x0405E000`;
`!spawnbgmodel b936 e004 94 0x80` layers that one-shot activation/control
transition over the persistent portal. Bank `0094` is not the portal loop.

Direct `PWIB` setup-block decode also proves that the three boss-death scenes
do not share one interchangeable goal prop. `rad0f306` binds actor-index 14
`gate` (`1200203`) at scene-local `37.880, -6.890, 195.940`; `rad0f307` binds
actor-index 13 `GOAL` (`1200203`) at scene-local
`260.580, -18.900, -102.770`; and `rad0f308` binds actor-index 14 `vfx`
(`1200204`) at scene-local `136.440, -22.980, -193.550`, while separately
embedding the b936/e004 effect.

The map-layout payload `data/29/B0/00/0A.DAT` contains the exact little-endian
float triplet `1216.000, -40.000, 736.000` once, at `0x1C370`. Applying that
zone translation to the scene setup records gives:

| Death scene | Cutscene actor | Scene-local position | Zone-world position |
|---|---|---:|---:|
| `rad0f306` | `gate` / `1200203` | `37.880, -6.890, 195.940` | `1253.880, -46.890, 931.940` |
| `rad0f307` | `GOAL` / `1200203` | `260.580, -18.900, -102.770` | `1476.580, -58.900, 633.230` |
| `rad0f308` | `vfx` / `1200204` | `136.440, -22.980, -193.550` | `1352.440, -62.980, 542.450` |

The transformed boss placements independently land within a few yalms of the
live boss-room captures: Antares `1249.271, -47.010, 929.214`, Sargas
`1473.037, -58.900, 638.495`, and Shaula
`1349.277, -62.994, 543.742`. This confirms the coordinate transform without
turning a player-standing capture into a model-center claim.

These scene actors remain temporary staging records: the recovered occupancy
director deletes them after playback. The 2026-07-23 room survey independently
captured the persistent post-clear porter anchors:

| Route | Captured porter anchor | Distance from transformed scene clue |
| --- | --- | ---: |
| Antares | `1252.812, -46.889, 931.700, -2.238` | `1.1` yalms from `rad0f306` `gate` |
| Sargas | `1476.189, -58.877, 635.071, -0.677` | `1.9` yalms from `rad0f307` `GOAL` |
| Shaula | `1350.552, -62.955, 542.791, -1.387` | `1.9` yalms from `rad0f308` `vfx` |

The close agreement validates the standing captures without treating them as
cutscene actor centers. After a route boss dies, the server now reconstructs a
targetable `1200203 / b936-e004` porter at the captured anchor, publishes its
persistent combined `0x81` interaction/portal state before appearance, and binds
the recovered `InstanceRaidExit` prompt/return contract. The native `askExit`
menu leaves the player in the chamber on cancel and returns only an accepting
player to their recorded content entry point. There is no deadline safety return;
players control every online exit. The repeatable scene decoder and regression
check is `tools/decompile_totorak_cutscene_setup.py`.

Porter use keeps a per-character exit claim bound to the exact live `Player`
object. A duplicate from the same session is idempotent; a reconnected replacement
object supersedes a stale claim, and a transition that never starts or throws
releases only its own claim for retry. Boss clear and late-party entry share a
per-instance lifecycle gate, so the entrant either lands before the death-scene
snapshot or is rejected before registration; expiry and cleanup also wait for an
active entry transition. A cleared instance remains in its finishing state while
any authoritative player is inside, so coffer progress, elapsed time, and cutscene
completion cannot zone anyone out.

While a cleared copy remains retained for a player, reward and porter publication
is idempotent and retried every two seconds until both are present, preventing a
transient spawn failure from trapping the party. After no re-entry tickets remain,
or once any remaining offline tickets reach their original expiry, empty-room
cleanup disables re-entry, rechecks exact sessions, atomically moves each expired
offline character while deleting its durable ticket, and retries any database
failure. It removes manager state only after the parent zone confirms that the
empty content copy was actually deleted.

The final reconnect audit adds one exact-`Session` lifecycle gate shared by login
replacement, login initialization and delayed `DoZoneIn`, socket attachment and
activity acceptance, ordinary/forced logout, World `0x1001`, stale-session cleanup,
and every porter, clear, timeout, and fallback transition. The old player remains
authoritative until its recovery/save finishes, then `AddSession` atomically swaps
to the replacement. A stale object therefore cannot write location state, queue an
ID-only session confirmation, move a replacement player, or remove the new session.
Lock ordering was independently checked with no `SessionList`, Toto instance, or
content-reentry inversion.

When a finishing client misses the single bounded landing window, reentry is
already disabled and saved-return recovery runs under that same exact-session
gate. The server queues the old client's logout and World confirmation before
exact removal, without waiting on a multiplexed connection's global send queue.
This provides a bounded character-selection fallback without allowing P1 cleanup
to overlap P2/P3 login.

The installed e003 LIB bank `0003` (`0x04003000`) is a short v2
fizzle/completion effect, while banks `0013` and `0093` are its controls. They
are not the persistent powered circle. Successful field- and boss-terminal
activations play bank `0003` exactly once after the state change.

### Duty cutscene routing

Installed scene actors and motion data establish one complete sequence:

- `rad0f300`: duty entrance.
- `rad0f301`: field device 1 / Field I.
- `rad0f302`: field device 2, reused for Fields II and III.
- `rad0f303`, `rad0f304`, `rad0f305`: Antares, Sargas, and Shaula terminal/boss introductions.
- `rad0f306`, `rad0f307`, `rad0f308`: the corresponding route-specific boss-death/completion scenes.

Playback is enabled through the recovered `RaidFst0Dungeon03.noticeEvent`
contract. The client handler fades out, closes the execution widget for
`rad0f306`-`rad0f308`, creates and starts the requested scene, deletes the scene
actor, fades back in, and reopens the dungeon widget. The server keeps that
`noticeEvent` owner alive while `callCurrentEventFunction` is yielded; only the
client's later `EventUpdate` resumes Lua, records boss-intro completion when
applicable, and sends `EndEvent`. Sending `EndEvent` beside the initial
`RunEventFunction` is explicitly forbidden because it tears down the owner before
the client can build its update packet.

Fresh entry still avoids embedding the occupancy director in the zone-in packet.
After the existing five-second dispatch delay, neither `rad0f300` nor the duty
widget is sent until the exact live `Player` remains connected in this private
area, is no longer zone-changing, and its `Session` reports actor visibility
ready. That landing gate polls every 250 ms for at most 30 seconds. The opening
scene additionally waits for an explicit encounter-population-ready marker and
a 1.5-second actor-table settling window. A landing timeout cancels the unsafe
scene attempt and retries the widget through the same gate; a population timeout
or later scheduling failure falls back to the widget after landing. A late
first-time party entrant receives the same opening scene; a completed player who
re-enters receives only the widget. Login reconnect retries `rad0f300` only when
that player had previously requested but not completed it, so widget-only/no-UI
GM tests do not unexpectedly acquire an intro. These landing checks are
latest-source behavior, not evidence from the older live DLL.

Every opening attempt now owns a monotonic attempt generation stored with the
player id and exact live `Player` object. The explicit and parameterless occupancy
callbacks must claim the server-dispatched generation, and Lua returns that same
generation when the blocking client call completes. Delayed work from an old zone
visit therefore cannot cancel or complete a newer attempt. The server waits 10
seconds for the client event to start and 120 seconds for an accepted opening to
finish. An ambiguous timeout is quarantined until that player session leaves
rather than being reused by a late callback; normal entry falls back to the duty
widget, while GM opening replay requires a reconnect before retrying.
`!totorak livecs open` also refuses to replace an active event or any
pending/uncertain opening claim.

A successful Magitek or boss-terminal talk queues its own `EndEvent`, then
schedules `rad0f301`-`rad0f305` 500 ms later so the new occupancy event cannot
overlap the old talk event on the wire. A boss introduction also passes the same
post-zone actor-visibility landing gate, and busy players are retried for up to
30 seconds. Each boss-intro schedule first reserves a pending state for that
exact live `Player` object for 45 seconds; immediately before the blocking
client call, Lua promotes the same owned state to a 120-second active interval.
Because `Actor.Equals` is character-id based, reservation, departure, move, and
arrival ownership all use explicit `Object.ReferenceEquals` checks. Duplicate or
stale-session schedules, callbacks, and moves therefore cannot mutate the
replacement session's state. The route's 30-second fallback may begin while a
slow client is still protected, but it moves only players with no live
pending/active state; an expired state receives the exact safety landing. Leaving
clears only that object's reservation and move, while reconnect synchronization
schedules the missing introduction if the gate is not ready or moves the live
replacement directly when the battlefield is already active. The boss spawn gate
opens only after every currently connected live object owns its arrival.

Boss deaths queue `rad0f306`-`rad0f308` through the same 500 ms lane, post-zone
actor-visibility gate, and 30-second busy-event retry. A player-id replay
entitlement and its exact live `Player` owner are registered before asynchronous
dispatch; completion and release paths require `Object.ReferenceEquals` with that
owner. A connected send failure or timeout releases the waiter. Area departure
or disconnect drops only the stale object owner while retaining the replay
entitlement. Reconnect while the cleared instance is retained installs the
replacement owner and requeues the route's death scene when that character has
not completed it, so a late callback from the old session cannot complete the new
wait. The blocking `EventUpdate` callback marks the matching entitlement complete
and closes the timer widget that the recovered client function just reopened.
An explicit completion rejection leaves a live timer alone (including GM
death-scene probes); only a confirmed clear or a genuinely unavailable hot-server
bridge uses the post-scene close path.
Clear finalization is independent of coffer state and cutscene waiters: it begins
only after no authoritative player remains, while disconnected participants keep
their original re-entry window before offline recovery is eligible.

The 2026-07-23 live run proved the opening sequence end to end. The server made
one content zone change at `18:25:46`, marked all 99 corridor actors and the
terminal population ready at `18:25:53`, started `rad0f300` at `18:25:55`, and
received its matching `EventUpdate` at `18:26:26`. The apparent second entry was
the scene's own loading/fade presentation, not another server zone change. The
client then opened the execution widget from the recovered scene handler.

Ordinary cutscenes retain enemy hate but make the player and owned pets temporarily
unselectable; enemies target another eligible member or stop until the callback
ends protection. The three boss-introduction scenes additionally clear all enemy
hate in the exact instance so corridor pulls return before the arena opens. Safe
GM probes are `!totorak livetest cs` and `!totorak livecs open|field1|field2|...`.
Generic cutscene commands remain blocked from the Toto-Rak keys because they do
not own this occupancy handshake. Normal enemies and Void Flames never map to a
scene, and the old `306=clear`, `307=failure`, `308=exit` aliases remain removed
because all three scenes are boss-specific victories.

The marked circle family remains a different mechanic. September 14 exact-XYZ
seam welding corrects the earlier 2/3/4/5/6 interpretation to **2/3/4/6/8 arcs**;
see `Data/raidroutes/dzemael_native_circle_review.json`. Arc counts alone do not
recover server occupancy thresholds.
They are the `b936/e009..e005` sequence (`1200325..1200329`) recovered for
the `RaidDungeonHeadCount` family, with 2/4/6 historically used by Dzemael.
The Toto-Rak validator still rejects those later appearance IDs from its terminal runtime.

Fresh entry deliberately does not publish a separate `InstanceRaidBaseClass`
actor. Repeated Windows crash reports showed the stock client faulting first when
that actor was included in the private-area zone-in and then, after deferring it,
at the exact moment its manual spawn/init packets were sent five seconds later.
Toto-Rak therefore uses its already-instantiated `RaidFst0Dungeon03` occupancy
director for the recovered widget callback after the five-second client-settle
delay. This preserves one director actor throughout entry and reconnect.

Guide-image stage mapping for the seven recovered barrier names is currently:

- Level I / blue: Torn's Rest and Ser Aucheforne.
- Level II / green: Bergand north and Bergand east.
- Level III / magenta: Fool's Rest east, Fool's Rest west, and Joukil.

## Live-capture workflow and accepted recaptures

Enter a quiet solo copy with `!totorak enter`. At each location, stand where the
named object should be and face toward the room entrance. If a genuine existing
actor is being measured, select it before running the command; `capture` now
records the selected actor's XYZ, rotation, actor id, actor class, and unique id.
With a target selected, bare `!totorak capture` also derives a stable label from
that unique id; an explicit label remains available when a more descriptive name
is useful.
If the desired retail object is missing or the visible object is one of this
implementation's provisional spawns, deselect it and capture your standing
position instead.

The accepted boss rows came from the first chamber pass. The final terminal
rows came from the later terminal-specific recapture pass:

```text
!totorak capture antares_boss
!totorak capture sargas_boss
!totorak capture shaula_boss
!totorak capture terminal_antares
!totorak capture terminal_sargas
!totorak capture terminal_shaula
```

The terminal map locations from the archive are:

- Antares terminal: after Magitek Field Lv. I, map `(6,6)`; Antares is at map
  `(7,7)`.
- Sargas terminal: after Magitek Field Lv. II, map `(9,4)`.
- Shaula terminal: after Magitek Fields Lv. I, II, and III, map `(7,3)`.

## Live route-coffer anchors

All six numbered dungeon coffers were captured live in zone 159 on 2026-07-18.
They replace the earlier guide-image registration estimates:

| Chest | Archive map point | Live world anchor |
| ---: | --- | --- |
| 1 | `(4,4)` | `1008.705, -40.954, 647.040, 0.092` |
| 2 | `(5,5)` | `1104.558, -48.068, 764.237, 3.077` |
| 3 | `(6,6)` | `1159.248, -45.002, 852.239, -0.249` |
| 4 | `(7,4)` | `1292.934, -56.996, 648.892, -1.464` |
| 5 | `(5,4)` | `1091.531, -50.964, 654.457, 1.765` |
| 6 | `(6,4)` | `1218.751, -52.000, 665.180, 1.408` |

The two quest-event centers, both confirmed three-NPC quest formations, six
numbered route chests, and both Void Flames are complete. Field II uses the
exact individual captures. Field I preserves that formation relative to its
captured center and rotates it to the captured approach heading:

| Quest NPC | Field I world anchor | Field II world anchor |
| --- | --- | --- |
| Teary Moogle | `1130.173, -45.000, 890.117, -2.917` | `1163.639, -49.000, 697.774, 2.999` |
| Pudgy Moogle | `1131.778, -45.000, 890.086, -2.887` | `1165.149, -49.000, 698.321, 3.029` |
| A-Ruhn-Senna | `1128.433, -45.000, 890.672, -2.887` | `1161.816, -49.000, 697.667, 3.029` |

The accepted Void Flame rows are:

| Enemy | Live world anchor |
| --- | --- |
| Void Flame 1 | `1231.977, -56.158, 733.011, 0.073` |
| Void Flame 2 | `1237.755, -55.340, 753.599, 0.967` |
| Antares Horde Mite 1 | `1252.332, -46.954, 927.029, -2.249` |
| Antares Horde Mite 2 | `1246.402, -46.948, 931.805, -2.297` |
| Antares Horde Mite 3 | `1249.197, -46.950, 928.464, -2.297` |
| Shaula Bastard Mite 1 | `1349.192, -62.901, 546.162, -1.352` |
| Shaula Bastard Mite 2 | `1346.844, -62.900, 539.095, -1.372` |
| Shaula Bastard Mite 3 | `1342.453, -62.950, 545.934, -1.092` |
| Shaula Widow's Suitor 1 | Reuses Bastard Mite 1's slot |
| Shaula Widow's Suitor 2 | Reuses Bastard Mite 2's slot |
| Shaula Widow's Suitor 3 | Reuses Bastard Mite 3's slot |

Antares's Horde Mites and Shaula's opening Bastard Mites use these live
captures. Their measured positions are stored as boss-local offsets so each
formation rotates coherently with its chamber anchor. By live-review choice,
each replenishing Widow's Suitor now appears in the corresponding Bastard Mite
slot and immediately attacks Shaula's current target. The first accidental
Shaula capture at `881.436, -23.287, 650.561` was outside the chamber and was
discarded. A later 14:28 chamber recapture supersedes the earlier valid Shaula
formation and is the set recorded above. The three approximate Sargas captures
were close to the cleaner existing triangle; by live-review choice, its
centered provisional formation remains unchanged.

For progression testing, use the active encounter route rather than the quiet
capture copy:

```text
!totorak livetest widgetonly
!totorak cells 16
!totorak progress
```

`cells` is GM-only and grants shared instance photocells. `progress` reports the
three field levels, seven recovered barriers, three boss terminals, Void Flame
kills, route coffers, reward coffers, and elapsed duty time.

Each fresh live instance also writes `[TotorakEncounter]` diagnostics for field
mask changes and every chamber add's route, slot, generation, exact spawn
anchor, and inherited-target result. This makes Shaula replacement-wave and
formation failures auditable from `map.log` after a client walkthrough. The
initial `progression ready` line reports terminal, route-coffer, corridor-group,
and corridor-actor totals; the expected live import is 3, 2, 46, and 99. Each
enemy line calls its client count `immediateVisiblePlayers`: zero is expected for
a distant pack and means it will enter through normal spatial visibility later,
not that its server actor failed to spawn.

The first full live population attempt on 2026-07-18 exposed a coroutine crash
at captured pack 16, the first Prison Pudding group. Its elemental profile was
incorrectly looking for a global Lua `ActionProperty` table that the occupancy
director does not load. The profile now stores the Map Server's local elemental
values directly (`Lightning=9`, `Wind=7`, `Fire=5`). The runtime harness now
executes the real population loop through the final captured pack, verifies all 99
corridor actors and all 13 Pudding profiles, and prevents that live-only failure
from being masked by a test-only global. Its all-fields pass additionally creates
all three terminals, six route coffers, both conditional Void Flames, six quest
NPCs, three bosses, and all nine opening chamber adds; repeats the progression
poll to prove idempotence; then verifies one-time boss-target inheritance for all
Antares/Sargas Horde Mites, Shaula's opening Bastard Mites, and every replacement
family without overriding normal enmity, plus surviving-add cleanup on boss death. A
separate CLR-boundary probe confirms MoonSharp converts the local numeric values
into the Map Server's elemental enum parameter, and the public occupancy
entrypoint completes its landing handoff, initial spawn, and all 3,600 lifetime
polls without a runtime error.

The read-only live-database probe passed on 2026-07-18 with all 15 Toto-Rak
BNPC definitions, both recovered boss skill lists, 35 inherited family-skill
references, 10 spell-list references, and all 27 quest/reward items present.
`tools/validate_totorak_legacy_raid.ps1` also locks the five original boss-chest
conditions and their exact item pairs, including the fixed zero-to-two-item
coffer, any-boss clear ownership, consecutive 1-to-5 capture consumption, the
voluntary porter exit, and the absence of coffer/deadline-driven finalization.

The 2026-07-23 exact-capture audit also asserts all fifteen supplied coffer
XYZ/rotation tuples verbatim, requires earned coffers to consume the surveyed
slots consecutively in list order, and separately locks all three porter tuples. Its
geometry check confirms the documented boss-to-coffer ranges and the
`1.1`/`1.9`/`1.9`-yalm agreement with the transformed death-scene clues. This is
confirmation that source matches the captures exactly; the active `19:09:38`
DLL has not live-spawned these latest placements.

The shared BNPC AI uses a finite 75-yalm spawn-territory leash for ordinary
outdoor and instanced enemies. Explicit `SpawnLeash` and `IgnoreSpawnLeash`
modifiers remain available for encounters with authored exceptions. Toto-Rak
disables `IgnoreSpawnLeash` and inherits the shared 75-yalm behavior: enemies
may pursue a player outside the authored pack, but the core AI disengages,
shows the affected hate holders a return-to-territory message, and walks the
enemy back to spawn after the radius is exceeded. Death, leaving the instance,
an invalid target, and the explicit boss-arena entry reset still disengage
combat normally; a blocking cutscene only pauses target selection while
preserving the hate table.

Late dynamic actor registration is also visibility-scoped. An actor already
inside a player's configured X/Z visibility rectangle is rebound immediately
after spawning. The occupancy loop polls every Toto-Rak director member once per
second and introduces a still-unknown mob, terminal, coffer, or quest NPC when
the player approaches. This prevents the 99-enemy population from being forced
into the client at once while covering actors created after the initial zone-in
visibility pass.

Every dynamically-authored enemy also has a one-shot lifecycle bound to the
occupancy director without joining its shared combat content group. Corridor
enemies and bosses therefore retain the normal client corpse/fade presentation,
then detach from the monster party, director, and private area instead of
remaining as invisible dead server actors. Chamber adds that are replaced or
removed when their boss dies use an explicit client despawn before the Lua wave
loop unregisters them, preventing stale corpses from overlapping a replacement.

## Bloisirant entrance guide and pre-Grand Company publishing

Bloisirant keeps `/Chara/Npc/Populace/PopulaceStandard` as his server script so
DftFst/default-talk and all eight Grand Company quest routes still select the
right server event. Actor class `1001150` alone now advertises the recovered
client guide `/chara/npc/populace/occupancyguide/RaidFst0Dungeon03Guide` in its
outgoing instantiate packet. This client-only override avoids the prior
`askEnterInstanceRaid` owner/class mismatch without changing database routing.
The authentic menu exposes Information, Requirements, Enter, and Leave; Enter
opens its final Yes/No prompt, and only the recovered return value `3` starts the
duty. Cancel, Leave, lore, requirements, and final No cannot enter. The three
Imperial Devices quest events retain their existing final confirmation and skip
a duplicate guide prompt.

`map_config.ini` controls the two admission policies independently:
`totorak_npc_requires_grand_company_story` can be `false` when Toto-Rak should
be published before Grand Companies, while
`totorak_party_size_requirement_enabled` separately chooses retail 2-4 entry or
configured solo-capable 1-4 entry. The recovered client's Requirements page is
static retail DAT text and will still mention Imperial Devices and two-to-four
players even when an administrator disables either server gate.

After Enter -> Yes, the server finishes the guide talk turn, closes Bloisirant's
event, displays `Entering the instance...`, and waits two seconds before zoning.
The delayed continuation is pinned to the exact connected Session; a logout,
replacement login, concurrent zone change, or stale party member is rejected.
A second click during the wait only closes the duplicate event. Quest progression
now occurs in CLR only after a real fresh/rejoin transition starts, so a handled
late-entry rejection cannot advance a quest.

The focused validator passes the recovered choice matrix, guide cleanup,
suspended duplicate click, client-bind packet limits, story/party switch wiring,
and authoritative-session admission. An isolated Release build completed with
zero errors at
`.codex-tmp/totorak-bloisirant-guide-build-20260724/Map Server.dll` (`2026-07-24
12:39:08.632 -04:00`, `2,380,288` bytes, SHA-256
`F768E32F0E9D64BCB518173C7D7735DF6BCA33950E0C919F481C540297146AFE`). This
newer guide build has not been installed into the running Release output yet.

## Final live QA

The 2026-07-23 solo walkthroughs give the following strict evidence matrix.
"Live-proven" means the installed client started the scene and returned its
blocking `CourtEventUpdate`; "implemented" means the route is covered by the
runtime harness and Release side build but has not yet run in the rebuilt live
Map Server:

| Requirement | Status | Evidence |
| --- | --- | --- |
| Bloisirant guide and configurable unlock | Implemented; isolated validator/build passed, natural live retest pending | Actor `1001150` keeps generic server quest routing but receives the recovered client guide. Only Enter -> Yes starts; story and party-size gates remain independent map-config switches, and the two-second handoff rejects stale sessions. |
| Fresh entry scene, then duty widget | Pre-cutscene spawn race reproduced and fixed; corrected restart/retest pending | The 2026-07-24 rebuilt run created exactly one private instance and reserved exactly one opening generation. Windows WER recorded `ffxivgame.exe` access violation `0xC0000005` at `08:19:38` (fault offset `0x00046EF0`), exactly when the first late-created entrance-enemy spawn train flushed while `ZoneChanging=True`; `rad0f300` never dispatched. Source now requires both acknowledged/stable landing and `CanReceiveActorVisibility()` before any dynamic NPC bind. |
| Magitek Field I and five-second powered hold | Live-proven baseline; deadline/generation rebuild pending | The terminal accepted the cells at `18:50:43`, started `rad0f301` at `18:50:44`, remained powered during the scene, and changed to `lit=False` at `18:50:48`. The newer per-terminal deadline/generation guard is source/isolated-build work, not part of that run. |
| Magitek Fields II and III | Live-proven | Both `rad0f302` runs started through the occupancy director and returned clean callbacks at `17:46:55` and `17:47:13`. |
| Antares terminal and battlefield handoff | Live-proven on the `19:09:38` Release baseline; latest session/landing guard pending | The checkpoint-assisted natural terminal scheduled `rad0f303` at `19:44:56`, returned at `19:45:00`, moved the client to `1226.210, -47.258, 911.200, 1.038`, and released the spawn gate at `19:45:01`. Exact-object ownership and actor-visibility readiness are newer than this run. |
| Sargas terminal and battlefield handoff | Implemented; live retest pending | `rad0f304` is followed by a same-area move to `1456.439, -59.131, 660.687, 2.474`. |
| Shaula terminal and battlefield handoff | Live-proven on the `19:09:38` Release baseline; latest session/landing guard pending | The normal terminal scheduled `rad0f305` at `20:01:09`, remained powered for five seconds, returned its client callback at `20:01:18`, moved the client to `1321.581, -63.386, 561.516, 1.868`, and released Shaula plus the three opening Bastard Mites. Exact-object ownership and actor-visibility readiness are newer than this run. |
| Open seals and boss doors stay absent after leaving and returning | Server-wire baseline proven; distance-safe/persistent-state rebuild pending | The return pass emitted two Field-I hide schedulers at `18:33:28` and the Antares-door hide scheduler at `18:33:33`. Latest source defers unknown distant actors, atomically binds visible unknown actors, and resolves chamber doors from boss-terminal activation in both spawn-state queries; the final visual cull/rebind retest remains pending. |
| Boss-death scenes, rewards, stopped timer, and voluntary return | Prior Antares/Shaula scene and reward baseline proven; voluntary-exit rebuild pending live retest | Antares previously completed `rad0f306`; Shaula dispatched `rad0f308` at `20:03:00`, returned its callback at `20:03:30`, and opened three earned coffers. Current source closes the widget after the accepted death callback, removes the former 90-second/all-coffers automatic return, and retains every online player until they accept the chamber porter. Sargas `rad0f307` and the full two-player stay/leave sequence remain live-pending. |
| Captured reward positions and chamber porters | Exact capture audit and isolated regression passed; rebuilt live retest pending | The audit locks all fifteen coffer and three porter tuples verbatim and requires earned coffers to fill capture slots 1 through 5 consecutively. The porter uses powered `1200203 / b936-e004`, binds `InstanceRaidExit`, and returns the accepting player to the recorded entry point. The running `19:09:38` DLL predates this work. |
| Concurrent coffer, duplicate-exit, and relog safety | Source/isolated coverage; rebuilt party retest pending | Coffer open uses reserve/commit/finally release to prevent concurrent entry, without claiming rollback of partial award side effects. Porter use retains exact-player exit claims and exact-session lifecycle gates. Clear publication retries transient coffer/porter failures; empty cleanup never transitions or force-logs-out an online player, preserves failed atomic ticket recovery, and removes state only after verified area deletion. |
| Two-to-four-player fan-out | Static/harness-covered; party retest pending | Every connected player in the private instance receives the activation regardless of distance or who spent the cells. Each member receives the same boss anchor with a small non-overlapping offset. After clear, one member may remain and loot after another uses the porter; a disconnected member keeps the original re-entry ticket until its expiry without forcing online members out. |

### Fast test checkpoints and party playback

`!totorak checkpoint entry|field1|field2|field3|antares|sargas|shaula`
prepares only the fields before the requested test, ensures the shared pool has
four cells, and moves the GM beside that terminal. For example,
`!totorak checkpoint shaula` bypasses Fields I-III, grants the cells needed by
the still-inactive Shaula device, and places the tester beside it. Activate the
device normally to exercise the real terminal, party cutscene, post-scene move,
door, and boss gate. The command is Lua-only and does not require rebuilding
the Map Server. It deliberately moves only the issuing GM and should not be used
to judge the visual opening sequence of prerequisite seals.

Natural terminal playback is instance-wide. Photocells and field state are
shared, and `ScheduleTotorakLegacyDutyCutsceneForParty` schedules the scene for
every connected player whose `CurrentArea` is that private instance. There is
no distance, terminal-participation, or individual-cell check: a second player
on the opposite side of Toto-Rak receives the scene too. Dispatch begins from
the same activation with a 500 ms delay, although a player already inside
another event can start slightly later while the server retries their event
owner. Boss-introduction callbacks then move every connected member into the
battlefield; the boss spawn gate waits for all arrivals, with the 30-second
fallback retained for a missing callback.

`!totorak livecs <scene>` remains a single-player raw playback probe. It is
useful for checking one installed scene quickly, but it intentionally does not
simulate natural party broadcast or spend cells. Use a checkpoint followed by a
normal terminal click for the actual multiplayer contract. Opening replay is
also deliberately rejected while another event or opening claim is active.

The current Map Server PID `48660` loads the `2026-07-24 08:17:32` normal
Release DLL (SHA-256
`7172A3D550CBC6F8BA22F1ADFFEB19924AF38552A18EF9D009775797A301040A`). It
contains the final r7 feature set, but it predates the entry-crash fix discovered
by its first live run. That run proves the failure happened before the cutscene:
the first four dynamic entrance enemies became immediately visible at
`08:19:36`, their packet batch flushed at `08:19:38`, and WER recorded the
client access violation at the same second. The server never logged an opening
scene dispatch or `CourtEventStart`, then timed out with `ZoneChanging=True`.

The corrected source makes `Npc.RebindForPlayerIfVisible` reject every dynamic
spawn while actor visibility is closed, and the encounter now waits for a
connected player to leave zone change and report stable post-zone movement
before its five-second settle window. The strengthened tracked validator proves
both gates and still freshly decodes all nine installed-client PWIB scenes
(`rad0f300`-`rad0f308`). The corrected source completed an isolated Release
build with zero errors at
`.codex-tmp/totorak-entry-crashfix-build-20260724/Map Server.dll` (`2026-07-24
08:29:16 -04:00`, `2,369,536` bytes, SHA-256
`D23A4E7CF4C97612D48BADEC0EFD0E5A678BE9DC80ECF130880938A0ED061B55`). PID
`48660` then stopped, and this exact corrected DLL was installed into the normal
Release output at `2026-07-24 08:37:40.044 -04:00`; its SHA-256 matches the
isolated artifact above. The server has not yet restarted on it. After restarting,
continue the live audit in this order:

1. For a pre-Grand Company solo test, set
   `totorak_npc_requires_grand_company_story=false` and
   `totorak_party_size_requirement_enabled=false`, restart the Map Server, and
   talk to Bloisirant. Verify Information/Requirements return to the menu, Leave
   and cancel do not enter, Enter -> No returns to the menu, and Enter -> Yes
   shows `Entering the instance...` before one landing, one `rad0f300`, and the
   duty widget after the callback. The log should show one reserved, dispatched,
   started, and completed generation with no duplicate claim. The static retail
   Requirements text will still mention Imperial Devices and a 2-4-player party.
2. Exercise `!totorak checkpoint field2` and `field3` separately, activating the
   shared second device normally. Confirm both `rad0f302` plays and each reuse
   owns a fresh five-second power-hold generation.
3. Run `!totorak checkpoint sargas`, activate the terminal normally, and confirm
   `rad0f304`, the exact battlefield landing, spawn-gate release, `rad0f307`, all
   captured coffers, the powered porter, exit prompt, and return point.
4. Repeat a short Antares or Shaula clear to verify its captured coffer layout.
   Open every earned coffer, wait more than 90 seconds, confirm the player remains,
   then test both cancel and accept on the reconstructed porter's leave prompt.
   Correlate the visual result with `[TotorakCoffer]` and `[TotorakExit]` lines.
5. Leave and re-enter the visibility range of every opened field seal and boss
   door. Confirm each remains hidden, including after cull/rebind or reconnect,
   and correlate the replay with `[TotorakSeal]` lines.
6. Repeat one natural boss-terminal activation with a real two-to-four-player
   party, keeping one member far away. Disconnect and reconnect one member while
   its introduction is pending or active; confirm all live members receive the
   scene, stale callbacks cannot move the replacement, distinct landings complete,
   and only then does the boss gate release.
7. Start a boss-death scene while one member owns another event, then reconnect
   that member during the retained clear window. Confirm the 30-second retry/replay
   entitlement follows only the live object, the accepted death callback closes
   the reopened widget, and no player is returned by another member's coffer use.
8. Disconnect once during an unfinished opening, reconnect to the same content
   copy, and confirm the old generation is cleared while only the previously
   requested intro is retried. A player who already completed it should receive
   the widget without another `rad0f300`.
9. Race two clients on one coffer and double-click a porter. Then have player one
   leave while player two remains to loot, and finally let player two leave while
   a reconnect is attempted. Confirm one coffer award path, one transition claim,
   failed-claim release, no forced logout or zone change, and cleanup only after
   no authoritative player or valid participant ticket remains; then tune combat
   without changing the captured positions or original enemy levels.

## 2026-07-24 14:35 natural-entry client crash correction

The natural Bloisirant guide completed correctly in the failing run: the client
returned `askMainMenu=3` at `14:35:16.280`, then returned from
`resetClientNeckDirection` at `14:35:16.623`. Content creation began at
`14:35:18.642`. Windows recorded `ffxivgame.exe` access violation `0xC0000005`
at `14:35:19.068`, fault offset `0x0069FB0A`, before the client sent its zone
landing acknowledgement and before any dynamic Toto-Rak actor, `rad0f300`, or
duty widget was published. The recovered guide bind is therefore not the crash
source.

The final client-visible area packet in that boundary logged
`Binding instance raid area ... /Area/PrivateArea/Occupancy/RaidDungeonSimple`.
That serialized the private-area `isInstanceRaid` slot as `true`, even though
the repository's earlier stock-client probes record that flag hard-crashing
private-area scene reconstruction. `PrivateAreaContent` now keeps two independent
states: `bindAsInstanceRaid` remains `true` for party, re-entry, and cleanup
classification, while a Toto-Rak-only suppression forces the client instantiate
slot to `false`. Toto-Rak applies the suppression before copying/spawning actors;
all other content-manager call sites retain their prior behavior. The occupancy
director continues to publish the recovered intro and widget only after the
client acknowledges landing.

The focused validator now locks the call order, the safe client slot, and the
unchanged server raid classification. It passes all population, terminal,
cutscene, reward, party, reconnect, and installed-client PWIB checks. An isolated
Release build completed with 0 errors and 44 existing warnings at
`.codex-tmp/totorak-client-bind-crashfix-build-20260724/Map Server.dll`
(`2026-07-24 14:49:32.511 -04:00`, `2,380,800` bytes, SHA-256
`B30BB58F3FF64216C89E15332022224FB2ECBA675596F4D1DD4134B6A26EC734`). It has
not replaced the normal Release binary. After rebuilding/restarting, a safe run
should log `Retaining server raid classification with client instance-raid bind
suppressed` instead of `Binding instance raid area name=Totorak`, then receive
the client's `0x0007`/visibility readiness before dispatching `rad0f300` and the
widget. Fresh solo entry should be repeated three times, followed by one
simultaneous two-player entry and one reconnect pass.
## 2026-07-24 16:03 second natural-entry crash correction

The rebuilt client-bind suppression was definitely active in the next failing
run. The guide returned `askMainMenu=3` at `16:03:38.574`, returned from
`resetClientNeckDirection` at `16:03:38.914`, and content startup began after the
intended two-second settle at `16:03:40.970`. The server logged
`Retaining server raid classification with client instance-raid bind suppressed`
at `16:03:41.110`, saved the captured Toto-Rak entry position, and completed the
private-area resolution. Windows then recorded a different `ffxivgame.exe`
`0xC0000005` at fault offset `0x002239F3` around `16:03:41.509`. The client never
sent zone-in acknowledgement `0x0007`; no dynamic population, opening scene, or
widget had reached it. This exonerates the guide event, its delay, and the
post-landing UI while proving that suppressing only the raid boolean was not
sufficient.

The remaining initial snapshot still published both native occupancy identities:
area class `/Area/PrivateArea/Occupancy/RaidDungeonSimple` and owned director
`Occupancy/RaidFst0Dungeon03`. Commit `5916b634` introduced both identities at
the same time as the raid boolean. The earlier successful Toto-Rak path had used
`/Area/PrivateArea/Content/PrivateAreaMasterSimpleContent`. Native inspection of
the new fault also placed it in the background scene/model actor family, matching
a scene-lifetime failure while the destructive actor table was being rebuilt.

The corrected entry flow now:

1. Retains server-side raid classification and the client raid-slot suppression.
2. Restores `PrivateAreaMasterSimpleContent` as the client landing shell.
3. Clears a stale `loginInitDirector` before every fresh or late transition.
4. Builds the fresh zone packet snapshot without the occupancy director.
5. Adds all successful entrants to the server encounter only after their zone
   snapshots are built, then starts the encounter with the complete party.
6. Waits for `0x0007`/actor visibility before publishing the occupancy director.
   Spawn, bind, init, and the first `rad0f300` or widget event share one
   capacity-admitted socket/generation transaction, so disconnect or queue-full
   rejection cannot leave a false "already spawned" marker.
7. Owns each publication with a reference-identity token containing the exact
   `Player`, `Session`, and actor-table generation. A stale disconnect callback
   therefore cannot suppress or remove its replacement session's director.
8. Applies the same deferred membership/publication order to reconnects and
   removes only the exact departing player's token.
9. Queues the entered-instance message after replacement actor-table construction
   instead of immediately before `DeleteAllActors`.

The focused validator now locks the simple landing class, server/client raid
split, fresh and late membership order, reconnect deferral, reference-safe
publication tokens, capacity-admitted director/event trains, stale-login-director
cleanup, and entered-message ordering. It passes the complete Toto-Rak population,
combat, terminal, cutscene, reward, party, reconnect, and installed PWIB suite.
A full isolated Release build of the current Map Server completed with 51 existing
warnings and zero errors at
`.codex-tmp/totorak-current-tree-final-20260724/Map Server.dll`
(`2026-07-24 17:13:39.267 -04:00`, `2,398,720` bytes, SHA-256
`ED1B3E1F92CF07292084FF9BA9E7EC70103D93284395EF3F48F58A79BF649138`). It has
not replaced the normal Release binary.
After rebuilding and restarting the normal Map Server, repeat natural Bloisirant
entry at least five times, then test simultaneous two-player entry and one
reconnect. A corrected fresh trace should omit `RaidFst0Dungeon03` from the
initial owned-director packet train, receive `0x0007`, log
`deferredContentDirector=True` with `manualPackets=True`, and only afterward
start `rad0f300` and the widget. If a native crash still occurs before `0x0007`
with both occupancy identities absent, the next isolated investigation is a
synchronous drain of the destructive zone packet batch; that generic transport
change is intentionally not mixed into this evidence-specific fix.

## 2026-07-24 17:18 third natural-entry crash correction

The deferred-director build was definitely active in the simultaneous
two-player failure. Toto-Rak content area `100000` was created in zone `159`,
both party members were moved into it, and the server encounter started with
party size two. Neither client then sent zone-in acknowledgement `0x0007`.
Because the landing gate never opened, neither client received the deferred
occupancy director, dynamic actors, `rad0f300`, or the duty widget. Party leader
Illusive Fizz remained looking at Bloisirant and crashed; Anzyr Rehmav reached
the content map but received no cutscene or widget. Neither completed the
server-side landing gate, but only the leader suffered the native crash.

Windows recorded a new `ffxivgame.exe` access violation `0xC0000005` at fault
offset `0x002443ED`. The local client instruction at that offset dereferences a
virtual method slot at object offset `0x120` while walking a collection,
consistent with an invalidated scene/actor object during replacement of the
actor table. This is distinct from both earlier Toto-Rak fault offsets and
confirms that the removed occupancy identities were not present at the new
failure boundary.

The transport packet batch had prevented flushing only while the transition
train was being constructed. Releasing the outer batch scheduled the normal
asynchronous flush, which intentionally yielded after 32 packets or four
milliseconds. A roughly 100-packet zone snapshot could therefore expose
`DeleteAllActors` plus only a prefix of its replacement scene state before the
next scheduled pass. The two visual outcomes reflect how far each client
processed that incomplete transition, not different content logic.

Destructive content-zone batches can now request a synchronous drain. A nested
request upgrades the enclosing transaction, so Toto-Rak's complete outer
transition train drains continuously while the connection still owns its send
flush lock. This closes the scheduler gap between `DeleteAllActors` and the
replacement snapshot while preserving the existing asynchronous behavior for
ordinary packet batches. Disconnect cleanup remains intact. A corrected trace
should show `[ZoneFlush] synchronous destructive-batch drain begin` and
`complete` with `remaining=0` for each member, followed by each client's
`0x0007` before the deferred director, `rad0f300`, and widget.

The focused Toto-Rak validator passes the full population, lifecycle, cutscene,
party, reconnect, reward, and installed-client PWIB suite, including a new
transport regression assertion. An isolated Release build completed with 50
existing warnings and zero errors at
`.codex-build/totorak-zone-drain/Map Server.dll`
(`2026-07-24 17:39:58.102 -04:00`, `2,400,768` bytes, SHA-256
`AA6FE8C10AD85299A69FD98EA48A7E62ED5CF460930E3FBF2298FCB258A74C1E`).
It has not replaced the normal Release binary; deployment, restart, and a live
two-player natural-entry retest are still required.

## 2026-07-24 17:51 leader-only landing crash and presentation correction

The synchronous destructive drain was active in the next two-player run and
completed with `remaining=0` for both clients: 108 queued packets for Illusive
Fizz and 97 for Anzyr Rehmav. This disproves an async scheduler gap as the
remaining leader failure. Anzyr completed the zone handshake, sent movement
2.637 seconds after transition, and remained active in Toto-Rak. Illusive sent
no further client opcode after its transition and timed out with
`zoneChanging=True` and `visibilityReady=False`.

Windows recorded Illusive's matching `ffxivgame.exe` crash at `17:51:03` as
`0xC0000096`, fault offset `0x044D8B1C`, with the faulting module unknown. That
exception means control reached an invalid/privileged instruction address and
is consistent with the same stale client-object family, but it is distinct from
the three earlier access-violation offsets.

The remaining structurally unsafe leader/member asymmetry is the player's owned
director list. `ClearLoginDirector` removes only the `Player_work` login pointer;
`SendZoneInPackets` still serialized every owned director, including deleted or
old-area directors, into the destination actor table. Content transitions now
request destination-area-only director publication. A skipped object remains in
server quest state but is not instantiated under the Toto-Rak area master. The
next trace will identify it explicitly through `[ZoneDirector] Suppressed
non-destination director during content landing`; absence of that marker keeps
the hypothesis falsifiable rather than treating this retest-dependent correction
as already proven.

Anzyr's server event also exposed a separate presentation failure. The server
bound `RaidFst0Dungeon03`, started `rad0f300`, and received its completion only
342 ms later, while the user observed neither the scene nor its widget side
effect. Opening dispatch now waits 2.5 seconds after progression population is
stable instead of one second. A completed opening callback also schedules a new
`relogin` noticeEvent 1.5 seconds later, so the authoritative timer widget no
longer depends solely on the cutscene handler's native side effect.

The focused validator passes the full Toto-Rak suite with new destination-director,
settle-delay, and widget-refresh assertions. An isolated Release build completed
with 44 existing warnings and zero errors at
`.codex-build/totorak-leader-isolation/Map Server.dll`
(`2026-07-24 18:06:21.506 -04:00`, `2,402,304` bytes, SHA-256
`BE437F53D60B5200FEE72A1CA9D77CB7285BB16B2E49A3164A8D3564E0AEF4A8`).
It has not replaced the normal Release binary. The next live test must confirm
Illusive reaches the landing movement marker and that Anzyr visibly receives
both `rad0f300` and the refreshed execution widget.

## 2026-07-24 18:15 leader entrance-event teardown correction

The next live traces separated an intermittent native client race from persistent
character or content state. At `18:10:06`, Illusive Fizz logged into public zone
175 without a Toto-Rak reconnect and then hit `ffxivgame.exe` access violation
`0xC0000005` at fault offset `0x0400000F`. The same character logged in normally
at `18:11:34`, so the fault did not leave a poisoned server-side re-entry state.
The user's Windower-disabled comparison also ruled out the Windower hook.

At `18:12:33`, both party members entered Toto-Rak and acknowledged landing.
The server then received opening-event start and completion callbacks for both
clients and queued both widget refreshes, although the users observed no visible
cutscene or widget. After a server restart, the `18:15:29` retry reproduced the
leader-only failure with the same 108-packet leader and 97-packet member batches.
Both synchronous drains completed with `remaining=0`; Anzyr Rehmav acknowledged
landing, while Illusive sent no landing movement and Windows recorded access
violation `0xC0000005` at fault offset `0x00410617`. Identical packet counts
working once and failing once exclude a deterministic truncated snapshot or
stale-director payload and point to client-side ordering/lifetime instead.

The remaining exact leader/member asymmetry was the entrance NPC event. Only the
party leader still owned Bloisirant's `talkDefault` event. Content entry formerly
queued `DeleteAllActors`, rebuilt the entire destination scene, and called
`EndEvent` only afterward. The client could therefore destroy the event's NPC
owner before processing teardown of the event that referenced it. This matches
the leader crashing while still looking at the NPC, before any black screen,
while the member had no such event owner.

Accepted content entry now closes the active event and synchronously drains that
small packet boundary while the old actor table still contains its NPC owner.
Only then does it begin cleanup and the destructive destination snapshot. Null or
rejected entries retain their existing event-close behavior. The focused
validator locks this order and the complete Toto-Rak suite passes. An isolated
Release build completed with 44 existing warnings and zero errors at
`.codex-build/totorak-event-boundary/Map Server.dll`
(`2026-07-24 18:24:20.609 -04:00`, `2,402,304` bytes, SHA-256
`9D6998819340CC82F506C4200001CAFBEBB45E867D7446FCB32FE1F058D3BF85`). It has
not replaced the normal Release binary.

On the next natural two-player entry, Illusive should log `[ZoneEvent] Closing
active event before content actor-table reset` with Bloisirant's owner ID,
followed by a completed synchronous drain before the larger destructive
`[ZoneFlush]` drain. Anzyr should have no `[ZoneEvent]` marker. Both clients must
then send the landing movement acknowledgement before deferred cutscene/widget
publication; visible `rad0f300` and the refreshed timer widget remain separate
presentation checks.

## 2026-07-24 18:26 generic zone-transition crash correction

The later crashes prove that the native fault family is not specific to dynamic
instances. The server was still running the `18:09:01` installed DLL (SHA-256
`7E11229C0073C0DC406330559E7372205C4AA353D1B0BA8FF867D46F17D59D0F`), not
the isolated entrance-event build, during these traces.

At `18:20:59.857`, Illusive Fizz confirmed an aetheryte warp while still owning
`commandContent`. `DoZoneChange` moved the character from Toto-Rak zone 159 to
public zone 175 and saved the destination at `18:20:59.912`. Windows recorded the
matching `ffxivgame.exe` access violation `0xC0000005` at `18:21:01`, fault
offset `0x00689D4E`. After the server restart, another ordinary zone change moved
Illusive from public zone 175 to public zone 154 at `18:26:50.672`; Windows
recorded `0xC0000005` at `18:26:51`, fault offset `0x006786AB`. The second trace
contains no dynamic content area at all. A separate `18:22:11` zero-address
client crash occurred while the restarted map server still had zero sessions,
so it cannot be attributed to a Toto-Rak packet.

Static disassembly of the installed 32-bit client places `0x00689D4E` inside a
loop over an object-pointer array: it reads an element vtable and dispatches slots
`+0x18` and `+0x90`. At `0x006786AB`, a small wrapper reads the retained object
at `this+0x64`, then jumps through that object's vtable slot `+0x5C`. The earlier
Toto-Rak offsets likewise fail while resolving virtual slots `+0x120`, `+0xB4`,
`+0x04`, and `+0x14`. The distinct call sites therefore share stale or destroyed
polymorphic client objects during scene replacement; they do not point to
navmesh, encounter Lua, or instance combat logic.

The shared unsafe path was generic `DoZoneChange`, not the instance manager. It
still ended an active command/aetheryte/NPC event only after `DeleteAllActors`
and its replacement snapshot, and both its outer transition batch and core reset
used the normal transport release. That release yields after 32 packets or four
milliseconds. The same full actor-table transition that Toto-Rak entry now drains
synchronously was therefore still being split during content exits and ordinary
public teleports. Login/reconnect used the same non-synchronous reconstruction,
matching the earlier intermittent login crash.

Cross-area `DoZoneChange` now sends and fully drains `EndEvent` against the old
actor table before any cleanup or actor deletion. Same-public-area warps preserve
their prior event order because they do not run `DeleteAllActors`. The complete
generic transition and its nested reset both request synchronous drain, covering
public teleports, content exits, private-area changes, and world-server handoff.
`DoZoneIn` also drains login/reconnect actor reconstruction synchronously. All
three code locations containing `DeleteAllActors` are consequently protected;
ordinary movement and non-destructive packet batches remain asynchronous.

The focused validator now locks generic event teardown, same-area behavior,
generic destructive draining, and login/reconnect draining in addition to all
Toto-Rak invariants. It passes. An isolated Release build completed with 44
existing warnings and zero errors at
`.codex-build/zone-transition-safety/Map Server.dll`
(`2026-07-24 18:35:17.569 -04:00`, `2,402,816` bytes, SHA-256
`2C0416D5B90A62882C51EAA790604649527002E4CFC2F54166D322A3FFE611D7`). It has
not replaced the normal Release binary.

Live verification should use this exact build and test, in order: login both
characters; public zone 175 to public zone 154; natural two-player Toto-Rak
entry; aetheryte/Teleport exit from inside Toto-Rak; then one reconnect while the
instance remains alive. Every cross-area event warp should log `[ZoneEvent]`
followed by its own completed drain, then a second `[ZoneFlush]` completed drain
for the actor-table transition. Eventless public teleports still require the
second drain. Every test must produce a client landing movement acknowledgement
and no new Windows `ffxivgame.exe` Application Error.

### 2026-07-24 18:40 partial live verification

The normal Release server was rebuilt and restarted at `18:39:33`. Its installed
DLL is `2,403,328` bytes with SHA-256
`545D2D80EFB2DC067B8C52A73502ABDC7AC197DD8814BB595AFA0E42915E9E90`;
it differs from the isolated artifact because it was built from the continuing
live tree, but the new runtime markers prove the transition correction is
present. Anzyr Rehmav logged in at `18:40:09`; the synchronous initialization
drain sent all 88 queued packets with `remaining=0`, then the client completed
its `0x0001` visibility handshake. Illusive Fizz logged in at `18:40:11`; its
100-packet drain also completed with `remaining=0`, followed by the same
visibility handshake. Windows recorded no new `ffxivgame.exe` Application Error
through `18:41:15`.

This validates the corrected login reconstruction for both clients, including
the path that previously crashed intermittently. It does not yet validate a
public teleport, Toto-Rak entry, content exit, or reconnect; none of those
transitions occurred after this restart in the available trace.

## 2026-07-24 18:42 member-only staged-reset correction

The first natural two-player entry on the `18:39:33` server narrowed the
remaining failure further. At `18:41:56`, both Illusive Fizz and Anzyr Rehmav
completed their synchronous content-transition drains (`108` and `97` packets,
respectively, both with `remaining=0`). Illusive then completed zone-in, sent
accepted movement at `18:41:59.251`, acknowledged `rad0f300` at
`18:42:07.391`, and received the delayed widget refresh. Anzyr never sent
`0x0007` or post-zone movement; its `ffxivgame.exe` process disappeared and the
server logged the expected landing timeout at `18:42:32.567`. The user confirmed
that this second client crashed. This exit did not produce a new Windows
Application Error or LocalDumps file, so there is no new native offset for this
specific attempt.

The same 108/97 transition shapes had previously succeeded for both clients and
failed on either client. A continuous synchronous socket drain therefore fixes
the server scheduler gap but does not give the legacy client a processing
boundary: `DeleteAllActors`, scene teardown, and roughly one hundred replacement
packets still arrive in one receive burst. That matches the nondeterministic
stale-vtable failures at several unrelated native call sites.

Destructive transitions now keep their transport ownership gate while publishing
two explicit stages. The first stage flushes all currently flushable teardown
packets, including `DeleteAllActors` and `_0xE2`, then holds a 100 ms quiet window
for the old client scene to retire. Packets produced by other threads remain in
`PostBatchPacketQueue`; they are not counted as flushable teardown and cannot
keep the stage loop alive. The server then queues the complete replacement
snapshot, appends the deferred packets after it, and performs the existing final
synchronous drain. This guarded boundary covers ordinary cross-area changes,
content entry/exit, and non-login `DoZoneIn` reconstruction. Fresh login, which
has no old actor table to delete, retains its one-stage initialization.

The focused validator now asserts teardown-before-rebuild ordering, batch-owner
checks, flushable-versus-deferred queue accounting, and the staged boundary in
all three destructive paths; the complete Toto-Rak suite passes. An isolated
Release build completed with 44 existing warnings and zero errors at
`.codex-build/zone-transition-staged/Map Server.dll`
(`2026-07-24 18:56:46.596 -04:00`, `2,405,888` bytes, SHA-256
`B6BCA17235756B667BD2D479A34CE84B31D3795BBF559F8EC8F3587ED09A6983`). It has
not replaced the running Release server. The next trace must show paired
`[ZoneFlushStage]` begin/complete lines with `remaining=0`, followed about 100 ms
later by the existing final `[ZoneFlush]` completion for each entrant.

### 2026-07-24 19:00 staged build deployment

An intermediate server started at `18:52:13` while the staged-drain queue review
was still in progress. It was stopped before further zone testing. The reviewed
isolated artifact was copied into the normal Release directory with matching
SHA-256 `B6BCA17235756B667BD2D479A34CE84B31D3795BBF559F8EC8F3587ED09A6983`,
and Map Server PID `47204` started at `18:59:49`. It completed initialization and
began listening on `0.0.0.0:1989` at `19:00:13` with zero sessions. Live entry,
public teleport, content exit, and reconnect verification remain pending.

## 2026-07-24 20:27 event-aware destructive transition

The first rebuilt two-player entry still crashed Illusive Fizz. Windows recorded
`ffxivgame.exe` access violation `0xC0000005` at fault offset `0x00410617`
while Illusive's staged content transition was between its three-packet teardown
drain and replacement snapshot. Anzyr Rehmav subsequently sent post-zone
movement and remained connected.

Static disassembly resolves the faulting virtual method to
`RaptureScreenEnvGlareClip` under the client cutscene scene system. The failing
instruction reads vtable slot `+0xB4` from the clip's retained screen-environment
object. Bloisirant's `askMainMenu` event had closed about two seconds earlier,
so its camera/environment clip could still receive a scheduler update after the
isolated `DeleteAllActors` stage retired the object table.

This complements the earlier member-only result: a party member with no recent
event needs the 100 ms teardown boundary, while the NPC-interacting leader needs
teardown and replacement kept atomic until its residual event clips expire.
`Player.EndEventWithType` now records the actual EventFinish publication time.
For five seconds after that timestamp, destructive zone changes bypass only the
intermediate teardown drain and keep teardown plus replacement in the enclosing
synchronously drained batch. Eventless party members retain the staged quiet
window. The same rule also covers command/aetheryte teleports that close an
event immediately before changing areas.

### 2026-07-24 20:38 leader event grace correction

The first live test of the event-aware atomic branch moved eventless Anzyr into
the instance but left NPC-interacting Illusive outside. Windows recorded no new
application crash, and the deployed Map binary contained the branch. This shows
that the atomic burst avoids the isolated-teardown access violation but is not a
reliable client zone handoff.

Bloisirant's entry coroutine now waits six scheduler seconds after EventFinish,
one second beyond the five-second recent-event protection window. Illusive then
uses the same staged teardown, 100 ms scene-retirement boundary, and replacement
snapshot that successfully moved Anzyr. The occupancy menu remains intact; only
the post-confirmation handoff grace changes.

### 2026-07-24 20:43 retained talk-turn clip and same-area transaction correction

The six-second leader handoff disproved event age as the remaining entrance
variable. At `20:43:25.248`, Illusive Fizz resumed from the final client event
update; content start followed at `20:43:31.289`. The leader's three-packet
teardown drained, the 100 ms retirement window elapsed, and all 106 replacement
packets drained. Illusive nevertheless crashed at that instant with the same
Windows access violation `0xC0000005` and fault offset `0x00410617`. Anzyr
Rehmav completed a 94-packet replacement, sent movement at `20:43:34.253`, and
remained connected.

The final event update returned `nil`, whereas `askMainMenu` returns the accepted
choice `3`. This identifies the entrance script's following
`resetClientNeckDirection` call as the final callback in the trace. The recovered
client method only wraps `finishCliantTalkTurn`, and it is unique to this
entrance path. Together with the native fault resolving to
`RaptureScreenEnvGlareClip`, the evidence indicates that this cosmetic finalizer
retains the screen-environment clip past EventFinish. The server keeps the full
recovered `askMainMenu` contract but no longer invokes that finalizer; the normal
`EndEvent` still closes the NPC talk owner.

The same audit found two independent partial-publication hazards affecting
in-instance teleports and players sharing a zone. `DoPlayerMoveInZone` and
`WarpToPosition` could flush `_0xE2` separately from the teleport and visibility
snapshot. A forced peer refresh could likewise flush `RemoveActor` before the
replacement player's spawn, init, position, state, and substate train. Both
same-area rebase methods now batch the complete self snapshot while updates are
locked, drain it synchronously, unlock in `finally`, and then synchronize peers.
Each peer remove/re-spawn train is also held as one synchronously drained viewer
transaction. This prevents either client from observing a half-rebuilt player
actor during simultaneous entry, an internal Toto-Rak warp, or a same-zone
refresh.
The focused validator passes with the retained-finalizer prohibition and the
same-area/peer transaction assertions. An isolated Release build completed with
50 existing warnings and zero errors at
`.codex-build/retained-clip-same-area/Map Server.dll`
(`2026-07-24 20:55:28.747 -04:00`, `2,406,400` bytes, SHA-256
`9D6ED86EDF8CB496B61DFFFCF4857EED9AD60553D6DB4227D27F4447DC5E898C`). The
artifact has not replaced the running Release server; the C# batching changes
require a rebuild/restart before live verification.
### 2026-07-24 21:09 live entrance confirmation and spatial reader closure

Two consecutive live two-player entries succeeded at approximately `21:04` and
`21:07`. Both Illusive Fizz and Anzyr Rehmav completed populated actor-table
landing, started and completed `rad0f300`, received the delayed occupancy widget,
and continued sending movement with two attached healthy sockets and empty
transport queues. The running Release DLL remained the older `20:36:45` artifact
(SHA-256 `4FBE31421AC6D585754D32AB49A70673AA8D425EA8F6DE62ABDF863F032DBE09`),
so none of the newly compiled same-area batching was present. Lua reload was the
only relevant delta. This isolates removal of
`resetClientNeckDirection`/`finishCliantTalkTurn` as the entrance-crash fix and
rules out Windower, the re-entry cooldown, and simultaneous content creation as
the leader's native `0x00410617` cause.

The remaining in-instance teleport audit found a separate server race. A
same-area move previously removed the player from `Area`, changed position, and
called `AddActorToZone`. That created an observable absent-player window and
cleared all Character temp variables. The replacement path now performs an
in-place `RepositionActorInZone` under the area-list and spatial-block locks,
preserving registration and temp state. Actor-centered visibility queries also
choose their subject grid under the same spatial lock; otherwise a concurrent
move could commit a query to the former grid before acquiring the reader lock.
Viewers left at the old location receive a guarded actor retirement, while new
viewers receive the already guarded complete replacement train.

The focused validator passes. A reflection-backed runtime probe preserved temp
value `77`, retained the exact registered actor, removed it from the old grid,
placed it once in the new grid, and completed `20,000` concurrent repositions
plus `20,000` actor-centered visibility reads without a missing or duplicate
snapshot. An isolated Release build completed with 44 existing warnings and zero
errors at `.codex-build/same-area-spatial-atomic-v2/Map Server.dll`
(`2026-07-24 21:08:42.477 -04:00`, `2,408,448` bytes, SHA-256
`E158B2613AC15FCC302BDECAA88E5F857D7B6BF972588B9CA19F753649CBCA04`). This
artifact has not replaced the running Release server; it must be rebuilt or
deployed before live internal-warp verification.
The normal Release output was subsequently rebuilt at
`2026-07-24 21:09:07.207 -04:00` and Map Server restarted at `21:09:09`.
The deployed `Map Server.dll` is `2,408,960` bytes with SHA-256
`D09C90D59CBAC9F12F5AE37E1F8E747A0CB41F99A520CB17947D9E415DDFB1A6`.
Running the same reflection/concurrency probe directly against that deployed
DLL again produced 40,000/40,000 consistent snapshots. Live two-player internal
warp, content exit, and reconnect verification remain pending.

## 2026-07-24 21:40 visible opening-scene identity correction

The stable two-player entry trace exposed a presentation false positive. Both
clients acknowledged `RaidFst0Dungeon03.eventNoticeCutScene(player,
"rad0f300", 1, finishTime)` and returned `EventUpdate` only 0.34 seconds later,
while the users saw no movie. The known-good 2026-07-23 occupancy trace held the
same callback for roughly 31 seconds and visibly rendered the scene. A fast event
ACK is therefore not proof that the stock client created the cutscene actor.

The distinguishing client identity is the private-area shell. The crash-safe
intermediate source had replaced retail `/Area/PrivateArea/Occupancy/
RaidDungeonSimple` with generic `PrivateAreaMasterSimpleContent`; the latter
accepts the director callback but does not provide the mode-61 occupancy runtime
envelope. Production source now restores `RaidDungeonSimple` while retaining all
later crash corrections: the content director is absent from the destructive
zone-in snapshot and remains post-landing gated; the actor table uses staged
synchronous publication; packets are route-local clones; same-area moves and peer
refreshes are atomic; and Bloisirant no longer calls the retained talk-turn
finalizer. This isolates the retail area identity from the older unsafe combined
zone-in configuration.

The focused Toto-Rak validator passes, and the isolated Release build completed
with 43 existing warnings and zero errors at
`.codex-build/totorak-visible-cs-20260724/Map Server.dll` (`2,408,448` bytes,
SHA-256 `6AE59DF34A8A4BB91071CDAF380ABF1755464D4D5EA02E8BD2B384890B43E4DF`).
The live Map Server restarted at `21:33:11` on the older
`8349551DD542CF9E8978F2C0E7F3215CA0181C0B0C1CD8FE33AE1117E9C93A11`
DLL and still holds it open. The corrected artifact is hash-verified as
`Map Server/bin/Release/Map Server.next.dll`; it must replace `Map Server.dll`
after the process stops. Live proof requires one solo entry first, then repeated
two-player entry with a visibly long `rad0f300` callback, widget, internal warp,
exit, and reconnect.
## 2026-07-24 21:50 retail entry-envelope correction

The 21:40 two-player trace disproved area identity as the sole presentation
cause. Both clients were already in `RaidDungeonSimple`, but the deferred,
post-landing occupancy spawn converted the opening request into a parameterless
event type `0x50` callback. That callback called `eventNoticeCutScene` inside
the wrong event envelope and returned after only 0.35 seconds, so the opening
claim was falsely recorded complete without a visible movie.

The proven 2026-07-23 18:25 trace used event type `0x05` with the complete
`"eventNoticeCutScene", "rad0f300", 1, finishTime` payload and remained active
from `18:25:55.120` until `18:26:26.471` (31.35 seconds). Disassembly of the
exact `18:18:43` known-good DLL shows why: Toto-Rak published
`isInstanceRaid=true`, attached every entrant to `RaidFst0Dungeon03`, started
that occupancy director, and only then built the destination zone snapshot.

Production source now restores that retail envelope while preserving the later
crash fixes. The unrelated `InstanceRaidBaseClass` actor remains absent;
`SendZoneInPackets` filters owned directors to the destination area; destructive
zone rebuilds drain atomically; routed packets are cloned per session; and
same-area reposition/peer publication remain atomic. Fresh and late entrants
therefore receive the required occupancy director in the guarded destination
snapshot rather than through a post-landing manual actor spawn.

The focused Toto-Rak validator passes. An isolated Release build completed with
44 existing warnings and zero errors, and the concurrent spatial probe again
reported 40,000/40,000 consistent snapshots. The build is staged as
`Map Server/bin/Release/Map Server.next.dll` (`2,408,448` bytes, SHA-256
`5CB6A2F5D4DDB4873738A8F83E148B2B6848EA19CE80B831B484725560559131`).
The running PID 67748 still uses the previous DLL; a controlled stop, promote,
and restart is required before live solo/two-player cutscene and transition
verification.
## Future legacy-instance reuse contract

The crash hardening is global and should benefit future public zones, private
areas, and instances: packets are cloned per session before routing; destructive
actor-table resets are socket-batched; recently closed client events keep
teardown and replacement atomic; content snapshots reject source-area directors;
same-area warps reindex actors without remove/re-add gaps; and peer refreshes are
published as complete per-viewer transactions. None of those protections depends
on Windower or a client-side hook.

The presentation envelope is deliberately per duty. A new legacy instance must
recover and validate its own area class path, `isInstanceRaid` bind value,
content-director script, membership/start order, event type, event payload,
cutscene arguments, widget calls, and reconnect behavior. Toto-Rak's proven
contract is `RaidDungeonSimple` + `RaidFst0Dungeon03` present in the destination
snapshot, followed by a type-`0x05` `noticeEvent` carrying the complete
`eventNoticeCutScene` payload. Copying Toto-Rak's identifiers, or enabling the
suppression/deferred-publication escape hatches without client evidence, is not a
generic instance implementation.

Server acceptance is not sufficient cutscene proof. Validation must confirm the
client returns the expected event type and payload, that the event remains active
for a plausible movie duration (or until an intentional skip), and that users
actually see the scene. The corrected Toto-Rak code and DLL satisfy the recovered
protocol and are deployed; visible two-client confirmation is still pending the
next entry test.

## 2026-07-24 22:06 native 0x50 opening-handshake correction

The live two-player entry after the retail-envelope rebuild disproved the 21:50
assumption that snapshot membership alone guarantees the first opening callback
will be type `0x05`. Both stock clients landed safely and the server sent the
complete `eventNoticeCutScene`, `rad0f300`, argument `1`, and finish-time
payload, but each client returned a native parameterless type `0x50` callback.
The Lua compatibility branch then made the critical mistake: it invoked the
cutscene inside that native event and recorded the generation complete after a
roughly 0.34-second ACK. No movie rendered, and the resulting false completion
also sent the widget refresh through the wrong active-event boundary.

Earlier crash-safe traces provide the recovery contract. Repeatedly, the first
post-zone kick returned type `0x50`; after that event ended cleanly, a second full
kick about two seconds later returned the required type `0x05`. Toto-Rak now
treats parameterless `0x50` as a handshake only. Lua neither claims, invokes, nor
completes `rad0f300` there. C# verifies the exact live Player reference, instance,
claim generation, and Dispatched state; moves that same generation back to
Scheduled; ends the native event; and publishes one full-payload retry after a
two-second clean boundary. The original start watchdog exits when it observes the
state transition, and the retry creates its own watchdog only after publication.

The retry is intentionally bounded to one attempt per claim generation. Its
one-shot marker is cleared on a new generation, normal completion, cancellation,
or player departure. If the retry also becomes native `0x50`, the claim is
released and the authoritative timer widget is scheduled instead of looping or
pretending the cutscene played. A later widget kick can also lose its `relogin`
command and arrive as parameterless `0x50`. When no opening claim owns that event,
Lua obtains the exact instance expiry from C# and executes `relogin` inside the
active native callback, preserving the authoritative cooldown rather than using a
default 60-minute value. Stale tasks cannot publish for a replacement session
because the existing reference-identity, area, socket-generation, landing, and
event-owner checks still apply.

This is a reusable lifecycle pattern, not a universal set of instance IDs. Future
legacy duties may reuse the global crash-safe transport and the bounded
native-handshake state machine only after traces establish that their client has
the same `0x50`-then-`0x05` behavior. Each duty must still supply its own area
class, director, event command, scene arguments, widget contract, and reconnect
semantics. The server path is entirely stock-client protocol handling; Windower
remains an optional diagnostic probe and is neither linked to nor required by the
server.

The focused validator, including the native-handshake Lua regression probe, passes.
An isolated Release rebuild completed with the repository's existing warnings and
zero errors. The resulting `Map Server.dll` is 2,415,616 bytes with SHA-256
`DD468A8DD8A771978F4561393F476C392E9E1D451609E88BB6EB145CBC9B3425` at
`.codex-build/totorak-native-0x50-handshake-20260724/Map Server.dll`. The live
PID 67484 remains on the 2,408,960-byte
`4647CB681C77CB9C96A2FCCCF3ADC7063D51F4BE6A2F8B7DEE5636111CBD52F8`
DLL; no promotion or restart occurred during this build. Visible two-client proof
still requires a controlled replacement and restart.

## 2026-07-24 22:40 exact private-area director ownership correction

The bounded native-`0x50` retry was useful diagnostically but did not restore
presentation. On the next two-player test, the opening command, its one allowed
retry, and the timer-widget `relogin` command all returned parameterless
type `0x50`. Both clients entered without crashing, proving that transport and
transition ordering were stable, but the stock client still did not recognize
the occupancy director that owned those events.

The landing trace identified the exact cause:

`[ZoneDirector] Suppressed non-destination director during content landing ... director=0x64F80002 script=Occupancy/RaidFst0Dungeon03 directorArea=_areaMaster@09F00 destinationArea=_areaMaster@09F00`

The two area names are identical, but they are different object references.
`CreateContentArea` registers the director actor on the parent `Zone`, leaving
`director.CurrentArea` set to that parent. The destination-only zone snapshot
correctly compares area references, so it suppressed the director from the
private Toto-Rak landing. Later binding saw the actor as the content director
and deliberately avoided a duplicate manual spawn. Every subsequent kick
therefore targeted an actor the client had never initialized and collapsed to
native type `0x50`, preventing both `rad0f300` and the timer widget.

Fresh Toto-Rak startup now assigns `director.CurrentArea = contentArea` before
membership, director startup, and any entrant zone change. The legacy occupancy
replacement path performs the same assignment before starting its director.
Registration remains on the parent `Zone`, while client-facing ownership now
uses the exact private-area object required by the reference-identity filter.
The global destination filter is unchanged, so unrelated or source-area
directors remain suppressed. This is a server-only stock-client fix and does not
require Windower.

The focused Toto-Rak validator passes, including static ordering checks for both
fresh and replacement occupancy directors and the Lua native-handshake
regression probe. An isolated Release build completed with the repository's
existing warnings and zero errors. The resulting `Map Server.dll` is 2,415,616
bytes with SHA-256
`1B8980B225D6D87D72508B0F0D1C13FA61CFF69284793409C4F4492BB52C765D`
at
`.codex-build/totorak-exact-content-director-20260724/Map Server.dll`.
The live PID 54912 still uses the earlier
`9AE1E52C3718CE3E572DB69FBF31C5F0652345D2821B7477D0595FCD7E89A045`
DLL; no promotion or restart occurred during this build. The next controlled
restart should be followed by a two-player NPC entry verifying that both
clients receive the opening cutscene and authoritative timer widget.
