# Hrv200 Gridanian Roots — HOLD assessment

Assessed: 2026-09-26. Botanist 20 class quest. NOT implemented.

## What is recovered

- Opyltyl offer (1000153) -> Cicely briefing (1000326, marker
  11048001) -> Quarrymill weed-clearing -> moogle aftermath (020,
  AfterWarp) -> Opyltyl reward (030, AfterWarp; Brass Hatchet
  7020011 + 1,760 post-1.20 EXP maximum + 20,000 gil + 2,000 marks).
- DAT marker 11048002 (1449 / 920, zone 154) converts to square
  (45,47) — exactly the walkthrough's "across the bridge, map
  marker 45,47". Navmesh covers the approach (8 live nodes within
  30 yalms, Y≈-12..-14).
- Gather item is Spiny Turnip Leaves (11000018, DAT row 60).

## Why it stays held

- The Quarrymill leg is an **instanced, timed harvesting duty**:
  walkthrough requires Botanist to initiate at the marker, harvest
  inside an instance ("roughly 20 skill points/harvest"), and
  finish within **10 minutes**, followed by a moogle approach and
  a second (reward) instance in the Growery. The engine has no
  private gathering areas and no harvest timers; the class driver
  has no instance, timer, or failure/retry support for gathering.
  (A third-party issue claims open-world gathering; the
  walkthrough's explicit instance + timer language plus both DAT
  scenes' AfterWarp flags contradict it.)
- **Objective count unknown**: DAT gives no quantity (no $E8
  counter, unlike Fsh200's "five"); the walkthrough's "find a
  Spiny Turnip" is ambiguous singular and "clearing the last of
  the troublesome weeds" implies multi-but-uncounted. No
  delivery count can be set without inventing the objective.
- Node design (actors/transforms/count) unknown; turnip leaves
  swim in no gathering pool (same data gap as the remora, but
  moot without a count and an instance system).
- Marker 11048003 (guild push/cut-replay boundary, candidate owned
  by main scenario) role unresolved.

## What would unblock it

Private gathering-area + harvest-timer engine support with
failure/retry semantics, a sourced weed/leaf count, node design
from video/DAT, and marker 03 ownership.
