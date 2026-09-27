# MNK 111223 Mnk0j3 — The Pursuit of Power (Lv40) — deep decomp

Target file (repo-blocked, staged here): `FF14-Decomp/docs/mnk0j3_pursuit_of_power_decomp_2026-09-27.md`

## Stages / sequences
- 0 route: Erik offer `processEventStart` (offer pc88/0x679; accept 62 / decline
  15; grants Outdated Aetheriometer 11000553 ✓) → Widargelt step
  `processEventStartAfter` at Little Ala Mhigo (measurements unfinished → go to
  Mun-Tuy; local 1.5s fades, no warp).
- 5 battle: one Prince of Pestilence, actor 2100610 (FlyNormalNM/display
  3100612 ✓ actor row), level 47 (Mun-Tuy doc), skill list 6026 = eLeMeN NM kit
  (Brundleflight 23064, Thunderstrike 23066, Thunderwall 23067, Thunderstorm
  23068 ✓ list rows). **Mob row 3081 does NOT exist** (only a historical UPDATE
  mentions it) → new private row 32736.
- 6 measurement: use 11000553 at marker 11221203 → completes IN PLACE
  (completionOwner interaction): `processEventClear` (widget 58 + notify + wait
  3 + `mnk0j310` Default + wait 1 + world 55) then `processEventAfget` (long 79
  + ability 27109). No reward NPC.
- Journal: Wil 544 (Widargelt) / 545 (Prince; RECOMMENDED 3 companions) /
  546 (post-kill measurement) / 547 next notice. Selector map exists.

## NPCs / mobs / positions
- Erik 1060033 ✓; Widargelt 1060032 @ zone 171 (1213.7,251.53,106.98) ✓ row
  2484 (matches marker 11221201: 1213.67,107.29).
- Fight marker 11221202: zone 157 Mun-Tuy Cellars, (-784.71,-2289.16), map
  (6.87,3.99); 62 recorded nodes, Y≈-24.1 (`!pos 157 -784.970 -24.132 -2288.564`).
- Measurement marker 11221203: zone 157, (-751.64,-2287.66), map (7.20,4.00);
  46 recorded nodes, Y≈-23.3 (`!pos 157 -751.212 -23.345 -2287.505`). Display
  ??? — no actor class; item-use is location-gated (zone 157 + 40u radius of
  the marker) instead of actor-bound. `processEventPoint` text 57 has no
  recovered push owner → follow-up, not a blocker.

## Instance / triggers / rewards
- Private content `quest_sqb_mnk0j3_<ownerId>`, cap 4, timeout 900s.
- Rewards: exp 4260; action 27109 ✓.

## Edge cases → guards
Kill→6 via director (exact uniqueId). Item use at 6 requires: quest bound,
sequence 6, exact slot, zone 157 within 40u of (-751.64,-2287.66); then consumes
item + `CompleteJobQuestFromInteraction` (new guarded entry: exact quest/
sequence/eligibility, completionOwner interaction). Out-of-zone/early use →
silent reject (retail shows nothing until the kill). Wipe/timeout/disconnect →
retry at Widargelt (last route actor). Abandon/reacquire → registry re-checks
sequence; start-item re-granted (HasItem guard prevents dupes). Party cap 4.
Mounts: engine-handled. No sync (retail-fixed level 47 boss vs lv40 quest).
