# Dzemael Darkhold implementation and placement audit — 2026-09-14

The core dungeon flow is substantially implemented in source. It is a playable
reconstruction candidate, but completion of a fresh normal-party client run has
not been established by this audit. Exact retail spawn placement remains
unmeasured. A numerical completion or placement-accuracy percentage would hide
the distinction between implemented code, recorded ground and retail evidence.

This audit used AGENTS.md, the saved coordinate guide and validation registry,
the current placement manifest/generated C#, the runtime manager, both native
map overlays, the earlier video review, and additional original-run footage.
It changes documentation only; no mob, device, coffer, patrol, SQL or installed
server binary was changed.

## Current implementation

| Area | Implemented | Remaining qualification |
| --- | --- | --- |
| Entry and lifecycle | Dyrstweitz/quest entry, 4–8 player admission, level/access checks, private zone 231, timer, reconnect, replay and cleanup | Fresh normal-party entry through clear/exit needs client verification |
| Route | Six population stages, ten devices, twelve native doors/barriers, two inter-map portals and victory exit | Some gate conditions and terminal head counts are authored; transporter visual/event binding is a substitute |
| Population | 89 staged enemies/hazards/bosses, plus one inactive Soulgazer anchor | These are stage totals, not 89 simultaneous entry spawns or a retail census |
| Bosses | Deepvoid 50% enrage; Batraal shield/terminals, 80% and 40% phases, 12 adds, final Desolation and clear cleanup | Several timings, magnitudes and positions are server policy |
| Other wave | Ten Knights’ Quarters skeleton points and seal trigger | Full original seal/barrier sequence and exact wave positions are unresolved |
| Rewards | Six route/objective coffers, five conditional victory coffers and quest integration | Exact historical coffer offsets, some probabilities and the relic chest contract remain unresolved |
| Hazards | Single invulnerable Eye and Soulgazer identities, reusable route controller | Eye intentionally walks without attacks; Soulgazer has no reviewed route JSON |

The 138 manifest entries comprise 90 mob/anchor entries, 22 wave positions,
10 devices, six route/objective coffers, five possible victory coffers, two GM
access points and three portal sources. 135 preserve complete XYZ from the
frozen 1,409-node recording. Three preserve exact user-supplied replacements:
the upper Bone Nix and the first two gate devices. The shared entrance is a
separate user observation. None of these counts is an accuracy percentage.

## What the locations actually establish

The September 8 video pass already corrected the approach, Stables, Gullet,
Grand Hall, Devil’s Ledge, transporter approach, Falls, Granary and Knights’
Quarters species/room assignments. Its explicit timestamp-to-manifest mapping
remains in [the previous review](dzemael_video_placement_review_2026-09-08.md).

- **Ground provenance:** every current entry has an identified complete XYZ
  source. This does not independently prove model clearance or continuous
  walking between samples.
- **Room/species evidence:** multiple main-route sectors are supported by
  original footage. Individual pack counts, facing and spacing remain authored.
- **Exact retail home points:** no measured error bound has been established.
  A combatant’s position after aggro or while returning home is not its spawn.
- **Weakly evidenced areas:** Captain’s Quarters retains five earlier authored
  placements; the previous main-route footage did not establish them. Arena
  adds, chest offsets and hazard stops need more detailed registration.
- **Saved user points:** requested placements remain authoritative within their
  scope. The registry does not label the Darkhold screenshot points as separate
  confirmed ground tests or a general retail calibration.

Both maps belong to zone 231. Map one uses MapNavi 2900, base `(560,384)`;
map two uses 2902, base `(736,593)`. Both use scale 2. Their native projection
is `pixel = 2 * (world X/Z + base)`, with the individual crop origin subtracted
for the review PNG. The outdoor Coerthas transform must not be used here.

The map overlays and their adjacent `.frame.json` files were inspected:

- [Map one](maps/dzemael-grounded-20260908/map1.png)
- [Map two](maps/dzemael-grounded-20260908/map2.png)

The frozen capture’s excluded nodes 599–613 remain excluded. The supplemental
September 9 premerge inventory contains no zone-231 file and supplies no extra
Darkhold ground for this audit. Source-local node IDs must remain separate.

## YouTube review in this audit

These are sampled observations, not a claim to have watched every frame or
completed minimap calibration. Playback times below were checked in the player;
the dungeon countdown is a different clock. No screenshot-derived XYZ was
promoted into the placement manifest.

