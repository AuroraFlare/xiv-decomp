# Of Men They Sing / Man402 Decomp and Delivery

Status: implemented and enabled on 2026-08-14.

Quest identity:

- Quest `110018`, code `Man402`, level `42` main scenario.
- Prerequisite `110017` (`Lord Errant`); next quest `110019` (`Futures Perfect`).
- Issuer and turn-in actor: Tataru, actor class `1001046`, display `1500054`, public Waking Sands spawn `merchward_tataru`.
- Retail rewards already represented in `gamedata_quest_rewards.sql`: `126,000` gil and `39,000` EXP.

## Source resolution

The implementation combines four independent source classes:

1. The recovered client scenario proves wrappers `pES`, `pE10`, `pE20`, and `pE30`, their SNPC argument forms, and the cutscene keys.
2. The installed client cutscene binaries prove actor dictionaries and spatial staging. `tools/decompile_man402_cutscene_setup.py` independently decodes and regression-checks those facts.
3. The journal and marker sheets prove the Camp Nine Ivies, missing-scout, Waking Sands, and Tataru objective order.
4. [Retail footage](https://youtu.be/BKZbj5kRgI8?t=78) and the [archived retail walkthrough](https://web.archive.org/web/20130508184247/http://ffxiv.gamerescape.com/wiki/Of_Men_They_Sing) resolve the server-only director shell: this is a solo instance, the player's own Path companion leads the route, getting too far away fails/leaves the duty, and the endpoint fight contains exactly two Bloodhounds.

The recovered `QuestDirectorMan40201` Lua contains only its base-class declaration. Escort motion, failure handling, battle spawning, recovery, and cleanup therefore remain server reconstruction rather than recovered Lua instructions.

## Playable route

| Sequence | Objective | Server behavior | Scene |
| --- | --- | --- | --- |
| accept | Speak to Tataru | Offer from the live Waking Sands Tataru | `pES` → `man40200` |
| `0` | Go to Camp Nine Ivies | Push trigger `1090190` in East Shroud zone `151` | `pE10` → `man40210` |
| `5`, flag `0` clear | Follow the Path companion | Private `SimpleContentMan40201`; dynamic companion class/nickname; escort route | gameplay |
| `5`, flag `0` set | Protect the scout | Injured scout staging plus two level-42 Bloodhounds | gameplay, then `pE20` → `man40220` |
| `15` | Return to the Waking Sands | Merchant Ward entrance recovery plus Tataru reward icon | `pE30` → `man40230` |
| `20` | Interrupted reward recovery | Tataru reopens the reward window without replaying the final scene | reward |

Flag `0` is the persisted escort-complete boundary. A relog before the scout restarts the escort; a relog after reaching the scout restarts the Bloodhound fight. A battlefield failure clears the flag and returns the player to the safe Nine Ivies retry anchor just outside the entry trigger, so the reset state does not immediately re-enter the duty.

## Cutscene decomp

Exact installed-client scene sizes and actor counts:

| Scene | Bytes | Actors | Spatial opcode | Role |
| --- | ---: | ---: | ---: | --- |
| `man40200` | `31,216` | `8` | `2` | Tataru/Minfilia distress-call offer |
| `man40210` | `287,456` | `17` | `7` | Nine Ivies briefing plus scout/Bloodhound staging |
| `man40220` | `20,976` | `6` | `7` | rescued scout and companion aftermath |
| `man40230` | `67,648` | `8` | `2` | Tataru report and final Path-companion exchange |

Implementation-critical transforms:

| Scene actor | Actor/appearance | Transform `(x, y, z, rotation)` | Use |
| --- | ---: | --- | --- |
| `man40210/PC` | player | `(1690.881, 20.171, -857.553, 2.539)` | private entry and public retry trigger |
| `man40210/sNPC` | dynamic | `(1694.418, 19.997, -861.227, -2.319)` | escort route start |
| `man40210/aramigo_mc` | `1001239` | `(1984.491, 31.996, -1680.115, -0.302)` | missing Resistance scout |
| `man40210/mon_haiena1` | appearance `1001370` | `(1987.319, 32.733, -1713.693, -0.339)` | Bloodhound 1 |
| `man40210/mon_haiena2` | appearance `1001370` | `(1989.393, 32.656, -1714.478, -0.339)` | Bloodhound 2 |
| `man40220/PC` | player | `(1870.347, 19.690, -1731.395, 1.457)` | post-duty public return |
| `man40230/TATARU` | `1001046` | `(-38.994, 0.000, -2.514, -0.808)` | final report staging |

`man40210` stores the monsters as cutscene appearance `1001370`; the exact spawnable battle class is `2201417`, class path `/Chara/Npc/Monster/Wolf/HyaenaScenarioMainLv42`, display `3201416`. Custom BNPC profile `32715` provides its level-42 wolf skill list (`5062`) and is shared by both runtime spawns.

## Escort route provenance

Marker `11001805` supplies the search-region anchor `(1917.460, -1627.580)`. The cutscene supplies the companion start and scout endpoint. `of_men_they_sing.json` contains 51 waypoints over `942.1` yalms at speed `7.0`, approximately `135` seconds before the fight, matching the retail footage's pacing.

The checked-in `zone_151.tsv` quick-navmesh was explicitly audited but is not continuous across this objective: its closest sample to the scout is about `210.6` yalms away, and its closest entry sample is an isolated node. The route builder therefore does not mislabel unrelated quick-navmesh samples as retail proof. Its intermediate forest turns are bounded inference from the footage between three recovered anchors. Re-run:

```text
python tools/derive_man402_escort_route.py --write
```

Retail distance failure is represented as `40` yalms with a `6` second grace window. The escort does not wait outside its leash; losing the companion fails the private duty and returns the player to the safe retry anchor outside the entry trigger.

## Runtime encounter and cleanup

- The escort actor is created from `getPlayerSnpcActorClassId(player)` and uses `getSnpcNickname(player)`; “Luna” is the footage player's nickname, not a fixed story NPC.
- On route completion, the child escort director is ended and replaced by a combat-ready instance of the same Path companion.
- The wounded scout uses fighter class `2290016` with recovered human appearance `1001239` as non-objective staging.
- Two actor-class `2201417` Bloodhounds spawn from profile `32715` with `3,200` HP each. The private director polls both unique IDs, so legacy kill callbacks are not trusted as the sole win condition.
- Player death, companion death, leaving the private area, leash failure, spawn failure, and the 30-minute timeout all take the same retry-safe failure route.
- Success advances to sequence `15` before finishing the content area, so `onPlayerLeft` cannot accidentally reset a completed duty.

## Delivery and test surface

Implemented files:

- `Data/scripts/quests/man/man402.lua`
- `Data/scripts/content/SimpleContentMan40201.lua`
- `Data/scripts/directors/Quest/QuestDirectorMan40201.lua`
- `Data/escortnavmesh/of_men_they_sing.json`
- `tools/derive_man402_escort_route.py`
- `tools/decompile_man402_cutscene_setup.py`
- `tools/validate_of_men_they_sing_man402.py`

SQL/runtime delivery:

- push trigger class `1090190` and spawn `3075` at Nine Ivies;
- Bloodhound BNPC profile `32715`;
- quest `110018` promoted from the generic scaffold to the implemented allowlist;
- main-scenario cap advanced from `110017` to `110018`.

GM recovery checkpoints:

```text
!questcomplete man402 camp
!questcomplete man402 escort
!questcomplete man402 combat
!questcomplete man402 turnin
!questcomplete man402 reward
```

Static verification:

```text
python tools/decompile_man402_cutscene_setup.py
python tools/derive_man402_escort_route.py
python tools/validate_of_men_they_sing_man402.py
python tools/validate_quest_availability.py
```
