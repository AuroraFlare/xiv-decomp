# Together We Stand (Man206) Decomp Notes

Quest: `110014`, `Man206`, level 22 main scenario.

Local script: `Data/scripts/quests/man/man206.lua`
Recovered client script: `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/man/man206.lua`
Text sheet: `docs/Dat Mining/man206.csv`
Marker sheet: `docs/Dat Mining/quest_marker.csv`
Replay sheet: `docs/Dat Mining/cutReplay.csv`

## Short Version

The local script implements the Waking Sands opening, the Path companion linkpearl handoff, the Gridania arrival cutscene, and the final Tataru reward scene. The client decomp proves there is a larger middle section around Camp Nine Ivies, Moonspore Grove, Flaxio, Dokixia, a podling carry state, and an HQ/duty sequence with Garlean enemies, but the local server content shell for that middle section is not present yet.

High-confidence bug fixed in this pass: `getJournalMapMarkerList` was copied from an unrelated quest and referenced undefined marker, sequence, and flag constants. It now uses Man206's actual `110014xx` marker rows.

## Second-Pass Findings

- `actorclass.csv` and `gamedata_actor_class.sql` identify Flaxio as actor class `1001237` / display id `2450020`, Dokixia as actor class `1001238` / display id `2450021`, and a second Dokixia actor class `1001517` sharing display id `2450021`.
- `gamedata_actor_appearance.sql` gives Flaxio and Dokixia the same sylph appearance base (`10905`) with look variants `1024` and `1056`.
- `cutReplay.csv` confirms the middle route scene rows: `11001404/man20603`, `11001405/man20610`, `11001406/man20620`, and `11001407/man20630`.
- `xtx_status.csv` defines status `223993` as `Intact-Podling Toting` with icon `10134`; `xtx_itemName.csv` defines item `11000091` as `Podling`.
- `quest_marker.csv` has a tight East Shroud marker cluster at `11001403` through `11001406`, then marker `11001407` in Gridania and `11001408` back at the Waking Sands.
- Reward data is not clean enough for a gameplay patch yet. The local script grants `1000001 x60000` and `50000` EXP, while raw DAT reward sheets expose both a `60000` value and an older `78000` value. Treat reward tuning as a separate reward-semantics audit.

## Source Map

- Quest registration: `Data/sql/gamedata_quests.sql` has `110014, Together We Stand, Man206, 110013, 22`.
- Follow-up quest: `Man300` / `110015` depends on `110014`.
- Local spawn shell: `Data/sql/server_eventnpc_spawn_locations.sql` has Waking Sands private-area NPCs and one Gridania SNPC trigger, `1090177`.
- Current worktree has an experimental Man206 content-launch diff in `Data/scripts/quests/man/man206.lua` and untracked shell files `Data/scripts/content/SimpleContentMan20610.lua` plus `Data/scripts/directors/Quest/QuestDirectorMan20610.lua`.
- No spawn row was found for the new `NINE_IVIES_RENDEZVOUS_TRIGGER` / `1090178` in zone `151`; existing `1090178` spawns are for `Man2g0` in Gridania/private areas.
- No route files were found for `Data/escortnavmesh/together_we_stand_inbound.json`, `together_we_stand_post_cs.json`, or `together_we_stand_return.json`.
- No local spawn shell was found for Flaxio, Dokixia, Moonspore Grove field NPCs, or the Garlean fight actors.

## Current Worktree Shell

The experimental shell is useful, but it should be treated as not-yet-playable:

| Piece | Current status | Notes |
| --- | --- | --- |
| `man206.lua` rendezvous trigger | Partial | Adds `NINE_IVIES_RENDEZVOUS_TRIGGER = 1090178`, sets it in `SEQ_015`, and starts `SimpleContentMan20610` from `onPush`. Needs a zone `151` spawn or another owner-binding strategy. |
| `SimpleContentMan20610.lua` | Present, untracked | Sets music and a square boundary, starts the content group, and resets `SEQ_020` / `SEQ_025` back to `SEQ_015` if the player leaves. |
| `QuestDirectorMan20610.lua` | Present, untracked | Runs three route legs: inbound -> `processEvent016`, post-cutscene -> `pE20` plus podling status, return -> `pE30` plus `SEQ_030`. |
| Escort route data | Missing | Director calls `LoadEscortRoute` for `together_we_stand_inbound`, `together_we_stand_post_cs`, and `together_we_stand_return`; none exist in `Data/escortnavmesh`. |
| Actor ownership | Still unproven | Shell uses a neutral trigger and content director. It does not yet prove Flaxio, Dokixia, HQ owner, or Garlean fight actor ownership. |