| Source | Sample inspected | What it supports; limits |
| --- | --- | --- |
| [Sylvarion Ryulong, FFXIV 1.0 Dzemael Darkhold 15min](https://www.youtube.com/watch?v=WmJxkVbowSI) | 1:30 | Bone Nix/recluse hippogryph encounter on the early approach. The combat log explicitly shows returning hippogryphs; visible actors cannot be counted as untouched spawn posts. |
| Same video | [3:00](https://www.youtube.com/watch?v=WmJxkVbowSI&t=180s) | Grand Hall circle, Imperial Veles/Myrmillo and Alpgrot Orobon labels, readable room outline on the minimap. Supports the prior room correction; active combat and overlapping nameplates prevent exact home-point recovery from this frame. |
| Same video | [9:00](https://www.youtube.com/watch?v=WmJxkVbowSI&t=540s) | Lower-route Bone Nix/Forsaken Souls and log of Deepvoid’s death, Level II field deactivation and population replacement. Supports progression context; the sampled frame is already after the boss fight. |
| [Batraal v1.18 Speed Run in 23:36](https://www.youtube.com/watch?v=SYWtisRBS-0) | [7:16](https://www.youtube.com/watch?v=SYWtisRBS-0&t=436s) | Deepvoid combat with Chain Bearer labels and combat-log activity. It provides an additional view for studying the ghost mechanic, not an exact spawn measurement. The page explicitly identifies version 1.18; do not silently assume all timings match later 1.x. |

The additional 24:14 video is linked directly by the participant’s
[August 2011 speed-run guide](https://forum.square-enix.com/ffxiv/threads/19663-Dzemeal-Darkhold-Speed-Run-Guide).
That guide describes ghosts teleporting to an inner circle during Deepvoid.
This qualitative mechanic should be investigated separately from ordinary
starting positions. The newly sampled combat frame alone does not establish
the teleport cycle, all destinations or the timer.

The earlier review’s [Blue Garter SR5C run](https://www.youtube.com/watch?v=WsaKqBbe4kY)
remains an existing source; it was not newly frame-reviewed in this audit.

## Concrete fidelity gaps

1. **Deepvoid’s Chain Bearers:** the manager currently declares eight fixed
   placements and a normal mob definition. `UpdateDeepvoid` only applies the
   boss enrage. No dedicated Chain Bearer alternating-position controller was
   found in the runtime/scripts. Ordinary combat AI is not evidence that the
   historical ghost teleport sequence is implemented. Review complete cycles
   before choosing endpoints, count, phase or cadence.
2. **Eye and Soulgazer:** the Eye uses 83 Grand Hall samples in a reversing
   walking-only route, deliberately retaining the user’s earlier preference.
   Soulgazer route loading is wired, but `dzemael_soulgazer.json` is absent.
   Full retail sectors, stops and casts are not reconstructed. Do not silently
   remove the walking-only preference during placement work.
3. **Lower progression:** the three lower-hall barriers share Deepvoid’s release
   condition; early gate circle counts and the single Knights’ seal are partly
   authored. They need comparison against visible retail activations.
4. **Home points and density:** the main-route footage supports species in
   sectors more strongly than exact positions. Captain’s Quarters and selected
   boss/add/coffer locations need footage that exposes undisturbed actors.
5. **Client acceptance:** a successful build does not establish that the normal
   party can enter, walk every gate, travel both ways, fight, receive rewards
   and exit without GM progression commands.

## How to tighten positions without inventing precision

For each candidate, preserve video ID, patch/era, playback timestamp, map page,
actor identity, whether it is idle/pulled/returning, and the visible landmark
correspondences. Register the minimap or full-map frame against that page’s
native artwork using multiple separated fixed landmarks and record residual
error. Verify zoom/orientation for each shot. A readable player marker locates
the player; it does not automatically locate every visible monster.

Then derive an X/Z region with explicit uncertainty and select a complete XYZ
sample on the correct floor, retaining its frozen source/node identity. Record
the horizontal distance from the visual estimate to that sample separately
from registration error. If no supported sample falls inside the justified
region, leave it unresolved and obtain a local position capture. Do not keep
an estimated X/Z while borrowing Y from a nearby point.

Confirm home points in a second run or across a sequence before changing
counts. Preserve the user’s explicit replacement points and excluded branch.
Apply supported private-instance changes through the manifest and generated
C#, followed by the existing tests and a fresh client route test. Any future
profile/database correction must also be present in the main SQL files.

This workflow can yield much stronger selected placements. The footage
inspected here does not support a promised whole-dungeon error such as ±1–2
yalms, and no arbitrary coordinates were substituted to meet that claim.

## Verification performed on 2026-09-14

- Placement exporter audit: 138 entries, frozen capture hash accepted.
- Placement/provenance tests: **19 passed**; generated C# matches the manifest.
- Map-coordinate tests: **18 passed**.
- Dzemael static validator: **passed**, including **five Lua parses**.
- Compiled traversal harness: **69 checks passed**.
- Release Map Server build: **passed, zero errors**, five existing warnings
  (package advisories and Blowfish sign extension).

The build output is isolated at `.tmp/dzemael-status-audit-20260914`. No server
was restarted or installed by this audit. Historical installation notes from
September 8 do not establish which binary a current running process uses.
Production door integration, full combat/reward acceptance and a populated
client clear were not newly run; earlier successful reports retain their dates.
