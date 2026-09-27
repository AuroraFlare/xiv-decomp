# Garuda Hard: clone-resolution timing follow-up, 2026-09-07

## Result and evidence threshold

The two cached original-FFXIV-1.x recordings show approximately **36–39 seconds
from Suparna's visibly depleted health to the following South announcement**.
They do not substantiate the former random **40–45 seconds after sister
resolution** as a measured retail rule. They also do **not** identify one exact
replacement timer.

Crucially, **neither inspected recording exposes a decisive literal
`<player> defeats Suparna/Chirada` message for this pair of sisters**. These are
carefully distinguished visual health/target-resolution observations, not
combat-log-confirmed server death timestamps. The Monk recording establishes
the Chirada-then-Suparna target sequence clearly. In the supplied reference,
Chirada is not selected by this player during the relevant interval, so treating
Suparna as the last sister is a plausible but less direct inference.

No production code, encounter placement or original video was modified.

## Method and sources

- [Supplied reference, `rzVsuAo30hs`](https://www.youtube.com/watch?v=rzVsuAo30hs):
  existing local 1280x720 stream, 23.976024 fps.
- [Monk recording, `4PPUsXfjWRM`](https://www.youtube.com/watch?v=4PPUsXfjWRM):
  existing local 1280x720 stream, 25 fps.

Coarse contact sheets located candidate events; quarter-second full frames were
then checked individually. Timings use video-presentation seconds. The source
hashes and original cache provenance are in the
[earlier artifact README](../outputs/garuda-video-timing-20260907/README.md).
The [new evidence directory](../outputs/garuda-clone-timing-20260907/README.md)
contains full frames and exact reproduction commands. No new video download or
browser playback occurred in this pass.

The pale bar *beneath* the pink target-name strip is the health display; the
persistent pink name strip must not be mistaken for full health. A depleted
health display, purple/dim target name and subsequent disappearance support
resolution, but do not decode the underlying server actor-state transition.
Health interpolation and delayed combat-log entries prevent packet-level timing.

## Supplied reference: last visible Suparna resolution

The first clone West announcement was previously bracketed in `(344,345]`.
Suparna is the player's selected target from roughly 352 seconds while Chirada
is separately visible earlier. Suparna's health decreases throughout the next
30 seconds; this is not a Garuda HP bar being mistaken for an add.

| Full-frame observation | Video time | Meaning |
|---|---:|---|
| Suparna still selected, tiny positive health segment | 381.50 | Last retained clearly positive frame |
| Health visually depleting/empty; name changes dim/purple | 381.75–382.00 | Resolution-looking UI transition, not a defeat message |
| Suparna target strip still present but fading/empty | 382.75 | Empty target is still being rendered |
| Suparna target strip gone; visible remaining boss is Garuda | 383.00 | Visual removal confirmed in this camera view |
| South announcement absent / present | 418.00 / 418.50 | Announcement in `(418.00,418.50]` |

The conservative displayed-health bracket `(381.50,382.00]` to the announcement
gives approximately **36.0–37.0 seconds**. The tighter visually empty 381.75 frame
would narrow this to 36.25–37.0 seconds, but the displayed bar animation is not a
server death clock. Target-strip disappearance `(382.75,383.00]` to the same
announcement gives **35.0–35.75 seconds** instead. These are different observable
events; do not silently mix their anchors.

The player's General log retains Suparna's earlier Downburst and Chirada's
earlier Downburst miss; it shows no new sister-defeat line at the visual
resolution. There is no directly observed Chirada health-to-zero sequence from
this player's target view. Other actors can also be occluded by the central
combat cluster, so this recording alone cannot certify which invisible moment
the server considered *both* sisters resolved.

## Monk recording: Chirada first, then Suparna

The first clone West announcement was previously bracketed in `(283,284]`.
The player attacks Chirada, then changes to Suparna, then Garuda. The left battle
log explicitly names the selected sister in damage lines, independently checking
that these target bars do not belong to Garuda.

| Full-frame observation | Video time | Meaning |
|---|---:|---|
| Chirada selected with a very small health segment; attacks name Chirada | 319.00 | First sister close to resolution |
| Chirada's displayed health further depletes and target name changes | 319.25 | Resolution-looking transition; no literal defeat line |
| Selected target is Garuda after Chirada disappears from selection | 319.75 | First target removal/switch visible |
| Selected target is Suparna, with significant remaining health | 322.00 | Second sister still alive after Chirada sequence |
| Suparna selected with a small positive health segment | 329.50 | Last retained clearly positive frame |
| Suparna selected with visually empty health | 329.75 | Depleted-health display |
| Empty Suparna target still selected / Garuda newly selected | 330.50 / 330.75 | Second removal/retargeting transition |
| South announcement absent / present | 368.25 / 368.50 | Announcement in `(368.25,368.50]` |

Displayed-health depletion `(329.50,329.75]` to South gives approximately
**38.5–39.0 seconds**. Empty-target removal/retargeting `(330.50,330.75]` to South
gives **37.5–38.0 seconds**. The sequence makes Suparna the best-supported final
sister in this pair, but manual retargeting is not an authoritative death event.

The left battle log shows final Suparna damage and later Garuda damage. Some
late-arriving Suparna action text persists after the visible health is empty;
that is not evidence of a newly living sister or an exact death time. No literal
defeat entry was recovered from either visible log pane. At 330.75 the bottom
line is a **Heavy Shot hits Suparna** damage result, not a defeat message.

## Were casts visibly delaying the next South pattern?

The final reference 412–419 seconds and Monk 362–369 seconds were inspected in
half-second steps; candidate text was rechecked in full frames.

- Reference: a new **Garuda readies Slipstream** line is absent at 411.50 and
  visible by 412.00. It is already an old retained line throughout the final
  seconds before South 418.50. There is no new readies line in 412–418.50. Garuda
  remains visibly in combat at 417.00. The log does not show an unambiguous
  Slipstream completion or outstanding-cast state at the putative 35-second
  post-sister threshold.
- Monk: the visible left battle log in 362–369 seconds contains player actions
  and Garuda ordinary **attack** results, including the full 366.50 frame. It
  does not expose a Garuda special readies/completion line in that window.
  The right pane shows the South announcement by 368.50 while the boss is
  beginning the pattern-transition animation.

Accordingly an accepted-cast/animation guard is reasonable encounter-engine
behavior, but **these frames do not prove that such a guard caused the roughly
two-second difference between the runs**. An ordinary autoattack line must not
be relabelled as Slipstream, Downburst or Wicked Wheel to explain that difference.

## Implementation implications and remaining uncertainty

### Additional WHM sample: why not impose a universal 35-second delay

The [WHM recording](https://www.youtube.com/watch?v=V-fCnnk7ZYg) adds a different
following branch: West with sisters, then Mirage. In the 328.00-second full
frame a bright sister silhouette and Chirada name are still at camera-left;
by 328.50–329.00 those silhouettes are no longer visible and the party is around
Garuda. This is **not** a selected-sister health or authoritative death bracket:
the healer targets party members, the camera shifts, and Suparna damage messages
continue arriving at 330.00. No literal sister defeat was recovered here either.

The Mirage announcement is absent at 370.00 and present at 370.50. The visible
disappearance-to-announcement gap is therefore about **41–43 seconds**, unlike
the shorter South observations above. Six full frames are preserved under
[`whm/`](../outputs/garuda-clone-timing-20260907/whm/). Their uncertainty precludes
recovering a separate retail Mirage timer, but they are a reason **not** to force
every clone branch to a fixed 35 seconds from these videos. The current 40–45
policy remains explicitly unverified and does not fit both South samples cleanly;
no new universal constant or probability distribution has been proved.

### Constraints on a future timing change

1. Stop describing 40–45 seconds after sister resolution as video-measured.
   Both observed depleted-health-to-announcement spans are shorter than 40.
2. If a closer provisional reconstruction is needed, **35 seconds after
   confirmed server-side sister resolution plus existing safety/accepted-action
   guards** is a plausible minimum consistent with these observations. It is
   **not a recovered retail constant**, and the reason for any added latency
   remains unproven. A bare immediate 35-second transition would also be earlier
   than the displayed-health-to-announcement interval in both recordings.
3. Preserve the distinction between sister HP reaching zero, actor resolution,
   target disappearance, jump animation and wind announcement. Choosing any one
   as a timer anchor can shift an otherwise identical duration by 1–2 seconds.
4. A packet trace, unfiltered sister-defeat combat log with the matching next
   pattern, or a stronger sample of independently timed pairs is still needed
   for an exact clone cooldown. These two runs cannot establish randomization,
   one universal clone interval, or timing for every Mirage-to-next branch.

This report supplements, rather than replaces, the separately measured South
pattern-start-to-next-pattern intervals in
[the prior timing follow-up](garuda-video-timing-followup-2026-09-07.md).