The shell currently bridges the recovered cutscene order more than it decompiles the original server route. Its strongest value is as a test harness once the trigger spawn and route files exist.

## Runtime State Machine

| Sequence | Local status | Intended flow from journal/decomp |
| --- | --- | --- |
| `SEQ_000` | Implemented | Enter Minfilia's office and play `processEventUdowntownrectStart`. |
| `SEQ_005` | Implemented | Talk to Minfilia, play `processEvent001`, then contact Path companion by NPC LS. |
| `SEQ_010` | Implemented | Go to Gridania Aetheryte Plaza and push `GRIDANIA_SNPC_TRIGGER`, playing `pE12`. |
| `SEQ_015` | Experimental shell in worktree | Rendezvous at Camp Nine Ivies, likely scene `pE13`; current trigger has no zone `151` spawn yet. |
| `SEQ_020` | Experimental director path | Move toward Moonspore Grove, including `processEvent016` HQ/duty and `pE20`; current route files are missing. |
| `SEQ_025` | Experimental director path | Carry podling back to Flaxio, then play `pE30`; current route files are missing. |
| `SEQ_030` | Implemented | Return to the Waking Sands, talk to Tataru, play `processEvent040`, complete quest. |

## Cutscene Matrix

| Method | Scene | Local status | Notes |
| --- | --- | --- | --- |
| `processEventUdowntownrectStart` | `man20600` | Implemented | Office entry. Recovered as `startNQCutScene(..., 1)`. |
| `processEvent001` | `man20601` | Implemented | Quest accept. Recovered as `startNQCutScene(..., 2)` with return branching. |
| `pE12` | `man20602` | Implemented | Gridania arrival with SNPC tuple. |
| `pE13` | `man20603` | Missing locally | Camp/Nine Ivies meetup with SNPC tuple. Recovered method branches on return `1` and may use after-warp fade. |
| `processEvent016` | `MAN20610` | Missing locally | HQ/duty scene. Recovered as `startHQCutScene(..., 1)`, replay type `2`. |
| `pE20` | `man20620` | Missing locally | Moonspore/podling scene with SNPC tuple and default fade. Probe-gated before patching. |
| `pE30` | `man20630` | Missing locally | Return to Flaxio with podling, SNPC tuple, and after-warp fade. Probe-gated before patching. |
| `processEvent040` | `man20640` | Implemented | Tataru finale and reward. |

The atlas rows agree with this split: `script_cutscene_gap_summary.csv` lists eight Man206 scenes and calls out the missing recovered delegates for `pE13`, `processEvent016`, `pE20`, and `pE30`.

## Replay Payload Contract

`cutReplay.csv` and the recovered Lua agree on the payload shape:

| Replay row | Scene | Launcher | Payload |
| --- | --- | --- | --- |
| `11001401` | `man20600` | `startNQCutScene` | Static, all `-200` placeholders. |
| `11001402` | `man20601` | `startNQCutScene` | Static, all `-200` placeholders; recovered method calls the scene twice while branching on return. |
| `11001403` | `man20602` | `startSnpcNQCutScene` | Standard SNPC tuple `-201` through `-205`. |
| `11001404` | `man20603` | `startSnpcNQCutScene` | Standard SNPC tuple; recovered method has after-warp branch behavior. |
| `11001405` | `man20610` | `startHQCutScene` | Static HQ/duty scene, replay type `2`. |
| `11001406` | `man20620` | `startSnpcNQCutScene` | Standard SNPC tuple. |
| `11001407` | `man20630` | `startSnpcNQCutScene` | Standard SNPC tuple; recovered method always uses after-warp fade. |
| `11001408` | `man20640` | `startNQCutScene` | Static, all `-200` placeholders. |

