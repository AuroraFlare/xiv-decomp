# Opcode Shift Hunting Notes

This note is for using the public FFXIV 1.23b packet list as a fingerprint
source when looking for shifted, renamed, or unused packet handlers in another
client build.

The key assumption is that opcode numbers may move, but packet families usually
keep more durable traits:

- direction, such as client-to-server event request or server-to-client actor
  update
- payload size and chunk count pattern
- field anchors, such as actor ids, target ids, text ids, item slots, group ids,
  Lua parameter streams, and begin/body/end counts
- sequence neighbors during login, zoning, actor spawn, inventory sync, or UI
  opening
- client-side feature names, widget names, DAT sheet names, or string literals

Do not treat a shared number as proof, and do not treat a changed number as a
miss. Match by packet shape first, then use the number as supporting evidence.

## Workflow

1. Start from `ffxiv_1x_opcode_catalog.csv`.
2. Pick one family, not one raw number.
3. Record the old packet's known direction, trigger, likely fields, and nearby
   packets.
4. Compare against modern or alternate-build packet data by structure:
   fixed-length fields, string offsets, actor/source/target semantics, and
   repeated chunk layout.
5. Search local client/decomp/server references for handler clusters around the
   same feature name or field anchors.
6. Mark the result as one of:
   - `same_number`
   - `shifted_candidate`
   - `shape_match_only`
   - `handler_exists_unseen`
   - `likely_dead`
   - `negative_control`

Keep live testing passive and local. Unknown or newly recovered packet sends
should stay behind debug-only probes until the payload layout and field semantics
are validated locally.

## Scoring

Use this quick score to avoid wishful matches:

| Signal | Points |
| --- | ---: |
| Same gameplay trigger and direction | 3 |
| Same sequence neighbors | 3 |
| Same payload size or chunk stride | 2 |
| Same field anchors at plausible offsets | 2 |
| Same client string/widget/DAT references | 2 |
| Same family neighborhood after an apparent shift | 1 |
| Only the numeric opcode matches | 0 |

Treat 6 or more as worth deeper reversing. Treat 4-5 as a weak candidate. Below
that, keep it in notes only.

## Content Focus

For Hamlet Defense, dungeon/private-area content, and chocobo caravans, the
useful question is usually "which packet family carried this content state?"
rather than "which single opcode is the content?"

An opcode identifies the message type. A packet is one instance of that message
with payload data. Content data can ride through generic packet families, so an
old system may leave no dedicated "caravan opcode" even if it has caravan-only
fields in `0x0133` requested data, `0x0137` work sync, event Lua params, or text
message packets.

Keep the broader wiki-only rows in the catalog as low-priority reference. Do
not let them drive the active hunt unless their packet family touches content UI,
director state, duty membership, scoring, routes, or objective progress.

| Content | Primary packet families | What to match |
| --- | --- | --- |
| Hamlet Defense | `0x01A6`, `0x01A8`, `0x012D-0x0133`, `0x0137`, `0x0157-0x016A` | score/ranking rows, Hamlet widgets, score text ids, supply rating, display guildleve id, director event sequence |
| Dungeons / private areas | `0x012D-0x0133`, `0x0137`, `0x017C-0x0186`, `0x0005`, `0x000C`, `0x000D`, battle/action result packets | private-area start/end, content member chunks, event bootstrap, map/music/weather setup, boss/objective work values |
| Chocobo caravans | `0x012D-0x0133`, `0x0137`, `0x0157-0x016A`, `0x00E5`, `0x0197`, `0x0199`, actor movement/target packets | route progress, escort actor id, objective count, countdown/timer UI, caravan text, chocobo actor/mount state |

## High-Value General 1.x Families

| 1.23b opcode or range | Family | Shift-hunt anchors |
| --- | --- | --- |
| `0x00D2`, `0x00D4`, `0x00D7`, `0x00DC-0x00E0` | actor target, facing, appearance, and effect variants | actor id, target id, animation/effect id, appearance flash, target clear |
| `0x012C`, `0x0138` | event and timing gaps | event sequence neighbors, target time value, Lua-param-adjacent handlers |
| `0x0171-0x0176` | push/equip condition gap | circle/fan/box trigger neighbors, equipment state changes |
| `0x0187-0x0193` | group update and control gap | group id, member count, begin/body/end triples, control bytes `0x14` and `0x15` |
| `0x01A2` | job quest completion | job id, quest flags, quest-book state neighbors |
| `0x01A6`, `0x01A8` | Hamlet supply ranking and defense score | Hamlet widgets, score text ids, display guildleve id, ranking rows |
| `0x01F4-0x01F6` | wiki-marked unused game slots | handler table presence, no observed trigger, negative-control comparison |
| lobby `0x01`, `0x10`, `0x1F4`, `0x1F5` | unknown lobby packets | login/select-character sequence position, account and world-list neighbors |

## Current Local Findings

- The local server already confirms most 1.23b game packet families in code.
- The CSV now includes wiki-only gaps that were not previously tracked.
- Lobby requests `0x03`, `0x04`, `0x05`, and `0x0B` are locally handled, so they
  are confirmed rather than wiki-only.
- `0x01A6` and `0x01A8` have local debug builders. Local IDA now recovers the
  `0x01A6` ranking parser as `20 * 0x4C = 0x5F0` bytes, while `0x01A8` has the
  compact score-row candidate. The old guessed non-empty ranking payload can
  still crash the stock client, so non-empty sends should stay behind explicit
  debug commands until native-shape probes are validated.
- `0x01F4-0x01F6` are the cleanest "old unused" game-opcode targets because the
  public 1.23b table explicitly marks them unused and the local source has no
  packet classes for them.

## Sources

- Public 1.23b opcode baseline: `https://wiki.ffxivrp.org/pages/Game_Opcodes`
- Public 1.23b packet layout: `https://wiki.ffxivrp.org/pages/Packet_Headers`
- Local packet builders and processors under `Map Server/Packets`,
  `World Server/Packets`, `Lobby Server/Packets`, and `Common Class Lib`
