# 110014 Together We Stand (Man206) — indepth decomp notes, 2026-09-27

Lv.22 MSQ, solo + Path Companion stealth escort. Zone 151 East Shroud,
static private area `PrivateAreaMasterPast/1`, director
`/Director/Quest/QuestDirectorMan20601` (`QuestDirectorMan20610.lua`;
`MAN20610` is the `processEvent016` HQ scene key, not the director class).
Boundary square `X 1200..2400 / Z -1700..-450`.
Mission timer 30 min (authored value; retail duration unrecovered).

Sources: `man206.lua`, `QuestDirectorMan20610.lua`, `ChocoboCaravanRoute.cs`
defaults, `EscortRouteDirector.cs`, `Player.cs` talk routing, `quest.csv`,
`quest_marker.csv`, `cutReplay.csv`, `xtx_status.csv` (223993),
`server_battlenpc_mob_types.sql` (1366-1369), `zone_151.tsv` (5313 nodes,
sha `609638ee…`), 3 escort routes, Gamer Escape `Together_We_Stand`
walkthrough steps 13-16.

## SEQ / event matrix (no loopholes)

| SEQ | Objective | Owner/event | Advance |
| --- | --- | --- | --- |
| 0 | Enter Minfilia's office | W office door `processEventUdowntownrectStart`; Minfilia `processEvent001` (accept=1 zones to 181) | 5 |
| 5 | Contact companion by linkpearl | NPC-LS packs by personality 1-9 | 10 via `StartSequenceForNpcLs` |
| 10 | Meet companion, Gridania Aetheryte Plaza | Push trigger 1090177 `pE12` (SNPC tuple) | 15 |
| 15 | Rendezvous Camp Nine Ivies | Push trigger 1090178 `pE13` (must return 1) + exclusive director + entry gate | 20, zone to 151/Past/1 |
| 20 | Head north to Moonspore Grove | `processEvent016` at trigger `(1927.550,-1058.200 r2.5)`; Dokixia `pE20` once companion within 15y | 25 + podling status 223993 |
| 25 | Carry podling to Flaxio | Flaxio `pE30` once companion within 15y | 30, clear status, exit `(1700.337,20.022,-866.217)` |
| 30 | Report to Tataru, Waking Sands | `processEvent040` + reward window (`REWARD_EXP=11000`, gil 60000) | complete |

Guards: SEQ_015 re-push while inside fails on exclusive-busy; SEQ_010/015
triggers are sequence-locked; entry gate = combat class + dismounted +
alive + public area; decline of `pE13` cancels entry without mutating SEQ;
fail/abandon/timeout/leave/death reset 20/25 -> 15 and clear podling
status. Talks to Dokixia/Flaxio route through the live director
(`Player.TryRouteQuestContentNpcTalk`); quest `onTalk` SEQ_020 Dokixia
branch is fallback dialogue only. `onFinish` clears podling status (fires
on abandon too).

## Actors / triggers

Waking Sands: Tataru 1001046, Minfilia 1000843, Almxio 1001085, Zoxio
1001086, Diluxio 1001178, doors 1090160/1090161/1090162, market entrance
1090265, ambient cast (see `man206.lua` constants). Merchant Ward flavor:
1000835/1001112/1000812/1001015 (SEQ 5-10) and 1001222/1001379/1001228/
1001229/1001230 (+1001015 repeat) from SEQ 15. Gridania SNPC trigger
1090177. Nine Ivies rendezvous trigger 1090178 @
`(1882.422,34.153,-1018.115 r1.392)` = inbound route wp0 exact.
Dokixia 1001238 (display 2450021), Flaxio 1001237 (display 2450020);
sylph look variants 1024/1056, floating height 3.5. Path Companion:
player SNPC actor class + nickname, plain NPC (never Ally: client-unsafe),
no combat AI per retail ("will not assist you").

## Positions / rot with grounding