Placeholder meaning follows the helper convention: `-201` nickname, `-202` raw skin, `-203` personality, `-204` coordinate, `-205` initial town. The recovered client method converts raw SNPC skin through `getSnpcActorClassID` before starting the SNPC cutscene.

## NPC And Actor Surface

Implemented local actors:

- Waking Sands private area: Minfilia, Tataru, Almxio, Zoxio, Diluxio, doors, and background Waking Sands NPCs.
- Gridania trigger: `GRIDANIA_SNPC_TRIGGER` / `1090177`, used to launch `pE12`.

Recovered or data-backed but not locally spawned:

- Flaxio: actor class `1001237`, display name id `2450020`, appears in marker `11001406`.
- Dokixia: actor classes `1001238` and `1001517`, display name id `2450021`.
- Podling item/state: item `11000091` and status `223993` (`Intact-Podling Toting`).
- East Shroud wiki scrape lists Together We Stand involvement for Flaxio, Dokixia, Imperial Hastatus, Imperial Retiarius, Imperial Speculator, and Imperial Triarius.

## Marker Matrix

The local marker function was stale. It now maps active Man206 sequences to the real marker rows:

| Sequence | Marker | Meaning |
| --- | --- | --- |
| `SEQ_000`, `SEQ_005` | `11001401` | Waking Sands / Hall of the First Step. |
| `SEQ_010` | `11001402` | Gridania Aetheryte Plaza trigger. |
| `SEQ_015` | `11001403` | East Shroud / Camp Nine Ivies route marker. |
| `SEQ_020` | `11001404` | Moonspore search route marker. |
| `SEQ_025` | `11001406` | Flaxio marker, display id `2450020`. |
| `SEQ_030` | `11001408` | Return to Waking Sands for finale. |

Marker `11001405` appears to be the HQ/duty or deeper Moonspore cutscene marker and is intentionally not used until the middle content has an owner and sequence transition.

## Marker Geometry

The Man206 marker rows give a rough route spine. The `region` / `map` columns below are the raw `quest_marker.csv` values, not server zone ids.

| Marker | X | Z | Target | Region | Map | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| `11001401` | `-431` | `187` | `1600179` | `101` | `121` | Waking Sands / Hall of the First Step. |
| `11001402` | `-110.959999` | `-1342.48999` | `4000257` | `103` | `321` | Gridania Aetheryte Plaza; local trigger spawn is zone `206` at roughly this position. |
| `11001403` | `1700.48999` | `-868.109985` | `4000257` | `103` | `302` | Camp Nine Ivies rendezvous, likely `pE13`. |
| `11001404` | `1927.119995` | `-1051.810059` | `4000257` | `103` | `302` | Moonspore approach/search route. |
| `11001405` | `2239.620117` | `-1699.02002` | `4000257` | `103` | `302` | Deeper Moonspore/HQ-duty marker, likely `processEvent016` or the lead-in to `pE20`. |
| `11001406` | `1980.939941` | `-1067.97998` | `2450020` | `103` | `302` | Flaxio return target after podling pickup. |
| `11001407` | `-235` | `50.5` | `4000257` | `104` | `421` | Extra Gridania/return marker; not used by the local script today. |
| `11001408` | `-431` | `187` | `1600179` | `101` | `121` | Final Waking Sands report marker. |

Rows `11001409` through `11001420` are duplicate Waking Sands-style marker rows and do not currently provide distinct route information.

## Linkpearl Flow

`NPCLS_MSGS` drives the Path companion contact after the Minfilia accept scene. The script uses the player's SNPC personality to pick the message pair in `SEQ_005`, then advances through `StartSequenceForNpcLs(SEQ_010)` when the message pack is exhausted.

Earlier quest LS handling was prone to out-of-range message pack issues; this file now has a guard in `onNpcLS` before indexing `NPCLS_MSGS[msgPack]`.

