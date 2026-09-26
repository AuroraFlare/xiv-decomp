# In-depth decomp: MSQ 110015 (Toll of the Warden, Man300) — continuation pass

Source files used for this pass:
- [man300.lua](/C:/Users/drime/source/repos/AuroraFlare/FF14-Memory/Data/scripts/quests/man/man300.lua)
- [QuestDirectorMan30001.lua](/C:/Users/drime/source/repos/AuroraFlare/FF14-Memory/Data/scripts/directors/Quest/QuestDirectorMan30001.lua)
- Recovered client scenario [man300.lua](/C:/Users/drime/source/repos/AuroraFlare/FF14-Memory/tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/man/man300.lua)
- Cutscene tables: [man300.csv](/C:/Users/drime/source/repos/AuroraFlare/FF14-Memory/docs/Dat%20Mining/man300.csv)

## 1) Quest flow and sequence contract

Current implementation is a seven-state sequence chain (journal sequence 0/10/15/20/25/30/35) with one full gameplay branch:

1. `processEvent000` / `man30000` (intro + acceptance handoff).
2. Public-gridania start state, then camp transfer and `pE20` / `man30020` handoff to Drybone.
3. Linkpearls in `SEQ_015` route to `302` / `303`, then advance to `SEQ_020`.
4. `pE30` / `man30030` transitions into private mesa area.
5. `pE40` / `man30040` fires automatically on battlefield landing.
6. Non-lethal battle/parley encounter resolves and `noticeEvent` advances to completion handoff.
7. `pE50` / `man30050` exits private area, then `pE60` / `man30060` awards and completes.

Implemented sequence rows:

- `SEQ_000`: start handoff
- `SEQ_005`: pre-accept cinematic phase
- `SEQ_010`: transition to Hedyn
- `SEQ_015`: Drybone objective + two linkpearls
- `SEQ_020`: mesa access gate
- `SEQ_025`: private-area arrival + first `man30040`
- `SEQ_030`: battlefield branch (combat or parley)
- `SEQ_035`: return / final completion scene

## 2) Journal + map objective mapping

| Seq | Journal | Marker | Objective |
| --- | --- | --- | --- |
| `0` | 207 | `11001501` | Enter Peasants' Ward. |
| `10` | 208 | `11001502` | Speak with Hedyn. |
| `15` (`counter` != 5) | 209 / 249 | `11001503` | Travel to Camp Drybone. |
| `15` (`counter` == 5) | 266 | `11001504` | Answer the Path linkpearl. |
| `20` | 210 / 250 | `11001505` | Enter the southwest mesa. |
| `25` | 211 | `11001506` | Internal arrival handoff (battle starts automatically). |
| `30` | 212 | `11001506` | Stop both tribes’ summoning attempt. |
| `35` | 213 | `11001507` | Return to Hedyn. |

Journal counter 0 is the primary combat/parley progress gate used by the Linkpearl state and battle-completion transitions.

## 3) Trigger and state details from `man300.lua`

- The quest script uses a private-area handoff path for the mesa encounter rather than a runtime content class.
- The battlefield is tied to `PrivateAreaMasterPast` with type `1` and uses a static area boundary.
- The quest does not expose extra per-objective item counts beyond the main counter and zone-state flow.
- Completion transitions are clean: after `pE50` the quest enters final sequence and immediately routes to `pE60`.

## 4) Cutscene behavior contract

| Scene function | Scene | Notes |
| --- | --- | --- |
| `processEvent000` | `man30000` | Opening briefing. |
| `processEvent010` | `man30010` | First transfer + intro. |
| `pE20` | `man30020` | Hedyn branch entry to Drybone phase. |
| `pE30` | `man30030` | Mesa transition before private-area transfer. |
| `pE40` | `man30040` | Auto-played after landing in private area. |
| `pE50` | `man30050` | Replay argument `10` (recovery path), returns to public zone. |
| `pE60` | `man30060` | Reward handoff and quest finish. |

Observed replay/fade conventions:
- `pE50` is the only scene with an explicit non-default replay payload.
- Multiple event methods are zone-warp initiated and are expected to stay open until area-change event finalize to avoid stale event layout.

## 5) `QuestDirectorMan30001` behavior

The director is a static encounter shell with two legal completion styles:

- Combat route: four encounter warriors.
- Parley route: two talk targets with negotiation gating.

Combat/parley implementation details:
- Shared nonlethal completion condition is defeat-or-override handling in `noticeEvent` to keep failure/retry path deterministic.
- A damage floor is applied during encounter; over-hit is capped, secondary AoE damage is normalized to keep both HP-loss accounting and retreat behavior consistent.
- Each defeated/retreating combatant is removed through retreat logic instead of immediate hard despawn.
- On success, notice flow moves the quest to handoff path and posts `man30050`.
- On failure, the director resets to the same sequence branch without opening duplicate rewards.

Known spawn/placement layer:
- Actor set for scene prelude includes Nananoby / Almxio / Zoxio with fixed captured transforms.
- Peaceful route talk targets are separate classes and are flagged negotiable to support player-triggered parley.
- Four combat mobs comprise the actual route objective set for this instance.

## 6) Parley-specific integration

The two named battlefield NPCs emit local/world-master messaging and are the only parley-enabled objectives.
When spoken:
- they set the negotiation-enabled flag on the client side,
- player uses standard Parley command workflow (`29497`),
- success posts back to the same encounter completion gate used by combat.

The local branch does not appear to cache quest-specific tile payloads for parley boards and currently falls back to server-provided generic deterministic values.

## 7) Reward contract

- Item reward: no direct item addition in script (reward is handled via quest reward metadata and `CompleteQuest`).
- Currency reward: 90,000 gil (`quest_new_reward` / row `11001501` mapping).
- Experience reward: 19,000 EXP.
- Linkpearl reward: Ashcrown Consortium linkpearl via NPC completion route.
- Reward grant appears to be auto-mediated by standard quest completion and does not double-push via script.

## 8) Compatibility notes

- Existing implementation removes legacy placeholder end states previously inferred around `SEQ_040`/`SEQ_045`; final handoff is now `SEQ_035`-bound to `pE60`.
- Static validators indicate all required scene and server-flow anchors are wired.
- Remaining uncertainty stays limited to optional non-essential ambient text variants inherited from recovered scenario data.
