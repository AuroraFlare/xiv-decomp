# Toll of the Warden (Man300) Retail Decomp and Runtime Contract

Quest `110015`, level 30 main scenario. This report supersedes the provisional
2026-07-07 route notes.

Evidence used:

- Recovered client scenario: `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/man/man300.lua`
- Installed client cutscenes: `client/cut/man30000` through `man30060`
- Reproducible placement decoder: `tools/decompile_man300_cutscene_setup.py`
- DAT sheets: `xtx_quest.csv`, `journalxtxWil.csv`, `quest_marker.csv`,
  `cutReplay.csv`, `quest_new_reward.csv`, and `xtx_npclslist.csv`
- Recorded retail route and battle: <https://youtu.be/pwZtrzwEMVY>
- Archived quest list: `docs/ffxiv-1.0-wiki/pages/Category__Main_Scenario_Quests.html`

## Result

The retail quest has seven main scenes and only these journal sequences:
`0`, `10`, `15`, `20`, `25`, `30`, and `35`. It ends when Hedyn rewards the
player in the Peasants' Ward. The former local `SEQ_040`/`SEQ_045`
Minfilia/Tataru epilogue was an invented placeholder and is removed.

The implemented route is:

1. Minfilia plays `processEvent000` / `man30000` as a pre-offer briefing.
2. Tataru plays `pEStart`; accepting begins sequence `0`.
3. Gridania's market entrance plays `processEvent010` / `man30010` and enters
   zone `161`, the Peasants' Ward.
4. Hedyn plays `pE20` / `man30020`, returns the player to Gridania, and sends
   them to Camp Drybone.
5. The Drybone trigger sets journal counter 0 to `5` and opens Path linkpearl
   messages `302` and `303`. Finishing them advances to sequence `20`.
6. The southwest mesa trigger plays `pE30` / `man30030` and enters static
   private area `171/PrivateAreaMasterPast/1`. Like retail, this entry accepts
   every discipline and admits a three-person mission group;
   Disciples of the Hand and Land are expected to use the Parley route.
7. After the player lands, the director automatically plays `pE40` /
   `man30040`; no battlefield NPC must be spoken to. The two talk targets and
   four battle-route warriors then spawn without overhead quest markers.
8. Weakening all four warriors to roughly 15% HP completes the nonlethal battle route.
   The server applies a matching damage floor at the shared HP-loss boundary
   (including periodic and secondary AoE damage), shows the tribe-specific
   “lost the will to fight” message, forces the current target to disengage,
   and has each combatant retreat a few yalms before despawning.
   The four warriors retain retail's yellow-name/passive staging and engage
   only when attacked, so the peaceful targets remain usable by non-combat
   disciplines.
9. The director plays `pE50` / `man30050` with its recovered extra argument
   `10`, returns to public Eastern Thanalan, and advances to sequence `35`.
10. Hedyn plays `pE60` / `man30060`, grants the Ashcrown Consortium linkpearl,
    displays 19,000 EXP, completes the quest, and returns the player to public
    Gridania. Central reward data grants 90,000 gil and 19,000 EXP exactly
    once.

## Journal and Marker Contract

| Sequence | Journal row | Marker | Objective |
| --- | ---: | ---: | --- |
| `0` | 207 | `11001501` | Enter the Peasants' Ward from Gridania's market entrance. |
| `10` | 208 | `11001502` | Speak with Hedyn. |
| `15`, counter 0 != 5 | 209 / 249 | `11001503` | Travel to Camp Drybone. |
| `15`, counter 0 = 5 | 266 | `11001504` | Answer the Path linkpearl. |
| `20` | 210 / 250 | `11001505` | Enter the mesa southwest of Drybone. |
| `25` | 211 | `11001506` | Internal arrival handoff; `pE40` starts automatically after landing. |
| `30` | 212 | `11001506` | Stop both tribes' summoning attempt. |
| `35` | 213 | `11001507` | Return to Hedyn. |