The LS text pairs are rows `330` through `347`: personalities get a skeptical first message about aiding sylphs, then a second message accepting the Empire-facing rescue premise. This supports keeping the current two-step message packs, including personality `9`.

## Dialogue Ownership

The recovered client script owns more Man206 dialogue than the local server currently exposes:

| Client method cluster | Text ids | Current local status | Route meaning |
| --- | --- | --- | --- |
| `processEvent000_2` through `processEvent000_11` | `270-281`, `329` | Mostly wired | Waking Sands panic and sylph arrival chatter before Minfilia. |
| `processEvent001_2` through `processEvent001_7` | `282-293` | Partially wired | Post-accept Waking Sands reactions. |
| `processEvent001_8` through `processEvent001_11` | `22-25`, `294-297` | Not wired | Extra exposition about Moonspore, the Empire, and forest search risk. |
| `processEvent010_2` | `305-306` | Wired on Tataru | Tataru confirms the Path companion meetup plan. |
| `processEvent012_2` through `processEvent012_7` | `528-529`, `298-304` | Not wired | Gridania/forest-city ambient warnings after the Aetheryte scene. |
| `processEvent016_1` through `processEvent016_3` | `539-541` | Not wired | Sylph stealth/duty support lines: hide the party, blind the metal ones, save podlings. |
| `processEvent020_2` | `571` | Not wired | Dokixia tells the player to take the podling to Flaxio and avoid being seen. |
| `processEvent030_2` through `processEvent030_8` | `308-320` | Not wired | Waking Sands return chatter about the rescue, sylph magic, and Garlean threat. |

The local `wakingsands_default_dialogue` fallback currently calls Man200 dialogue once the sequence is past `SEQ_010`. A future polish pass should swap the late Waking Sands NPCs to these Man206 `processEvent030_*` methods after the middle route exists.

## Journal Data Notes

`xtx_quest.csv` carries two overlapping Man206 journal text sets. Rows `201` through `206` are the SNPC-substituted set, while rows `246` through `248` are generic Path companion wording for the early quest beats. The local script currently comments `SEQ_005` through `SEQ_015` with the generic rows, then uses `204` through `206` for the Moonspore/podling/return beats. Runtime journal payload still comes from `getJournalInformation`, which returns the Path companion nickname in slot six.

The quest row also has explicit podling item display clauses for sequences after `25` and before `30`, pointing at item `11000091`. That reinforces `SEQ_025` as the intact-podling carry segment rather than a normal talk objective.

## Helper Support

`Data/scripts/scenario_decomp_helpers.lua` now provides reusable helpers for scenario decomp patches:

- `delegateSnpcEvent(player, owner, eventName, ...)` sends the standard five-value Path companion tuple.
- `unpackSequenceMarkers(player, quest, markersBySequence)` turns a simple sequence-to-marker table into a quest marker return list.
- `sendNpcLsMessagePack(...)` guards NPC LS pack/message indexing and applies read/end/repeat completion behavior.

Man206 uses those helpers for `pE12`, `getJournalMapMarkerList`, and `onNpcLS`. The same helpers should fit future main scenario scripts with SNPC cutscenes and copied marker tables.

## Middle Route Reconstruction

A conservative implementation pass should split the missing content into small, loggable steps:

| Step | Candidate sequence | Candidate owner | Event | State mutation to prove |
| --- | --- | --- | --- | --- |
| Camp rendezvous | `SEQ_015` | Flaxio or a neutral trigger near marker `11001403` | `pE13` / `man20603` | Advance to `SEQ_020`; capture return value and after-warp lifetime. |
| Moonspore duty entry | `SEQ_020` | Duty/director or trigger near marker `11001405` | `processEvent016` / `MAN20610` | Prove whether this starts an HQ/private duty, a normal field cutscene, or only an in-scene cutscene. |
| Podling pickup | `SEQ_020` -> `SEQ_025` | Dokixia or trigger near marker `11001405` / `11001404` | `pE20` / `man20620`, then `processEvent020_2` | Apply or display `Intact-Podling Toting` status `223993`; expose podling item `11000091` in journal. |
| Podling handoff | `SEQ_025` | Flaxio actor `1001237` at marker `11001406` | `pE30` / `man20630` | Remove podling carry state, advance to `SEQ_030`, and verify after-warp fade/lifetime. |
| Return polish | `SEQ_030` | Waking Sands NPCs | `processEvent030_*`, then `processEvent040` | Use Man206 return dialogue before Tataru completion, then reconcile reward grant. |