Map: Black Shroud navi row 2100, base `(3104,3808)`. Grounding key:
R=nearest escort-route waypoint (walked ground), N=quicknavmesh node,
M=DAT marker, !=needs live `!pos` check (height unresolved).

| Point | X | Y | Z | Rot | Ground |
| --- | --- | --- | --- | --- | --- |
| Entry / return | 1882.422 | 34.153 | -1018.115 | 1.392 | R inbound[0] 0.0u dY 0.00 |
| Post-CS start / 016 trigger | 1927.550 | 34.356 | -1058.200 | 0.350 | R inbound[37] 0.0u dY 0.00 |
| Almxio | 1997.537 | 34.554 | -1070.002 | -2.256 | R post[51] 2.6u dY +0.46 |
| Flaxio / handoff | 1979.560 | 33.426 | -1067.752 | 1.931 | R return[472] 3.6u dY +0.41 |
| Zoxio | 2185.881 | 32.214 | -1352.869 | -0.831 | R return[237] 5.7u dY +0.39 |
| Diluxio | 2133.905 | 48.251 | -1531.625 | 2.374 | R return[131] 0.9u dY +0.04 |
| Dokixia | 2239.857 | 32.004 | -1697.957 | -0.059 | R post[520] 0.8u dY +0.00 |
| N retiarius 1 | 2045.685 | 32.202 | -1066.061 | -2.886 | R post[88] 15.3u dY -0.13, route terrace |
| N retiarius 2 | 2197.018 | 31.981 | -1276.283 | -1.602 | R return[278] 7.3u dY +0.27 |
| N triarius 1 | 2180.387 | 40.930 | -1417.888 | -1.169 | R return[202] 4.5u dY -0.28 |
| N triarius 2 | 2154.995 | 49.733 | -1589.024 | 1.203 | ! nearest R 27.2u dY +4.92, nearest N 44.6u |
| R hastatus 1 | 2159.232 | 49.156 | -1477.923 | 2.284 | R return[170] 19.2u dY +0.09; 12 N in 30u |
| R speculator 1 | 2032.731 | 39.953 | -1099.115 | -0.486 | ! nearest R 9.7u dY +1.70, nearest N 234u |
| R retiarius 1 | 2135.319 | 31.936 | -1084.873 | -1.318 | R post[127] 0.5u dY +0.03 |
| Completion exit | 1700.337 | 20.022 | -866.217 | 1.483 | M 11001403 `(1700.49,-868.11)` |

Live probes: `!pos 151 2154.995 49.733 -1589.024` and
`!pos 151 2032.731 39.953 -1099.115` (confirm floor, adjust Y only from
observation). All spawns inside the boundary; Dokixia Z -1697.957 is 2u
from the -1700 edge by design (route end). Sentinels are deliberately
off-path: retail warns not to follow the companion near soldiers.

## Cutscenes (replay rows)

| Row | Key | Launcher | Payload | Lifetime |
| --- | --- | --- | --- | --- |
| 11001401 | man20600 | startNQCutScene | static | after-warp, keep open |
| 11001402 | man20601 | startNQCutScene | static, branch on return | after-warp on accept |
| 11001403 | man20602 `pE12` | startSnpcNQCutScene | SNPC -201..-205 | default fade |
| 11001404 | man20603 `pE13` | startSnpcNQCutScene | SNPC tuple, branch | after-warp on accept; entry only on result 1 |
| 11001405 | man20610 `processEvent016` | startHQCutScene (type 2) | static, no SNPC args | director-owned |
| 11001406 | man20620 `pE20` | startSnpcNQCutScene | SNPC tuple | default fade |
| 11001407 | man20630 `pE30` | startSnpcNQCutScene | SNPC tuple | after-warp, keep open |
| 11001408 | man20640 | startNQCutScene | static | after-warp, reward after |