Marker locations match the DAT sheet: Gridania market entrance
`(-192.57, -1407.58)`, Camp Drybone `(1241.42, -548.82)`, mesa entrance
`(1055.17, -283.77)`, Nananoby `(1034.83, -269.04)`, and Hedyn in Gridania.

## Cutscene Contract

| Method | Scene | Payload / fade behavior |
| --- | --- | --- |
| `processEvent000` | `man30000` | Plain NQ scene; after-warp fade. |
| `processEvent010` | `man30010` | Plain NQ scene; after-warp fade. |
| `pE20` | `man30020` | Standard Path-companion tuple; after-warp fade. |
| `pE30` | `man30030` | Path tuple plus boolean; `false` selects after-warp fade. |
| `pE40` | `man30040` | Standard Path tuple; normal fade-in. |
| `pE50` | `man30050` | Path tuple plus replay argument `10`; after-warp fade. |
| `pE60` | `man30060` | Standard Path tuple; after-warp fade. |

The exact replay rows `11001501` through `11001507` independently confirm the
same seven scenes and `pE50`'s extra value.

For `processEvent010`, `pE20`, `pE30`, `pE50`, and `pE60`, the initiating event
remains open until `DoZoneChange`. The staged zone-change pipeline then
publishes `EventFinish` against the old actor table before resetting the scene.
Ending one of these events before the warp breaks the recovered after-warp fade
contract and can leave the client on “Now Loading” or load the destination with
an incomplete event layout. `pE40` uses a normal fade-in and closes normally
after it returns.
The battlefield is a static `PrivateArea`, not a runtime `PrivateAreaContent`,
so its exit must not call `ContentFinished`; the normal static quest-area exit
cleanup retires the director after the public-area transition begins.
Battlefield actors likewise remain registered until that exit cleanup removes
the player from the private area. Despawning them while the client still owns
the private actor table, immediately before the full zone reset, causes a
duplicate-retirement crash in the 1.x client.

## Battlefield Staging

The static layer uses `/Area/PrivateArea/PrivateAreaMasterPast`, type `1`, with
a conservative boundary `(930, -350)` to `(1120, -150)`. The runtime-captured
battlefield landing point is `(1001.755, 252.750, -280.197)`, rotation `1.010`.
This supersedes the nearby `man30030` cutscene transform for persistent entry.
Additional party entrants land at small deterministic offsets from that point,
matching the retail three-slot cap without stacking multiple player actors.
The period video's description explicitly says that NPC companions count as a
person: solo entry receives the owner's Path companion, two players share the
owner's companion as their third member, and three players enter without a
companion. The director uses an explicit owner marker so helper ordering cannot
redirect shared Parley or completion state into the wrong journal.

Story actors used for the pre-fight handoff:

| Actor | Class | X | Y | Z |
| --- | ---: | ---: | ---: | ---: |
| Nananoby | `1001050` | 1032.359 | 251.705 | -268.516 |
| Almxio | `1001085` | 1032.456 | 251.827 | -271.512 |
| Zoxio | `1001086` | 1032.292 | 252.210 | -273.272 |

Nananoby, Almxio, and Zoxio's runtime placements are from in-game `/mypos`
captures in zone 171; their rotations are `-0.974`, `-1.297`, and `-1.387`,
respectively. These supersede the nearby `man30040` cutscene transforms for
the persistent battlefield actors without changing the recovered cutscene
fixtures.

Peaceful-route staging from the runtime captures and objective actor-class rows:

| Talk target | Exact actor class | X | Y | Z | Rotation |
| --- | ---: | ---: | ---: | ---: | ---: |
| loyal Ixal | `1001095` | 1025.807 | 251.071 | -238.023 | -1.907 |
| able-bodied Amalj'aa | `1001098` | 1013.015 | 251.960 | -272.674 | 0.713 |