Do not add sequence transitions to live Man206 from this table alone. The missing owner layer is the real risk: `processEvent016` may belong to a duty/director shell, and `pE13` / `pE30` both have cutscene lifetime behavior that can leave the active event in a bad state if replayed with the wrong owner.

The current worktree shell implements this shape as an escort-route harness, not as proven retail ownership. Before using it as live content, add or generate the three `together_we_stand_*` route files and bind the `SEQ_015` trigger to a real zone `151` spawn or a dynamically spawned event owner.

## Fight And Middle Content Status

The middle of this quest should exist, but should not be wired blindly yet:

- `pE13`, `pE20`, and `pE30` need the confirmed SNPC payload and event lifetime behavior before adding delegates.
- `processEvent016` is an HQ cutscene and likely belongs to a duty/director layer, not a simple public NPC push.
- The worktree has an experimental Man206 content director and podling status handling, but no route files, no zone `151` rendezvous trigger spawn, and no Flaxio/Dokixia/Garlean actor ownership proof.
- The marker and text data show the intended route, but not the server-side encounter mechanics.

Useful no-mutation probe commands once a GM test character is placed at the suspected owner/area:

```text
!questdelegate quest:110014 pE13 @snpc5
!questdelegate quest:110014 processEvent016
!questdelegate quest:110014 pE20 @snpc5
!questdelegate quest:110014 pE30 @snpc5
```

`pE13` and `pE30` are the riskiest because the recovered methods branch or use after-warp handling. Capture sequence before/after, event lifetime, owner actor, and return values before converting these into live quest transitions.

For the middle-route data pass, also capture:

- Player status list before and after `pE20` / `pE30`, especially status `223993`.
- Inventory/journal item display before and after `SEQ_025`, especially item `11000091`.
- Whether `processEvent016` creates a private/HQ event, and whether `processEvent016_1` through `processEvent016_3` are called by that shell.
- Owner actor class and display id for every successful delegate, to separate Flaxio, Dokixia, neutral triggers, and duty directors.

## Fixes Applied

- Added Man206 marker constants `MRKR_11001401` through `MRKR_11001407`.
- Replaced the copied `getJournalMapMarkerList` logic with Man206 sequence markers.
- Removed references to unrelated undefined constants such as `MRKR_NONOLATO`, `SEQ_003`, `FLAG_SEQ025_FYE`, and `MRKR_AMPHITHEATRE`.
- Cleaned stale sequence comments for `SEQ_015` through `SEQ_030`.
- Added shared scenario decomp helpers and routed Man206 SNPC delegate, marker, and NPC LS handling through them.

## Follow-Up Work

- Probe `pE13`, `pE20`, and `pE30` with the SNPC payload plan from `outputs/quest-runtime-probe-atlas-20260630/cutscene_runtime_probe_plan.csv`.
- Locate or reconstruct the HQ/duty owner for `processEvent016` / `MAN20610`.
- Add or generate `Data/escortnavmesh/together_we_stand_inbound.json`, `together_we_stand_post_cs.json`, and `together_we_stand_return.json` before testing the experimental director.
- Add a safe zone `151` spawn or dynamic owner for `NINE_IVIES_RENDEZVOUS_TRIGGER` / `1090178`.
- Add proper East Shroud spawn/director content for Flaxio, Dokixia, podling carry status `223993`, and the Garlean patrol/fight actors once the runtime contract is known.
- Add Man206 late return dialogue `processEvent030_2` through `processEvent030_8` after the middle route is playable.
- Reconcile Man206 reward display/data before replacing the local `50000` EXP and `60000` gil grant.
