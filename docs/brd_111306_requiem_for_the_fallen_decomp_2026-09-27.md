# Brd0j6 deep decomp: Requiem for the Fallen (111306, Lv50)

JOB BRD, 2026-09-27. Instance quest (private SQB, two waves + song aftermath).

## Sources

- `job_blm_pld_brd_drg_decomp_2026-09-07.md` (Bard/111306 section)
- `marker-evidence.json`: 11225501 (475.20, 608.08, 102/201, zone 143)
- `brd0j610.json` scene placement (77 PC SetPos clips; first c01x pose
  (537.39, 213.73, 579.38); Jehantel slot 5; bow/arrow/prop slots)
- Gamer Escape/Gamercorner: Yotoli Hueloc the Austere, Coerthas Central
  Highlands; secondary reconstruction: war-band fight, then Jehantel's
  song (+ fells a risen Ixal with his bow)
- Empty `QuestDirectorBrd0j601`; Yotoli loot staging row (3117, Lv55,
  job 23, skill 14)

## Stages and flags

| Seq | Phase | Owner |
| --- | --- | --- |
| 65535 | Offer at Jehantel (`processEventJEHANTELStart`, EQ pc166/0x682) | NPC |
| 5 | War-band fight, Griffin Crossing (two waves) | Private SQB |
| 5+win | Song aftermath (`processEvent_010`/brd0j610; song FOLLOWS victory) | Content-owned |
| 10 | Reward talk at Jehantel (`processEventClear(8032705)`) | NPC |

No second NQ scene. `JEHANTELS_*_Follow` are phase remarks. Scene actor
1001964 (sabreur display) is presentation only, never a combat target.
Jehantel is giver/guide/scene participant, never a battle ally.

## Mobs (archive identities + adapter profiles)

| Enemy | Actor | Mob | Lv | Job | Skills |
| --- | --- | --- | --- | --- | --- |
| Ixali sabreur (wave 1) | 2206414 | 32753 | 53 | 3 | 5035 Ixali family |
| Ixali strongbeak (wave 1) | 2206415 | 32754 | 53 | 8 | 5035 |
| Ixali bravewing (wave 1) | 2206416 | 32755 | 53 | 8 | 5035 |
| Ixali fogcaller (wave 1) | 2206417 | 32756 | 53 | 23 | 5035 |
| Yotoli Hueloc the Austere (wave 2, NM) | 2206413 | 3117 | 55 | 23 | 14 (Sonorous/Terrene Blast, Remembrance, Chthonic Call, Blaster, Aerial Blasts) |

Wave order (band first, Yotoli second) is adapter tuning for the
journal's "war band"; no recovered order. Yotoli's CNJ spell list is
still unassigned (skill list only). Marker ground: zone 143 highlands
~215-225 (scene Y 213.7; node 3966 Y 224.8 ~144u away). Party cap 8.

## Rewards

Battle Voice 27227 (widget `(27227,1)`) + Choral Shirt 8032705
(server-authoritative grant; widget arg mirrors it). No authoritative
EXP recovered: none granted.

## Implementation

Standalone `brd0j6.lua` + `QuestDirectorJobBrd0j6.lua` (waves 1/2,
successEvent _010/brd0j610, cap 8, timeout 1500). Full runtime edge
guards (see reg doc). Shared template row stays HOLD (untouched).
