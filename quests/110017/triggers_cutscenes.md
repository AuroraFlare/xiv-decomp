# Man308 triggers and cutscenes

## Triggers (actor classes, `onPush`/`onTalk`)

| Trigger | Class | Sequence | Effect |
|---|---|---|---|
| Ul'dah market entrance | 1090265 | SEQ_ACCEPT | warp zone 209 Gold Court (offer route) |
| Gold Court offer | 1090187 | SEQ_ACCEPT | `pES` talk/UI; accept via `isQuestInfoAccepted` |
| Paglth'an gate | 1090188 | SEQ_000 | `pE01`/`man30800` → SEQ_005 |
| Paglth'an approach | 1090189 | SEQ_005 | `startMan308Content` (`pE10`, after-warp) → SEQ_010 |
| Paglth'an approach | 1090189 | SEQ_010/015 | recovery re-entry (`startMan308ContentTest`, GM/recovery fade path) |
| Path companion | SNPC | SEQ_010 | `pE20` + `pE30` → SEQ_015 + move to battle staging |
| Ul'dah market entrance | 1090265 | SEQ_020 | warp zone 181 Waking Sands entry |
| Minfilia | 1000843 | SEQ_020 | `pE90`/`man30900` + reward window + `CompleteQuest` + Waking Sands return warp |

No escort pathing exists: the companion talk teleports to battle staging
(`DoZoneChangeContent` in-area) instead of walking a route.

## Cutscene matrix (all from recovered `man308.lua` + `cutReplay.csv`)

| Method | Scene(s) | Payload | Fade |
|---|---|---|---|
| `pES` | talk turns 330–356 / 357–383 | 9 personality variants + `showQuestInfomation` | none (offer) |
| `pE01` | man30800 | SNPC tuple | default (no warp) |
| `pE10` | man30810 | SNPC tuple + `false` | after-warp; staged only after destination valid, event open until `DoZoneChangeContent` |
| `pE20` | talk turn 624–632 | one personality row | none |
| `pE30` | man30830 | SNPC tuple | after-warp; holds fade for the in-area staging move |
| `pE50` | man40640 (HQ) + man30850 | SNPC tuple + `true` | default in content |
| `pE60` | man30860 | SNPC tuple | default |
| `pE80` | man30880 + man30890 | SNPC tuple | default; then party warp to public return |
| `pE90` | man30900 | companion slot forwarded unchanged (no skin→class conversion) | after-warp; event open until `DoZoneChange` |

Recovered but not on the normal route (deliberate, per 08-14 route audit):
`pE00` (post-accept triplet replay, no call site), `processEvent020_1/_2`
(tempered-captive says, text 20/21 — captives Parley directly per footage),
`processEvent090` + `090_1..14` (standalone `man30890` replay + post-fight
talks 600–622), orphan `man30820` (no wrapper or cut-replay row).

## Lifetime rules (dynamic PrivateAreaContent)

- Entry: `CreateContentArea` (zone 174 source) → director bind →
  `PrepareQuestEntry` → `AddMember` + `SetLoginDirector` →
  `commitQuestEntry` → `StartDirector(false)` + `StartContentGroup` →
  per-entrant `DoZoneChangeContent`. `pE10(false)` starts only after the
  destination exists; the staged pipeline publishes `EventFinish` against
  the old actor table, so early `EndEvent` would strand "Now Loading".
- Recovery/GM path skips `pE10` and releases the destination loading screen
  via destination-owned `noticeEvent entryReady` on `onZoneIn` (source-side
  kick would be consumed before the private actor table exists).
- `pE50`/`pE60` are director-kicked (`noticeEvent beginRitual`, 8s direct
  fallback); completion is director-kicked (`noticeEvent battleWon`, 8s
  direct fallback). Owner-only: helper kicks are acknowledged and ignored.
- Exit: `ContentFinished` before every warp; static-area rules (no
  `ContentFinished`, no pre-exit despawn) do NOT apply to this dynamic copy.
- Test checkpoints: `startMan308ContentTest` (skip `pE10`),
  `startMan308ParleyTest` / `startMan308CombatTest` (SEQ_015, flag
  cleared/set), GM `!questcomplete man308 <gate|approach|companion|parley|
  combat|turnin>`.
