# Ifrit Hard Plume placement and Eruption trail handoff

Date: 2026-08-06
Status: implementation ready; retail placement and cadence still require live confirmation

## Durable state

The localized warning art is proven:

- hidden m852 state 0x80 is Radiant Plume;
- hidden m852 state 0x20 is the Eruption ground-crack warning;
- WSS16 is the presentation-safe SubStatusKick used to commit either state;
- private commands remain authoritative for damage.

The repository now has a GM Plume placement authoring workflow. No phase coordinates have been captured yet. The rough live recollection is approximately eight localized Plume origins per pattern, with their positions changing slightly between phases. Treat that count as a starting observation, not a locked retail value.

## Resuming Plume placement capture

Start a solo Hard test and stand at each desired Plume origin. Use a separate phase label for every distinct layout:

    !testifrit plumeplace phase1 add
    !testifrit plumeplace phase2 add
    !testifrit plumeplace phase3 add

Repeat add while walking between points. Each point immediately displays the real, harmless Plume warning art and is appended to a durable tagged Map log export.

Useful controls:

    !testifrit plumeplace <phase> add
    !testifrit plumeplace <phase> undo
    !testifrit plumeplace <phase> show
    !testifrit plumeplace <phase> hide
    !testifrit plumeplace <phase> export
    !testifrit plumeplace <phase> clear
    !testifrit plumeplace all export

Aliases plumepos and plumemark route to the same workflow. Phase names are free-form safe labels, so descriptive names such as early-center, early-outer, and post-hellfire may be used once the retail sequence is known.

The in-instance list is temporary, but every edit and explicit export writes Lua-ready coordinates under:

    [IfritPlumePlacementExport]

Current Map log location:

    Map Server/bin/Release/Logging/2026-08-06/map.log

The exported rows include x, y, z, and rot. Copy the final tables into IfritEncounter.lua only after every phase has been visually checked.

## Provisional Hard Eruption reconstruction

Hard Eruption is intentionally isolated behind four tuning constants:

    HARD_ERUPTION_EARLY_PULSES = 1
    HARD_ERUPTION_TRAIL_PULSES = 3
    HARD_ERUPTION_TRAIL_STEP_YALMS = 2.0
    HARD_ERUPTION_MOVEMENT_EPSILON = 0.25

Current policy:

1. During the first Hard special phase (75% to 60% HP), Eruption creates one frozen warning and one matching damage circle.
2. At 60% HP and below, including the Nail phase, Eruption creates a three-point trail on one selected non-tank player when possible.
3. Point one snapshots the selected player's position.
4. Before points two and three, the director samples the player's displacement since the prior point.
5. If displacement is at least 0.25 yalm, its normalized direction becomes the new trail direction.
6. The next warning is placed exactly 2.0 yalms from the previous warning along that direction.
7. If the player has not moved enough to establish a new direction, the previous direction is retained; the player's facing is only the initial fallback.
8. The hidden warning carrier and the authoritative private-command damage query receive the same explicit world coordinate.

Every successful point logs its pulse number, position, normalized direction, direction basis, and step. This makes a future live comparison sufficient to retune count, distance, sampling, or cadence without changing the proven art and damage plumbing.

## Items to confirm live

- whether the first phase truly uses one point rather than a three-point trail;
- whether every later Hard Eruption uses three points;
- whether the trail is one selected player or multiple simultaneous targets after Hellfire;
- whether two yalms is the correct world-space step;
- whether direction is re-sampled for the third point or locked from the player's first movement;
- the exact delay between successive warnings;
- whether Eruption is present during the four-Nail window;
- the exact number, order, and coordinates of each Plume layout.

Until those checks are complete, the Eruption count and directional trail are reconstruction policy, not decomp-confirmed retail facts.

