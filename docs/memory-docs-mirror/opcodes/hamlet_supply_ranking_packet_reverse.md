# Hamlet Supply Ranking Packet Reverse Notes

This note records local IDA findings for the 1.x
`0x01A6 HamletSupplyRanking` client receiver.

The important outcome: the client expects a fixed `0x5F0` payload made of 20
ranking rows, each `0x4C` bytes. The old disabled `0x60` byte sample builder was
not just missing a flag; it was the wrong native shape.

## Scope

- Target binary: `ffxivgame.exe`, 32-bit PE.
- IDA database addresses below are local-analysis addresses. They are useful
  breadcrumbs, not portable source-level symbols.
- This is static local client analysis only. No live retail capture is involved.

## Receiver Trail

Useful local IDA breadcrumbs:

| Item | Local address / note |
| --- | --- |
| Likely `HamletSupplyRankingReceiver` vtable | `.rdata:01057324` |
| Receiver deleting destructor | `sub_8A0FC0` |
| Receiver constructor | `sub_89CDB0` |
| Receiver cleanup | `sub_89CE20` |
| Receiver receive/decode bridge | `sub_89CE70` |
| Stack receiver dispatcher | `sub_75A7C0` |
| Heap receiver registration | `sub_762920` |
| Target list population | `sub_6F3310` |
| Fixed payload parser | `sub_6EDFF0` |
| Raw row decoder | `sub_6DCB50` |
| Sorted row insert | `sub_7214B0` |
| Type descriptor string | `.data:012D8310` |

The likely receiver vtable sits immediately before the named
`HamletDefenseScoreReceiver_vftable`:

```text
01057324 off_1057324 dd offset sub_8A0FC0
01057328             dd offset sub_89CE70
0105732C             dd offset word_1172CEC
01057330 HamletDefenseScoreReceiver_vftable ...
```

`sub_89CDB0` installs `off_1057324` and copies `0x17C` dwords from the incoming
payload buffer into `this+8`. That is `0x17C * 4 = 0x5F0` bytes.

`sub_89CE70` dynamic-casts the packet target, then calls `sub_6F3310` with the
receiver copy at `this+8`. `sub_6F3310` lazily allocates the ranking list holder
at target `+0x60` and dispatches to `sub_6EDFF0`.

## Parser Shape

`sub_6EDFF0` clears the existing list, then loops exactly `0x14` rows:

```text
for row in 0..19:
    if *(u32 *)(payload + row * 0x4C) == 0:
        continue

    decoded = decode_row(payload + row * 0x4C)
    sorted_insert(decoded)
```

The raw row pointer advances by `0x4C` every loop, so the wire payload is:

```text
20 rows * 0x4C bytes = 0x5F0 bytes
```

## Row Layout

`sub_6DCB50` decodes one raw row:

| Raw offset | Size | Native behavior |
| ---: | ---: | --- |
| `+0x00` | `u32` | nonzero row gate; copied to decoded row `+0xA8` |
| `+0x04` | `u32` | copied to decoded row `+0xAC`; primary sort key |
| `+0x08` | `char[0x20]` | first fixed string, copied to decoded row `+0x00` |
| `+0x28` | `char[0x20]` | second fixed string, copied to decoded row `+0x54` |
| `+0x48` | `u16/i16` | copied to decoded row `+0xB0` |
| `+0x4A` | `u8` | copied to decoded row `+0xB2` |
| `+0x4B` | `u8` | padding/unused in the observed decoder |

The decoded row flag at `+0xB3` is derived from whether the second fixed string
is non-empty. It is not copied from raw `+0x4B`.

`sub_7214B0` inserts rows sorted primarily by decoded `+0xAC`, then decoded
`+0xA8`, then the first string.

## Lua Getter Mapping

The Lua getter path uses the list populated by `0x01A6`:

- `sub_74A220` registers `_countHamletSupplyRanking` to `sub_6F97C0`.
- `sub_74A370` registers `_getHamletSupplyRanking` to `sub_6F97F0`.
- `sub_6F97C0` returns the list count from `this+0x60`.
- `sub_6F97F0` fetches one 1-based row through `sub_6E58F0`.

The list node embeds the decoded row at node `+0x0C`, so getter-visible fields
map like this:

| Getter row field | Source |
| ---: | --- |
| `+0x0C` | raw string at `+0x08` |
| `+0x60` | raw string at `+0x28` |
| `+0xB4` | raw dword at `+0x00` |
| `+0xB8` | raw dword at `+0x04` |
| `+0xBC` | raw word at `+0x48` |
| `+0xBE` | raw byte at `+0x4A` |
| `+0xBF` | derived second-string-present flag |

## Implementation Notes

A controlled non-empty probe should build a full zero-padded `0x5F0` payload.
For a one-row test:

- Populate row 0 and leave rows 1 through 19 zeroed.
- Set row 0 `+0x00` to a nonzero value so the parser does not skip it.
- Write NUL-terminated ASCII into the two `0x20` fixed strings.
- Fill `+0x04`, `+0x48`, and `+0x4A` with conservative test values.

Do not wire automatic sends yet. The byte layout is now strong, but the exact
semantic names for the two dwords, word, and byte still need DAT/UI validation,
and this packet only populates ranking data. It does not solve the separate
Hamlet live HUD opener/content-state gate.

## Remaining Tasks

1. Validate the gated `0x5F0` sample builder with a one-row live probe.
2. Validate the field labels in the Hamlet ranking UI.
3. Confirm whether raw `+0x04` is rank, score, sort order, or a combined value.
4. Keep non-empty sends opt-in until a live client accepts the one-row payload cleanly.
