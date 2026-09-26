#!/usr/bin/env python3
"""Build a focused native/source atlas for FFXIV seasonal control planes."""

from __future__ import annotations

import argparse
import csv
import json
import re
import struct
from pathlib import Path

import pefile


DEFAULT_EXE = Path(r"C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV\ffxivgame.exe")
DEFAULT_OUTPUT = Path("outputs/seasonal-control-plane-decomp-atlas-20260711")
DEFAULT_DOC = Path("docs/seasonal_control_plane_decomp_2026-07-11.md")
SPECIAL_PACKET = Path("Map Server/Packets/Send/Player/SetSpecialEventWorkPacket.cs")
WEATHER_PACKET = Path("Map Server/Packets/Send/SetWeatherPacket.cs")
LUA_ROOT = Path("tools/outputs/lpb")
GC_SHOP_TABLE = Path("docs/Dat Mining/gcSealShopItem.csv")
ITEM_NAME_TABLE = Path("docs/Dat Mining/xtx_itemName.csv")

GET_SPECIAL_EVENT_NATIVE = 0x00707CC0
GET_BYTE_HELPER = 0x0075D390
GET_WORD_HELPER = 0x0075D3A0
BULK_SET_HELPER = 0x0075D2D0
SPECIAL_PACKET_HANDLER = 0x00576050
SET_WEATHER_VIRTUAL_THUNK = 0x0071E410


