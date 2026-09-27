# 110019 Man406 placements — coordinate-guide evidence

Method: `tools/mobspawns/map_coordinates.py` (`maps` + `locate --world`), zone 190
Mor Dhona, native page 3500 (base 1280/1344, scale 1), live recording
`Data/quicknavmesh/zone_190.tsv` (10150 nodes, sha256 `1c740cb5…451ba`).
Per the guide: heights belong only to their recorded positions; a page selects
the transform, not a floor. Every in-copy placement below sits on recorded
ground within 5 y horizontally with a matching floor height.

## Combat roster (all map cell (14,7))

| Mob | Script XYZ / rot | Map XY | Nearest node (dist / Y) | `!pos` |
| --- | --- | --- | --- | --- |
| Juggernaut | 188.595, 44.0, -640.177 / -1.428 | (14.69, 7.04) | 5377, 2.45 y, Y 44.00 | `!pos 190 190.953 44.000 -639.505` |
| Centurion | 182.257, 43.843, -643.488 / -0.063 | (14.62, 7.01) | 5398, 4.50 y, Y 43.27 | `!pos 190 177.936 43.274 -642.237` |
| Hoplomachus | 184.175, 44.346, -633.383 / -1.159 | (14.64, 7.11) | 5305, 3.37 y, Y 43.70 | `!pos 190 183.000 43.697 -636.540` |
| Sagittarius | 195.774, 44.343, -641.046 / -1.159 | (14.76, 7.03) | 5376, 2.13 y, Y 44.59 | `!pos 190 197.546 44.592 -642.223` |

60-70 recorded points within 30 y of each combatant; nearest public mob
(truffle_hog id 4100) 17-25 y away — no overlap with the private encounter.
Combat entry `(128.823, 44.257, -636.224)` shares the same arena floor.

## Duty entry / pursuit start (map cell (11,6))

- Duty entry `(-168.856, 18.64, -703.84)`: map (11.11, 6.40), node 1244 at
  2.93 y (`!pos 190 -168.621 18.598 -706.757`), 44 recorded points in 30 y.
- Pursuit route start `(-152.77, 18.46, -704.93)` continues the same recorded
  road east toward `(101.03, 39.61, -662.44)`; all 77 waypoints are the saved
  player recording verbatim (validator-enforced, drift < 0.001).
- Public trigger SQL row id 3083 `man406_revenants_toll_trigger` at
  `(-218.47, 18.542, -666.627)`, map (10.62, 6.77).

## Cave aftermath (map cell (15,5))

- Cave arrival `(265.47, 56.408, -799.867)`: map (15.45, 5.44), node 6006 at
  3.44 y (`!pos 190 263.818 56.815 -796.855`), 19 recorded points in 30 y.
- Children cluster `x 296.6-297.9, y≈55.1, z -799.0..-800.2`, rot ≈ -1.2..-1.8
  (facing the arrival point); trigger spawn `(227.76, 62.0, -788.86)`.
- Nearest public mob (fallen_captain id 966061) 21 y away — no overlap.

## Boundary

Content square `(-300,-830)-(340,-630)` covers duty entry → arena → flee path
(anchors to `(283,46,-690)`) → cave in one copy; flee anchors and cave arrival
are all on recorded ground per the same zone-190 recording.
