# Quest 110013 Man200 "Fade to White" [Lv.18] — instance notes

Source bodies read: `FF14-Memory/Data/scripts/quests/man/man200.lua` (479 lines),
`Data/scripts/content/SimpleContent30080.lua`,
`Data/scripts/directors/Quest/QuestDirectorEventMan20001.lua`,
`docs/fade_to_white_man200_helper_pass_2026-07-08.md`,
`docs/quest_instance_implementation_guide.md`,
`Map Server` area/director sources. Retail walkthrough:
[Gamer Escape](https://ffxiv.gamerescape.com/wiki/Fade_to_White) +
"Fade to White Part 1/4" playthrough descriptions (companion choice, no battle).

## Verdict: non-combat naming room (degenerate fight clauses)

`man20001` is a private Merchants Ward copy holding ONE actor: the player's
chosen Path Companion, for the `pEN` nickname scene. Evidence of no combat:

- No `SpawnEnemy`/`SpawnAlly`/timer/boundary call in content or director.
- Zone 181 `locate` at entry and companion reports `existing_mobs: 0`.
- Retail walkthrough steps 12-14: speak to Tataru, name companion, meet at the
  Quicksand — no battle. The YouTube Part 4 caption is "we finally choose our
  Path Companion".

So phases/adds/enrage/leash/reset, escort follow/teleport/aggro, and
party/solo scaling are all degenerate: nothing to scale, leash, or reset.
No mobs were authored, so no mob placements were invented. Do NOT add a fight;
retail has none.

## Actors / positions / rotation (zone 181, world_only, 49 live nodes)

Checked with `tools/mobspawns/map_coordinates.py maps --zone 181` and
`locate --zone 181 --world <x> <z>` against `Data/quicknavmesh/zone_181.tsv`
(sha256 `2e14c8fd…9d2afb`). Zone 181 has no native map binding: world X/Z
lookup plus recorded heights only, per the coordinate guide.

| Actor | X | Y | Z | Rot | Ground evidence |
| --- | --- | --- | --- | --- | --- |
| Instance entry warp | -200.262 | 0 | -159.890 | -1.568 | ~1.2u from node 49 (-199.371, 0, -160.648); 23 nodes in 30u |
| Path Companion `pathcompanion` | -203.470 | 0 | -159.578 | 1.552 | ~0.8u from node 48 (-203.722, 0.011, -160.314); 22 nodes in 30u |
| Public return (post-naming) | -200.262 | 0 | -159.890 | 0 | same recorded floor |
| Office warps | -142.75 / -126.2 | 1 / 1.2 | -160 | -1.6 / 1.6 | interior room warps, unchanged |
| Exit door target (zone 175) | -216.52 | 190 | 30.5 | 2.32 | Ul'dah public |

Nearest landmark: `merchward_tataru` SQL row 2143 at
(-199.563, 0, -162.347), ~2.6u from entry. No recorded-height conflicts: all
instance Y values match the Y~=0 floor.

## Triggers / SEQ branches (all covered, no loopholes found)

- SEQ 0: office-west door push `pE10` -> warp (-126.2,1.2,-160) -> SEQ 5.
  Exit door -> zone 175. Tataru talk -> `processEvent000_2`.
- SEQ 5: Minfilia echo `pE20`; result 1 -> SEQ 10, else stay.
- SEQ 10: Minfilia join `pE25`; result 1 -> SEQ 20 + warp (-142.75,1,-160),
  else stay (retail "No asks again").
- SEQ 20: Tataru `processSnpcSelect`; `isValidSnpcSelection` (classes 1-5,
  rows 1070001-1070080, 16-row blocks) -> `SetSNpc`, linkshell 6, SEQ 25,
  60s delayed pearl message. Invalid/cancel -> EndEvent, stay.
- SEQ 25: Tataru `processEvent040_2` + missing-message restore (restart-safe).
  `onNpcLS` from 6 at SEQ 25/27 -> SEQ 27.
- SEQ 27 pre-duty: Tataru -> `startMan20001Content` (guard, join prompt,
  allocate `man20001`, `pE050`, `DoZoneChangeContent`, music 44). Decline ->
  EndEvent, stay. In-instance SNPC talk -> `pEN` naming; empty/cancel (-3)
  falls through safely; valid name -> `pE055`, FLAG_DUTY_COMPLETE,
  `ContentFinished`, public warp zone 181. Post-flag SNPC talk is now an
  explicit EndEvent guard (no re-naming warp).
- SEQ 27 post-duty: Tataru -> `pE050_2`. Momodi (flagged): `pE060`, reward
  window (6500 EXP), Chocobo Whistle 2001031 with HasItem retry + full-key-item
  bail-out, `completeQuest`, then 45000 gil + EXP. Momodi without flag: inert.
- Ambient Waking Sands talk tables (`MAN200_SEQ000/010/SHARED_TALK_EVENTS`)
  cover every other ENPC in both halves; shared table always runs.

## Cutscenes / events

`pE10 pE20 pE25 processSnpcSelect processEvent040_2 contentsJoinAskInBasaClass
pE050 pEN pE055 pE050_2 pE060` + `processEvent000_2..20` / `processEvent020_2..14`
ambient talk. SNPC preview scenes for 110013: `man20150`, `man20140`
(`scenario_decomp_helpers.MAN_SNPC_PREVIEW_SCENES`). Entry music 44.

## Fail / edge handling (implemented)

- Entry: `guardAnyDisciplineInstanceEntry` before prompt/state (correct for
  all-discipline narrative content); nil contentArea/director bail with
  EndEvent (+`ContentFinished` on director failure). Double-entry impossible:
  Tataru is not copied into the runtime area, only the companion.
- Early exit/disconnect: engine destroys the emptied solo copy;
  `SimpleContent30080.onPlayerLeft` documents that SEQ 27 pre-flag IS the
  retry step (no rewind) and refreshes ENPCs. Death/timeout impossible
  (no combat, no timer); relog retries via Tataru. Abandon is engine-generic;
  no quest-external persistent state needs cleanup (SNPC choice is re-set on
  re-accept at SEQ 20).
- Chocobo: blocked by engine default — `PrivateArea` ctor hardcodes
  `canRideChocobo=false` and `WorldManager.IsMountRestrictedArea` rejects
  `IsPrivate()` areas. No script work needed.
- Party: solo entry via single-player `DoZoneChangeContent`; no party entrant
  collection (retail naming is solo). `onZoneIn` is side-effect free per the
  quest-battle convention so a helper zone-in can never advance the owner.

## Gaps (concrete, out of instance scope)

1. Retail triggers the SEQ 25 linkpearl on entering the Adventurers' Guild
   room; the server uses a 60s timer + Tataru-talk restore. No zone-enter
   trigger exists. Quest-side fidelity gap, needs client trigger evidence.
2. Retail step 16 (chat to companion at the Quicksand, accept/decline "begin
   your adventure", both completing) is folded into Momodi `pE060`; no
   companion ENPC is staged at the Quicksand post-duty. Needs scene-data
   evidence before adding actors.