Markers 11001401/02 Waking/Gridania, 03 Nine Ivies, 04 approach
`(1927.12,-1051.81)`, 05 deep Moonspore `(2239.62,-1699.02)`,
06 Flaxio `(1980.94,-1067.98)`, 08 finale. 09-20 duplicate Waking rows.
Dialogue clusters: `000_2..11` panic, `001_2..11` reactions/exposition,
`010_2` Tataru confirm, `012_2..7` ambient warnings, `016_1..3` sylph
concealment lines, `020_2` Dokixia carry orders, `030_2..8` return
chatter, all wired.

## Mob AI / phases (retail: run-or-fight stealth, no boss)

Catalog (`server_battlenpc_mob_types`): 1366 retiarius / 1367 triarius /
1368 hastatus (detect 10, Lv 22-22, respawn 60s); 1369 speculator same
with variant column 87. Director overrides: Lv 22 fixed (no scaling;
solo duty), sight+ignore-level aggro, detection 10 (3 while concealed),
leash 50, link 25, max action 24.0, auto-attack 6.0 (polearm 7.0), no
roam, DPS AI, icon 1. Phase 1 (SEQ 20): 4 north sentinels spawn 5s after
entry. Phase 2 (SEQ 25): north wave despawned on `pE20`, 3 return
sentinels spawn. Killed sentinels respawn per catalog 60s. Concealment:
talking to any route sylph (Almxio/Zoxio/Diluxio/Dokixia) refreshes 180s
(authored) of detection-3 "hide"; optional per retail, re-cast by
re-talking. Detection never auto-fails: fight (easy for DoW/DoM) or run
to a sylph to re-hide. Companion is a plain NPC so mob AI ignores it
(retail: "soldiers cannot see your companion") and it never assists.
No enrage (no boss); "reset" = failDuty despawns all waves + actors.

## Escort pathing

Routes (`Data/escortnavmesh`, zone 151): inbound 38 wp (Nine Ivies to
016 trigger), post-CS 521 wp (trigger to Dokixia), return 473 wp
(Moonspore to Flaxio). Legs chained inbound -> `processEvent016` ->
post -> Dokixia hold -> `pE20` -> return -> Flaxio hold -> `pE30`;
HoldEscortActorsOnCompletion bridges legs without despawn. Params:
speed 4.0, arrival 1.0, start delay 4s, leash 30 (map marker 32/caution
30), follow 6, recall 4 @1.75x, resume 12, combat-hold 0,
OwnerFailureDistance 0 (separation never fails), `CanCallBackEscort=true`
(retail Call interaction), `CanCallBackChocobo=false` (no chocobo in
instance), no party registration, no map marker. Handoffs arm Dokixia /
Flaxio talk markers only within 15y of the companion. No engine escort
teleport exists; recovery is Call-recall only.

## Fail edges

Timeout 30 min, player death (fail-fast, no idle), disconnect (relog
re-resolves via `GetPCInWorld`+`HasConnectedSession`; director waits to
timeout), quest abandon (podling cleared, fail to SEQ 15 stance),
leaving the private area (teleport-out detected, prompt fail), route
fail/deleted, leg-notice timeout 30s (retried every 3s), missing route
file, exclusive-busy entry, `pE13` decline (no mutation). All fails:
stop escort, clear podling, despawn waves+actors, SEQ 20/25 -> 15,
system-error reason, `ContentFinished`, warp to Nine Ivies entry,
`EndDirector`. Complete: SEQ 30, warp to marker-03 exit.

## Unresolved (concrete)

- Retail spawn XYZ of the 7 sentinels unrecovered; current values are
  authored route-side placements (2 need live `!pos` height checks, above).
- 30-min timer, 180s concealment, 15y handoff, leash/link values authored.
- Reward conflict: script 11000 EXP + 60000 gil vs legacy 50000/78000 rows.
- YouTube playthrough (`YF3r5GnhE3Q`) has no machine-readable transcript;
  mechanics rest on wiki steps 13-16 + journal text.
- `tools/validate_together_we_stand_man206.py` is broken at HEAD (missing
  `tools/outputs/lpb/decomp_more_20260617/...` scenario file).