def write_csv(path: Path, rows: list[dict[str, object]], fields: tuple[str, ...]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        writer.writerows(rows)


def opcode(text: str) -> int:
    match = re.search(r"OPCODE\s*=\s*0x([0-9A-Fa-f]+)", text)
    if not match:
        raise ValueError("packet opcode not found")
    return int(match.group(1), 16)


def packet_size(text: str) -> int:
    match = re.search(r"PACKET_SIZE\s*=\s*0x([0-9A-Fa-f]+)", text)
    if not match:
        raise ValueError("packet size not found")
    return int(match.group(1), 16)


class Image:
    def __init__(self, path: Path) -> None:
        self.path = path
        self.data = path.read_bytes()
        self.pe = pefile.PE(str(path))
        self.base = self.pe.OPTIONAL_HEADER.ImageBase

    def bytes_at(self, va: int, size: int) -> bytes:
        return self.data[self.pe.get_offset_from_rva(va - self.base) :][:size]

    def call_target(self, va: int) -> int:
        raw = self.bytes_at(va, 5)
        if raw[0] != 0xE8:
            raise AssertionError(f"{va:#x} is not a direct call")
        return va + 5 + struct.unpack_from("<i", raw, 1)[0]


def verify_native(image: Image) -> dict[str, object]:
    assert image.bytes_at(GET_BYTE_HELPER, 14) == bytes.fromhex(
        "8b4424048a840884000000c20400"
    )
    assert image.bytes_at(GET_WORD_HELPER, 15) == bytes.fromhex(
        "8b442404668b84418c000000c20400"
    )
    assert image.bytes_at(BULK_SET_HELPER, 8) == bytes.fromhex("8a4424048a542408")
    assert image.bytes_at(SPECIAL_PACKET_HANDLER, 3) == bytes.fromhex("83ec28")
    assert image.bytes_at(SET_WEATHER_VIRTUAL_THUNK, 10) == bytes.fromhex(
        "8b018b8044010000ffe0"
    )
    assert image.call_target(0x00707D16) == GET_BYTE_HELPER
    assert image.call_target(0x00707D3B) == GET_WORD_HELPER
    assert image.call_target(0x0057612E) == BULK_SET_HELPER
    return {
        "get_special_event_native": f"0x{GET_SPECIAL_EVENT_NATIVE:08X}",
        "get_byte_helper": f"0x{GET_BYTE_HELPER:08X}",
        "get_word_helper": f"0x{GET_WORD_HELPER:08X}",
        "bulk_set_helper": f"0x{BULK_SET_HELPER:08X}",
        "packet_handler": f"0x{SPECIAL_PACKET_HANDLER:08X}",
        "set_weather_virtual_thunk": f"0x{SET_WEATHER_VIRTUAL_THUNK:08X}",
    }


def work_layout() -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    for index in range(1, 17):
        if index <= 8:
            rows.append(
                {
                    "work_index": index,
                    "native_type": "boolean byte",
                    "object_offset_hex": f"0x{0x84 + index - 1:02X}",
                    "packet_source": f"payload byte +0x01 bit {index - 1}",
                    "getter_helper_va": f"0x{GET_BYTE_HELPER:08X}",
                }
            )
        else:
            rows.append(
                {
                    "work_index": index,
                    "native_type": "uint16",
                    "object_offset_hex": f"0x{0x8C + (index - 9) * 2:02X}",
                    "packet_source": f"payload uint16 +0x{2 + (index - 9) * 2:02X}",
                    "getter_helper_va": f"0x{GET_WORD_HELPER:08X}",
                }
            )
    return rows


def consumer_rows() -> list[dict[str, object]]:
    targets = {
        "chara/npc/populace/populacecompanyshop.lua": {
            8: "sets Grand Company shop eventFlag 8, unlocking company tracer fireworks",
            11: "sets Grand Company shop eventFlag 11, retaining tracers and unlocking Patriot's Choker",
        },
        "command/system/emotestandardcommand.lua": {
            18: "permits emote id 156 / Fire Dance",
        },
        "widget/emotelistwidget.lua": {
            18: "adds visible emote id 156 / Fire Dance to the emote list",
        },
        "command/system/teleportcommand.lua": {
            20: "changes filtering for late-era teleport destinations",
        },
        "quest/scenario/etc/etc304.lua": {
            20: "changes cutscene music to id 29",
        },
    }
    candidates: dict[str, Path] = {}
    for path in LUA_ROOT.rglob("*.lua"):
        normalized = path.as_posix().lower()
        for suffix in targets:
            if normalized.endswith(suffix):
                previous = candidates.get(suffix)
                if previous is None or "decomp_further_20260617" in normalized:
                    candidates[suffix] = path

    rows: list[dict[str, object]] = []
    for suffix, values in targets.items():
        path = candidates[suffix]
        text = path.read_text(encoding="utf-8", errors="ignore")
        for value, effect in values.items():
            matches = list(
                re.finditer(
                    rf"_getSpecialEventWork\(9\)\s*(?:==|~=)\s*{value}", text
                )
            )
            if not matches:
                raise AssertionError(f"missing mode {value} in {path}")
            line = text.count("\n", 0, matches[0].start()) + 1
            rows.append(
                {
                    "work_index": 9,
                    "mode_value": value,
                    "consumer": suffix,
                    "line": line,
                    "effect": effect,
                    "source_path": str(path),
                }
            )
    return sorted(rows, key=lambda row: (int(row["mode_value"]), str(row["consumer"])))


def shop_mode_rows() -> list[dict[str, object]]:
    with GC_SHOP_TABLE.open(newline="", encoding="utf-8-sig", errors="replace") as handle:
        shop_rows = list(csv.reader(handle))[2:]
    with ITEM_NAME_TABLE.open(newline="", encoding="utf-8-sig", errors="replace") as handle:
        name_rows = list(csv.reader(handle))[2:]
    names = {row[0]: row[6] for row in name_rows if len(row) > 6}
    companies = {1: "Maelstrom", 2: "Order of the Twin Adder", 3: "Immortal Flames"}
    rows: list[dict[str, object]] = []
    for row in shop_rows:
        if len(row) < 10 or not row[7].isdigit() or int(row[7]) not in (8, 11):
            continue
        threshold = int(row[7])
        company_id = int(row[6])
        rows.append(
            {
                "mode_threshold": threshold,
                "shop_row_id": row[0],
                "company_id": company_id,
                "company": companies[company_id],
                "item_id": row[1],
                "item_name": names.get(row[1], ""),
                "visible_at_mode_8": "yes" if threshold <= 8 else "no",
                "visible_at_mode_11": "yes" if threshold <= 11 else "no",
            }
        )
    return rows


def mode_summary_rows() -> list[dict[str, object]]:
    return [
        {
            "mode_value": 8,
            "classification": "Grand Company festival phase",
            "positive_effects": "Storm/Serpent/Flame Tracer fireworks become visible in GC shops",
            "weather_relationship": "no direct weather call; separate player event-mode lane",
            "confidence": "high",
        },
        {
            "mode_value": 11,
            "classification": "Foundation Day phase",
            "positive_effects": "retains tracer rows and adds Patriot's Choker in all three GC shops",
            "weather_relationship": "no direct weather call; separate player event-mode lane",
            "confidence": "high",
        },
        {
            "mode_value": 18,
            "classification": "summer Bombard / Fire Dance event",
            "positive_effects": "adds and permits emote 156 / Fire Dance; Spl102 Bombard Backlash teaches the dance",
            "weather_relationship": "companion lane to summer weather 8029, not its trigger",
            "confidence": "high",
        },
        {
            "mode_value": 20,
            "classification": "late-era / Seventh Umbral state",
            "positive_effects": "changes teleport filtering and etc304 cutscene music; related dialogue mentions Atomos/Seventh Umbral events",
            "weather_relationship": "no direct weather call; late-era content gate",
            "confidence": "medium-high",
        },
    ]


def control_planes(special_text: str, weather_text: str) -> list[dict[str, object]]:
    return [
        {
            "control_plane": "player special-event work",
            "opcode_hex": f"0x{opcode(special_text):04X}",
            "packet_size_hex": f"0x{packet_size(special_text):02X}",
            "payload_contract": "byte +0x01 bitfield -> work 1-8; uint16 +0x02..+0x10 -> work 9-16",
            "scope": "player/actor scoped; sent in CreatePlayerRelatedPackets only to MyPlayer",
            "client_entry": f"handler 0x{SPECIAL_PACKET_HANDLER:08X}; Lua getter 0x{GET_SPECIAL_EVENT_NATIVE:08X}",
            "seasonal_role": "event-mode UI/content gates; no recovered weather or city-layout mutation",
        },
        {
            "control_plane": "area weather",
            "opcode_hex": f"0x{opcode(weather_text):04X}",
            "packet_size_hex": f"0x{packet_size(weather_text):02X}",
            "payload_contract": "uint16 weather id + uint16 transition packed into an 8-byte payload",
            "scope": "area/zone weather; source actor id is zero",
            "client_entry": f"Lua _setWeather virtual thunk 0x{SET_WEATHER_VIRTUAL_THUNK:08X}",
            "seasonal_role": "selects atmosphere resources and DAT-authored city decoration masks",
        },
    ]


def write_doc(
    path: Path,
    output: Path,
    planes: list[dict[str, object]],
    consumers: list[dict[str, object]],
    shops: list[dict[str, object]],
    modes: list[dict[str, object]],
    native: dict[str, object],
) -> None:
    plane_table = "\n".join(
        f"| {row['control_plane']} | {row['opcode_hex']} | {row['scope']} | {row['payload_contract']} | {row['seasonal_role']} |"
        for row in planes
    )
    consumer_table = "\n".join(
        f"| {row['mode_value']} | {row['consumer']} | {row['effect']} |"
        for row in consumers
    )
    shop_table = "\n".join(
        f"| {row['mode_threshold']} | {row['company']} | {row['item_id']} | {row['item_name']} | {row['visible_at_mode_8']} | {row['visible_at_mode_11']} |"
        for row in shops
    )
    mode_table = "\n".join(
        f"| {row['mode_value']} | {row['classification']} | {row['positive_effects']} | {row['weather_relationship']} |"
        for row in modes
    )
    text = f"""# Seasonal Control-Plane Native Decomp - 2026-07-11

Scope: installed `2012.09.19.0001` / `1.23b` executable, recovered client
Lua, and the local Project Meteor packet builders.

## Result

Seasonal weather/decor and `SpecialEventWork` are separate protocol lanes.
Retail could send both during an event, but opcode `0x0196` does not choose the
weather resource or city layout decoration mask.

| Control plane | Opcode | Scope | Payload | Recovered role |
|---|---:|---|---|---|
{plane_table}

The native `_getSpecialEventWork` registration resolves to
`{native['get_special_event_native']}`. Indices `1-8` read eight byte values at
object offsets `+0x84..+0x8B`; indices `9-16` read eight `uint16` values at
`+0x8C..+0x9A`. The packet handler at `{native['packet_handler']}` expands one
bitfield and eight words, then calls the bulk setter at
`{native['bulk_set_helper']}`.

`SpecialEventWork[9]` is therefore not a magic local event detector. It is the
first server-supplied 16-bit event-mode field, sourced from payload offset
`+0x02`.

## Recovered mode-9 consumers

| Value | Consumer | Effect |
|---:|---|---|
{consumer_table}

No recovered Lua consumer requests any index except `9`, and no consumer calls
weather or a city background scheduler from this value.

| Mode | Classification | Positive effects | Weather relationship |
|---:|---|---|---|
{mode_table}

The Grand Company sheet makes modes `8` and `11` concrete. Its event-mask
column is tested as `required <= eventFlag`, so mode `11` keeps the mode-`8`
fireworks and adds the later threshold-`11` item:

| Required mode | Company | Item ID | Item | At mode 8 | At mode 11 |
|---:|---|---:|---|---:|---:|
{shop_table}

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

- `{output / 'control_plane_packets.csv'}`
- `{output / 'special_event_work_layout.csv'}`
- `{output / 'special_event_mode_consumers.csv'}`
- `{output / 'special_event_mode_shop_rows.csv'}`
- `{output / 'special_event_mode_summary.csv'}`
- `{output / 'contract_summary.json'}`
"""
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(text, encoding="utf-8")


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--exe", type=Path, default=DEFAULT_EXE)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--doc", type=Path, default=DEFAULT_DOC)
    args = parser.parse_args()

    special_text = SPECIAL_PACKET.read_text(encoding="utf-8")
    weather_text = WEATHER_PACKET.read_text(encoding="utf-8")
    assert "binWriter.Write((UInt16)0x00)" in special_text
    assert "binWriter.Write((UInt16)18)" in special_text

    native = verify_native(Image(args.exe))
    layout = work_layout()
    consumers = consumer_rows()
    shops = shop_mode_rows()
    modes = mode_summary_rows()
    planes = control_planes(special_text, weather_text)
    contract = {
        "client_snapshot": "2012.09.19.0001 / 1.23b",
        "special_event_opcode": f"0x{opcode(special_text):04X}",
        "weather_opcode": f"0x{opcode(weather_text):04X}",
        "special_event_work_fields": len(layout),
        "special_event_boolean_fields": 8,
        "special_event_uint16_fields": 8,
        "recovered_lua_indexes": sorted({int(row["work_index"]) for row in consumers}),
        "recovered_mode_values": sorted({int(row["mode_value"]) for row in consumers}),
        "local_default_mode9": 18,
        "mode8_shop_rows": sum(int(row["mode_threshold"]) == 8 for row in shops),
        "mode11_shop_rows": sum(int(row["mode_threshold"]) == 11 for row in shops),
        "summer_event_mode": 18,
        "summer_weather_id": 8029,
        "native_addresses": native,
        "conclusion": "SpecialEventWork is player event-mode/UI state; weather/decor is a separate area weather and layout-selector control plane.",
    }

    write_csv(
        args.output / "special_event_work_layout.csv",
        layout,
        ("work_index", "native_type", "object_offset_hex", "packet_source", "getter_helper_va"),
    )
    write_csv(
        args.output / "special_event_mode_consumers.csv",
        consumers,
        ("work_index", "mode_value", "consumer", "line", "effect", "source_path"),
    )
    write_csv(
        args.output / "control_plane_packets.csv",
        planes,
        ("control_plane", "opcode_hex", "packet_size_hex", "payload_contract", "scope", "client_entry", "seasonal_role"),
    )
    write_csv(
        args.output / "special_event_mode_shop_rows.csv",
        shops,
        (
            "mode_threshold", "shop_row_id", "company_id", "company",
            "item_id", "item_name", "visible_at_mode_8", "visible_at_mode_11",
        ),
    )
    write_csv(
        args.output / "special_event_mode_summary.csv",
        modes,
        (
            "mode_value", "classification", "positive_effects",
            "weather_relationship", "confidence",
        ),
    )
    args.output.mkdir(parents=True, exist_ok=True)
    (args.output / "contract_summary.json").write_text(json.dumps(contract, indent=2) + "\n", encoding="utf-8")
    write_doc(args.doc, args.output, planes, consumers, shops, modes, native)
    print(json.dumps(contract, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
