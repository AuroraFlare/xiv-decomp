# Man300 triggers and cutscenes

## Triggers (actor classes, `onPush`)

| Trigger | Class | Sequence | Effect |
|---|---|---|---|
| Gridania market entrance | 1090264 | SEQ_000 | `processEvent010`, →SEQ_010, warp zone 160 ward point |
| Drybone linkpearl | 1090241 | SEQ_015 | counter 0 = 5, Path LS msg, re-push guarded |
| Drybone mesa | 1090178 | SEQ_020 | `startMan300Content` → static private area |

Drybone trigger marker `(1241.42,-548.82)`; mesa entrance `(1055.17,-283.77)`;
Nananoby return `(1034.83,-269.04)`; market entrance `(-192.57,-1407.58)`
(`quest_marker.csv`). No escort pathing exists in this quest (static arena).

## Cutscene matrix (all from recovered `man300.lua` + `cutReplay.csv` 11001501–07)

| Method | Scene | Payload | Fade |
|---|---|---|---|
| `processEvent000` | man30000 | plain | after-warp; `DoPlayerMoveInZone` rebase in place |
| `pEStart` | talk turns | nickname+personality, `isQuestInfoAccepted` | none (offer) |
| `processEvent010` | man30010 | plain | after-warp; event open until `DoZoneChange` |
| `pE20` | man30020 | SNPC tuple | after-warp; event open until warp |
| `pE30` | man30030 | SNPC tuple + `false` | after-warp; event open until warp |
| `pE40` | man30040 | SNPC tuple | normal fade-in; auto-kicked on landing via `noticeEvent` `beastTribesConfrontation`, closes normally |
| `pE50` | man30050 | SNPC tuple + `10` | after-warp; noticeEvent `beastTribesSubdued`, NOT closed before warp |
| `pE60` | man30060 | SNPC tuple | after-warp; reward window 19000 + LS + CompleteQuest, then warp |

Talk helpers (pure talk turns, no state change): `processEvent005_8`,
`010_2/4/5`, `020_2/3/4/7`, `022_1` (Hedyn route reminder), `030_2/3`
(Almxio/Zoxio in director), `040_2` (Nananoby), `050_3/5/6/8/9/12`.

## Lifetime rules (static PrivateArea, not PrivateAreaContent)

- Warp scenes stay open: the staged pipeline publishes `EventFinish` against
  the old actor table. Early `EndEvent` = stuck "Now Loading".
- Never call `ContentFinished` on this battlefield.
- Never despawn battlefield actors immediately before the exit reset:
  duplicate retirement + `DeleteAllActors` crashes the 1.x client. The static
  quest-area exit cleanup retires the director after the public transition.
- `pE40` is auto-played, never started by talking to Nananoby.
- Entry: `TryCreateExclusiveQuestDirector` (busy → "Another group…"), owner
  temp var set only after admission, `commitQuestEntry`, `SEQ_025`,
  `AddMemberWithoutContentGroup` + `SetLoginDirector`, `StartDirector(false)`,
  per-entrant `MarkQuestFightContentZoneChange` + `DoZoneChange` + login-director
  re-set. Test checkpoints: `startMan300ContentTest` (skip `pE30`),
  `startMan300BattleTest`/`startMan300ParleyTest` (skip to SEQ_030, both routes
  retained).