The loyal Ixal and able-bodied Amalj'aa are peaceful-route talk NPCs, not
battle objectives. Talking to either displays localized world-master messages
`51034` and `51050`, enabling and explaining Parley against that target. Their
runtime placements are from in-game `/mypos` captures in zone 171. They use a
neutral Populace interaction class with their original localized names and
monster appearances applied separately, preventing enemy-style presentation.
Neither talk target displays an overhead quest marker.

Additional zone 171 battlefield mob captures, with each chat-arrow label
referring to the `/mypos` line immediately above it:

| Mob | X | Y | Z | Rotation |
| --- | ---: | ---: | ---: | ---: |
| Amalj'aa bowyer | 997.981 | 251.274 | -233.886 | 2.905 |
| Ixali swordfighter | 995.138 | 251.290 | -238.078 | 2.332 |
| Amalj'aa drubber | 1001.052 | 251.234 | -246.198 | 2.332 |
| Ixali swordfighter | 1007.453 | 251.290 | -243.753 | 2.332 |

These four generic mobs are the battle-route targets and now replace the
earlier six-named-combatant inference in the director.

The fifth capture at X `1004.777`, Y `251.213`, Z `-252.857`, rotation `2.332`
is intentionally ignored because the confirmed battle group contains four mobs.

### Ixali balloon platform

An in-game zone 171 capture confirms the Ixali balloon at
`(1037.955, 251.258, -231.589)`, rotation `-1.968`. The installed client has a
matching BG-object in family `b964`, officially catalogued as the Ixali balloon
platform. In-game probing confirmed variant `e001`; it uses spawnable appearance
`1080060` and embedded idle resources. Actions `151` and `152` toggle the Ixali
logo and held wooden logs. The director now spawns the confirmed default variant
at this position and removes it with the other battlefield actors.

Actor-class SQL supplies the exact Ixal and Amalj'aa model families while the
mob-type rows supply level-30 combat stats and AI. The director uses the two
captured talk targets for the peaceful route and the four captured generic
warriors for the battle route; the earlier six-named-target staging inference
has been retired.

## Reward Contract

- `quest_new_reward.csv` and old reward row `11001501`: 90,000 gil.
- archived main-scenario table: 19,000 EXP.
- `xtx_npclslist.csv` row 7: Ashcrown Consortium linkpearl.

Rewards live in `gamedata_quest_rewards.sql` and are auto-granted by
`Player.CompleteQuest`. The Lua script only opens the retail reward window and
completes the quest, preventing a duplicate grant.

## Parley Alternative

Quest text row 67 offers two solutions: weaken the warriors in combat or win
Parley against the two named talk targets. Talking to a target now emits the
retail localized instructions (`51034`, `51050`), enables client character
property 4 (`isNegotiatable`), and closes the talk event. The player then targets
that NPC and selects ready command `29497` (Parley) from the interaction menu.
That command follows the recovered three-widget handshake: the one-topic list,
the three-star Parley/Concede confirmation, and the tile board. The Ixal and
Amalj'aa use the datamined Toll of the Warden negotiation-title rows `5001` and
`5101`; both leave Desired and Required blank. Winning against both queues the
director-owned `pE50` completion scene and
completes the encounter. Negotiation command requests are accepted only for
quest-authored targets carrying the runtime `negotiation.enabled` flag. The
direct test checkpoint is `!questcomplete man300 parley`. The exact
quest-specific tile values are not present in local data, so the current board
uses the server's generic deterministic twelve-topic contract until that
payload is captured.

## Verification

Run the decomp regression against an installed 1.x client:

```powershell
python tools/decompile_man300_cutscene_setup.py
python tools/decompile_man300_cutscene_setup.py --json
```

The tool verifies all seven binary sizes, actor dictionaries, spatial record
formats, and every implementation anchor above. It clearly labels these as
cutscene transforms rather than claiming they are persistent spawn records.
