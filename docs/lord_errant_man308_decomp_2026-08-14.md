# Lord Errant (Man308) Decomp and Delivery Notes

> **2026-09-04 correction:** The [bytecode follow-up](msq_30_46_bytecode_decomp_2026-09-04.md) proves `pE90` does not convert companion skin to actor class. Its server call now uses the existing converted-argument helper; the final scene and return lifecycle remain in place.

Quest: `110017`, `Man308`, level 38 main scenario, prerequisite `110016` (Forever Taken).

Implementation:

- `Data/scripts/quests/man/man308.lua`
- `Data/scripts/content/SimpleContentMan30801.lua`
- `Data/scripts/directors/Quest/QuestDirectorMan30801.lua`
- `tools/decompile_man308_cutscene_setup.py`
- `tools/validate_lord_errant_man308.py`

Primary period-footage reference: [tJrl9bfP5A8, encounter starts at 6:38](https://www.youtube.com/watch?v=tJrl9bfP5A8&t=398s).

This document supersedes the cautious 2026-07-07 scaffold notes. The video,
current-client cutscene binaries, recovered scenario, marker/journal tables,
negotiation table, and reward rows now close the route gaps that previously
kept Man308 hidden.

## Delivered Route

1. The Ul'dah market entrance routes the player to the Path companion's Gold
   Court offer (`pES`).
2. The recovered Paglth'an gate anchor plays `pE01` / `man30800`.
3. The recovered approach anchor plays `pE10` / `man30810` and creates a
   party-capable, combat-class private copy of Southern Thanalan. Journal rows
   `218` through `221` all explicitly permit up to two accompanying party
   members. Because the mandatory Path companion occupies a retail mission
   slot, the server admits the owner plus one nearby player helper and then
   materializes the owner's companion as the third member.
4. The Path companion plays the personality line in `pE20`, followed by the
   site-arrival scene `pE30` / `man30830`.
5. The director plays the paired ritual scenes `pE50` (`man40640` plus
   `man30850`) and `pE60` (`man30860`).
6. Four tempered human captives appear. Targeting any one and completing one
   successful Parley frees the entire group, matching the single negotiation
   session shown in the footage.
7. The director replaces the passive companion with a combat ally and spawns
   the exact three hostile labels seen in the footage: Amalj'aa lancer,
   Amalj'aa archer, and Amalj'aa augur.
8. Killing all three plays the combined post-fight wrapper `pE80`
   (`man30880` then `man30890`) and returns the player to the public Paglth'an
   anchor recovered from `man30890`.
9. Minfilia at the Waking Sands plays `pE90` / `man30900`, opens the 32,500 EXP
   reward presentation, and completes the quest. Database completion grants
   the authoritative 32,500 EXP and 114,000 gil rows.

## Quest State and Recovery

| Sequence | Journal row | Server objective | Recovery behavior |
| ---: | ---: | --- | --- |
| `0` | `218` | Reach the Paglth'an gate | Public trigger remains available. |
| `5` | `219` | Reach the battlefield approach | Entry can be retried after failure/early exit. |
| `10` | `220` | Speak with the Path companion in content | Expired content can be recreated from the public approach. |
| `15`, flag 0 | `220` | Watch the ritual and Parley with a captive | Failed/conceded Parley is retryable in place. |
| `15`, flag 1 | `221` | Defeat the three Amalj'aa | Relog/content recreation skips the ritual and resumes combat. |
| `20` | `222` | Report to Minfilia | Waking Sands reward/turn-in state. |

Quest flag 0 is the authoritative Parley-complete bit. The content script
clears it and rolls sequence 10/15 back to sequence 5 on an unfinished early
exit. Normal completion marks the content finished before leaving, so that
rollback cannot erase the post-battle state.

Party ownership is explicit rather than inferred from director-member order.
Only the player who opened the copy advances or rolls back Man308; a helper can
fight or complete the shared Parley, but leaving the duty cannot mutate that
helper's independent journal. Completion and failure return every admitted
player to the public Paglth'an anchor.

## Footage Findings

The supplied video resolves the main behavioral ambiguity left by the empty
client director shells:

- Around 6:40, four tempered human captives are staged around the player and
  Path companion.
- The footage shows one point-based Parley encounter lasting about 50 seconds,
  with gains/losses attributed to the captive group.
- The result transitions to exactly three hostile enemies: lancer, archer,
  and augur.
- The last enemy dies around 8:11; the post-fight sequence begins immediately.
- `man30880` and `man30890` account for the long ritual aftermath and the
  outside Paglth'an scene visible through roughly 13:00.

The implementation therefore does not require four separate Parley wins and
does not spawn the captives as hostile kill targets.

## Recovered Scenario Wrappers

| Wrapper | Scene(s) | Fade behavior | Delivery use |
| --- | --- | --- | --- |
| `pES` | Talk/UI | Personality opening and accepted triplets | Gold Court quest offer |
| `pE00` | Talk | Replays accepted triplets | Recovered, not required by normal route |
| `pE01` | `man30800` | Default | Paglth'an gate |
| `pE10` | `man30810` | Default or after-warp | Private-content entry, `false` branch |
| `pE20` | Talk | One personality row | Companion briefing |
| `pE30` | `man30830` | After-warp | Battle-site staging |
| `pE50` | `man40640`, `man30850` | Default or after-warp | Ifrit ritual, `true` branch in content |
| `pE60` | `man30860` | Default | Amalj'aa pre-fight beat |
| `pE80` | `man30880`, `man30890` | Default | Complete post-fight sequence |
| `processEvent090` | `man30890` | Default | Standalone/replay route only |
| `pE90` | `man30900` | After-warp | Minfilia completion/handoff |

`man30820` remains an orphan asset: it has no recovered Man308 wrapper or
cut-replay row. The decoder inventories it, but the playable route does not
invent a call site for it.

## Binary Cutscene Inventory

The decoder validates current installed-client sizes, actor counts, spatial
opcodes, actor ids, and key transforms.

| Scene | Bytes | Actors | Spatial opcode | Important cast/role |
| --- | ---: | ---: | ---: | --- |
| `man30800` | `89,312` | 4 | 1 | PC, SNPC, two sylphs |
| `man30810` | `62,992` | 9 | 1 | PC, SNPC, two sylphs, five Amalj'aa |
| `man30820` | `49,056` | 11 | 9 | Orphan scene; one decoded PC transform |
| `man30830` | `16,304` | 5 | 1 | PC, SNPC, three Amalj'aa |
| `man30850` | `4,777,472` | 15 | 2 | Four human captives, priests, Ifrit |
| `man30860` | `9,360` | 3 | 2 | Three Amalj'aa |
| `man30880` | `2,358,128` | 15 | 15 | Ritual aftermath cast |
| `man30890` | `94,496` | 7 | 6 | PC, SNPC, sylphs, three Amalj'aa |
| `man30900` | `44,960` | 7 | 8 | Minfilia, PC, Tataru, Waking Sands cast |
| `man40640` | `9,909,200` | 27 | 26 | HQ ritual composite and four captives |

These byte sizes correct the earlier notes, which included container/padding
figures rather than the current installed scene-file sizes.

### Route and Battlefield Anchors

| Source | Actor | Transform `(x, y, z, rotation)` | Use |
| --- | --- | --- | --- |
| `man30800` | PC | `(1240.229, 319.338, 746.182, -0.929)` | Gate trigger |
| `man30810` | PC | `(1134.053, 312.430, 830.706, -1.649)` | Approach trigger |
| `man30810` | PC | `(1000.714, 308.565, 985.779, 1.541)` | Battle staging |
| `man30830` | PC | `(995.168, 309.146, 982.116, -2.519)` | Private-content entry |
| `man30830` | SNPC | `(996.166, 309.178, 980.941, -2.240)` | Companion spawn |
| `man30830` | Amalj'aa A | `(990.180, 309.682, 979.995, 1.795)` | Lancer spawn |
| `man30830` | Amalj'aa B | `(992.990, 309.931, 976.904, -0.001)` | Archer spawn |
| `man30830` | Amalj'aa E | `(992.674, 309.542, 979.550, 0.822)` | Augur spawn |
| `man30890` | PC | `(1217.650, 311.707, 776.001, -0.931)` | Public post-fight return |
| `man30900` | PC | `(-40.159, 0.000, -1.605, 2.209)` | Completion-scene anchor |

The transforms are cutscene-managed evidence. Only the route, content-entry,
combat, and return anchors explicitly listed as implementation uses become
server positions.

## Captives and Negotiation

The client actor-appearance rows `2289001` through `2289003` are used as
appearance overrides on passive named event actors. This preserves the three
recovered human variants without misclassifying the prisoners as enemies.
One appearance is reused for the fourth human confirmed by `man30850`,
`man30880`, and `man40640`.

Each captive stores a server-authored negotiation-board profile:

- title id `1401` (`Lord Errant`);
- requested-item slot `1000019` (widget-safe presentation value only);
- 12 turns;
- 20 seconds per turn.

`NegotiationCommand.lua` now accepts those values from target temp vars before
falling back to generic command arguments. Reward/item mutations remain solely
in the quest/director result callback.

## Battle Profiles

| BNPC profile | Actor class | Label | Job | Level | Skill list |
| ---: | ---: | --- | ---: | ---: | ---: |
| `32712` | `2206508` | Amalj'aa lancer | Lancer (`8`) | 38 | `88` |
| `32713` | `2206512` | Amalj'aa archer | Archer (`7`) | 38 | `87` |
| `32714` | `2206518` | Amalj'aa augur | Thaumaturge (`22`) | 38 | `89` |

The director applies 2,500 HP, linked aggression, recovered positions, a
45-yalm leash, and ranged-position behavior for the archer and augur. The Path
companion becomes a level-38 DPS ally once combat begins.

## Markers and Static Triggers

| Marker | Objective |
| ---: | --- |
| `11001701` | Paglth'an gate |
| `11001702` | Paglth'an approach |
| `11001703` | Waking Sands / Minfilia |
| `11001704` | Ul'dah market / Gold Court route |
| `11001705` | Ritual site / companion |
| `11001706`, `11001707` | Tempered captives |
| `11001708` | Amalj'aa combat group |

Server event-spawn ids `3072` through `3074` add the invisible push actors for
the Gold Court offer, Paglth'an gate, and Paglth'an approach.

## Validation and GM Checkpoints

Static validation:

```text
python tools/validate_lord_errant_man308.py
python tools/validate_quest_availability.py
python tools/decompile_man308_cutscene_setup.py
```

Runtime checkpoints:

```text
!questcomplete man308 gate
!questcomplete man308 approach
!questcomplete man308 companion
!questcomplete man308 parley
!questcomplete man308 combat
!questcomplete man308 turnin
```

The supported main-scenario cap is now `110017`, and Man308 has been removed
from the hidden generic scaffold and promoted to Implemented in the quest
availability audit.
