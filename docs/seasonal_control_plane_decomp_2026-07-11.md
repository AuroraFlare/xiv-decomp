# Seasonal Control-Plane Native Decomp - 2026-07-11

Scope: installed `2012.09.19.0001` / `1.23b` executable, recovered client
Lua, and the local Project Meteor packet builders.

## Result

Seasonal weather/decor and `SpecialEventWork` are separate protocol lanes.
Retail could send both during an event, but opcode `0x0196` does not choose the
weather resource or city layout decoration mask.

| Control plane | Opcode | Scope | Payload | Recovered role |
|---|---:|---|---|---|
| player special-event work | 0x0196 | player/actor scoped; sent in CreatePlayerRelatedPackets only to MyPlayer | byte +0x01 bitfield -> work 1-8; uint16 +0x02..+0x10 -> work 9-16 | event-mode UI/content gates; no recovered weather or city-layout mutation |
| area weather | 0x000D | area/zone weather; source actor id is zero | uint16 weather id + uint16 transition packed into an 8-byte payload | selects atmosphere resources and DAT-authored city decoration masks |

The native `_getSpecialEventWork` registration resolves to
`0x00707CC0`. Indices `1-8` read eight byte values at
object offsets `+0x84..+0x8B`; indices `9-16` read eight `uint16` values at
`+0x8C..+0x9A`. The packet handler at `0x00576050` expands one
bitfield and eight words, then calls the bulk setter at
`0x0075D2D0`.

`SpecialEventWork[9]` is therefore not a magic local event detector. It is the
first server-supplied 16-bit event-mode field, sourced from payload offset
`+0x02`.

## Recovered mode-9 consumers

| Value | Consumer | Effect |
|---:|---|---|
| 8 | chara/npc/populace/populacecompanyshop.lua | sets Grand Company shop eventFlag 8, unlocking company tracer fireworks |
| 11 | chara/npc/populace/populacecompanyshop.lua | sets Grand Company shop eventFlag 11, retaining tracers and unlocking Patriot's Choker |
| 18 | command/system/emotestandardcommand.lua | permits emote id 156 / Fire Dance |
| 18 | widget/emotelistwidget.lua | adds visible emote id 156 / Fire Dance to the emote list |
| 20 | command/system/teleportcommand.lua | changes filtering for late-era teleport destinations |
| 20 | quest/scenario/etc/etc304.lua | changes cutscene music to id 29 |

No recovered Lua consumer requests any index except `9`, and no consumer calls
weather or a city background scheduler from this value.

| Mode | Classification | Positive effects | Weather relationship |
|---:|---|---|---|
| 8 | Grand Company festival phase | Storm/Serpent/Flame Tracer fireworks become visible in GC shops | no direct weather call; separate player event-mode lane |
| 11 | Foundation Day phase | retains tracer rows and adds Patriot's Choker in all three GC shops | no direct weather call; separate player event-mode lane |
| 18 | summer Bombard / Fire Dance event | adds and permits emote 156 / Fire Dance; Spl102 Bombard Backlash teaches the dance | companion lane to summer weather 8029, not its trigger |
| 20 | late-era / Seventh Umbral state | changes teleport filtering and etc304 cutscene music; related dialogue mentions Atomos/Seventh Umbral events | no direct weather call; late-era content gate |

The Grand Company sheet makes modes `8` and `11` concrete. Its event-mask
column is tested as `required <= eventFlag`, so mode `11` keeps the mode-`8`
fireworks and adds the later threshold-`11` item:

| Required mode | Company | Item ID | Item | At mode 8 | At mode 11 |
|---:|---|---:|---|---:|---:|
| 8 | Maelstrom | 3020601 | Storm Tracer | yes | yes |
| 11 | Maelstrom | 9040018 | Patriot's Choker | no | yes |
| 8 | Order of the Twin Adder | 3020603 | Serpent Tracer | yes | yes |
| 11 | Order of the Twin Adder | 9040018 | Patriot's Choker | no | yes |
| 8 | Immortal Flames | 3020602 | Flame Tracer | yes | yes |
| 11 | Immortal Flames | 9040018 | Patriot's Choker | no | yes |

Patch 1.19 identifies Patriot's Choker as available only during Foundation Day
celebrations. The three threshold-`8` rows are the company-distributed Storm,
Serpent, and Flame Tracers. This places modes `8` and `11` in the Grand Company
festival/Foundation Day lane, not the Halloween/Starlight weather lane.

Mode `18` is independently named by the client data: `xtx_emote` row `156` is
Fire Dance, its command help calls it a summertime dance, and quest `Spl102 /
Bombard Backlash` teaches the dance for use against Bombards. The retail summer
event therefore had at least three coordinated lanes: mode `18` for Fire Dance
UI/command access, weather `8029` for atmosphere, and map/layout objects for
fireworks and decorations.

## Local server consequence

`SetSpecialEventWorkPacket.BuildPacket` currently writes a zero bitfield and
the word value `18`, with the remaining payload left zero. That produces
`SpecialEventWork[9] == 18` for every player receiving the self-related packet,
unlocking emote `156` (the Bomb Dance path). It does not select Halloween,
Starlight, or Moonfire weather/decor.

This also explains why changing the hard-coded value would affect shops,
teleports, dialogue/cutscene behavior, or the event emote without changing the
city atmosphere. Weather opcode `0x000D` remains the control that reaches the
DAT weather-selector layer recovered in
`docs/city_seasonal_weather_selector_datamine_2026-07-11.md`.

## Historical patch status

The original `ffxivpatches` S3 bucket still resolves to AWS region
`ap-northeast-1`, but anonymous object access returns `403`. Exact seasonal
filenames have no recovered Wayback CDX or Common Crawl 2012 record in this
pass. Historical payload extraction remains blocked on locating an archived
copy; the launcher sizes and CRC32 values remain the acceptance contract.

## Reproduction

```powershell
python tools/build_seasonal_control_plane_decomp_atlas.py
```

Outputs:

- `outputs\seasonal-control-plane-decomp-atlas-20260711\control_plane_packets.csv`
- `outputs\seasonal-control-plane-decomp-atlas-20260711\special_event_work_layout.csv`
- `outputs\seasonal-control-plane-decomp-atlas-20260711\special_event_mode_consumers.csv`
- `outputs\seasonal-control-plane-decomp-atlas-20260711\special_event_mode_shop_rows.csv`
- `outputs\seasonal-control-plane-decomp-atlas-20260711\special_event_mode_summary.csv`
- `outputs\seasonal-control-plane-decomp-atlas-20260711\contract_summary.json`
