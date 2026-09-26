#!/usr/bin/env python3
"""Rebuild the installed-client evidence set for Garuda's wind hazards.

The script is read-only with respect to the installed FFXIV 1.x client. It
verifies the exact source hashes, recursively inventories PWIB/SEDB resources,
extracts scheduler/token evidence, and proves which payload families are or are
not shared between combat, persistent model-state, cinematic, and weather data.
"""

from __future__ import annotations

import argparse
import csv
import hashlib
import json
import math
import re
import struct
from collections import Counter
from dataclasses import dataclass
from pathlib import Path


DEFAULT_CLIENT = Path(r"C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV")
DEFAULT_OUTPUT = Path("outputs/garuda-tornado-decomp-20260805")

EXECUTABLE_DEF = {
    "relative": Path("ffxivgame.exe"),
    "sha256": "9341f2b4567440b310a4d494f5cc5599ca334ba51c8042247317ff466492f2e9",
    "role": "native_scheduler_actionclip_and_vfx_runtime",
}

SOURCE_DEFS = {
    "m851_wss05": {
        "relative": Path(r"client\chara\mon\m851\act\emp_emp\wss\base\0005"),
        "sha256": "6b70fcdb5dece7deb0999210594e4ae13fd6c82f43d78400c348ad8fe4737f99",
        "role": "garuda_owned_tatumaki_cast_package",
    },
    "m851_wss11": {
        "relative": Path(r"client\chara\mon\m851\act\emp_emp\wss\base\0011"),
        "sha256": "e6c5014cb0f7ff131ef40a5e0e7724f3d5c5faa392edeba4957297be415d259e",
        "role": "garuda_owned_tatumaki_loop_cast_package",
    },
    "m999_wss15": {
        "relative": Path(r"client\chara\mon\m999\act\emp_emp\wss\base\0015"),
        "sha256": "16bcfd08dcfea38d040e7fa5faa9b939422032363908f4450bd3e1d9c8f62097",
        "role": "one_shot_tatumaki_combat_package",
    },
    "m999_wss18": {
        "relative": Path(r"client\chara\mon\m999\act\emp_emp\wss\base\0018"),
        "sha256": "a6e52e63cd16673bf1d6633c639ca5aacdd6c88bd5739da9165f0a591d5e26fb",
        "role": "one_shot_taihuu_combat_package",
    },
    "m999_e003_model": {
        "relative": Path(r"client\chara\mon\m999\equ\e003\met_mdl\0001"),
        "sha256": "3dc782ca249deb86e914d5231829c99e48d3d2ecf6fc63c22579e1090feac501",
        "role": "persistent_tornado_model_state_carrier",
    },
    "sum6g000": {
        "relative": Path(r"client\cut\sum6g000\sum6g000"),
        "sha256": "c0bdcb72ac50d712642e56d29df4ef00403717f433c3fdcd553e5de0eb071e74",
        "role": "garuda_cinematic_tornado_family",
    },
    "wtr_smmn": {
        "relative": Path(r"data\28\D9\00\15.DAT"),
        "sha256": "db13649451a75054235319e93bc9bfd3c236eb776bdd45c6df12e96e49e2a383",
        "role": "garuda_weather_and_environmental_wind",
    },
}

M999_WSS_BANK_SHA256 = {
    1: "a849d146a606332e773e6f151a61bbbdfb22d6a15102a8f4c0c3d93881113a94",
    2: "495d76a562dbe2bebfb2698468dd114cd2aa024e6f22004b9fd0520ddd72cfc1",
    3: "0ddecf22508dcd151e302c7484981932b52db02f8ca926c3a114c65168046ac6",
    4: "769514e370b57a5024e1f646fbe7ab05563f802c615e2f32890c51895d7a9423",
    5: "d5f262f0d06fe1fa8f1f990df3333cc8093a1c72fea22aedc507aba16baaec72",
    6: "4eaa0bf9aeba22ae4b0fffb56425d080ea12aed36a1673139b7854b43c52308b",
    7: "024bcb72f397b163599607ccec24e6f72c43e79c9aca0dd1a4745527e9f9e99a",
    8: "507375ca88078b648d50d852932dee3ff65b7b7e76778bc1437d0c7556c94eef",
    9: "72f91f10ea757f3c3e1f7217e2246a55adf295819d42fdbb9339a2c3df36c379",
    10: "afbdb40c52f52675efdc3be00b96feaa1a80d0407a0b8a4b8a94a69d6cdb939d",
    11: "337dbceffa415c7d1edb42ea9b719240186442f04665822bc3f5485370c6ecdd",
    12: "c1e3bdc8ce80a80e9b56b6776a32422301fa8b07cf9ec755bbea610bc27587ee",
    13: "4f45f409fddc36574919c77967746d8ced160af288de619a03fdcd740b4a79a1",
    14: "c25b6868e7f67e38be5c285f94ec962a581b9f5e3d31c5915d5340372fb79550",
    15: "16bcfd08dcfea38d040e7fa5faa9b939422032363908f4450bd3e1d9c8f62097",
    16: "6a0445e82313ae3ff021113d42d11d329e00a32ceeb145143e11fca263925f0b",
    17: "c458104e4b2d4498e1526679be2e6189693af45ea04488308a8556e610be6f60",
    18: "a6e52e63cd16673bf1d6633c639ca5aacdd6c88bd5739da9165f0a591d5e26fb",
    19: "2bda6b73c2c0f59a1abaa51fd01c267b1d07e304acca890284a0c24508f6d34b",
    20: "767db3b34ab40a8508168f0871f94eaf7bafabad3fed89121c5169d3d20e3825",
}

RETAIL_LUA_SURFACE_DEFS = (
    {
        "name": "LentigoGarudaTyphoon",
        "luac_relative": Path(r"tools\outputs\lpb\content_systems_20260612\luac\chara\npc\monster\lentigo\lentigogarudatyphoon.luac"),
        "lua_relative": Path(r"tools\outputs\lpb\content_systems_20260612\lua\chara\npc\monster\lentigo\lentigogarudatyphoon.lua"),
        "bytes": 212,
        "sha256": "0fe6fb4a9f4015e67ec26964f556542732818e6baf221b455e39ccbf864ae700",
        "require": 'require("/Chara/Npc/Monster/Lentigo/LentigoBaseClass")',
        "declaration": '_defineClass("LentigoGarudaTyphoon", "LentigoBaseClass")',
    },
    {
        "name": "GarudaOthers",
        "luac_relative": Path(r"tools\outputs\lpb\content_systems_20260612\luac\command\game\basic\garudaothers.luac"),
        "lua_relative": Path(r"tools\outputs\lpb\content_systems_20260612\lua\command\game\basic\garudaothers.lua"),
        "bytes": 203,
        "sha256": "d4dc1af5445c6c56b39ce6c578db993709a2c3327df5889d3b47a8776872f3f2",
        "require": 'require("/Command/Game/BattleCommandBaseClass")',
        "declaration": '_defineClass("GarudaOthers", "BattleCommandBaseClass")',
    },
    {
        "name": "GarudaAttackWeaponSkill",
        "luac_relative": Path(r"tools\outputs\lpb\content_systems_20260612\luac\command\game\weaponskill\garudaattackweaponskill.luac"),
        "lua_relative": Path(r"tools\outputs\lpb\content_systems_20260612\lua\command\game\weaponskill\garudaattackweaponskill.lua"),
        "bytes": 222,
        "sha256": "c7a1782af189b59dbad096290e944783a0a47dd94d0b7858bf179c1dc5f12eaf",
        "require": 'require("/Command/Game/WeaponSkill/WeaponSkillBaseClass")',
        "declaration": '_defineClass("GarudaAttackWeaponSkill", "WeaponSkillBaseClass")',
    },
    {
        "name": "GarudaBaseClass",
        "luac_relative": Path(r"tools\outputs\lpb\content_systems_20260612\luac\chara\npc\monster\garuda\garudabaseclass.luac"),
        "lua_relative": Path(r"tools\outputs\lpb\content_systems_20260612\lua\chara\npc\monster\garuda\garudabaseclass.lua"),
        "bytes": 203,
        "sha256": "6bc8abf51454910b9aaacd488cfa2ca326d2d3a860721b791b2aa20a88f79e8c",
        "require": 'require("/Chara/Npc/Monster/MonsterBaseClass")',
        "declaration": '_defineBaseClass("GarudaBaseClass", "MonsterBaseClass")',
    },
    {
        "name": "InstanceRaidNormalGaruda",
        "luac_relative": Path(r"tools\outputs\lpb\content_systems_20260612\luac\director\instanceraid\instanceraidnormalgaruda.luac"),
        "lua_relative": Path(r"tools\outputs\lpb\content_systems_20260612\lua\director\instanceraid\instanceraidnormalgaruda.lua"),
        "bytes": 222,
        "sha256": "4cd419cd806a6f43e89a1266fff994a40de4835768aebafa583e9b7a1b624660",
        "require": 'require("/Director/InstanceRaid/InstanceRaidBaseClass")',
        "declaration": '_defineClass("InstanceRaidNormalGaruda", "InstanceRaidBaseClass")',
    },
)

LENTIGO_INHERITANCE_DEFS = (
    {
        "class": "LentigoGarudaTyphoon",
        "role": "garuda_typhoon_identity",
        "luac_relative": Path(r"tools\outputs\lpb\decomp_further_20260617\luac\chara\npc\monster\lentigo\lentigogarudatyphoon.luac"),
        "lua_relative": Path(r"tools\outputs\lpb\decomp_further_20260617\lua\chara\npc\monster\lentigo\lentigogarudatyphoon.lua"),
        "bytes": 212,
        "sha256": "0fe6fb4a9f4015e67ec26964f556542732818e6baf221b455e39ccbf864ae700",
        "base": "LentigoBaseClass",
        "method_count": 0,
        "only_behavior": "none",
    },
    {
        "class": "LentigoMoogleF0f4",
        "role": "cross_content_identity_comparison",
        "luac_relative": Path(r"tools\outputs\lpb\decomp_further_20260617\luac\chara\npc\monster\lentigo\lentigomooglef0f4.luac"),
        "lua_relative": Path(r"tools\outputs\lpb\decomp_further_20260617\lua\chara\npc\monster\lentigo\lentigomooglef0f4.lua"),
        "bytes": 209,
        "sha256": "28815197a48181395f0847b4c33486b5ab67a40b8007ff2f200c0a23c2f237cc",
        "base": "LentigoBaseClass",
        "method_count": 0,
        "only_behavior": "none",
    },
    {
        "class": "LentigoWhiteGeneralMeteor",
        "role": "cross_content_identity_comparison",
        "luac_relative": Path(r"tools\outputs\lpb\decomp_further_20260617\luac\chara\npc\monster\lentigo\lentigowhitegeneralmeteor.luac"),
        "lua_relative": Path(r"tools\outputs\lpb\decomp_further_20260617\lua\chara\npc\monster\lentigo\lentigowhitegeneralmeteor.lua"),
        "bytes": 217,
        "sha256": "72547aa53e699229269834e06aae3cf79b56fcdd9183690b4afe04b348f8492d",
        "base": "LentigoBaseClass",
        "method_count": 0,
        "only_behavior": "none",
    },
    {
        "class": "LentigoWhiteGeneralWS",
        "role": "cross_content_identity_comparison",
        "luac_relative": Path(r"tools\outputs\lpb\decomp_further_20260617\luac\chara\npc\monster\lentigo\lentigowhitegeneralws.luac"),
        "lua_relative": Path(r"tools\outputs\lpb\decomp_further_20260617\lua\chara\npc\monster\lentigo\lentigowhitegeneralws.lua"),
        "bytes": 213,
        "sha256": "7273643e2578f6bbbda7b96f668bf2b98656f18af729ac07af5768882fe0b3c9",
        "base": "LentigoBaseClass",
        "method_count": 0,
        "only_behavior": "none",
    },
    {
        "class": "LentigoQuicksandW0D5Raid1",
        "role": "cross_content_identity_comparison",
        "luac_relative": Path(r"tools\outputs\lpb\decomp_more_20260617\luac\chara\npc\monster\lentigo\lentigoquicksandw0d5raid1.luac"),
        "lua_relative": Path(r"tools\outputs\lpb\decomp_more_20260617\lua\chara\npc\monster\lentigo\lentigoquicksandw0d5raid1.lua"),
        "bytes": 217,
        "sha256": "590d3dcb4eabb4abeb8ca7d7f15499cbc55d039880284c3c1053216fca9cedfd",
        "base": "LentigoBaseClass",
        "method_count": 0,
        "only_behavior": "none",
    },
    {
        "class": "LentigoBaseClass",
        "role": "lentigo_shared_base",
        "luac_relative": Path(r"tools\outputs\lpb\decomp_further_20260617\luac\chara\npc\monster\lentigo\lentigobaseclass.luac"),
        "lua_relative": Path(r"tools\outputs\lpb\decomp_further_20260617\lua\chara\npc\monster\lentigo\lentigobaseclass.lua"),
        "bytes": 303,
        "sha256": "b2cde5f17ed2ef97bd339e68ad429e74f4e61dcdcc1cde61e0190bf7c3851a50",
        "base": "MonsterBaseClass",
        "method_count": 1,
        "only_behavior": "isMapMarkerVisibleForTalkable returns false",
    },
    {
        "class": "MonsterBaseClass",
        "role": "generic_monster_base",
        "luac_relative": Path(r"tools\outputs\lpb\decomp_further_20260617\luac\chara\npc\monster\monsterbaseclass.luac"),
        "lua_relative": Path(r"tools\outputs\lpb\decomp_further_20260617\lua\chara\npc\monster\monsterbaseclass.lua"),
        "bytes": 188,
        "sha256": "c195bdd1abdde12a9917b16a710142463ae61a9d727e242ca31a6b2cd392b95e",
        "base": "NpcBaseClass",
        "method_count": 0,
        "only_behavior": "none",
    },
    {
        "class": "NpcBaseClass_battle",
        "role": "generic_battle_mixin",
        "luac_relative": Path(r"tools\outputs\lpb\decomp_further_20260617\luac\chara\npc\npcbaseclass_battle.luac"),
        "lua_relative": Path(r"tools\outputs\lpb\decomp_further_20260617\lua\chara\npc\npcbaseclass_battle.lua"),
        "bytes": 1066,
        "sha256": "2f80ba2e710c6a4a762f280c778cd96db31a8996c9b4369a0399e96bbc8aa965",
        "base": "NpcBaseClass",
        "method_count": 5,
        "only_behavior": "battle metadata init; parts accessors; aggro accessor",
    },
)

EXPECTED_TOKENS = {
    "m851_wss05": (
        "skl05cas01m.veffbin",
        "skl05tar01m.veffbin",
        "tatumaki",
        "CameraShake",
        "RaptureActionSelectDamageMccClip",
    ),
    "m851_wss11": (
        "m851skl11m_c1.veffbin",
        "m851skl11m_c2.veffbin",
        "m851skl11m_t1.veffbin",
        "tatumaki",
        "LOOP",
        "SceneTexture",
        "RaptureActionSelectDamageMccClip",
    ),
    "m999_wss15": (
        "tatumaki.veffbin",
        "tn_hit01m.veffbin",
        "skl15_cas",
        "skl15_tar",
        "RaptureCasterSchClip",
        "RaptureActionSelectDamageMccClip",
    ),
    "m999_wss18": (
        "taihuu01.veffbin",
        "taihu_end.veffbin",
        "tm_hit01m.veffbin",
        "skl18_cas",
        "skl18_tar",
        "RaptureCasterSchClip",
        "RaptureActionSelectDamageMccClip",
    ),
    "m999_e003_model": (
        "init_msb4_0",
        "init_msb4_1",
        "tatumaki_loop.veff",
        "init_msb5_0",
        "init_msb5_1",
        "taihu_loop.veff",
        "taihu_end",
        "RaptureEffectEndClip",
    ),
    "sum6g000": (
        "torne_in",
        "torne_lop",
        "torne_rot",
        "torne_st",
        "gal_land",
        "gal_sonic",
        "gal_sprl",
        "f0grd_wid",
    ),
    "wtr_smmn": (
        "wtr_smmn",
        "wind_00_0000",
    ),
}

GENERIC_SHOOT_MON_SHA256 = (
    "7da7c8b13a2096a23de59d6719c2e2cad385cb8e6e295974273b33e7a08c0422"
)

VFX_CONTROL_PATTERN = re.compile(
    r"(?:SQEX/CDev/Engine/Vfx/QixControl/Controls|"
    r"Application/Scene/Vfx/RaptureQixControl/QixControl/Controls)/"
    r"[A-Za-z0-9_:]+"
)

EXPECTED_MODEL_SCHEDULERS = {
    "init_msb4_0": (100_000, 2, None, None),
    "init_msb4_1": (2_010_000, 6, 90_000, (2,)),
    "init_msb5_0": (790_000, 2, None, None),
    "init_msb5_1": (2_250_000, 6, 200_000, (2,)),
}

TYPE_LABELS = {
    int.from_bytes(b"bcs\0", "little"): "SCB",
    int.from_bytes(b"bcm\0", "little"): "MCB",
    int.from_bytes(b"btm\0", "little"): "MTB",
    int.from_bytes(b"ser\0", "little"): "RES",
}


@dataclass(frozen=True)
class Resource:
    index: int
    kind: int
    resource_type: int
    resource_id: str
    resource_path: str
    payload: bytes


def sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def read_verified(client: Path, source: str) -> tuple[Path, bytes]:
    definition = SOURCE_DEFS[source]
    path = client / definition["relative"]
    data = path.read_bytes()
    actual = sha256_bytes(data)
    expected = definition["sha256"]
    if actual != expected:
        raise ValueError(
            f"{source} hash mismatch: expected {expected}, got {actual} ({path})"
        )
    return path, data


def read_executable_verified(client: Path) -> tuple[Path, bytes]:
    path = client / EXECUTABLE_DEF["relative"]
    data = path.read_bytes()
    actual = sha256_bytes(data)
    expected = EXECUTABLE_DEF["sha256"]
    if actual != expected:
        raise ValueError(
            f"ffxivgame.exe hash mismatch: expected {expected}, got {actual} ({path})"
        )
    return path, data


def pe_va_to_file_offset(data: bytes, virtual_address: int) -> int:
    """Map a VA in the verified 32-bit PE to its raw file offset."""
    if data[:2] != b"MZ":
        raise ValueError("executable has no MZ header")
    pe_offset = struct.unpack_from("<I", data, 0x3C)[0]
    if data[pe_offset : pe_offset + 4] != b"PE\0\0":
        raise ValueError("executable has no PE header")
    section_count, optional_size = struct.unpack_from("<H12xH", data, pe_offset + 6)
    optional = pe_offset + 0x18
    if struct.unpack_from("<H", data, optional)[0] != 0x10B:
        raise ValueError("expected a PE32 optional header")
    image_base = struct.unpack_from("<I", data, optional + 0x1C)[0]
    rva = virtual_address - image_base
    section_table = optional + optional_size
    for index in range(section_count):
        entry = section_table + index * 0x28
        virtual_size, section_rva, raw_size, raw_offset = struct.unpack_from(
            "<IIII", data, entry + 8
        )
        if section_rva <= rva < section_rva + max(virtual_size, raw_size):
            relative = rva - section_rva
            if relative >= raw_size:
                raise ValueError(f"VA 0x{virtual_address:X} has no raw file bytes")
            return raw_offset + relative
    raise ValueError(f"VA 0x{virtual_address:X} is outside PE sections")


def pe_dwords(data: bytes, virtual_address: int, count: int) -> tuple[int, ...]:
    offset = pe_va_to_file_offset(data, virtual_address)
    return struct.unpack_from(f"<{count}I", data, offset)


def pe_bytes(data: bytes, virtual_address: int, size: int) -> bytes:
    offset = pe_va_to_file_offset(data, virtual_address)
    return data[offset : offset + size]


def read_cstring(data: bytes, offset: int, end: int | None = None) -> tuple[str, int]:
    limit = len(data) if end is None else end
    terminator = data.find(b"\0", offset, limit)
    if terminator < 0:
        raise ValueError(f"unterminated string at 0x{offset:X}")
    return data[offset:terminator].decode("ascii", errors="replace"), terminator + 1


def parse_pwib(data: bytes) -> list[Resource]:
    if len(data) < 0x40:
        raise ValueError("resource container is too small")

    if data[:4] == b"PWIB":
        file_size, resource_offset, data_offset = struct.unpack_from(">III", data, 4)
        if file_size != len(data):
            raise ValueError(f"PWIB size mismatch: {file_size} != {len(data)}")
        if resource_offset != 0x10 or not resource_offset <= data_offset <= len(data):
            raise ValueError("unsupported PWIB header")
        root = resource_offset
    elif data[:8] == b"SEDBRES ":
        # Nested effect/common-resource packages omit the 16-byte PWIB wrapper.
        root = 0
    else:
        raise ValueError("not a PWIB/SEDBRES resource container")

    if data[root : root + 8] != b"SEDBRES ":
        raise ValueError("resource root is not SEDBRES")
    count, strings_offset, string_count, _ = struct.unpack_from("<IIII", data, root + 0x30)
    if count < 2 or string_count != count:
        raise ValueError("unsupported SEDBRES table shape")

    entry_offset = root + 0x40
    entries = [
        struct.unpack_from("<IIII", data, entry_offset + index * 0x10)
        for index in range(count)
    ]
    base = entry_offset + count * 0x10
    type_offset = base + entries[-2][1]
    id_offset = base + entries[-1][1]
    resource_types = struct.unpack_from(f"<{count}I", data, type_offset)

    resource_ids = [
        read_cstring(data, id_offset + index * 0x10, id_offset + (index + 1) * 0x10)[0]
        for index in range(count)
    ]
    resource_paths: list[str] = []
    cursor = base + strings_offset
    for _ in range(string_count):
        value, cursor = read_cstring(data, cursor)
        resource_paths.append(value)

    resources: list[Resource] = []
    for index, ((entry_index, relative_offset, size, kind), resource_type) in enumerate(
        zip(entries, resource_types)
    ):
        if entry_index != index:
            raise ValueError(f"non-sequential resource index {entry_index} at {index}")
        if index >= count - 2 or size == 0 or resource_type == 0 or kind == 0:
            continue
        payload = data[base + relative_offset : base + relative_offset + size]
        if len(payload) != size:
            raise ValueError(f"truncated resource {index}")
        resources.append(
            Resource(
                index=index,
                kind=kind,
                resource_type=resource_type,
                resource_id=resource_ids[index],
                resource_path=resource_paths[index],
                payload=payload,
            )
        )
    return resources


def payload_tag(payload: bytes) -> str:
    if payload.startswith(b"PWIB"):
        return "PWIB"
    if payload.startswith(b"SEDB"):
        return payload[:8].rstrip(b"\0 ").decode("ascii", errors="replace")
    return ""


def ascii_runs(data: bytes, minimum: int = 4) -> list[tuple[int, str]]:
    pattern = rb"[\x20-\x7E]{" + str(minimum).encode("ascii") + rb",}"
    return [
        (match.start(), match.group().decode("ascii", errors="replace"))
        for match in re.finditer(pattern, data)
    ]


def ascii_strings(data: bytes, minimum: int = 4) -> list[str]:
    return [value for _, value in ascii_runs(data, minimum)]


def bounded_ascii_token_present(data: bytes, token: str) -> bool:
    """Match a serialized token without accepting a longer identifier suffix."""
    escaped = re.escape(token.encode("ascii"))
    pattern = rb"(?<![A-Za-z0-9_])" + escaped + rb"(?![A-Za-z0-9_])"
    return re.search(pattern, data, flags=re.IGNORECASE) is not None


def walk_pwib_resources(
    data: bytes, layer: str = "outer"
) -> list[tuple[str, Resource]]:
    objects: list[tuple[str, Resource]] = []
    for resource in parse_pwib(data):
        objects.append((layer, resource))
        if resource.payload.startswith((b"PWIB", b"SEDBRES ")):
            objects.extend(
                walk_pwib_resources(
                    resource.payload,
                    f"{layer}/RES:{resource.resource_id or resource.index}",
                )
            )
    return objects

def walk_pwib(source: str, data: bytes) -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []

    def walk(blob: bytes, layer: str) -> None:
        resources = parse_pwib(blob)
        for resource in resources:
            row = {
                "source": source,
                "layer": layer,
                "index": resource.index,
                "resource_id": resource.resource_id,
                "resource_path": resource.resource_path,
                "resource_type_hex": f"0x{resource.resource_type:08X}",
                "resource_type": TYPE_LABELS.get(resource.resource_type, ""),
                "payload_tag": payload_tag(resource.payload),
                "bytes": len(resource.payload),
                "sha256": sha256_bytes(resource.payload),
            }
            rows.append(row)
            if resource.payload.startswith((b"PWIB", b"SEDBRES ")):
                walk(
                    resource.payload,
                    f"{layer}/RES:{resource.resource_id or resource.index}",
                )

    walk(data, "outer")
    return rows


def scb_clip_classes(payload: bytes) -> list[str]:
    classes: list[str] = []
    seen: set[str] = set()
    for match in re.finditer(rb"(ProxyActor|[A-Za-z][A-Za-z0-9_]*Clip)\0", payload):
        value = match.group(1).decode("ascii")
        if value not in seen:
            classes.append(value)
            seen.add(value)
    return [value for value in classes if value != "ProxyActor"]


def scb_resource_table(payload: bytes) -> list[tuple[str, str]]:
    marker = payload.find(b"RIDTBL")
    if marker < 0:
        raise ValueError("SCB has no RIDTBL")
    ridt = marker + 0x10
    if payload[ridt : ridt + 4] != b"RIDT":
        raise ValueError("SCB RIDT record is missing")
    ridt_size, resource_count = struct.unpack_from("<II", payload, ridt + 8)
    if ridt_size != 0x10 + resource_count * 0x10:
        raise ValueError(f"unexpected RIDT size/count: {ridt_size}/{resource_count}")
    resources = [
        read_cstring(payload, ridt + 0x10 + index * 0x10, ridt + 0x20 + index * 0x10)[0]
        for index in range(resource_count)
    ]

    ridi = ridt + ridt_size
    if payload[ridi : ridi + 4] != b"RIDI":
        raise ValueError("SCB RIDI record is missing")
    type_count = struct.unpack_from("<I", payload, ridi + 0x0C)[0]
    if type_count != resource_count:
        raise ValueError(f"RIDT/RIDI count mismatch: {resource_count}/{type_count}")
    resource_types = [
        payload[ridi + 0x10 + index * 4 : ridi + 0x14 + index * 4]
        .rstrip(b"\0")
        .decode("ascii", errors="replace")
        for index in range(type_count)
    ]
    return list(zip(resources, resource_types))

def parse_scb_graph(source: str, scheduler: str, payload: bytes) -> list[dict[str, object]]:
    markers = [match.start() for match in re.finditer(re.escape(b"@CBLK"), payload)]
    if len(markers) < 2:
        raise ValueError(f"{scheduler}: expected two @CBLK sections")
    active = markers[1]
    if active + 0x40 > len(payload):
        raise ValueError(f"{scheduler}: truncated active block")

    duration_units, entry_count = struct.unpack_from("<II", payload, active + 0x24)
    clip_classes = scb_clip_classes(payload)
    resource_table = scb_resource_table(payload)
    cursor = active + 0x40
    rows: list[dict[str, object]] = []

    for ordinal in range(entry_count):
        if cursor + 8 > len(payload):
            raise ValueError(f"{scheduler}: truncated entry {ordinal}")
        record_size, type_index, actor_index, start_units = struct.unpack_from("<HBBI", payload, cursor)
        if record_size < 8 or cursor + record_size > len(payload):
            raise ValueError(
                f"{scheduler}: invalid entry size {record_size} at 0x{cursor:X}"
            )
        if type_index >= len(clip_classes):
            raise ValueError(
                f"{scheduler}: clip type {type_index} exceeds {clip_classes}"
            )

        body = payload[cursor + 8 : cursor + record_size]
        timeline_clip_id = struct.unpack_from("<I", body, 4)[0] if len(body) >= 8 else -1
        clip_class = clip_classes[type_index]
        resource_ref_index: int | str = ""
        resource_ref_id = ""
        resource_ref_type = ""
        if clip_class == "ActionClip":
            if len(body) < 12:
                raise ValueError(f"{scheduler}: truncated ActionClip payload")
            resource_ref_index = struct.unpack_from("<I", body, 8)[0]
            if resource_ref_index >= len(resource_table):
                raise ValueError(
                    f"{scheduler}: ActionClip resource {resource_ref_index} exceeds "
                    f"table of {len(resource_table)}"
                )
            resource_ref_id, resource_ref_type = resource_table[resource_ref_index]
            if resource_ref_type != "bca":
                raise ValueError(
                    f"{scheduler}: ActionClip resource {resource_ref_index} has "
                    f"type {resource_ref_type}, expected bca"
                )
        target_ids: tuple[int, ...] = ()
        if clip_class == "RaptureEffectEndClip":
            if len(body) < 12:
                raise ValueError(f"{scheduler}: truncated EffectEnd payload")
            target_count = struct.unpack_from("<I", body, 8)[0]
            if target_count > 64 or len(body) < 12 + (target_count * 2):
                raise ValueError(f"{scheduler}: invalid EffectEnd target list")
            target_ids = tuple(
                struct.unpack_from("<H", body, 12 + index * 2)[0]
                for index in range(target_count)
            )

        cancel_tokens = [
            value
            for value in ascii_strings(body)
            if value.startswith("init_msb")
        ]
        rows.append(
            {
                "source": source,
                "scheduler": scheduler,
                "state": (
                    "on"
                    if scheduler.startswith("init_msb") and scheduler.endswith("_1")
                    else "off" if scheduler.startswith("init_msb") else "action"
                ),
                "active_block_offset_hex": f"0x{active:X}",
                "active_duration_units": duration_units,
                "active_duration_seconds": duration_units / 1_000_000,
                "active_entry_count": entry_count,
                "entry_ordinal": ordinal,
                "record_offset_hex": f"0x{cursor:X}",
                "record_size": record_size,
                "clip_type_index": type_index,
                "controlled_actor_index": actor_index,
                "clip_class": clip_class,
                "timeline_clip_id": timeline_clip_id,
                "resource_ref_index": resource_ref_index,
                "resource_ref_id": resource_ref_id,
                "resource_ref_type": resource_ref_type,
                "start_units": start_units,
                "start_seconds": start_units / 1_000_000,
                "effect_end_target_count": len(target_ids) if target_ids else "",
                "effect_end_target_ids": ";".join(str(value) for value in target_ids),
                "effect_end_target_classes": "",
                "cancel_scheduler_tokens": ";".join(cancel_tokens),
                "entry_payload_hex": body.hex(" "),
                "_target_ids": target_ids,
            }
        )
        cursor += record_size

    classes_by_id = {int(row["timeline_clip_id"]): str(row["clip_class"]) for row in rows}
    for row in rows:
        target_ids = row.pop("_target_ids")
        target_classes = [classes_by_id.get(target, "missing") for target in target_ids]
        row["effect_end_target_classes"] = ";".join(target_classes)
        if target_ids and any(value != "ActionClip" for value in target_classes):
            raise ValueError(
                f"{scheduler}: EffectEnd targets are not exclusively ActionClip: "
                f"{list(zip(target_ids, target_classes))}"
            )

    if scheduler in EXPECTED_MODEL_SCHEDULERS:
        expected_duration, expected_count, expected_start, expected_targets = (
            EXPECTED_MODEL_SCHEDULERS[scheduler]
        )
        if (duration_units, entry_count) != (expected_duration, expected_count):
            raise ValueError(
                f"{scheduler}: expected duration/count "
                f"{expected_duration}/{expected_count}, got {duration_units}/{entry_count}"
            )
        effect_rows = [row for row in rows if row["clip_class"] == "RaptureEffectEndClip"]
        if expected_start is None:
            if effect_rows:
                raise ValueError(f"{scheduler}: unexpected EffectEnd entry")
        else:
            if len(effect_rows) != 1:
                raise ValueError(f"{scheduler}: expected one EffectEnd entry")
            effect_row = effect_rows[0]
            actual_targets = tuple(
                int(value)
                for value in str(effect_row["effect_end_target_ids"]).split(";")
                if value
            )
            if (effect_row["start_units"], actual_targets) != (
                expected_start,
                expected_targets,
            ):
                raise ValueError(
                    f"{scheduler}: unexpected EffectEnd timing/targets "
                    f"{effect_row['start_units']}/{actual_targets}"
                )

    return rows


def direct_appearance_contract(repo: Path) -> list[dict[str, object]]:
    sql_path = repo / "Data/sql/gamedata_actor_appearance.sql"
    row_pattern = re.compile(
        r"INSERT INTO `gamedata_actor_appearance` VALUES \(([^)]+)\);"
    )
    matches: list[list[int]] = []
    for line in sql_path.read_text(encoding="utf-8", errors="replace").splitlines():
        match = row_pattern.fullmatch(line)
        if match is None:
            continue
        values = [int(value) for value in match.group(1).split(",")]
        if len(values) != 40:
            raise ValueError(f"unexpected appearance column count: {len(values)}")
        if values[1] == 10999 and values[28] == 3072:
            matches.append(values)

    if len(matches) != 1:
        raise ValueError(f"expected one m999/e003 appearance, got {len(matches)}")
    values = matches[0]
    if (values[0], values[2], values[27]) != (9114428, 2, 0):
        raise ValueError(f"unexpected m999/e003 appearance row: {values}")
    return [
        {
            "appearance_id": values[0],
            "base_model": values[1],
            "size": values[2],
            "head_gear": values[27],
            "body_gear": values[28],
            "model_join": "m999/e003",
            "database_uniqueness": "sole base-10999 row with body gear 3072",
            "runtime_note": "direct model override is safe; actor class 9114428 has no battle class path",
        }
    ]


def action_wrapper_flags(source_data: dict[str, bytes]) -> list[dict[str, object]]:
    definitions = (
        ("m851_wss05", "m851_05_ca1", "boss_caster"),
        ("m851_wss05", "skl05_tar1", "boss_target"),
        ("m851_wss11", "skl11_cas1", "boss_caster"),
        ("m851_wss11", "skl11_cas2", "boss_caster"),
        ("m851_wss11", "skl11_tar1", "boss_target"),
        ("m999_wss15", "skl15_cas", "hazard_caster"),
        ("m999_wss15", "skl15_tar", "hazard_target"),
        ("m999_wss18", "skl18_cas", "hazard_caster"),
        ("m999_wss18", "end", "hazard_end"),
        ("m999_wss18", "skl18_tar", "hazard_target"),
        ("m999_e003_model", "tatumaki", "persistent_on"),
        ("m999_e003_model", "taihu01m", "persistent_on"),
        ("m999_e003_model", "taihu_end", "persistent_off"),
    )
    resource_maps = {
        source: {
            resource.resource_id: resource
            for _, resource in walk_pwib_resources(source_data[source])
        }
        for source in {source for source, _, _ in definitions}
    }
    rows: list[dict[str, object]] = []
    for source, resource_id, role in definitions:
        resource = resource_maps[source].get(resource_id)
        if resource is None:
            raise ValueError(f"missing ActionClip wrapper {source}/{resource_id}")
        if payload_tag(resource.payload) != "SEDBACB" or len(resource.payload) != 1016:
            raise ValueError(f"unexpected ActionClip wrapper {source}/{resource_id}")
        field_9c = struct.unpack_from("<I", resource.payload, 0x9C)[0]
        field_a0 = struct.unpack_from("<I", resource.payload, 0xA0)[0]
        persistent = role == "persistent_on"
        expected = (0xC0, 0x101) if persistent else (0x80, 0x1)
        if (field_9c, field_a0) != expected:
            raise ValueError(
                f"unexpected ActionClip mode {source}/{resource_id}: "
                f"{field_9c:#x}/{field_a0:#x}"
            )
        rows.append(
            {
                "source": source,
                "resource_id": resource_id,
                "role": role,
                "action_field_0x9c_hex": f"0x{field_9c:08X}",
                "action_field_0xa0_hex": f"0x{field_a0:08X}",
                "sample_group": "persistent_on" if persistent else "ordinary_or_off",
                "sha256": sha256_bytes(resource.payload),
                "interpretation_boundary": (
                    "native behavior is recovered in native_action_wrapper_semantics.csv; "
                    "the two bits also occur independently, so neither alone is an infinite-loop opcode"
                ),
            }
        )
    return rows



def installed_action_wrapper_census(
    repo: Path, client: Path
) -> list[dict[str, object]]:
    """Census ActionClip @ACT flags across the installed action-bank atlas."""
    atlas = repo / "outputs/dungeon-animation-inventory-20260722/installed_action_banks.csv"
    rows: list[dict[str, object]] = []
    scanned_files = 0
    with atlas.open(encoding="utf-8-sig", newline="") as handle:
        for bank in csv.DictReader(handle):
            if "SEDBACB" not in bank["sedb_tag_counts"]:
                continue
            path = client / "client/chara" / Path(bank["relative_path"])
            if not path.is_file():
                raise ValueError(f"missing installed action bank from atlas: {path}")
            data = path.read_bytes()
            if not data.startswith(b"PWIB"):
                raise ValueError(f"action bank is not PWIB: {path}")
            scanned_files += 1
            for layer, resource in walk_pwib_resources(data):
                if payload_tag(resource.payload) != "SEDBACB":
                    continue
                if len(resource.payload) < 0xA4:
                    raise ValueError(
                        f"unexpected ActionClip size in {bank['relative_path']}: "
                        f"{len(resource.payload)}"
                    )
                field_9c = struct.unpack_from("<I", resource.payload, 0x9C)[0]
                field_a0 = struct.unpack_from("<I", resource.payload, 0xA0)[0]
                rows.append(
                    {
                        "category": bank["category"],
                        "model_or_object": bank["resource"],
                        "lane": bank["lane"],
                        "bank": bank["bank"],
                        "relative_path": bank["relative_path"],
                        "resource_id": resource.resource_id,
                        "resource_path": resource.resource_path,
                        "layer": layer,
                        "payload_bytes": len(resource.payload),
                        "action_field_0x9c_hex": f"0x{field_9c:08X}",
                        "action_field_0xa0_hex": f"0x{field_a0:08X}",
                        "extra_0x40_bit": int(bool(field_9c & 0x40)),
                        "extra_0x100_bit": int(bool(field_a0 & 0x100)),
                        "sha256": sha256_bytes(resource.payload),
                        "interpretation_boundary": (
                            "raw @ACT words; native bit behavior is recovered separately, "
                            "but original source-field names remain unavailable"
                        ),
                    }
                )

    counts = Counter(
        (row["action_field_0x9c_hex"], row["action_field_0xa0_hex"])
        for row in rows
    )
    expected = Counter(
        {
            ("0x00000080", "0x00000001"): 1266,
            ("0x000000C0", "0x00000101"): 43,
            ("0x00000080", "0x00000101"): 19,
            ("0x000000C0", "0x00000001"): 8,
        }
    )
    if scanned_files != 584 or counts != expected:
        raise ValueError(
            f"unexpected installed ActionClip census: files={scanned_files} counts={counts}"
        )
    return rows
def persistent_leaf_parameters(data: bytes) -> list[dict[str, object]]:
    """Expose exact model-state leaf values without inventing collision geometry."""
    resources = {
        resource.resource_id: resource
        for _, resource in walk_pwib_resources(data)
    }
    definitions = (
        ("small_tornado_on", 4, "0x10", "tatumaki", "10AwX5vleafinst"),
        ("large_typhoon_on", 5, "0x20", "taihu01m", "0LpZwqvleafinst"),
        ("large_typhoon_off", 5, "0x20", "taihu_end", "2B8nqJvleafinst"),
    )
    rows: list[dict[str, object]] = []
    for state, bit, mask, action_id, leaf_id in definitions:
        action = resources.get(action_id)
        leaf = resources.get(leaf_id)
        if action is None or leaf is None:
            raise ValueError(f"missing persistent leaf pair: {action_id}/{leaf_id}")
        if payload_tag(action.payload) != "SEDBACB" or len(action.payload) != 1016:
            raise ValueError(f"unexpected ActionClip payload for {action_id}")
        if payload_tag(leaf.payload) != "SEDBvins" or len(leaf.payload) != 1012:
            raise ValueError(f"unexpected VLeafIns payload for {leaf_id}")

        rows.append(
            {
                "state": state,
                "mode_bit": bit,
                "mask": mask,
                "action_resource_id": action_id,
                "action_sha256": sha256_bytes(action.payload),
                "action_field_0x9c_hex": f"0x{struct.unpack_from('<I', action.payload, 0x9C)[0]:08X}",
                "action_field_0xa0_hex": f"0x{struct.unpack_from('<I', action.payload, 0xA0)[0]:08X}",
                "leaf_resource_id": leaf_id,
                "leaf_sha256": sha256_bytes(leaf.payload),
                "position_y_0x314": struct.unpack_from("<f", leaf.payload, 0x314)[0],
                "angle_control_metadata_0x32c": struct.unpack_from("<i", leaf.payload, 0x32C)[0],
                "scale_x_0x330": struct.unpack_from("<f", leaf.payload, 0x330)[0],
                "scale_y_0x334": struct.unpack_from("<f", leaf.payload, 0x334)[0],
                "scale_z_0x338": struct.unpack_from("<f", leaf.payload, 0x338)[0],
                "scale_control_metadata_0x33c_hex": f"0x{struct.unpack_from('<I', leaf.payload, 0x33C)[0]:08X}",
                "rgba_0x350_0x35c": ";".join(
                    f"{struct.unpack_from('<f', leaf.payload, offset)[0]:g}"
                    for offset in (0x350, 0x354, 0x358, 0x35C)
                ),
                "raw_time_a_0x360": struct.unpack_from("<I", leaf.payload, 0x360)[0],
                "raw_time_b_0x364": struct.unpack_from("<I", leaf.payload, 0x364)[0],
                "interpretation_boundary": (
                    "position-Y and scale XYZ are exact client presentation transforms; "
                    "neighboring metadata is not a coordinate, and neither transform is server collision geometry"
                ),
            }
        )

    expected = {
        "small_tornado_on": (0.0, -5000, (1.2, 1.0, 1.2), "0x11100000", 300000, 150000),
        "large_typhoon_on": (0.75, 5000, (1.2, 1.1, 1.2), "0x10100000", 300000, 150000),
        "large_typhoon_off": (0.75, -5000, (1.2, 1.0, 1.2), "0x10100000", 300000, 150000),
    }
    for row in rows:
        actual = (
            round(float(row["position_y_0x314"]), 6),
            row["angle_control_metadata_0x32c"],
            tuple(round(float(row[key]), 6) for key in (
                "scale_x_0x330", "scale_y_0x334", "scale_z_0x338"
            )),
            row["scale_control_metadata_0x33c_hex"],
            row["raw_time_a_0x360"],
            row["raw_time_b_0x364"],
        )
        if actual != expected[str(row["state"])]:
            raise ValueError(f"unexpected persistent leaf parameters for {row['state']}: {actual}")
    return rows


def vfx_leaf_lifetime_comparison(
    source_data: dict[str, bytes]
) -> list[dict[str, object]]:
    """Compare the state leaves with their one-shot WSS counterparts."""
    definitions = (
        (
            "small_tornado_on", "persistent_state", "m999_e003_model",
            "tatumaki", "10AwX5vleafinst", "LeafLifeEx",
            "m999 WSS15 caster", "same timing/mode triple; different lifetime class/layout",
        ),
        (
            "large_typhoon_on", "persistent_state", "m999_e003_model",
            "taihu01m", "0LpZwqvleafinst", "LeafLifeEx",
            "m999 WSS18 caster",
            "same layout; outside identifiers only position Y and scale XYZ differ",
        ),
        (
            "large_typhoon_off", "persistent_off", "m999_e003_model",
            "taihu_end", "2B8nqJvleafinst", "LeafLifeEx",
            "m999 WSS18 end",
            "same layout; outside identifiers only scale Y differs",
        ),
        (
            "wss15_caster", "one_shot_combat", "m999_wss15",
            "skl15_cas", "49HLfHvleafinst", "LeafLife",
            "small tornado state", "same timing/mode triple; base LeafLife class",
        ),
        (
            "wss18_caster", "one_shot_combat", "m999_wss18",
            "skl18_cas", "23M7hZvleafinst", "LeafLifeEx",
            "large typhoon on state",
            "same layout; outside identifiers only position Y and scale XYZ differ",
        ),
        (
            "wss18_end", "one_shot_combat_end", "m999_wss18",
            "end", "1R79ktvleafinst", "LeafLifeEx",
            "large typhoon off state",
            "same layout; outside identifiers only scale Y differs",
        ),
    )
    resource_maps = {
        source: {
            resource.resource_id: resource
            for _, resource in walk_pwib_resources(source_data[source])
        }
        for source in {definition[2] for definition in definitions}
    }
    timing_pattern = struct.pack("<III", 300_000, 150_000, 1)
    rows: list[dict[str, object]] = []
    for (
        sample, role, source, action_id, leaf_id, expected_class,
        paired_sample, pair_relation,
    ) in definitions:
        action = resource_maps[source].get(action_id)
        leaf = resource_maps[source].get(leaf_id)
        if action is None or leaf is None:
            raise ValueError(f"missing leaf comparison resources: {source}/{action_id}/{leaf_id}")
        if payload_tag(action.payload) != "SEDBACB" or len(action.payload) != 1016:
            raise ValueError(f"unexpected comparison ActionClip: {source}/{action_id}")
        if payload_tag(leaf.payload) != "SEDBvins":
            raise ValueError(f"unexpected comparison leaf: {source}/{leaf_id}")

        lifetime_class = (
            "LeafLifeEx" if b"/LeafLifeEx\0" in leaf.payload
            else "LeafLife" if b"/LeafLife\0" in leaf.payload
            else ""
        )
        if lifetime_class != expected_class:
            raise ValueError(
                f"unexpected lifetime class for {source}/{leaf_id}: {lifetime_class}"
            )
        offsets = [
            offset
            for offset in range(len(leaf.payload))
            if leaf.payload.startswith(timing_pattern, offset)
        ]
        if len(offsets) != 1:
            raise ValueError(
                f"expected one 300000/150000/mode1 tuple in {source}/{leaf_id}: {offsets}"
            )
        timing_offset = offsets[0]
        rows.append(
            {
                "sample": sample,
                "role": role,
                "source": source,
                "action_resource_id": action_id,
                "action_field_0x9c_hex": (
                    f"0x{struct.unpack_from('<I', action.payload, 0x9C)[0]:08X}"
                ),
                "action_field_0xa0_hex": (
                    f"0x{struct.unpack_from('<I', action.payload, 0xA0)[0]:08X}"
                ),
                "leaf_resource_id": leaf_id,
                "leaf_payload_bytes": len(leaf.payload),
                "lifetime_class": lifetime_class,
                "timing_tuple_offset_hex": f"0x{timing_offset:X}",
                "serialized_word_a": struct.unpack_from("<I", leaf.payload, timing_offset)[0],
                "serialized_word_b": struct.unpack_from("<I", leaf.payload, timing_offset + 4)[0],
                "serialized_mode": leaf.payload[timing_offset + 8],
                "paired_sample": paired_sample,
                "pair_relation": pair_relation,
                "native_mode_1_conclusion": (
                    "word A is not the active cutoff; runtime uses the owning effect boundary "
                    "and a native 150000-us fade default"
                ),
                "sha256": sha256_bytes(leaf.payload),
            }
        )
    return rows


def tornado_leaf_transforms(
    source_data: dict[str, bytes]
) -> list[dict[str, object]]:
    """Decode the leaf-instance XYZ transform triplets used by wind presentations."""
    definitions = (
        (
            "garuda_wss05_caster", "boss_cast", "m851_wss05", "2ZB6Rwvleafinst",
            878, 0x300, 0x310, 0x320,
            (0.0, 0.0, 0.0), (0.0, 0.0, 0.0), (1.5, 1.5, 1.5),
            769, -5000, 0x10100000,
        ),
        (
            "garuda_wss11_caster_elevated", "boss_cast", "m851_wss11", "2Xv2zbvleafinst",
            878, 0x300, 0x310, 0x320,
            (0.0, 7.5, 0.0), (0.0, 0.0, 0.0), (2.0, 2.0, 2.0),
            769, -5000, 0x10100000,
        ),
        (
            "garuda_wss11_caster_root", "boss_cast", "m851_wss11", "1Z7dpXvleafinst",
            878, 0x300, 0x310, 0x320,
            (0.0, 0.0, 0.0), (0.0, 0.0, 0.0), (2.0, 2.0, 2.0),
            769, -5000, 0x10100000,
        ),
        (
            "wss15_caster", "small_tornado_combat", "m999_wss15", "49HLfHvleafinst",
            878, 0x300, 0x310, 0x320,
            (0.0, 0.0, 0.0), (0.0, 0.0, 0.0), (0.9, 1.2, 0.9),
            769, -5000, 0x10100000,
        ),
        (
            "wss15_target_hit", "small_tornado_hit", "m999_wss15", "4idUqnvleafinst",
            1166, 0x320, 0x330, 0x340,
            (0.0, 0.0, 0.0), (0.0, 0.0, 0.0), (2.0, 2.0, 2.0),
            832, 10000, 0x10100000,
        ),
        (
            "wss18_caster", "large_typhoon_combat", "m999_wss18", "23M7hZvleafinst",
            1012, 0x310, 0x320, 0x330,
            (0.0, 0.0, 0.0), (0.0, 0.0, 0.0), (1.0, 1.0, 1.0),
            785, 5000, 0x10100000,
        ),
        (
            "wss18_end", "large_typhoon_combat_end", "m999_wss18", "1R79ktvleafinst",
            1012, 0x310, 0x320, 0x330,
            (0.0, 0.75, 0.0), (0.0, 0.0, 0.0), (1.2, 1.1, 1.2),
            785, -5000, 0x10100000,
        ),
        (
            "wss18_target_hit", "large_typhoon_hit", "m999_wss18", "4Btb8Ivleafinst",
            1166, 0x320, 0x330, 0x340,
            (0.0, 0.0, 0.0), (0.0, 0.0, 0.0), (2.0, 2.0, 2.0),
            832, 10000, 0x10100000,
        ),
        (
            "small_tornado_on", "persistent_state", "m999_e003_model", "10AwX5vleafinst",
            1012, 0x310, 0x320, 0x330,
            (0.0, 0.0, 0.0), (0.0, 0.0, 0.0), (1.2, 1.0, 1.2),
            785, -5000, 0x11100000,
        ),
        (
            "large_typhoon_on", "persistent_state", "m999_e003_model", "0LpZwqvleafinst",
            1012, 0x310, 0x320, 0x330,
            (0.0, 0.75, 0.0), (0.0, 0.0, 0.0), (1.2, 1.1, 1.2),
            785, 5000, 0x10100000,
        ),
        (
            "large_typhoon_off", "persistent_off", "m999_e003_model", "2B8nqJvleafinst",
            1012, 0x310, 0x320, 0x330,
            (0.0, 0.75, 0.0), (0.0, 0.0, 0.0), (1.2, 1.0, 1.2),
            785, -5000, 0x10100000,
        ),
    )
    resource_maps = {
        source: {
            resource.resource_id: resource
            for _, resource in walk_pwib_resources(source_data[source])
        }
        for source in {definition[2] for definition in definitions}
    }
    rows: list[dict[str, object]] = []
    for (
        sample, role, source, resource_id, expected_bytes,
        position_offset, angle_offset, scale_offset,
        expected_position, expected_angle, expected_scale,
        expected_position_metadata, expected_angle_metadata, expected_scale_metadata,
    ) in definitions:
        resource = resource_maps[source].get(resource_id)
        if resource is None or payload_tag(resource.payload) != "SEDBvins":
            raise ValueError(f"missing transform leaf {source}/{resource_id}")
        payload = resource.payload
        if len(payload) != expected_bytes:
            raise ValueError(f"unexpected transform layout {source}/{resource_id}: {len(payload)}")
        position = struct.unpack_from("<3f", payload, position_offset)
        angle = struct.unpack_from("<3f", payload, angle_offset)
        scale = struct.unpack_from("<3f", payload, scale_offset)
        position_metadata = struct.unpack_from("<i", payload, position_offset + 0xC)[0]
        angle_metadata = struct.unpack_from("<i", payload, angle_offset + 0xC)[0]
        scale_metadata = struct.unpack_from("<I", payload, scale_offset + 0xC)[0]
        actual = (
            tuple(round(value, 6) for value in position),
            tuple(round(value, 6) for value in angle),
            tuple(round(value, 6) for value in scale),
            position_metadata,
            angle_metadata,
            scale_metadata,
        )
        expected = (
            expected_position, expected_angle, expected_scale,
            expected_position_metadata, expected_angle_metadata, expected_scale_metadata,
        )
        if actual != expected:
            raise ValueError(f"unexpected transform values for {sample}: {actual}")
        rows.append(
            {
                "sample": sample,
                "role": role,
                "source": source,
                "leaf_resource_id": resource_id,
                "leaf_payload_bytes": len(payload),
                "position_offset_hex": f"0x{position_offset:X}",
                "position_x": position[0],
                "position_y": position[1],
                "position_z": position[2],
                "position_metadata_signed": position_metadata,
                "angle_offset_hex": f"0x{angle_offset:X}",
                "angle_x": angle[0],
                "angle_y": angle[1],
                "angle_z": angle[2],
                "angle_metadata_signed": angle_metadata,
                "scale_offset_hex": f"0x{scale_offset:X}",
                "scale_x": scale[0],
                "scale_y": scale[1],
                "scale_z": scale[2],
                "scale_metadata_hex": f"0x{scale_metadata:08X}",
                "sha256": sha256_bytes(payload),
                "interpretation_boundary": (
                    "client leaf presentation transform; metadata words are not XYZ values, "
                    "and no value is server collision geometry"
                ),
            }
        )
    return rows


def tornado_leaf_transform_diffs(
    transform_rows: list[dict[str, object]]
) -> list[dict[str, object]]:
    """Record the only non-identifier transform differences in matched 1012-byte leaves."""
    by_sample = {str(row["sample"]): row for row in transform_rows}
    pairs = (
        ("large_typhoon_on", "wss18_caster", "persistent_on_vs_one_shot_caster"),
        ("large_typhoon_off", "wss18_end", "persistent_off_vs_one_shot_end"),
    )
    fields = (
        "position_x", "position_y", "position_z",
        "angle_x", "angle_y", "angle_z",
        "scale_x", "scale_y", "scale_z",
        "position_metadata_signed", "angle_metadata_signed", "scale_metadata_hex",
    )
    rows: list[dict[str, object]] = []
    for left_name, right_name, relation in pairs:
        left = by_sample[left_name]
        right = by_sample[right_name]
        for field in fields:
            if left[field] == right[field]:
                continue
            rows.append(
                {
                    "relation": relation,
                    "left_sample": left_name,
                    "right_sample": right_name,
                    "field": field,
                    "left_value": left[field],
                    "right_value": right[field],
                    "conclusion": (
                        "exact serialized presentation difference; identifiers are omitted "
                        "and neither side supplies server collision geometry"
                    ),
                }
            )
    expected = {
        ("persistent_on_vs_one_shot_caster", "position_y"),
        ("persistent_on_vs_one_shot_caster", "scale_x"),
        ("persistent_on_vs_one_shot_caster", "scale_y"),
        ("persistent_on_vs_one_shot_caster", "scale_z"),
        ("persistent_off_vs_one_shot_end", "scale_y"),
    }
    actual = {(str(row["relation"]), str(row["field"])) for row in rows}
    if actual != expected:
        raise ValueError(f"unexpected matched-leaf transform differences: {actual}")
    return rows


def native_vfx_transform_semantics(executable: bytes) -> list[dict[str, object]]:
    """Lock the native CoordRoot position/angle/scale registries and defaults."""
    definitions = (
        (
            "Position3D:CoordRoot", "0x191", 0x01301794,
            (0x010B9CB4, 0x00000191, 0x010B9DE8, 0x00BA4C10,
             0x00BA4C40, 0x00BA4C50, 0x00000000, 0x00BA4C60),
            "0,0,0", "0x00BA4C10", "0x00BA4C60", "first XYZ vector",
        ),
        (
            "Angle3D:CoordRoot", "0x3AE", 0x01301ED4,
            (0x010B9C40, 0x000003AE, 0x010B9E24, 0x00BA5500,
             0x00BA5530, 0x00BA5540, 0x00000000, 0x00BA5550),
            "0,0,0", "0x00BA5500", "0x00BA5550", "second XYZ vector",
        ),
        (
            "Scale3D:CoordRoot", "0x30F", 0x01302614,
            (0x010B9BCC, 0x0000030F, 0x010B9E60, 0x00BA5DF0,
             0x00BA5E20, 0x00BA5E30, 0x00000000, 0x00BA5E40),
            "1,1,1", "0x00BA5DF0", "0x00BA5E40", "third XYZ vector",
        ),
    )
    if struct.unpack("<f", pe_bytes(executable, 0x00F54F70, 4))[0] != 1.0:
        raise ValueError("native VFX homogeneous/default-one constant changed")
    rows: list[dict[str, object]] = []
    for (
        control, class_id, registry_address, expected_registry,
        runtime_default, initializer, updater, serialized_relation,
    ) in definitions:
        actual_registry = pe_dwords(executable, registry_address, len(expected_registry))
        if actual_registry != expected_registry:
            raise ValueError(
                f"native transform registry changed at 0x{registry_address:08X}: "
                f"{actual_registry}"
            )
        rows.append(
            {
                "control": control,
                "class_id_hex": class_id,
                "registry_address": f"0x{registry_address:08X}",
                "initializer_address": initializer,
                "update_address": updater,
                "runtime_default_xyz": runtime_default,
                "runtime_fields": (
                    "+0x10/+0x14/+0x18 XYZ; +0x1C homogeneous/default one; "
                    "+0x20 serialized XYZ pointer; +0x24 optional driver"
                ),
                "serialized_leaf_relation": serialized_relation,
                "garuda_conclusion": (
                    "native defaults and updater order confirm leaf position/angle/scale "
                    "triplets; neighboring metadata is not a fourth coordinate"
                ),
            }
        )
    return rows


def vmdl_bounds(payload: bytes) -> tuple[int, tuple[float, ...]]:
    """Find the single kind=14,size=68,live=1 model-bounds record."""
    matches: list[tuple[int, tuple[float, ...]]] = []
    for offset in range(0, len(payload) - 0x2C, 4):
        if struct.unpack_from("<III", payload, offset) != (14, 68, 1):
            continue
        values = struct.unpack_from("<6f", payload, offset + 0x14)
        if all(math.isfinite(value) for value in values):
            matches.append((offset, values))
    if len(matches) != 1:
        raise ValueError(f"expected one VMDL bounds record, found {len(matches)}")
    return matches[0]


def tornado_vfx_model_bounds(
    source_data: dict[str, bytes]
) -> list[dict[str, object]]:
    """Inventory visual-model bounds without treating them as damage radii."""
    rows: list[dict[str, object]] = []
    for source in ("m999_wss15", "m999_wss18", "m999_e003_model"):
        for layer, resource in walk_pwib_resources(source_data[source]):
            if payload_tag(resource.payload) != "SEDBvmdl":
                continue
            offset, values = vmdl_bounds(resource.payload)
            minimum = values[:3]
            maximum = values[3:]
            extent = tuple(maximum[index] - minimum[index] for index in range(3))
            if source == "m999_wss15":
                role = "small_tornado_combat_package"
            elif source == "m999_wss18":
                role = "large_typhoon_combat_package"
            elif "init_msb4_1" in layer:
                role = "small_tornado_persistent_state"
            elif "init_msb5_1" in layer:
                role = "large_typhoon_persistent_state"
            else:
                role = "large_typhoon_end_state"
            rows.append(
                {
                    "source": source,
                    "role": role,
                    "layer": layer,
                    "model_resource_id": resource.resource_id,
                    "resource_path": resource.resource_path.replace("\\", "/"),
                    "bytes": len(resource.payload),
                    "sha256": sha256_bytes(resource.payload),
                    "bounds_record_offset_hex": f"0x{offset:X}",
                    "min_x": minimum[0],
                    "min_y": minimum[1],
                    "min_z": minimum[2],
                    "max_x": maximum[0],
                    "max_y": maximum[1],
                    "max_z": maximum[2],
                    "extent_x": extent[0],
                    "extent_y": extent[1],
                    "extent_z": extent[2],
                    "interpretation_boundary": (
                        "render-model local bounds only; particles, planes, and rings may exceed "
                        "the damaging region, so this is not server collision geometry"
                    ),
                }
            )
    if len(rows) != 43:
        raise ValueError(f"unexpected tornado VMDL bounds row count: {len(rows)}")
    by_id = {str(row["model_resource_id"]): row for row in rows}
    expected_extents = {
        "2tT19Dtatumaki": (12.732853, 4.827507, 12.732856),
        "0lkp62taifu03m": (123.550484, 21.524352, 123.550491),
        "30SpDdpl02m": (42.373409, 8.281151, 42.373425),
    }
    for resource_id, expected in expected_extents.items():
        row = by_id.get(resource_id)
        actual = tuple(round(float(row[f"extent_{axis}"]), 6) for axis in "xyz") if row else ()
        if actual != expected:
            raise ValueError(f"unexpected visual bounds for {resource_id}: {actual}")
    return rows


def tornado_veff_root_bounds(
    source_data: dict[str, bytes]
) -> list[dict[str, object]]:
    """Decode the common VEFF root-bounds record for combat and state effects."""
    rows: list[dict[str, object]] = []
    for source in ("m999_wss15", "m999_wss18", "m999_e003_model"):
        for layer, resource in walk_pwib_resources(source_data[source]):
            if payload_tag(resource.payload) != "SEDBveff":
                continue
            name_offset = resource.payload.find(resource.resource_id.encode("ascii"))
            if name_offset < 0:
                raise ValueError(f"missing inline VEFF name {source}/{resource.resource_id}")
            record_offset = name_offset + 0x6C
            values = struct.unpack_from("<3f4x3f", resource.payload, record_offset)
            if not all(math.isfinite(value) for value in values):
                raise ValueError(f"non-finite VEFF bounds {source}/{resource.resource_id}")
            minimum = values[:3]
            maximum = values[3:]
            extent = tuple(maximum[index] - minimum[index] for index in range(3))
            rows.append(
                {
                    "source": source,
                    "layer": layer,
                    "veff_resource_id": resource.resource_id,
                    "resource_path": resource.resource_path.replace("\\", "/"),
                    "record_offset_hex": f"0x{record_offset:X}",
                    "min_x": minimum[0],
                    "min_y": minimum[1],
                    "min_z": minimum[2],
                    "max_x": maximum[0],
                    "max_y": maximum[1],
                    "max_z": maximum[2],
                    "extent_x": extent[0],
                    "extent_y": extent[1],
                    "extent_z": extent[2],
                    "profile": "zero_hit_root" if extent == (0.0, 0.0, 0.0) else "40_unit_cube",
                    "interpretation_boundary": (
                        "serialized VEFF root/culling envelope; identical +/-20 records occur "
                        "on small, large, loop, and end effects, so this is not damage geometry"
                    ),
                }
            )
    profiles = Counter(str(row["profile"]) for row in rows)
    if len(rows) != 8 or profiles != Counter({"40_unit_cube": 6, "zero_hit_root": 2}):
        raise ValueError(f"unexpected tornado VEFF root profile: {len(rows)}/{profiles}")
    return rows


def containing_ascii_run(payload: bytes, offset: int) -> str:
    """Return the complete printable run containing an in-file string offset."""
    matches = [
        value
        for start, value in ascii_runs(payload)
        if start <= offset < start + len(value)
    ]
    return matches[-1] if matches else ""


def discover_veff_allocation_table(
    payload: bytes,
) -> tuple[int, int, list[tuple[int, int, int]]]:
    """Find the VEFF root descriptor and its contiguous valid allocation table."""
    candidates: list[tuple[int, int, list[tuple[int, int, int]]]] = []
    for table_offset in range(0, min(0x1200, len(payload) - 0xC), 4):
        root_offset, count, stride = struct.unpack_from("<3I", payload, table_offset)
        if count != 1 or stride != 0x110 or not 0 < root_offset <= len(payload) - stride:
            continue
        descriptors: list[tuple[int, int, int]] = []
        for offset in range(table_offset, len(payload) - 0xB, 0xC):
            data_offset, item_count, item_stride = struct.unpack_from("<3I", payload, offset)
            if (
                data_offset <= 0
                or item_count <= 0
                or item_stride <= 0
                or data_offset + item_count * item_stride > len(payload)
            ):
                break
            descriptors.append((data_offset, item_count, item_stride))
        if len(descriptors) < 32:
            continue
        primary_offset, primary_count = struct.unpack_from("<2I", payload, root_offset + 0x60)
        secondary_offset, secondary_count = struct.unpack_from("<2I", payload, root_offset + 0x68)
        class_offset, class_count = struct.unpack_from("<2I", payload, root_offset + 0x88)
        if primary_count != secondary_count or primary_count < 3 or class_count < 3:
            continue
        descriptor_set = set(descriptors)
        if (
            (primary_offset, primary_count, 0x24) not in descriptor_set
            or (secondary_offset, secondary_count, 0x1C) not in descriptor_set
            or (class_offset, class_count, 0x18) not in descriptor_set
        ):
            continue
        candidates.append((table_offset, root_offset, descriptors))
    if len(candidates) != 1:
        raise ValueError(f"expected one VEFF allocation table, found {len(candidates)}")
    return candidates[0]


def tornado_veff_rotation_graph(
    source_data: dict[str, bytes]
) -> tuple[list[dict[str, object]], list[dict[str, object]], list[dict[str, object]]]:
    """Join tornado VEFF class metadata to instantiated angle-control allocations."""
    summaries: list[dict[str, object]] = []
    usage_rows: list[dict[str, object]] = []
    angle_allocation_rows: list[dict[str, object]] = []
    tracked_controls = (
        "Angle3D:CoordRoot",
        "Angle3DWorld:CoordWorld",
        "Angle3D:CoordPureWorld",
        "Angle3D:CoordLocal",
        "Angle3DGenerated:GendNormal:CoordRoot",
        "Angle3DGenerated:GendNormal:CoordWorld",
        "Angle3DGenerated:GendNormal:CoordPureWorld",
        "Angle3DGenerated:GendNormal:CoordLocal",
        "GenerateMaster",
    )

    for source in ("m999_wss15", "m999_wss18", "m999_e003_model"):
        for layer, resource in walk_pwib_resources(source_data[source]):
            payload = resource.payload
            if payload_tag(payload) != "SEDBveff":
                continue
            table_offset, root_offset, descriptors = discover_veff_allocation_table(payload)
            primary_offset, primary_count = struct.unpack_from("<2I", payload, root_offset + 0x60)
            secondary_offset, secondary_count = struct.unpack_from("<2I", payload, root_offset + 0x68)
            class_offset, class_count = struct.unpack_from("<2I", payload, root_offset + 0x88)
            if primary_count != secondary_count:
                raise ValueError(f"{resource.resource_id}: VEFF control arrays disagree")

            class_names: list[str] = []
            for class_index in range(class_count):
                class_words = struct.unpack_from("<6I", payload, class_offset + class_index * 0x18)
                literal = containing_ascii_run(payload, class_words[4])
                class_names.append(literal.rsplit("/", 1)[-1] if literal else "")
            metadata_counts = Counter(class_names)

            joined_counts: Counter[str] = Counter()
            for node_index in range(2, primary_count):
                primary_words = struct.unpack_from(
                    "<9I", payload, primary_offset + node_index * 0x24
                )
                class_index = primary_words[1]
                if class_index >= class_count:
                    continue
                control = class_names[class_index]
                joined_counts[control] += 1
                if control != "Angle3D:CoordRoot":
                    continue
                data_offset = primary_words[0]
                allocation_matches = [
                    descriptor
                    for descriptor in descriptors
                    if descriptor == (data_offset, 1, 0x10)
                ]
                if len(allocation_matches) != 1:
                    raise ValueError(
                        f"{resource.resource_id}: root-angle node {node_index} lacks exact vector allocation"
                    )
                raw_words = struct.unpack_from("<4I", payload, data_offset)
                float_overlay = struct.unpack_from("<4f", payload, data_offset)
                angle_allocation_rows.append(
                    {
                        "source": source,
                        "layer": layer,
                        "veff_resource_id": resource.resource_id,
                        "node_index": node_index,
                        "primary_record_offset_hex": f"0x{primary_offset + node_index * 0x24:X}",
                        "allocation_offset_hex": f"0x{data_offset:X}",
                        "raw_word_0_hex": f"0x{raw_words[0]:08X}",
                        "raw_word_1_hex": f"0x{raw_words[1]:08X}",
                        "raw_word_2_hex": f"0x{raw_words[2]:08X}",
                        "raw_word_3_hex": f"0x{raw_words[3]:08X}",
                        "float_overlay_0": float_overlay[0],
                        "float_overlay_1": float_overlay[1],
                        "float_overlay_2": float_overlay[2],
                        "float_overlay_3": float_overlay[3],
                        "all_words_zero": int(raw_words == (0, 0, 0, 0)),
                        "interpretation_boundary": (
                            "mechanically joined Angle3D:CoordRoot allocation; some records contain "
                            "serialized links/flags, so the four words stay raw and are not relabelled XYZ"
                        ),
                    }
                )

            string_counts: Counter[str] = Counter()
            for _string_offset, value in ascii_runs(payload):
                for match in VFX_CONTROL_PATTERN.finditer(value):
                    string_counts[match.group().rsplit("/", 1)[-1]] += 1
            for control in tracked_controls:
                if not (
                    string_counts[control]
                    or metadata_counts[control]
                    or joined_counts[control]
                ):
                    continue
                usage_rows.append(
                    {
                        "source": source,
                        "layer": layer,
                        "veff_resource_id": resource.resource_id,
                        "control": control,
                        "serialized_class_string_count": string_counts[control],
                        "class_metadata_record_count": metadata_counts[control],
                        "mechanically_joined_primary_record_count": joined_counts[control],
                        "evidence_rank": (
                            "instantiated_control"
                            if joined_counts[control]
                            else "class_metadata_only"
                            if metadata_counts[control]
                            else "dependency_string_only"
                        ),
                        "interpretation_boundary": (
                            "class-string presence alone does not prove an instantiated control; "
                            "the primary-record join is the stronger serialized-graph test"
                        ),
                    }
                )

            summaries.append(
                {
                    "source": source,
                    "layer": layer,
                    "veff_resource_id": resource.resource_id,
                    "bytes": len(payload),
                    "sha256": sha256_bytes(payload),
                    "allocation_table_offset_hex": f"0x{table_offset:X}",
                    "allocation_descriptor_count": len(descriptors),
                    "root_offset_hex": f"0x{root_offset:X}",
                    "primary_control_records": primary_count,
                    "secondary_control_records": secondary_count,
                    "class_metadata_records": class_count,
                    "joined_angle_root_records": joined_counts["Angle3D:CoordRoot"],
                    "joined_angle_world_records": joined_counts["Angle3DWorld:CoordWorld"],
                    "joined_angle_generated_records": sum(
                        joined_counts[control]
                        for control in tracked_controls
                        if control.startswith("Angle3DGenerated:")
                    ),
                    "generated_angle_dependency_strings": sum(
                        string_counts[control]
                        for control in tracked_controls
                        if control.startswith("Angle3DGenerated:")
                    ),
                    "interpretation_boundary": (
                        "serialized presentation graph only; no server targeting, collision, "
                        "damage cadence, or potency is encoded here"
                    ),
                }
            )

    if len(summaries) != 8:
        raise ValueError(f"unexpected tornado VEFF graph count: {len(summaries)}")
    if len(angle_allocation_rows) != 17:
        raise ValueError(
            f"unexpected joined root-angle allocations: {len(angle_allocation_rows)}"
        )
    generated_joined = sum(int(row["joined_angle_generated_records"]) for row in summaries)
    generated_strings = sum(int(row["generated_angle_dependency_strings"]) for row in summaries)
    if generated_joined != 0 or generated_strings != 2:
        raise ValueError(
            f"unexpected generated-angle usage: joined={generated_joined}, strings={generated_strings}"
        )
    return summaries, usage_rows, angle_allocation_rows


def native_vfx_rotation_semantics(executable: bytes) -> list[dict[str, object]]:
    """Lock the native static, world-composed, and generated angle evaluators."""
    registries = {
        "Angle3D:CoordRoot": (
            0x01301ED4,
            (0x010B9C40, 0x000003AE, 0x010B9E24, 0x00BA5500,
             0x00BA5530, 0x00BA5540, 0x00000000, 0x00BA5550),
            "copies a serialized XYZ radian vector and applies an optional modifier",
            "static root-angle class; 17 joined allocations are preserved as raw words",
            "internal angle vector; world-family debug confirms the radian convention",
        ),
        "Angle3DWorld:CoordWorld": (
            0x01301FBC,
            (0x010BA560, 0x000002EF, 0x010B9E24, 0x00BA5900,
             0x00BA1FB0, 0x00E39DD0, 0x00000000, 0x00BA5A30),
            "lazily samples owner world angle, adds serialized XYZ, then applies an optional modifier",
            "world-orientation composition; not autonomous angular motion",
            "angle/root debug values = internal radians * 180 / pi",
        ),
        "Angle3DGenerated:GendNormal:CoordRoot": (
            0x01302274,
            (0x010BA628, 0x00000167, 0x010B9E24, 0x00BA5B00,
             0x00BA5B50, 0x00E39DD0, 0x00BA5B60, 0x00BA5CB0),
            "angle + speed*t + 0.5*acceleration*t^2, with t=accumulated_ticks/5000",
            "curve evaluator is real, but the eight Garuda tornado graphs have zero joined instances",
            "generated logger emits raw angle/speed/acceleration; no 180/pi conversion",
        ),
    }
    for control, (address, expected, _behavior, _conclusion, _debug_units) in registries.items():
        actual = pe_dwords(executable, address, len(expected))
        if actual != expected:
            raise ValueError(f"native rotation registry changed for {control}: {actual}")
    constants = {
        0x00FA9598: 5000.0,
        0x00F59898: 0.5,
        0x00F62F40: 180.0,
        0x00F62F48: 3.1415927410125732,
    }
    for address, expected in constants.items():
        actual = struct.unpack("<d", pe_bytes(executable, address, 8))[0]
        if actual != expected:
            raise ValueError(f"native rotation constant changed at 0x{address:08X}: {actual}")
    return [
        {
            "control": control,
            "class_id_hex": f"0x{expected[1]:X}",
            "registry_address": f"0x{address:08X}",
            "initializer_address": f"0x{expected[3]:08X}",
            "event_or_copy_address": f"0x{expected[6]:08X}" if expected[6] else "",
            "update_address": f"0x{expected[7]:08X}",
            "native_behavior": behavior,
            "debug_unit_evidence": debug_units,
            "garuda_conclusion": conclusion,
        }
        for control, (address, expected, behavior, conclusion, debug_units) in registries.items()
    ]

def tornado_veff_particle_graph(
    source_data: dict[str, bytes]
) -> list[dict[str, object]]:
    """Count instantiated particle-translation, emission, and draw controls."""
    tracked_controls = (
        "Position3DGenerated:GendNormal:CoordRoot",
        "Position3DGenerated:GendNormal:CoordWorld",
        "Position3DGenerated:GendNormal:CoordPureWorld",
        "Position3DGenerated:GendNormal:CoordLocal",
        "GenerateMaster",
        "DrawResource",
    )
    rows: list[dict[str, object]] = []
    for source in ("m999_wss15", "m999_wss18", "m999_e003_model"):
        for layer, resource in walk_pwib_resources(source_data[source]):
            payload = resource.payload
            if payload_tag(payload) != "SEDBveff":
                continue
            _table_offset, root_offset, _descriptors = discover_veff_allocation_table(payload)
            primary_offset, primary_count = struct.unpack_from("<2I", payload, root_offset + 0x60)
            class_offset, class_count = struct.unpack_from("<2I", payload, root_offset + 0x88)
            class_names: list[str] = []
            for class_index in range(class_count):
                class_words = struct.unpack_from("<6I", payload, class_offset + class_index * 0x18)
                literal = containing_ascii_run(payload, class_words[4])
                class_names.append(literal.rsplit("/", 1)[-1] if literal else "")

            joined_counts: Counter[str] = Counter()
            for node_index in range(2, primary_count):
                primary_words = struct.unpack_from(
                    "<9I", payload, primary_offset + node_index * 0x24
                )
                class_index = primary_words[1]
                if class_index < class_count:
                    joined_counts[class_names[class_index]] += 1

            rows.append(
                {
                    "source": source,
                    "layer": layer,
                    "veff_resource_id": resource.resource_id,
                    "primary_control_records": primary_count,
                    "joined_generated_position_root_records": joined_counts[
                        "Position3DGenerated:GendNormal:CoordRoot"
                    ],
                    "joined_generated_position_world_records": joined_counts[
                        "Position3DGenerated:GendNormal:CoordWorld"
                    ],
                    "joined_generated_position_pure_world_records": joined_counts[
                        "Position3DGenerated:GendNormal:CoordPureWorld"
                    ],
                    "joined_generated_position_local_records": joined_counts[
                        "Position3DGenerated:GendNormal:CoordLocal"
                    ],
                    "joined_generate_master_records": joined_counts["GenerateMaster"],
                    "joined_draw_resource_records": joined_counts["DrawResource"],
                    "interpretation_boundary": (
                        "generated position is client-side particle translation and GenerateMaster "
                        "is client-side emission; neither is actor movement, hazard yaw, or collision"
                    ),
                }
            )

    if len(rows) != 8:
        raise ValueError(f"unexpected tornado particle graph count: {len(rows)}")
    totals = {
        control: sum(
            int(
                row[
                    {
                        "Position3DGenerated:GendNormal:CoordRoot": "joined_generated_position_root_records",
                        "Position3DGenerated:GendNormal:CoordWorld": "joined_generated_position_world_records",
                        "Position3DGenerated:GendNormal:CoordPureWorld": "joined_generated_position_pure_world_records",
                        "Position3DGenerated:GendNormal:CoordLocal": "joined_generated_position_local_records",
                        "GenerateMaster": "joined_generate_master_records",
                        "DrawResource": "joined_draw_resource_records",
                    }[control]
                ]
            )
            for row in rows
        )
        for control in tracked_controls
    }
    expected_totals = {
        "Position3DGenerated:GendNormal:CoordRoot": 11,
        "Position3DGenerated:GendNormal:CoordWorld": 0,
        "Position3DGenerated:GendNormal:CoordPureWorld": 0,
        "Position3DGenerated:GendNormal:CoordLocal": 0,
        "GenerateMaster": 11,
        "DrawResource": 22,
    }
    if totals != expected_totals:
        raise ValueError(f"unexpected tornado particle-control totals: {totals}")
    return rows


def native_vfx_particle_semantics(executable: bytes) -> list[dict[str, object]]:
    """Lock the native generated-position, emission, and draw dispatch paths."""
    registries = {
        "Position3DGenerated:GendNormal:CoordRoot": (
            0x01301B34,
            (0x010BA400, 0x000003B5, 0x010B9DE8, 0x00BA4FD0,
             0x00BA5050, 0x00E39DD0, 0x00BA5060, 0x00BA5260),
            (
                "normal mode computes anchor + base + direction*speed*t + "
                "0.5*direction*acceleration*t^2; alternate mode integrates and damps translation"
            ),
            11,
            "two WSS18 main instances and nine persistent-small instances",
            "translation only; the evaluator contains no circular orbit or actor/hazard yaw",
        ),
        "GenerateMaster": (
            0x0131254C,
            (0x0111AD70, 0x00000175, 0x0111AD20, 0x00D6ACA0,
             0x00D6ACF0, 0x00E39DD0, 0x00000000, 0x00D6AD50),
            (
                "accumulates owner displacement, interpolates emission points along the path, "
                "applies randomized spacing/probability/count, and caps one update at 101 iterations"
            ),
            11,
            "five WSS15 main instances and three in each target-hit graph",
            "particle creation scheduler only; it does not move a server actor or define collision",
        ),
        "DrawResource": (
            0x013116CC,
            (0x0111B468, 0x00000036, 0x0111B410, 0x00D66690,
             0x00D666B0, 0x00E39DD0, 0x00000000, 0x00D66790),
            "resolves a serialized draw resource and dispatches type-specific renderer paths",
            22,
            "present in every tornado graph",
            "render dispatch only; it supplies neither a motion curve nor server damage geometry",
        ),
    }
    for control, (address, expected, _behavior, _count, _distribution, _boundary) in registries.items():
        actual = pe_dwords(executable, address, len(expected))
        if actual != expected:
            raise ValueError(f"native particle registry changed for {control}: {actual}")
    return [
        {
            "control": control,
            "class_id_hex": f"0x{expected[1]:X}",
            "registry_address": f"0x{address:08X}",
            "initializer_address": f"0x{expected[3]:08X}",
            "event_or_copy_address": f"0x{expected[6]:08X}" if expected[6] else "",
            "update_or_dispatch_address": f"0x{expected[7]:08X}",
            "native_behavior": behavior,
            "garuda_joined_instances": count,
            "garuda_distribution": distribution,
            "interpretation_boundary": boundary,
        }
        for control, (
            address, expected, behavior, count, distribution, boundary
        ) in registries.items()
    ]

def native_vfx_runtime_input_semantics(
    executable: bytes,
) -> list[dict[str, object]]:
    """Lock graph-handle resolution and particle input-block field semantics."""
    signatures = {
        (0x00E3A0A0, 0x43): "61f744984a3636d573cc3b248af239fc81837fde8acf292416fb39b8222455f7",
        (0x00D6AD50, 0x5C9): "76998e11cb3900b62e55a4df3c9c9273fa76adb009eff1413a0c8476c098ca62",
        (0x00BA5060, 0x164): "ed6a2c1cdacd75b5ad014d5d286f0441b7b3eb6d55558c91c30784fc5c894ebd",
        (0x00BA5B60, 0x45): "88fa172759a885a6094591047260ea349852d2b68395e96eb3dd47db6f5d126f",
    }
    for (address, byte_count), expected_hash in signatures.items():
        actual_hash = sha256_bytes(pe_bytes(executable, address, byte_count))
        if actual_hash != expected_hash:
            raise ValueError(
                f"native VFX input signature changed at 0x{address:08X}: {actual_hash}"
            )
    minimum_spacing = struct.unpack("<f", pe_bytes(executable, 0x00FB7AB4, 4))[0]
    if minimum_spacing != 0.0010000000474974513:
        raise ValueError(f"GenerateMaster minimum spacing changed: {minimum_spacing}")

    rows = [
        {
            "consumer": "generic VFX evaluated input",
            "parameter": "control output handle",
            "parameter_offset_hex": "caller-selected",
            "storage": "int16 node index + int16 component index",
            "native_address": "0x00E3A0A0",
            "native_behavior": (
                "selects the positive or negative node table, indexes the component, "
                "then returns output +0x20 or random-extension output +0x30"
            ),
            "interpretation_boundary": (
                "proves runtime handle layout; a serialized slice still needs its loader "
                "join before every four-byte word can be called a handle"
            ),
        },
        {
            "consumer": "Position3DGenerated:GendNormal:CoordRoot",
            "parameter": "base position vector",
            "parameter_offset_hex": "+0x00..+0x08",
            "storage": "three evaluated float32 values",
            "native_address": "0x00BA5060",
            "native_behavior": "initial translation term",
            "interpretation_boundary": "client particle position only",
        },
        {
            "consumer": "Position3DGenerated:GendNormal:CoordRoot",
            "parameter": "direction vector",
            "parameter_offset_hex": "+0x10..+0x18",
            "storage": "three evaluated float32 values",
            "native_address": "0x00BA5060",
            "native_behavior": "multiplied independently by speed and acceleration scalars",
            "interpretation_boundary": "not actor facing or a circular-orbit axis",
        },
        {
            "consumer": "Position3DGenerated:GendNormal:CoordRoot",
            "parameter": "speed scalar",
            "parameter_offset_hex": "+0x40",
            "storage": "evaluated float32",
            "native_address": "0x00BA5060",
            "native_behavior": "scales the direction vector's linear term",
            "interpretation_boundary": "exact authored value unresolved",
        },
        {
            "consumer": "Position3DGenerated:GendNormal:CoordRoot",
            "parameter": "acceleration or damping scalar",
            "parameter_offset_hex": "+0x44",
            "storage": "evaluated float32",
            "native_address": "0x00BA5060 / 0x00BA5260",
            "native_behavior": (
                "scales direction acceleration in normal mode and supplies the alternate "
                "mode's damping progression"
            ),
            "interpretation_boundary": "exact authored value unresolved",
        },
        {
            "consumer": "Position3DGenerated:GendNormal:CoordRoot",
            "parameter": "alternate integration mode",
            "parameter_offset_hex": "+0x48 bit 0",
            "storage": "evaluated flag",
            "native_address": "0x00BA5060 / 0x00BA5260",
            "native_behavior": "selects damped integration instead of direct parabolic evaluation",
            "interpretation_boundary": "does not select actor pursuit",
        },
        {
            "consumer": "GenerateMaster",
            "parameter": "generation resource specification",
            "parameter_offset_hex": "+0x24",
            "storage": "mode-tagged serialized resource input",
            "native_address": "0x00D6ACA0 / 0x00D99A70",
            "native_behavior": "constructs or dispatches the child particle resource",
            "interpretation_boundary": "presentation resource, not a server mob spawn",
        },
        {
            "consumer": "GenerateMaster",
            "parameter": "base emission probability",
            "parameter_offset_hex": "+0x0C",
            "storage": "direct float32",
            "native_address": "0x00D6B1C1",
            "native_behavior": "base of the randomized emission threshold",
            "interpretation_boundary": "exact authored value unresolved",
        },
        {
            "consumer": "GenerateMaster",
            "parameter": "emission-probability random width",
            "parameter_offset_hex": "+0x2C",
            "storage": "direct float32",
            "native_address": "0x00D6B193",
            "native_behavior": "multiplies an independent random sample in the threshold",
            "interpretation_boundary": "exact authored value unresolved",
        },
        {
            "consumer": "GenerateMaster",
            "parameter": "generation count",
            "parameter_offset_hex": "+0x30",
            "storage": "evaluated float32 handle, truncated to integer",
            "native_address": "0x00D6ADF3",
            "native_behavior": "number of child generations at each accepted emission point",
            "interpretation_boundary": "exact authored handle/value unresolved",
        },
        {
            "consumer": "GenerateMaster",
            "parameter": "base travel spacing",
            "parameter_offset_hex": "+0x34",
            "storage": "evaluated float32 handle",
            "native_address": "0x00D6AE01",
            "native_behavior": "base owner-displacement distance before the next emission point",
            "interpretation_boundary": "exact authored handle/value unresolved",
        },
        {
            "consumer": "GenerateMaster",
            "parameter": "travel-spacing random width",
            "parameter_offset_hex": "+0x38",
            "storage": "evaluated float32 handle",
            "native_address": "0x00D6AE12",
            "native_behavior": (
                "adds a random spacing component and clamps the result to at least "
                "0.0010000000474974513"
            ),
            "interpretation_boundary": "exact authored handle/value unresolved",
        },
    ]
    if len(rows) != 12:
        raise ValueError(f"unexpected native VFX input semantic row count: {len(rows)}")
    return rows


def native_vfx_graph_module_registries(
    executable: bytes,
) -> list[dict[str, object]]:
    """Lock the native scalar float graph-module families without guessing tag joins."""
    registries = (
        (
            "standard", "immediate", "StandardImmediateFloat32", 0x01304390,
            (0x010C8894, 0x00BD7870, 0x00BD7880, 0x00BE8FE0,
             0x00BE9000, 0x00BE9010, 0x00BE9120, 0x00BE9040,
             0x00100002, 0x00200020, 0x00100010, 0x00000010),
        ),
        (
            "standard", "linear", "StandardLinearFloat32", 0x01304690,
            (0x010C8948, 0x00BD7870, 0x00BD7880, 0x00BE99E0,
             0x00BE9A00, 0x00BE9A40, 0x00BE9B50, 0x00BE9A70,
             0x00100012, 0x00200020, 0x00200010, 0x00000020),
        ),
        (
            "standard", "parabolical", "StandardParabolicalFloat32", 0x01304990,
            (0x010C89DC, 0x00BD7870, 0x00BD7880, 0x00BEA930,
             0x00BEA950, 0x00BEA9B0, 0x00BEAAF0, 0x00BEA9E0,
             0x00100022, 0x00200020, 0x00300010, 0x00000030),
        ),
        (
            "standard", "polynomial", "StandardPolynomialFloat32", 0x01304C90,
            (0x010C8A94, 0x00BD7870, 0x00BD7880, 0x00BEC270,
             0x00BEC2C0, 0x00BEC470, 0x00BEC710, 0x00BEC4D0,
             0x00040332, 0x000C000C, 0x00040001, 0x00000004),
        ),
        (
            "random", "immediate", "RandomImmediateFloat32", 0x01304F90,
            (0x010C8B40, 0x00BD7870, 0x00BD7880, 0x00BED860,
             0x00BED8C0, 0x00BED920, 0x00BED980, 0x00BED9B0,
             0x00100002, 0x00100010, 0x00100010, 0x00000010),
        ),
        (
            "random", "linear", "RandomLinearFloat32", 0x01305290,
            (0x010C8BE0, 0x00BD7870, 0x00BD7880, 0x00BEEC60,
             0x00BEECC0, 0x00BEED50, 0x00BEEDB0, 0x00BEEDE0,
             0x00100012, 0x00100010, 0x00200010, 0x00000020),
        ),
        (
            "random", "parabolical", "RandomParabolicalFloat32", 0x01305590,
            (0x010C8C68, 0x00BD7870, 0x00BD7880, 0x00BF0B90,
             0x00BF0BF0, 0x00BF0CA0, 0x00BF0D00, 0x00BF0D30,
             0x00100022, 0x00100010, 0x00300010, 0x00000030),
        ),
        (
            "random", "polynomial", "RandomPolynomialFloat32", 0x01305890,
            (0x010C8D14, 0x00BD7870, 0x00BD7880, 0x00BF3A20,
             0x00BF3A70, 0x00BF3AC0, 0x00BF2EC0, 0x00BF3250,
             0x00040332, 0x000C000C, 0x00040001, 0x00000004),
        ),
    )
    rows: list[dict[str, object]] = []
    for distribution, curve, name, address, expected in registries:
        actual = pe_dwords(executable, address, len(expected))
        if actual != expected:
            raise ValueError(
                f"native VFX graph registry changed for {name}: {actual}"
            )
        name_bytes = pe_bytes(executable, expected[0], len(name) + 1)
        if name_bytes != name.encode("ascii") + b"\0":
            raise ValueError(f"native VFX graph registry name changed for {name}")
        rows.append(
            {
                "distribution": distribution,
                "curve_family": curve,
                "runtime_class": name,
                "registry_address": f"0x{address:08X}",
                "function_0x04": f"0x{expected[1]:08X}",
                "function_0x08": f"0x{expected[2]:08X}",
                "function_0x0c": f"0x{expected[3]:08X}",
                "function_0x10": f"0x{expected[4]:08X}",
                "function_0x14": f"0x{expected[5]:08X}",
                "function_0x18": f"0x{expected[6]:08X}",
                "function_0x1c": f"0x{expected[7]:08X}",
                "class_code_hex": f"0x{expected[8]:08X}",
                "profile_0x24_hex": f"0x{expected[9]:08X}",
                "profile_0x28_hex": f"0x{expected[10]:08X}",
                "profile_0x2c_hex": f"0x{expected[11]:08X}",
                "registry_prefix_sha256": sha256_bytes(
                    pe_bytes(executable, address, 0x30)
                ),
                "interpretation_boundary": (
                    "native scalar float evaluator family; loader dispatch is proven "
                    "through distribution-list selection and a low-uint16 type index"
                ),
            }
        )
    if len(rows) != 8:
        raise ValueError(f"unexpected native VFX graph registry count: {len(rows)}")
    return rows


def native_vfx_graph_module_types(
    executable: bytes,
) -> list[dict[str, object]]:
    """Decode all seven base/scalar/vector/genesis entries in each native curve block."""
    blocks = (
        ("standard", "immediate", "StandardImmediate", "StandardImmediateObjectRef",
         0x01304390, "ece80b4f573227266ad6a9f2c36682345e8ff61ea5a216e0df774aea05213eb7"),
        ("standard", "linear", "StandardLinear", "...none",
         0x01304690, "629ba8e486623e4f2c6e82f4e39a289a37602d0ead0357374f3236e6e6f14d10"),
        ("standard", "parabolical", "StandardParabolical", "...none",
         0x01304990, "d5a541457b24ed2f6617c0ffb9375b67d3e7ccea3b74a8cd19e37e58dbed6af3"),
        ("standard", "polynomial", "StandardPolynomial", "...none",
         0x01304C90, "68a9e4637734f63eb726bdd4e25f59ce47c2914af40ff968095a90b5c72043d6"),
        ("random", "immediate", "RandomImmediate", "...none",
         0x01304F90, "ea5ae1c5cc01ca7d0aadc57d3415e5cd3039ce1784891239bbc87c135069d566"),
        ("random", "linear", "RandomLinear", "...none",
         0x01305290, "507b841621b45b5533244c34e72460445aa33bf166c58cb4bcf4e2dedf1b6b02"),
        ("random", "parabolical", "RandomParabolical", "...none",
         0x01305590, "b025692467f1bf53758ac8ded50e28c26ac4a28620cd85a64b67c04da8ada5df"),
        ("random", "polynomial", "RandomPolynomial", "...none",
         0x01305890, "50aa625fa1f94c1140dde0f3d2b803d3139036a3d9ae630638a3f54ef3bf9e16"),
    )
    type_suffixes: tuple[str | None, ...] = (
        None, "Float32", "Float32X2", "Float32X3", "Float32X4",
        "Genesis", "SureGenesis",
    )
    rows: list[dict[str, object]] = []
    for (
        distribution, curve, name_prefix, base_name, scalar_address, expected_hash
    ) in blocks:
        block_address = scalar_address - 0x30
        block_bytes = pe_bytes(executable, block_address, 0x150)
        actual_hash = sha256_bytes(block_bytes)
        if actual_hash != expected_hash:
            raise ValueError(
                f"native VFX graph type block changed at 0x{block_address:08X}: "
                f"{actual_hash}"
            )
        for entry_index, suffix in enumerate(type_suffixes):
            type_index = entry_index - 1
            entry_address = block_address + entry_index * 0x30
            words = pe_dwords(executable, entry_address, 12)
            string_offset = pe_va_to_file_offset(executable, words[0])
            runtime_class, _next_offset = read_cstring(executable, string_offset)
            expected_class = base_name if suffix is None else name_prefix + suffix
            if runtime_class != expected_class:
                raise ValueError(
                    f"native VFX graph type name changed at 0x{entry_address:08X}: "
                    f"{runtime_class}"
                )
            rows.append(
                {
                    "distribution": distribution,
                    "curve_family": curve,
                    "type_index": type_index,
                    "runtime_type": suffix or "family_base_or_none",
                    "runtime_class": runtime_class,
                    "entry_address": f"0x{entry_address:08X}",
                    "class_code_hex": f"0x{words[8]:08X}",
                    "class_code_low_byte_hex": (
                        f"0x{words[8] & 0xFF:02X}" if words[8] else ""
                    ),
                    "profile_0x24_hex": f"0x{words[9]:08X}",
                    "profile_0x28_hex": f"0x{words[10]:08X}",
                    "profile_0x2c_hex": f"0x{words[11]:08X}",
                    "raw_entry_hex": pe_bytes(executable, entry_address, 0x30).hex(),
                    "block_sha256": actual_hash,
                    "interpretation_boundary": (
                        "native evaluator type entry; the full table artifact carries the "
                        "loader-proven distribution and low-uint16 type-index join"
                    ),
                }
            )
    if len(rows) != 56:
        raise ValueError(f"unexpected native VFX graph type count: {len(rows)}")
    return rows


def native_vfx_graph_type_table(
    executable: bytes,
) -> list[dict[str, object]]:
    """Decode both complete 64-slot type tables used by the native graph loader."""
    tables = (
        (
            "standard",
            0x01304350,
            "75bdfb1a28ded857d8ebabcd0d527075cca2d99bb4b01650fb3860a91c5612e9",
        ),
        (
            "random",
            0x01304F50,
            "8658766eed9b4a5e6d8e6d56ba998eae1a6f450c42688bb4c114ea49d8f269dc",
        ),
    )
    curve_names = {
        0x0: "immediate",
        0x1: "linear",
        0x2: "parabolical",
        0x3: "polynomial",
    }
    type_names = {
        0x0: "family_base",
        0x1: "object_or_family_base",
        0x2: "Float32",
        0x3: "Float32X2",
        0x4: "Float32X3",
        0x5: "Float32X4",
        0x6: "Genesis",
        0x7: "SureGenesis",
    }
    rows: list[dict[str, object]] = []
    for distribution, class_code_base, expected_hash in tables:
        table_start = class_code_base - 0x20
        table_bytes = pe_bytes(executable, table_start, 0xC00)
        actual_hash = sha256_bytes(table_bytes)
        if actual_hash != expected_hash:
            raise ValueError(
                f"native {distribution} VFX graph table changed: {actual_hash}"
            )
        for type_index in range(0x40):
            entry_address = table_start + type_index * 0x30
            class_code_address = class_code_base + type_index * 0x30
            words = pe_dwords(executable, entry_address, 12)
            if distribution == "standard" and type_index == 0:
                runtime_class = "unlabeled_standard_type_00"
            else:
                string_offset = pe_va_to_file_offset(executable, words[0])
                runtime_class, _next_offset = read_cstring(executable, string_offset)
            class_code = words[8]
            if class_code and class_code & 0xFF != type_index:
                raise ValueError(
                    f"native {distribution} VFX type 0x{type_index:02X} "
                    f"has mismatched class code 0x{class_code:08X}"
                )
            status = (
                "implemented_class_code"
                if class_code
                else "named_without_class_code"
                if runtime_class != "...none"
                else "unused_none"
            )
            rows.append(
                {
                    "distribution": distribution,
                    "type_index_hex": f"0x{type_index:02X}",
                    "curve_family_overlay": curve_names[type_index >> 4],
                    "runtime_type_overlay": type_names.get(
                        type_index & 0xF, "unused_or_unknown"
                    ),
                    "runtime_class": runtime_class,
                    "entry_address": f"0x{entry_address:08X}",
                    "class_code_address": f"0x{class_code_address:08X}",
                    "class_code_hex": f"0x{class_code:08X}",
                    "class_code_low_byte_hex": (
                        f"0x{class_code & 0xFF:02X}" if class_code else ""
                    ),
                    "profile_0x24_hex": f"0x{words[9]:08X}",
                    "profile_0x28_hex": f"0x{words[10]:08X}",
                    "profile_0x2c_hex": f"0x{words[11]:08X}",
                    "registry_status": status,
                    "raw_entry_hex": pe_bytes(executable, entry_address, 0x30).hex(),
                    "table_sha256": actual_hash,
                    "interpretation_boundary": (
                        "the native loader indexes this table as base + uint16_type*0x30; "
                        "record-list selection supplies standard versus random separately"
                    ),
                }
            )
    statuses = Counter(
        (str(row["distribution"]), str(row["registry_status"])) for row in rows
    )
    expected_statuses = Counter(
        {
            ("standard", "implemented_class_code"): 25,
            ("standard", "named_without_class_code"): 4,
            ("standard", "unused_none"): 35,
            ("random", "implemented_class_code"): 24,
            ("random", "named_without_class_code"): 4,
            ("random", "unused_none"): 36,
        }
    )
    if len(rows) != 128 or statuses != expected_statuses:
        raise ValueError(f"unexpected native VFX graph table census: {statuses}")
    return rows


def veff_polynomial_type_registry_join(
    parameter_record_rows: list[dict[str, object]],
    native_table_rows: list[dict[str, object]],
) -> list[dict[str, object]]:
    """Join every polynomial record to its exact distribution/type table slot."""
    distribution_by_slot = {
        "pair_2_standard": "standard",
        "pair_3_random": "random",
    }
    serialized_counts = Counter(
        (
            distribution_by_slot[str(row["root_slot"])],
            int(str(row["tag_or_key_hex"]), 16),
        )
        for row in parameter_record_rows
        if row["classification"] == "polynomial_type_record"
    )
    expected_counts = Counter(
        {
            ("standard", 0x31): 31,
            ("standard", 0x32): 76,
            ("standard", 0x33): 52,
            ("standard", 0x34): 50,
            ("standard", 0x36): 11,
            ("standard", 0x10031): 60,
            ("standard", 0x10033): 41,
            ("random", 0x32): 6,
            ("random", 0x33): 17,
            ("random", 0x10033): 23,
        }
    )
    if serialized_counts != expected_counts:
        raise ValueError(
            f"unexpected VEFF polynomial distribution/type census: {serialized_counts}"
        )

    rows: list[dict[str, object]] = []
    for (distribution, first_dword), count in sorted(serialized_counts.items()):
        type_index = first_dword & 0xFFFF
        overflow_id = first_dword >> 16 & 0xFF
        reserved_high_byte = first_dword >> 24
        matches = [
            row
            for row in native_table_rows
            if row["distribution"] == distribution
            and row["type_index_hex"] == f"0x{type_index:02X}"
            and row["registry_status"] == "implemented_class_code"
        ]
        if len(matches) != 1:
            raise ValueError(
                f"serialized {distribution} type 0x{type_index:02X} has "
                f"unexpected native matches: {len(matches)}"
            )
        match = matches[0]
        if match["curve_family_overlay"] != "polynomial":
            raise ValueError(
                f"serialized {distribution} type 0x{type_index:02X} "
                "did not resolve to polynomial"
            )
        rows.append(
            {
                "distribution": distribution,
                "serialized_first_dword_hex": f"0x{first_dword:08X}",
                "serialized_occurrences": count,
                "type_index_hex": f"0x{type_index:04X}",
                "graph_overflow_id_hex": f"0x{overflow_id:02X}",
                "reserved_high_byte_hex": f"0x{reserved_high_byte:02X}",
                "native_type_match_count": len(matches),
                "native_type_match": str(match["runtime_class"]),
                "loader_join_conclusion": (
                    "pair 2 selects standard and pair 3 selects random; the low "
                    "uint16 exactly selects this polynomial type slot"
                ),
                "overflow_join_conclusion": (
                    "serialized byte +2 is validated as graph overflow id 0 or 1 "
                    "and copied to runtime record +0x24"
                ),
                "interpretation_boundary": (
                    "the graph overflow behavior and exact property-to-runtime-input "
                    "join remain unresolved"
                ),
            }
        )
    if len(rows) != 10:
        raise ValueError(f"unexpected polynomial type join row count: {len(rows)}")
    return rows


def tornado_veff_parameter_records(
    source_data: dict[str, bytes],
) -> tuple[
    list[dict[str, object]],
    list[dict[str, object]],
    list[dict[str, object]],
]:
    """Walk VEFF graph records with the native standard/random list bridge."""
    polynomial_type_indices = {0x31, 0x32, 0x33, 0x34, 0x36}
    record_rows: list[dict[str, object]] = []
    terminal_rows: list[dict[str, object]] = []
    bridge_rows: list[dict[str, object]] = []
    graph_count = 0

    for source in ("m999_wss15", "m999_wss18", "m999_e003_model"):
        for layer, resource in walk_pwib_resources(source_data[source]):
            payload = resource.payload
            if payload_tag(payload) != "SEDBveff":
                continue
            graph_count += 1
            _table_offset, root_offset, _descriptors = discover_veff_allocation_table(
                payload
            )
            group_offset, group_count = struct.unpack_from(
                "<2I", payload, root_offset + 0x70
            )
            seen_slices: set[tuple[int, int]] = set()

            def walk_slice(
                slice_offset: int,
                slice_count: int,
                group_index: int,
                root_slot: str,
                depth: int,
                path: str,
            ) -> None:
                if not (
                    slice_offset >= root_offset + 0x110
                    and slice_count > 0
                    and slice_offset + slice_count * 0xC <= len(payload)
                ):
                    raise ValueError(
                        f"{resource.resource_id}: invalid parameter-record slice "
                        f"0x{slice_offset:X}/{slice_count}"
                    )
                slice_key = (slice_offset, slice_count)
                if slice_key in seen_slices:
                    raise ValueError(
                        f"{resource.resource_id}: repeated parameter-record slice {slice_key}"
                    )
                seen_slices.add(slice_key)

                for record_index in range(slice_count):
                    record_offset = slice_offset + record_index * 0xC
                    tag_or_key, data_offset, data_count = struct.unpack_from(
                        "<3I", payload, record_offset
                    )
                    child_record_slice_valid = (
                        data_offset >= root_offset + 0x110
                        and data_count > 0
                        and data_offset + data_count * 0xC <= len(payload)
                    )
                    terminal_dword_slice_valid = (
                        data_offset >= root_offset + 0x110
                        and data_count > 0
                        and data_offset + data_count * 4 <= len(payload)
                    )
                    type_index_overlay = tag_or_key & 0xFFFF
                    graph_overflow_id = tag_or_key >> 16 & 0xFF
                    reserved_high_byte = tag_or_key >> 24
                    upper_half_overlay = tag_or_key >> 16
                    if (
                        type_index_overlay in polynomial_type_indices
                        and graph_overflow_id <= 1
                        and reserved_high_byte == 0
                        and child_record_slice_valid
                    ):
                        classification = "polynomial_type_record"
                    elif terminal_dword_slice_valid:
                        classification = "terminal_dword_slice_descriptor"
                    elif (
                        type_index_overlay < 0x40
                        and graph_overflow_id <= 1
                        and reserved_high_byte == 0
                    ):
                        classification = "inline_native_type_record_candidate"
                    else:
                        classification = "inline_or_unresolved_record"

                    child_size = (
                        data_count * 0xC
                        if classification == "polynomial_type_record"
                        else data_count * 4
                        if classification == "terminal_dword_slice_descriptor"
                        else 0
                    )
                    child_bytes = (
                        payload[data_offset : data_offset + child_size]
                        if child_size
                        else b""
                    )
                    record_path = f"{path}/{record_index}"
                    record_rows.append(
                        {
                            "source": source,
                            "layer": layer,
                            "veff_resource_id": resource.resource_id,
                            "group_index": group_index,
                            "root_slot": root_slot,
                            "depth": depth,
                            "traversal_path": record_path,
                            "record_offset_hex": f"0x{record_offset:X}",
                            "tag_or_key_hex": f"0x{tag_or_key:08X}",
                            "type_index_overlay_hex": f"0x{type_index_overlay:04X}",
                            "upper_half_overlay_hex": f"0x{upper_half_overlay:04X}",
                            "graph_overflow_id_hex": f"0x{graph_overflow_id:02X}",
                            "reserved_high_byte_hex": f"0x{reserved_high_byte:02X}",
                            "data_offset_hex": f"0x{data_offset:X}" if data_offset else "",
                            "data_count": data_count,
                            "classification": classification,
                            "raw_record_hex": payload[
                                record_offset : record_offset + 0xC
                            ].hex(),
                            "child_slice_sha256": (
                                sha256_bytes(child_bytes) if child_bytes else ""
                            ),
                            "interpretation_boundary": (
                                "native-bridged 12-byte record traversal: pair 2 is "
                                "standard, pair 3 is random, the low uint16 is type, "
                                "and byte +2 is the graph overflow id; exact property "
                                "and runtime-input semantics remain unresolved"
                            ),
                        }
                    )

                    if classification == "polynomial_type_record":
                        walk_slice(
                            data_offset,
                            data_count,
                            group_index,
                            root_slot,
                            depth + 1,
                            record_path,
                        )
                    elif classification == "terminal_dword_slice_descriptor":
                        for word_index in range(data_count):
                            word_offset = data_offset + word_index * 4
                            raw_word = struct.unpack_from("<I", payload, word_offset)[0]
                            float_overlay = struct.unpack_from("<f", payload, word_offset)[0]
                            signed_overlay = struct.unpack_from("<i", payload, word_offset)[0]
                            terminal_rows.append(
                                {
                                    "source": source,
                                    "layer": layer,
                                    "veff_resource_id": resource.resource_id,
                                    "group_index": group_index,
                                    "root_slot": root_slot,
                                    "depth": depth,
                                    "traversal_path": record_path,
                                    "source_record_offset_hex": f"0x{record_offset:X}",
                                    "source_tag_or_key_hex": f"0x{tag_or_key:08X}",
                                    "word_index": word_index,
                                    "word_offset_hex": f"0x{word_offset:X}",
                                    "raw_word_hex": f"0x{raw_word:08X}",
                                    "unsigned_int_overlay": raw_word,
                                    "signed_int_overlay": signed_overlay,
                                    "float_overlay": format(float_overlay, ".9g"),
                                    "raw_word_class": (
                                        "zero"
                                        if raw_word == 0
                                        else "aligned_in_payload_offset_candidate"
                                        if raw_word % 4 == 0
                                        and root_offset + 0x110 <= raw_word < len(payload)
                                        else "unclassified_raw_word"
                                    ),
                                    "interpretation_boundary": (
                                        "raw terminal DWORD with integer and float overlays; "
                                        "property name, unit, and runtime input remain unresolved"
                                    ),
                                }
                            )

            for group_index in range(1, group_count):
                visible_group_offset = group_offset + group_index * 0x38
                native_descriptor_offset = visible_group_offset - 0x8
                group_words = struct.unpack_from(
                    "<14I", payload, visible_group_offset
                )
                native_words = struct.unpack_from(
                    "<14I", payload, native_descriptor_offset
                )
                if native_words[6:10] != group_words[4:8]:
                    raise ValueError(
                        f"{resource.resource_id}: shifted native descriptor bridge changed "
                        f"for group {group_index}"
                    )
                bridge_rows.append(
                    {
                        "source": source,
                        "layer": layer,
                        "veff_resource_id": resource.resource_id,
                        "allocation_block_offset_hex": f"0x{group_offset:X}",
                        "allocation_block_count": group_count,
                        "logical_group_index": group_index - 1,
                        "visible_group_record_offset_hex": f"0x{visible_group_offset:X}",
                        "native_descriptor_offset_hex": f"0x{native_descriptor_offset:X}",
                        "native_descriptor_shift": -8,
                        "preceding_tail_offset_hex": f"0x{native_descriptor_offset:X}",
                        "preceding_tail_offset_value_hex": f"0x{native_words[0]:08X}",
                        "preceding_tail_count": native_words[1],
                        "standard_pair_offset_hex": f"0x{native_descriptor_offset + 0x18:X}",
                        "standard_record_offset_hex": f"0x{native_words[6]:X}" if native_words[6] else "",
                        "standard_record_count": native_words[7],
                        "random_pair_offset_hex": f"0x{native_descriptor_offset + 0x20:X}",
                        "random_record_offset_hex": f"0x{native_words[8]:X}" if native_words[8] else "",
                        "random_record_count": native_words[9],
                        "raw_native_descriptor_hex": payload[
                            native_descriptor_offset : native_descriptor_offset + 0x38
                        ].hex(),
                        "native_descriptor_sha256": sha256_bytes(
                            payload[native_descriptor_offset : native_descriptor_offset + 0x38]
                        ),
                        "loader_conclusion": (
                            "FUN_00BD3F70 passes this 0x38-byte descriptor to "
                            "FUN_00BD2660; +0x18/+0x1C is standard and "
                            "+0x20/+0x24 is random"
                        ),
                    }
                )
                for root_slot, slice_offset, slice_count in (
                    ("pair_2_standard", native_words[6], native_words[7]),
                    ("pair_3_random", native_words[8], native_words[9]),
                ):
                    if not slice_offset and not slice_count:
                        continue
                    walk_slice(
                        slice_offset,
                        slice_count,
                        group_index,
                        root_slot,
                        0,
                        f"group_{group_index}/{root_slot}",
                    )


    if graph_count != 8:
        raise ValueError(f"unexpected VEFF parameter graph count: {graph_count}")
    classifications = Counter(str(row["classification"]) for row in record_rows)
    expected_classifications = Counter(
        {
            "polynomial_type_record": 367,
            "terminal_dword_slice_descriptor": 800,
            "inline_native_type_record_candidate": 23,
            "inline_or_unresolved_record": 4,
        }
    )
    if classifications != expected_classifications:
        raise ValueError(f"unexpected VEFF parameter records: {classifications}")
    if len(terminal_rows) != 1068:
        raise ValueError(f"unexpected VEFF terminal DWORD count: {len(terminal_rows)}")
    if len(bridge_rows) != 74:
        raise ValueError(f"unexpected VEFF group-loader bridge count: {len(bridge_rows)}")
    return record_rows, terminal_rows, bridge_rows


def tornado_particle_serialized_links(
    source_data: dict[str, bytes]
) -> tuple[
    list[dict[str, object]],
    list[dict[str, object]],
    list[dict[str, object]],
]:
    """Preserve exact serialized maps for translated and emitted particles."""
    tracked = {
        "Position3DGenerated:GendNormal:CoordRoot",
        "GenerateMaster",
    }
    control_rows: list[dict[str, object]] = []
    link_rows: list[dict[str, object]] = []
    dependency_rows: list[dict[str, object]] = []
    for source in ("m999_wss15", "m999_wss18", "m999_e003_model"):
        for layer, resource in walk_pwib_resources(source_data[source]):
            payload = resource.payload
            if payload_tag(payload) != "SEDBveff":
                continue
            _table_offset, root_offset, _descriptors = discover_veff_allocation_table(payload)
            primary_offset, primary_count = struct.unpack_from("<2I", payload, root_offset + 0x60)
            secondary_offset, secondary_count = struct.unpack_from("<2I", payload, root_offset + 0x68)
            class_offset, class_count = struct.unpack_from("<2I", payload, root_offset + 0x88)
            if primary_count != secondary_count:
                raise ValueError(f"{resource.resource_id}: particle control arrays disagree")
            class_names: list[str] = []
            for class_index in range(class_count):
                class_words = struct.unpack_from("<6I", payload, class_offset + class_index * 0x18)
                literal = containing_ascii_run(payload, class_words[4])
                class_names.append(literal.rsplit("/", 1)[-1] if literal else "")

            for node_index in range(2, primary_count):
                primary_record_offset = primary_offset + node_index * 0x24
                secondary_record_offset = secondary_offset + node_index * 0x1C
                primary_words = struct.unpack_from("<9I", payload, primary_record_offset)
                secondary_words = struct.unpack_from("<7I", payload, secondary_record_offset)
                class_index = primary_words[1]
                if class_index >= class_count or class_names[class_index] not in tracked:
                    continue
                control = class_names[class_index]
                link_offset = primary_words[7]
                link_count = primary_words[8]
                if bool(link_offset) != bool(link_count):
                    raise ValueError(
                        f"{resource.resource_id}/{node_index}: incomplete particle link slice"
                    )
                if link_offset + link_count * 8 > len(payload):
                    raise ValueError(
                        f"{resource.resource_id}/{node_index}: particle link slice out of range"
                    )
                head_offset = secondary_words[0]
                head_count = secondary_words[1]
                tail_offset = secondary_words[5]
                tail_count = secondary_words[6]
                for slice_name, slice_offset, slice_count in (
                    ("secondary_head", head_offset, head_count),
                    ("secondary_tail", tail_offset, tail_count),
                ):
                    if bool(slice_offset) != bool(slice_count):
                        raise ValueError(
                            f"{resource.resource_id}/{node_index}: incomplete {slice_name} slice"
                        )
                    if slice_offset + slice_count * 4 > len(payload):
                        raise ValueError(
                            f"{resource.resource_id}/{node_index}: {slice_name} slice out of range"
                        )
                    for dependency_index in range(slice_count):
                        dependency_offset = slice_offset + dependency_index * 4
                        raw_key = struct.unpack_from("<I", payload, dependency_offset)[0]
                        node_overlay, component_overlay = struct.unpack_from(
                            "<hh", payload, dependency_offset
                        )
                        dependency_rows.append(
                            {
                                "source": source,
                                "layer": layer,
                                "veff_resource_id": resource.resource_id,
                                "node_index": node_index,
                                "control": control,
                                "slice_role": slice_name,
                                "dependency_index": dependency_index,
                                "record_offset_hex": f"0x{dependency_offset:X}",
                                "raw_key_hex": f"0x{raw_key:08X}",
                                "signed_node_index_overlay": node_overlay,
                                "signed_component_index_overlay": component_overlay,
                                "classification": (
                                    "sentinel_or_flags_not_runtime_handle"
                                    if raw_key == 0x10000000
                                    else "native_handle_layout_candidate"
                                ),
                                "interpretation_boundary": (
                                    "the native resolver consumes int16 node/component pairs, but "
                                    "the serialized-loader join for this secondary slice is not proven"
                                ),
                            }
                        )
                tail_keys = (
                    struct.unpack_from(f"<{tail_count}I", payload, tail_offset)
                    if tail_count
                    else ()
                )
                link_bytes = payload[link_offset : link_offset + link_count * 8]
                control_rows.append(
                    {
                        "source": source,
                        "layer": layer,
                        "veff_resource_id": resource.resource_id,
                        "node_index": node_index,
                        "control": control,
                        "primary_record_offset_hex": f"0x{primary_record_offset:X}",
                        "secondary_record_offset_hex": f"0x{secondary_record_offset:X}",
                        "serialized_object_offset_hex": f"0x{primary_words[0]:X}",
                        "link_slice_offset_hex": f"0x{link_offset:X}" if link_offset else "",
                        "link_descriptor_count": link_count,
                        "link_slice_sha256": sha256_bytes(link_bytes) if link_bytes else "",
                        "secondary_tail_offset_hex": f"0x{tail_offset:X}" if tail_offset else "",
                        "secondary_tail_count": tail_count,
                        "secondary_tail_keys_hex": ";".join(
                            f"0x{key:08X}" for key in tail_keys
                        ),
                        "primary_words_hex": ";".join(
                            f"0x{word:08X}" for word in primary_words
                        ),
                        "secondary_words_hex": ";".join(
                            f"0x{word:08X}" for word in secondary_words
                        ),
                        "interpretation_boundary": (
                            "exact serialized graph links; they are not flat position/speed/"
                            "acceleration or emission-interval values"
                        ),
                    }
                )
                for link_index in range(link_count):
                    record_offset = link_offset + link_index * 8
                    word_0, word_1, word_2 = struct.unpack_from("<IHH", payload, record_offset)
                    link_rows.append(
                        {
                            "source": source,
                            "layer": layer,
                            "veff_resource_id": resource.resource_id,
                            "node_index": node_index,
                            "control": control,
                            "link_index": link_index,
                            "record_offset_hex": f"0x{record_offset:X}",
                            "word_0_hex": f"0x{word_0:08X}",
                            "word_1_hex": f"0x{word_1:04X}",
                            "word_2_hex": f"0x{word_2:04X}",
                            "raw_record_hex": payload[record_offset : record_offset + 8].hex(),
                            "interpretation_boundary": (
                                "mechanically decoded I/HH record only; link direction and exact "
                                "runtime property name are not proven"
                            ),
                        }
                    )

    counts = Counter(str(row["control"]) for row in control_rows)
    if counts != Counter(
        {
            "Position3DGenerated:GendNormal:CoordRoot": 11,
            "GenerateMaster": 11,
        }
    ):
        raise ValueError(f"unexpected serialized particle controls: {counts}")
    if len(link_rows) != 165:
        raise ValueError(f"unexpected serialized particle link count: {len(link_rows)}")
    dependency_class_counts = Counter(
        str(row["classification"]) for row in dependency_rows
    )
    expected_dependency_class_counts = Counter(
        {
            "native_handle_layout_candidate": 28,
            "sentinel_or_flags_not_runtime_handle": 10,
        }
    )
    if dependency_class_counts != expected_dependency_class_counts:
        raise ValueError(
            f"unexpected serialized particle dependencies: {dependency_class_counts}"
        )
    return control_rows, link_rows, dependency_rows


def vmdl_material_properties(
    payload: bytes,
) -> tuple[str, list[dict[str, object]]]:
    """Decode the authored VFX material parameter descriptors and value buffer."""
    first_property_offset = payload.find(b"ambientColor")
    last_property_offset = payload.find(b"controlColor", first_property_offset)
    if first_property_offset < 0 or last_property_offset < 0:
        raise ValueError("VMDL material property-name range not found")
    property_names = [
        value
        for offset, value in ascii_runs(payload)
        if first_property_offset <= offset <= last_property_offset
    ]
    descriptor_signature = bytes.fromhex("03 00 01 00 0C 00 00 00")
    descriptor_offset = payload.find(
        descriptor_signature, last_property_offset + len("controlColor")
    )
    if descriptor_offset < 0:
        raise ValueError("VMDL material descriptor table not found")
    descriptors = [
        struct.unpack_from("<2I", payload, descriptor_offset + index * 8)
        for index in range(len(property_names))
    ]
    value_offset = descriptor_offset + len(descriptors) * 8
    rows: list[dict[str, object]] = []
    cursor = value_offset
    for property_index, (name, (type_tag, byte_count)) in enumerate(
        zip(property_names, descriptors)
    ):
        if byte_count % 4 or cursor + byte_count > len(payload):
            raise ValueError(f"invalid VMDL material value size for {name}: {byte_count}")
        raw = payload[cursor : cursor + byte_count]
        words = struct.unpack(f"<{byte_count // 4}I", raw) if byte_count else ()
        floats = struct.unpack(f"<{byte_count // 4}f", raw) if byte_count else ()
        rows.append(
            {
                "property_index": property_index,
                "property_name": name,
                "descriptor_offset_hex": f"0x{descriptor_offset + property_index * 8:X}",
                "type_tag_hex": f"0x{type_tag:08X}",
                "byte_count": byte_count,
                "value_offset_hex": f"0x{cursor:X}" if byte_count else "",
                "raw_words_hex": ";".join(f"0x{word:08X}" for word in words),
                "float_overlay": ";".join(format(value, ".9g") for value in floats),
                "value_kind": (
                    "authored_numeric_buffer"
                    if byte_count
                    else "runtime_or_resource_bound_no_authored_numeric_buffer"
                ),
            }
        )
        cursor += byte_count
    shader_names = [
        value for _offset, value in ascii_runs(payload) if value.startswith("TechCgfxShader")
    ]
    if not shader_names:
        raise ValueError("VMDL shader technique not found")
    return shader_names[0], rows


def persistent_large_material_contract(
    source_data: dict[str, bytes]
) -> tuple[list[dict[str, object]], list[dict[str, object]]]:
    """Resolve the active persistent-large draw model and its material values."""
    resources = walk_pwib_resources(source_data["m999_e003_model"])
    by_id = {resource.resource_id: (layer, resource) for layer, resource in resources}
    veff_layer, veff = by_id["2q4KW7taihu_loo"]
    payload = veff.payload
    _table_offset, root_offset, _descriptors = discover_veff_allocation_table(payload)
    primary_offset, primary_count = struct.unpack_from("<2I", payload, root_offset + 0x60)
    class_offset, class_count = struct.unpack_from("<2I", payload, root_offset + 0x88)
    class_names: list[str] = []
    for class_index in range(class_count):
        class_words = struct.unpack_from("<6I", payload, class_offset + class_index * 0x18)
        literal = containing_ascii_run(payload, class_words[4])
        class_names.append(literal.rsplit("/", 1)[-1] if literal else "")
    draw_nodes: list[tuple[int, tuple[int, ...]]] = []
    for node_index in range(2, primary_count):
        primary_words = struct.unpack_from("<9I", payload, primary_offset + node_index * 0x24)
        class_index = primary_words[1]
        if class_index < class_count and class_names[class_index] == "DrawResource":
            draw_nodes.append((node_index, primary_words))
    if len(draw_nodes) != 1:
        raise ValueError(f"unexpected persistent-large DrawResource count: {len(draw_nodes)}")
    draw_node_index, draw_words = draw_nodes[0]
    model_ids = [
        resource.resource_id
        for _layer, resource in resources
        if payload_tag(resource.payload) == "SEDBvmdl"
        and resource.resource_id.encode("ascii")
        in payload[draw_words[0] : draw_words[0] + 0x80]
    ]
    if model_ids != ["37QyJuring03m"]:
        raise ValueError(f"unexpected persistent-large active draw model: {model_ids}")

    material_rows: list[dict[str, object]] = []
    parsed: dict[str, tuple[str, dict[str, dict[str, object]]]] = {}
    for role, model_id in (
        ("active_persistent_large_draw_model", "37QyJuring03m"),
        ("preloaded_auxiliary_ring_comparator", "0hlYBUring01m"),
    ):
        model_layer, model = by_id[model_id]
        shader, property_rows = vmdl_material_properties(model.payload)
        property_map = {str(row["property_name"]): row for row in property_rows}
        parsed[model_id] = (shader, property_map)
        texture_ids = sorted(
            resource.resource_id
            for _layer, resource in resources
            if payload_tag(resource.payload) == "SEDBvtex"
            and resource.resource_id.encode("ascii") in model.payload
        )
        for row in property_rows:
            material_rows.append(
                {
                    "model_role": role,
                    "model_resource_id": model_id,
                    "model_layer": model_layer,
                    "model_sha256": sha256_bytes(model.payload),
                    "shader_technique": shader,
                    "texture_resource_ids": ";".join(texture_ids),
                    **row,
                    "interpretation_boundary": (
                        "authored VMDL material value; shader exposure does not imply runtime "
                        "animation when the authored numeric buffer is zero"
                    ),
                }
            )

    active_shader, active_properties = parsed["37QyJuring03m"]
    comparator_shader, comparator_properties = parsed["0hlYBUring01m"]
    relevant = (
        "TextureDist_1_distortion_amount",
        "vfxDistortionTex_UVScroll",
        "vfxDistortionTex_UVScale",
    )
    active_values = {
        name: str(active_properties[name]["float_overlay"]) for name in relevant
    }
    comparator_values = {
        name: str(comparator_properties[name]["float_overlay"]) for name in relevant
    }
    expected_values = {
        "TextureDist_1_distortion_amount": "0.200000003",
        "vfxDistortionTex_UVScroll": "0;0;0",
        "vfxDistortionTex_UVScale": "1;1",
    }
    if active_values != expected_values or comparator_values != expected_values:
        raise ValueError(
            f"persistent-large material values changed: {active_values}/{comparator_values}"
        )
    model_layer, model = by_id["37QyJuring03m"]
    texture_ids = sorted(
        resource.resource_id
        for _layer, resource in resources
        if payload_tag(resource.payload) == "SEDBvtex"
        and resource.resource_id.encode("ascii") in model.payload
    )
    dds_names = sorted(
        value for _offset, value in ascii_runs(model.payload) if value.endswith(".dds")
    )
    contract_rows = [
        {
            "source": "m999_e003_model",
            "veff_layer": veff_layer,
            "veff_resource_id": veff.resource_id,
            "draw_node_index": draw_node_index,
            "draw_primary_record_offset_hex": f"0x{primary_offset + draw_node_index * 0x24:X}",
            "draw_serialized_object_offset_hex": f"0x{draw_words[0]:X}",
            "active_model_resource_id": model.resource_id,
            "active_model_layer": model_layer,
            "active_model_sha256": sha256_bytes(model.payload),
            "shader_technique": active_shader,
            "texture_resource_ids": ";".join(texture_ids),
            "texture_dds_names": ";".join(dds_names),
            "distortion_amount": active_values["TextureDist_1_distortion_amount"],
            "uv_scroll_xyz": active_values["vfxDistortionTex_UVScroll"],
            "uv_scale_xy": active_values["vfxDistortionTex_UVScale"],
            "conclusion": (
                "active persistent-large draw uses the smoke/fire distortion ring, but its "
                "authored UV scroll is zero; no material UV-scroll rotation is encoded"
            ),
        }
    ]
    if active_shader != "TechCgfxShader2" or texture_ids != [
        "1H4E8zfire_u04m",
        "3AbKuosmok_a01m",
    ] or dds_names != ["fire_u04m.dds", "smok_a01m.dds"]:
        raise ValueError(
            f"persistent-large draw resource changed: {active_shader}/{texture_ids}/{dds_names}"
        )
    if len(material_rows) != 50:
        raise ValueError(f"unexpected persistent-large material row count: {len(material_rows)}")
    return contract_rows, material_rows

def native_vfx_lifetime_semantics(executable: bytes) -> list[dict[str, object]]:
    expected_registries = {
        0x01300F6C: (
            0x010BA124, 0x00000387, 0x010BA0E8, 0x00E39DB0,
            0x00E39DC0, 0x00E39DD0, 0x00000000, 0x00BA4370,
        ),
        0x0130F9CC: (
            0x0111C300, 0x000003C9, 0x0111C2CC, 0x00E39DB0,
            0x00E39DC0, 0x00E39DD0, 0x00000000, 0x00D589F0,
        ),
    }
    for address, expected in expected_registries.items():
        actual = pe_dwords(executable, address, len(expected))
        if actual != expected:
            raise ValueError(
                f"native lifetime registry changed at 0x{address:08X}: {actual}"
            )
    if pe_bytes(executable, 0x00BA4469, 7) != bytes.fromhex(
        "c7 46 18 f0 49 02 00"
    ):
        raise ValueError("LeafLife 150000-us default signature changed")

    return [
        {
            "control": "LeafLife",
            "class_id_hex": "0x387",
            "registry_address": "0x01300F6C",
            "base_control": "AbstractLeafLife",
            "update_address": "0x00BA4370",
            "value_evaluator_address": "0x00BA42A0",
            "initializer_address": "0x00BA4440",
            "event_handler_address": "0x00BA45A0",
            "runtime_fields": (
                "+0x10 normalized life; +0x14 boundary/start tick; "
                "+0x18 fade interval; +0x1C mode; +0x1D completed flag"
            ),
            "mode_1_behavior": (
                "full life until the configured owning-effect boundary; "
                "initializer supplies native 150000-us fade default"
            ),
            "persistence_conclusion": "fade-state evaluator, not an infinite generator",
        },
        {
            "control": "LeafLifeEx",
            "class_id_hex": "0x3C9",
            "registry_address": "0x0130F9CC",
            "base_control": "LeafLife",
            "update_address": "0x00D589F0",
            "value_evaluator_address": "0x00D58910",
            "initializer_address": "0x00BA4440 (inherited)",
            "event_handler_address": "0x00BA45A0 (inherited)",
            "runtime_fields": (
                "same LeafLife state; mode 1 reads the owning effect's +0x10/+0x44 boundary"
            ),
            "mode_1_behavior": (
                "uses owner lifetime boundary rather than serialized word A; "
                "event transitions reuse the 150000-us fade path"
            ),
            "persistence_conclusion": "owner-coupled fade evaluator, not an infinite generator",
        },
    ]


def native_action_wrapper_semantics(
    executable: bytes, installed_rows: list[dict[str, object]]
) -> list[dict[str, object]]:
    signatures = {
        0x00A17BDE: "f6 43 14 40 74 0b c7 46 44 01 00 00 00 6a 00",
        0x0082FC3E: "80 38 01 75 0f 80 78 01 00 74 09 6a 02",
        0x0082FCEE: "80 38 01 75 ee 80 78 01 00 74 e8",
    }
    for address, expected_hex in signatures.items():
        expected = bytes.fromhex(expected_hex)
        if pe_bytes(executable, address, len(expected)) != expected:
            raise ValueError(f"native ActionClip signature changed at 0x{address:08X}")

    combined = [
        row for row in installed_rows
        if row["action_field_0x9c_hex"] == "0x000000C0"
        and row["action_field_0xa0_hex"] == "0x00000101"
    ]
    category_counts = Counter(str(row["category"]) for row in combined)
    if len(combined) != 43 or category_counts != Counter({"mon": 26, "bgobj": 17}):
        raise ValueError(
            f"unexpected combined persistent-policy profile: {len(combined)}/{category_counts}"
        )

    return [
        {
            "serialized_field": "@ACT word 0x9C",
            "bit_hex": "0x00000040",
            "native_addresses": "0x00A17A30 / branch 0x00A17BDE",
            "native_test": "parsed action byte +0x14 & 0x40",
            "observed_behavior": (
                "sets internal iteration target +0x44 to exactly 1 and initializes "
                "the action state through 0x00A210F0 with value 0"
            ),
            "garuda_value": "set on tatumaki and taihu01m; clear on taihu_end",
            "interpretation_boundary": (
                "alternate ActionClip policy; the branch itself is not an infinite-loop opcode"
            ),
            "installed_combined_profile": "43 rows: 26 mon, 17 bgobj",
        },
        {
            "serialized_field": "@ACT word 0xA0",
            "bit_hex": "0x00000100",
            "native_addresses": "0x0082FC10 / 0x0082FCB0 / accessor 0x00A17E50",
            "native_test": "primary byte == 1 and extension byte != 0",
            "observed_behavior": (
                "forces internal state 2 when the child effect is created and invokes "
                "the 0x00A20F90 time/state accumulator before common ActionClip updating"
            ),
            "garuda_value": "set on tatumaki and taihu01m; clear on taihu_end",
            "interpretation_boundary": (
                "persistent-state update policy; particle regeneration still belongs to "
                "the selected effect/scheduler owner"
            ),
            "installed_combined_profile": "43 rows: 26 mon, 17 bgobj",
        },
        {
            "serialized_field": "combined @ACT policy",
            "bit_hex": "0x00000040 + 0x00000100",
            "native_addresses": "0x00A17A30 / 0x0082FC10 / 0x0082FCB0",
            "native_test": "0xC0 / 0x101 focused wrapper words",
            "observed_behavior": (
                "one-iteration state policy plus extended child-start/update handling"
            ),
            "garuda_value": "on-state wrappers only",
            "interpretation_boundary": (
                "explains the distinct model-state wrapper path without claiming the "
                "two words alone encode unbounded visible lifetime"
            ),
            "installed_combined_profile": "43 rows: 26 mon, 17 bgobj",
        },
    ]

def native_clip_semantics() -> list[dict[str, object]]:
    return [
        {
            "clip_class": "RaptureEffectEndClip",
            "registration_address": "0x0063629B",
            "factory_address": "0x0063A4D0",
            "implementation_address": "0x00821530",
            "vtable_address": "0x010148A4",
            "override_slot": "+0x04 (activation/bind override after destructor)",
            "target_contract": "serialized target indices must resolve to ActionClip",
            "actionclip_factory_address": "0x0063C210",
            "actionclip_constructor_address": "0x0082FB30",
            "actionclip_vtable_address": "0x01033BEC",
            "actionclip_effect_end_address": "0x0082FD20",
            "native_action": (
                "invoke ActionClip +0xC8 on activation; that method enumerates live "
                "EffectClip children and dispatches each effect handle to the owner handler"
            ),
            "destruction_semantics": (
                "does not directly delete the ActionClip, model-state actor, or scheduler; "
                "resource-authored fade/particle tail remains separate"
            ),
            "evidence": "ffxivgame.exe IDA assembly and RaptureEffectEndClip.cpp residue",
        }
    ]

def write_csv(path: Path, fieldnames: list[str], rows: list[dict[str, object]]) -> None:
    with path.open("w", encoding="utf-8", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames, extrasaction="ignore")
        writer.writeheader()
        writer.writerows(rows)

def m999_wss_bank_census(client: Path) -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    wind_banks: list[int] = []
    root = Path(r"client\chara\mon\m999\act\emp_emp\wss\base")
    token_defs = (
        (b"tatumaki", "tatumaki"),
        (b"tn_hit01m", "tn_hit01m"),
        (b"taihuu01", "taihuu01"),
        (b"taihu_end", "taihu_end"),
        (b"tm_hit01m", "tm_hit01m"),
    )
    for wss, expected_hash in M999_WSS_BANK_SHA256.items():
        relative = root / f"{wss:04d}"
        path = client / relative
        data = path.read_bytes()
        digest = sha256_bytes(data)
        if digest != expected_hash:
            raise ValueError(
                f"m999 WSS{wss} hash mismatch: expected {expected_hash}, got {digest}"
            )
        lowered = data.lower()
        tokens = [name for raw, name in token_defs if raw in lowered]
        if tokens:
            wind_banks.append(wss)
        rows.append(
            {
                "wss": wss,
                "relative_path": str(relative).replace("\\", "/"),
                "bytes": len(data),
                "sha256": digest,
                "recursive_resource_rows": len(walk_pwib(f"m999_wss{wss:02d}", data)),
                "wind_authored_tokens": "; ".join(tokens),
                "contains_tatumaki": int("tatumaki" in tokens),
                "contains_taihuu_family": int(any(token.startswith("taihu") for token in tokens)),
                "contains_wind_hit_resource": int(
                    "tn_hit01m" in tokens or "tm_hit01m" in tokens
                ),
                "classification": (
                    "small_tornado_action"
                    if wss == 15
                    else "large_typhoon_action"
                    if wss == 18
                    else "scheduler_stub"
                    if len(data) == 3280
                    else "non_wind_action_bank"
                ),
            }
        )
    if wind_banks != [15, 18]:
        raise ValueError(f"unexpected m999 wind-authored WSS banks: {wind_banks}")
    if "tatumaki" not in rows[14]["wind_authored_tokens"]:
        raise ValueError("m999 WSS15 lost its authored tatumaki token")
    if "taihuu01" not in rows[17]["wind_authored_tokens"]:
        raise ValueError("m999 WSS18 lost its authored taihuu token")
    return rows


def retail_lua_tornado_surfaces(repo: Path) -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    for definition in RETAIL_LUA_SURFACE_DEFS:
        luac_path = repo / definition["luac_relative"]
        lua_path = repo / definition["lua_relative"]
        luac = luac_path.read_bytes()
        digest = sha256_bytes(luac)
        if len(luac) != definition["bytes"] or digest != definition["sha256"]:
            raise ValueError(f"recovered Lua bytecode mismatch: {definition['name']}")
        statements = [
            line.strip()
            for line in lua_path.read_text(encoding="utf-8").splitlines()
            if line.strip()
        ]
        expected = [definition["require"], definition["declaration"]]
        if statements != expected:
            raise ValueError(
                f"unexpected recovered Lua surface for {definition['name']}: {statements}"
            )
        rows.append(
            {
                "class": definition["name"],
                "luac_relative_path": str(definition["luac_relative"]).replace("\\", "/"),
                "lua_relative_path": str(definition["lua_relative"]).replace("\\", "/"),
                "bytes": len(luac),
                "sha256": digest,
                "require_statement": statements[0],
                "class_declaration": statements[1],
                "decompiled_statement_count": len(statements),
                "method_count": 0,
                "cadence_or_potency_override": 0,
                "conclusion": "identity-only subclass; behavior is inherited from generic/native code",
            }
        )
    return rows


def lentigo_inheritance_boundary(repo: Path) -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    movement_name = re.compile(
        r"(?:move|position|target|timer|update|tick|path|chase|follow|speed|life|despawn)",
        re.IGNORECASE,
    )
    expected_battle_methods = {
        "NpcBaseClass.initForBattle",
        "NpcBaseClass.initForBattleCommon",
        "NpcBaseClass.getPartsName",
        "NpcBaseClass.isPartsExists",
        "NpcBaseClass.getAggro",
    }

    for definition in LENTIGO_INHERITANCE_DEFS:
        luac_path = repo / definition["luac_relative"]
        lua_path = repo / definition["lua_relative"]
        luac = luac_path.read_bytes()
        digest = sha256_bytes(luac)
        if len(luac) != definition["bytes"] or digest != definition["sha256"]:
            raise ValueError(f"inherited Lua bytecode mismatch: {definition['class']}")

        source = lua_path.read_text(encoding="utf-8")
        statements = [line.strip() for line in source.splitlines() if line.strip()]
        methods = re.findall(r"(?m)^function\s+([^\s(]+)\s*\(", source)
        movement_methods = [method for method in methods if movement_name.search(method)]
        if len(methods) != definition["method_count"] or movement_methods:
            raise ValueError(
                f"unexpected inherited method surface for {definition['class']}: "
                f"methods={methods}, movement={movement_methods}"
            )

        class_name = str(definition["class"])
        base = str(definition["base"])
        if class_name.startswith("Lentigo") and class_name != "LentigoBaseClass":
            expected = [
                'require("/Chara/Npc/Monster/Lentigo/LentigoBaseClass")',
                f'_defineClass("{class_name}", "LentigoBaseClass")',
            ]
            if statements != expected:
                raise ValueError(f"unexpected Lentigo identity subclass: {class_name}")
        elif class_name == "LentigoBaseClass":
            required = (
                'require("/Chara/Npc/Monster/MonsterBaseClass")',
                '_defineBaseClass("LentigoBaseClass", "MonsterBaseClass")',
                "function LentigoBaseClass.isMapMarkerVisibleForTalkable(A0_0)",
                "L1_1 = false",
                "return L1_1",
            )
            if not all(token in source for token in required):
                raise ValueError("LentigoBaseClass no longer has the marker-only contract")
        elif class_name == "MonsterBaseClass":
            if statements != [
                'require("/Chara/Npc/NpcBaseClass")',
                '_defineBaseClass("MonsterBaseClass", "NpcBaseClass")',
            ]:
                raise ValueError("MonsterBaseClass gained unexpected client behavior")
        elif set(methods) != expected_battle_methods:
            raise ValueError(f"NpcBaseClass_battle methods changed: {methods}")

        rows.append(
            {
                "class_or_module": class_name,
                "role": definition["role"],
                "base_or_owner": base,
                "luac_relative_path": str(definition["luac_relative"]).replace("\\", "/"),
                "bytes": len(luac),
                "sha256": digest,
                "method_count": len(methods),
                "movement_method_count": len(movement_methods),
                "only_behavior": definition["only_behavior"],
                "conclusion": (
                    "Garuda typhoon identity only; no pursuit implementation"
                    if class_name == "LentigoGarudaTyphoon"
                    else "Lentigo only suppresses its talk/map marker"
                    if class_name == "LentigoBaseClass"
                    else "cross-content Lentigo identity only"
                    if class_name.startswith("Lentigo")
                    else "generic client metadata surface; no pursuit implementation"
                ),
            }
        )
    return rows


def movement_packet_authority(repo: Path) -> list[dict[str, object]]:
    instantiate_relative = "Map Server/Packets/Send/Actor/ActorInstantiatePacket.cs"
    move_relative = "Map Server/Packets/Send/Actor/MoveActorToPositionPacket.cs"
    speed_relative = "Map Server/Packets/Send/Actor/SetActorSpeedPacket.cs"
    instantiate_source = (repo / instantiate_relative).read_text(encoding="utf-8")
    move_source = (repo / move_relative).read_text(encoding="utf-8")
    speed_source = (repo / speed_relative).read_text(encoding="utf-8")

    instantiate_tokens = (
        "public const ushort OPCODE = 0x00CC;",
        "binWriter.BaseStream.Seek(0x24, SeekOrigin.Begin);",
        "Encoding.ASCII.GetBytes(className)",
    )
    move_tokens = (
        "public const ushort OPCODE = 0x00CF;",
        "binWriter.Write((Single)x);",
        "binWriter.Write((Single)y);",
        "binWriter.Write((Single)z);",
        "binWriter.Write((Single)rot);",
        "binWriter.Write((ushort)moveState);",
        "binWriter.Write((Single)floatingHeight);",
    )
    speed_tokens = (
        "public const ushort OPCODE = 0x00D0;",
        "binWriter.Write((Single)stopSpeed);",
        "binWriter.Write((Single)walkSpeed);",
        "binWriter.Write((Single)runSpeed);",
        "binWriter.Write((Single)activeSpeed);",
    )
    if not all(token in instantiate_source for token in instantiate_tokens):
        raise ValueError("actor class instantiate packet contract changed")
    if not all(token in move_source for token in move_tokens):
        raise ValueError("movement endpoint packet contract changed")
    if not all(token in speed_source for token in speed_tokens):
        raise ValueError("actor speed packet contract changed")

    return [
        {
            "opcode": "0x00CC",
            "source": instantiate_relative,
            "server_authored_fields": "objectName; className at payload offset 0x24; initParams",
            "absent_decision_fields": "target; path; retarget rule; speed; lifetime",
            "client_role": "bind the runtime actor to its client Lua class",
            "garuda_boundary": "capture className=LentigoGarudaTyphoon, then track that actor ID through 0x00D0/0x00CF",
        },
        {
            "opcode": "0x00CF",
            "source": move_relative,
            "server_authored_fields": "x; y; z; rotation; moveState; floatingHeight",
            "absent_decision_fields": "target; path; retarget rule; duration; lifetime",
            "client_role": "render/interpolate authoritative actor endpoint",
            "garuda_boundary": "a retail capture is required to recover South-wind destinations and path timing",
        },
        {
            "opcode": "0x00D0",
            "source": speed_relative,
            "server_authored_fields": "stopSpeed; walkSpeed; runSpeed; activeSpeed",
            "absent_decision_fields": "target; path; retarget rule; lifetime",
            "client_role": "apply server-provided actor speed profile",
            "garuda_boundary": "a retail capture is required to recover the typhoon speed profile",
        },
    ]


def native_lentigo_string_boundary(executable_data: bytes) -> list[dict[str, object]]:
    tokens = (
        "LentigoGarudaTyphoon",
        "GarudaTyphoon",
        "LentigoBaseClass",
        "/Lentigo/",
    )
    lowered = executable_data.lower()
    rows = [
        {
            "token": token,
            "ascii_match_count": lowered.count(token.lower().encode("ascii")),
            "source": "ffxivgame.exe",
            "source_sha256": sha256_bytes(executable_data),
            "interpretation": "no obvious native ASCII class-name dispatch",
            "caveat": "does not exclude numeric actor-ID dispatch or generic native movement handling",
        }
        for token in tokens
    ]
    if any(int(row["ascii_match_count"]) != 0 for row in rows):
        raise ValueError(f"unexpected native Lentigo class string match: {rows}")
    return rows


def command_geometry(repo: Path) -> list[dict[str, object]]:
    wanted = {"23556": "Great Whirlwind", "23559": "Eye of the Storm"}
    rows: list[dict[str, object]] = []
    with (repo / "AI Scripts/command.csv").open(
        encoding="utf-8-sig", errors="replace", newline=""
    ) as handle:
        for row in csv.reader(handle):
            if row and row[0] in wanted:
                command = {
                    "command_id": row[0],
                    "name": wanted[row[0]],
                    "raw_column_65_range": row[65],
                    "raw_column_67": row[67],
                    "raw_column_80_recast": row[80],
                    "raw_column_97_damage_swing": row[97],
                    "raw_column_109_property": row[109],
                    "raw_column_111_element": row[111],
                    "element_name": "Wind" if row[111] == "7" else "unexpected",
                    "interpretation": (
                        "12-yalm tornado action range"
                        if row[0] == "23556"
                        else "44-yalm arena-scale storm action range"
                    ),
                }
                if (
                    command["raw_column_80_recast"] != "0"
                    or command["raw_column_97_damage_swing"] != "0"
                    or command["raw_column_111_element"] != "7"
                ):
                    raise ValueError(f"unexpected canonical wind command fields: {command}")
                rows.append(command)
    if len(rows) != 2:
        raise ValueError("could not recover both canonical Garuda wind commands")
    return rows



def command_selector_boundary(repo: Path) -> list[dict[str, object]]:
    sql_path = repo / "Data/sql/server_battle_commands.sql"
    sql_text = sql_path.read_text(encoding="utf-8")
    command_rows: dict[int, list[str]] = {}
    for command_id in (23556, 23559, 23997, 23998):
        match = re.search(
            rf"INSERT INTO (?:`?server_battle_commands`?) VALUES \(({command_id},.*?)\);",
            sql_text,
        )
        if match is None:
            raise ValueError(f"missing battle command row {command_id}")
        command_rows[command_id] = next(csv.reader([match.group(1)], skipinitialspace=True))

    expected = {
        23556: ("great_whirlwind", 12.0, 1, 0x13001000),
        23559: ("eye_of_the_storm", 44.0, 1, 0x13001000),
        23997: ("garuda_eye_of_storm", 50.0, 18, 0x13012000),
        23998: ("garuda_great_whirlwind", 50.0, 15, 0x1300F000),
    }
    rows: list[dict[str, object]] = []
    for command_id, (name, command_range, wss, packed) in expected.items():
        values = command_rows[command_id]
        actual = (values[1].strip("'"), float(values[17]), int(values[34]))
        if (
            actual != (name, command_range, packed)
            or int(values[32]) != 1
            or int(values[43]) != 7
            or float(values[44]) != 0.0
        ):
            raise ValueError(f"unexpected selector row {command_id}: {actual}")
        rows.append(
            {
                "evidence_class": "server_command_row",
                "source": "Data/sql/server_battle_commands.sql",
                "id_or_opcode": command_id,
                "name": name,
                "range": command_range,
                "packed_animation": f"0x{packed:08X}",
                "decoded_wss": wss,
                "stored_model_animation": int(values[32]),
                "action_property_element": int(values[43]),
                "damage_swing": float(values[44]),
                "animation_payload_offset": "0x04",
                "command_payload_offset": "0x24",
                "conclusion": (
                    "recovered canonical row is a generic WSS1 placeholder"
                    if command_id < 23997
                    else "private encounter row carries the selected m999 WSS presentation"
                ),
            }
        )

    packet_specs = (
        ("0x013C", "Map Server/Packets/Send/Actor/Battle/CommandResultX00Packet.cs"),
        ("0x0139", "Map Server/Packets/Send/Actor/Battle/CommandResultX01Packet.cs"),
        ("0x013A", "Map Server/Packets/Send/Actor/Battle/CommandResultX10Packet.cs"),
        ("0x013B", "Map Server/Packets/Send/Actor/Battle/CommandResultX18Packet.cs"),
    )
    for opcode, relative in packet_specs:
        packet_text = (repo / relative).read_text(encoding="utf-8")
        for required in (
            f"public const ushort OPCODE = {opcode};",
            "binWriter.Write((UInt32)animationId);",
            "binWriter.Seek(0x20, SeekOrigin.Begin);",
            "binWriter.Write((UInt16)commandId);",
        ):
            if required not in packet_text:
                raise ValueError(f"packet selector contract changed in {relative}: {required}")
        rows.append(
            {
                "evidence_class": "command_result_packet",
                "source": relative,
                "id_or_opcode": opcode,
                "name": "server-authored result presentation",
                "range": "",
                "packed_animation": "independent UInt32 animationId",
                "decoded_wss": "model-dependent bank encoded in animationId",
                "stored_model_animation": "",
                "animation_payload_offset": "0x04",
                "command_payload_offset": "0x24",
                "conclusion": (
                    "commandId and animationId are separate packet fields; the stock client "
                    "does not need a command-to-WSS lookup to render the result"
                ),
            }
        )

    return rows


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--client", type=Path, default=DEFAULT_CLIENT)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    args = parser.parse_args()

    repo = Path(__file__).resolve().parents[1]
    client = args.client.resolve()
    output = (repo / args.output).resolve() if not args.output.is_absolute() else args.output
    output.mkdir(parents=True, exist_ok=True)

    source_data: dict[str, bytes] = {}
    source_rows: list[dict[str, object]] = []
    resource_rows: list[dict[str, object]] = []
    token_rows: list[dict[str, object]] = []
    scheduler_rows: list[dict[str, object]] = []
    scheduler_graph_rows: list[dict[str, object]] = []
    vfx_control_rows: list[dict[str, object]] = []
    m999_bank_rows = m999_wss_bank_census(client)
    retail_lua_rows = retail_lua_tornado_surfaces(repo)
    lentigo_rows = lentigo_inheritance_boundary(repo)
    movement_rows = movement_packet_authority(repo)

    _executable_path, executable_data = read_executable_verified(client)
    native_lentigo_rows = native_lentigo_string_boundary(executable_data)
    source_rows.append(
        {
            "source": "ffxivgame_exe",
            "role": EXECUTABLE_DEF["role"],
            "relative_path": str(EXECUTABLE_DEF["relative"]).replace("\\", "/"),
            "bytes": len(executable_data),
            "sha256": sha256_bytes(executable_data),
        }
    )

    for source, definition in SOURCE_DEFS.items():
        path, data = read_verified(client, source)
        source_data[source] = data
        source_rows.append(
            {
                "source": source,
                "role": definition["role"],
                "relative_path": str(definition["relative"]).replace("\\", "/"),
                "bytes": len(data),
                "sha256": sha256_bytes(data),
            }
        )

        if data.startswith(b"PWIB"):
            rows = walk_pwib(source, data)
            resource_rows.extend(rows)
            for layer, resource in walk_pwib_resources(data):
                tag = payload_tag(resource.payload)
                if TYPE_LABELS.get(resource.resource_type) == "SCB" or tag == "SEDBSCB":
                    scheduler_rows.append(
                        {
                            "source": source,
                            "layer": layer,
                        "payload_bytes": len(resource.payload),
                            "index": resource.index,
                            "resource_id": resource.resource_id,
                            "resource_path": resource.resource_path,
                            "resource_type": TYPE_LABELS.get(resource.resource_type, ""),
                            "payload_tag": tag,
                            "bytes": len(resource.payload),
                            "sha256": sha256_bytes(resource.payload),
                            "note": "outer scheduler" if layer == "outer" else "nested scheduler",
                        }
                    )
                    if source in (
                        "m851_wss05",
                        "m851_wss11",
                        "m999_wss15",
                        "m999_wss18",
                        "m999_e003_model",
                    ):
                        scheduler_graph_rows.extend(
                            parse_scb_graph(source, resource.resource_id, resource.payload)
                        )

                if tag == "SEDBveff":
                    for string_offset, value in ascii_runs(resource.payload):
                        for match in VFX_CONTROL_PATTERN.finditer(value):
                            full_control = match.group()
                            vfx_control_rows.append(
                                {
                                    "source": source,
                                    "layer": layer,
                        "payload_bytes": len(resource.payload),
                                    "resource_id": resource.resource_id,
                                    "resource_path": resource.resource_path,
                                    "payload_tag": tag,
                                    "payload_sha256": sha256_bytes(resource.payload),
                                    "string_offset_hex": f"0x{string_offset + match.start():X}",
                                    "control": full_control.rsplit("/", 1)[-1],
                                    "serialized_class": full_control,
                                }
                            )

        for token in EXPECTED_TOKENS[source]:
            present = bounded_ascii_token_present(data, token)
            token_rows.append(
                {
                    "source": source,
                    "token": token,
                    "present": int(present),
                    "evidence_role": definition["role"],
                }
            )
            if not present:
                raise ValueError(f"missing expected token {token!r} in {source}")

    hashes_by_source = {
        source: {
            str(row["sha256"])
            for row in resource_rows
            if row["source"] == source and int(row["bytes"]) > 0
        }
        for source in SOURCE_DEFS
    }
    intersection_rows: list[dict[str, object]] = []
    pairs = (
        ("m999_wss15", "m999_wss18"),
        ("m999_e003_model", "m999_wss15"),
        ("m999_e003_model", "m999_wss18"),
        ("m851_wss05", "m999_wss15"),
        ("m851_wss05", "m999_wss18"),
        ("m851_wss11", "m999_wss15"),
        ("m851_wss11", "m999_wss18"),
        ("m851_wss05", "m999_e003_model"),
        ("m851_wss11", "m999_e003_model"),
        ("sum6g000", "m999_wss15"),
        ("sum6g000", "m999_wss18"),
        ("sum6g000", "m999_e003_model"),
    )
    for left, right in pairs:
        shared = sorted(hashes_by_source[left] & hashes_by_source[right])
        if not shared:
            intersection_rows.append(
                {"left": left, "right": right, "shared_sha256": "", "shared_count": 0}
            )
        else:
            for digest in shared:
                intersection_rows.append(
                    {
                        "left": left,
                        "right": right,
                        "shared_sha256": digest,
                        "shared_count": len(shared),
                    }
                )

    wss_shared = hashes_by_source["m999_wss15"] & hashes_by_source["m999_wss18"]
    if wss_shared != {GENERIC_SHOOT_MON_SHA256}:
        raise ValueError(f"unexpected WSS15/WSS18 shared payloads: {wss_shared}")
    m999_combat_hashes = hashes_by_source["m999_wss15"] | hashes_by_source["m999_wss18"]
    for boss_source in ("m851_wss05", "m851_wss11"):
        shared = hashes_by_source[boss_source] & m999_combat_hashes
        if shared != {GENERIC_SHOOT_MON_SHA256}:
            raise ValueError(f"{boss_source}: unexpected m999 combat imports: {shared}")
        if hashes_by_source[boss_source] & hashes_by_source["m999_e003_model"]:
            raise ValueError(f"{boss_source}: unexpectedly imports persistent tornado data")
    model_state_graph_rows = [
        row for row in scheduler_graph_rows if row["source"] == "m999_e003_model"
    ]
    if len(model_state_graph_rows) != 16:
        raise ValueError(
            f"expected 16 model-state scheduler entries, got {len(model_state_graph_rows)}"
        )
    if not vfx_control_rows:
        raise ValueError("no serialized VEFF control classes recovered")
    if hashes_by_source["m999_e003_model"] & (
        hashes_by_source["m999_wss15"] | hashes_by_source["m999_wss18"]
    ):
        raise ValueError("persistent model-state payload unexpectedly equals a combat payload")
    if hashes_by_source["sum6g000"] & (
        hashes_by_source["m999_wss15"]
        | hashes_by_source["m999_wss18"]
        | hashes_by_source["m999_e003_model"]
    ):
        raise ValueError("cinematic tornado payload unexpectedly equals a combat payload")

    clips = sorted(
        {
            clip
            for source in ("m999_wss15", "m999_wss18", "m999_e003_model")
            for clip in re.findall(
                rb"Rapture[A-Za-z0-9_]+Clip", source_data[source]
            )
        }
    )
    clip_rows = [
        {"clip_class": clip.decode("ascii"), "scope": "m999 wind sources"}
        for clip in clips
    ]

    write_csv(
        output / "source_manifest.csv",
        ["source", "role", "relative_path", "bytes", "sha256"],
        source_rows,
    )
    write_csv(
        output / "resource_inventory.csv",
        [
            "source",
            "layer",
            "index",
            "resource_id",
            "resource_path",
            "resource_type_hex",
            "resource_type",
            "payload_tag",
            "bytes",
            "sha256",
        ],
        resource_rows,
    )
    write_csv(
        output / "semantic_tokens.csv",
        ["source", "token", "present", "evidence_role"],
        token_rows,
    )
    write_csv(
        output / "scheduler_inventory.csv",
        [
            "source",
            "layer",
            "index",
            "resource_id",
            "resource_path",
            "resource_type",
            "payload_tag",
            "bytes",
            "sha256",
            "note",
        ],
        scheduler_rows,
    )
    write_csv(
        output / "scheduler_graph.csv",
        [
            "source", "scheduler", "state", "active_block_offset_hex",
            "active_duration_units", "active_duration_seconds", "active_entry_count",
            "entry_ordinal", "record_offset_hex", "record_size", "clip_type_index",
            "controlled_actor_index",
            "clip_class", "timeline_clip_id", "resource_ref_index",
            "resource_ref_id", "resource_ref_type", "start_units", "start_seconds",
            "effect_end_target_count", "effect_end_target_ids",
            "effect_end_target_classes", "cancel_scheduler_tokens", "entry_payload_hex",
        ],
        scheduler_graph_rows,
    )
    write_csv(
        output / "vfx_controls.csv",
        [
            "source", "layer", "resource_id", "resource_path", "payload_tag",
            "payload_sha256", "string_offset_hex", "control", "serialized_class",
        ],
        vfx_control_rows,
    )
    action_wrapper_rows = action_wrapper_flags(source_data)
    write_csv(
        output / "action_wrapper_flags.csv",
        [
            "source", "resource_id", "role", "action_field_0x9c_hex",
            "action_field_0xa0_hex", "sample_group", "sha256",
            "interpretation_boundary",
        ],
        action_wrapper_rows,
    )
    installed_wrapper_rows = installed_action_wrapper_census(repo, client)
    write_csv(
        output / "installed_action_wrapper_census.csv",
        [
            "category", "model_or_object", "lane", "bank", "relative_path",
            "resource_id", "resource_path", "layer", "payload_bytes", "action_field_0x9c_hex",
            "action_field_0xa0_hex", "extra_0x40_bit", "extra_0x100_bit",
            "sha256", "interpretation_boundary",
        ],
        installed_wrapper_rows,
    )
    leaf_parameter_rows = persistent_leaf_parameters(source_data["m999_e003_model"])
    write_csv(
        output / "persistent_leaf_parameters.csv",
        [
            "state", "mode_bit", "mask", "action_resource_id", "action_sha256",
            "action_field_0x9c_hex", "action_field_0xa0_hex", "leaf_resource_id",
            "leaf_sha256", "position_y_0x314", "angle_control_metadata_0x32c",
            "scale_x_0x330", "scale_y_0x334", "scale_z_0x338",
            "scale_control_metadata_0x33c_hex", "rgba_0x350_0x35c", "raw_time_a_0x360",
            "raw_time_b_0x364", "interpretation_boundary",
        ],
        leaf_parameter_rows,
    )
    lifetime_comparison_rows = vfx_leaf_lifetime_comparison(source_data)
    write_csv(
        output / "vfx_leaf_lifetime_comparison.csv",
        [
            "sample", "role", "source", "action_resource_id",
            "action_field_0x9c_hex", "action_field_0xa0_hex", "leaf_resource_id",
            "leaf_payload_bytes", "lifetime_class", "timing_tuple_offset_hex",
            "serialized_word_a", "serialized_word_b", "serialized_mode",
            "paired_sample", "pair_relation", "native_mode_1_conclusion", "sha256",
        ],
        lifetime_comparison_rows,
    )
    transform_rows = tornado_leaf_transforms(source_data)
    write_csv(
        output / "vfx_leaf_transforms.csv",
        [
            "sample", "role", "source", "leaf_resource_id", "leaf_payload_bytes",
            "position_offset_hex", "position_x", "position_y", "position_z",
            "position_metadata_signed", "angle_offset_hex", "angle_x", "angle_y",
            "angle_z", "angle_metadata_signed", "scale_offset_hex", "scale_x",
            "scale_y", "scale_z", "scale_metadata_hex", "sha256",
            "interpretation_boundary",
        ],
        transform_rows,
    )
    transform_diff_rows = tornado_leaf_transform_diffs(transform_rows)
    write_csv(
        output / "vfx_leaf_transform_diffs.csv",
        [
            "relation", "left_sample", "right_sample", "field", "left_value",
            "right_value", "conclusion",
        ],
        transform_diff_rows,
    )
    native_transform_rows = native_vfx_transform_semantics(executable_data)
    write_csv(
        output / "native_vfx_transform_semantics.csv",
        [
            "control", "class_id_hex", "registry_address", "initializer_address",
            "update_address", "runtime_default_xyz", "runtime_fields",
            "serialized_leaf_relation", "garuda_conclusion",
        ],
        native_transform_rows,
    )
    model_bounds_rows = tornado_vfx_model_bounds(source_data)
    write_csv(
        output / "vfx_model_bounds.csv",
        [
            "source", "role", "layer", "model_resource_id", "resource_path", "bytes",
            "sha256", "bounds_record_offset_hex", "min_x", "min_y", "min_z", "max_x",
            "max_y", "max_z", "extent_x", "extent_y", "extent_z",
            "interpretation_boundary",
        ],
        model_bounds_rows,
    )
    root_bounds_rows = tornado_veff_root_bounds(source_data)
    write_csv(
        output / "vfx_root_bounds.csv",
        [
            "source", "layer", "veff_resource_id", "resource_path",
            "record_offset_hex", "min_x", "min_y", "min_z", "max_x", "max_y",
            "max_z", "extent_x", "extent_y", "extent_z", "profile",
            "interpretation_boundary",
        ],
        root_bounds_rows,
    )
    rotation_summary_rows, rotation_usage_rows, angle_allocation_rows = (
        tornado_veff_rotation_graph(source_data)
    )
    write_csv(
        output / "veff_rotation_graph_summary.csv",
        [
            "source", "layer", "veff_resource_id", "bytes", "sha256",
            "allocation_table_offset_hex", "allocation_descriptor_count",
            "root_offset_hex", "primary_control_records", "secondary_control_records",
            "class_metadata_records", "joined_angle_root_records",
            "joined_angle_world_records", "joined_angle_generated_records",
            "generated_angle_dependency_strings", "interpretation_boundary",
        ],
        rotation_summary_rows,
    )
    write_csv(
        output / "veff_rotation_class_usage.csv",
        [
            "source", "layer", "veff_resource_id", "control",
            "serialized_class_string_count", "class_metadata_record_count",
            "mechanically_joined_primary_record_count", "evidence_rank",
            "interpretation_boundary",
        ],
        rotation_usage_rows,
    )
    write_csv(
        output / "veff_angle_control_allocations.csv",
        [
            "source", "layer", "veff_resource_id", "node_index",
            "primary_record_offset_hex", "allocation_offset_hex", "raw_word_0_hex",
            "raw_word_1_hex", "raw_word_2_hex", "raw_word_3_hex",
            "float_overlay_0", "float_overlay_1", "float_overlay_2", "float_overlay_3",
            "all_words_zero", "interpretation_boundary",
        ],
        angle_allocation_rows,
    )
    native_rotation_rows = native_vfx_rotation_semantics(executable_data)
    write_csv(
        output / "native_vfx_rotation_semantics.csv",
        [
            "control", "class_id_hex", "registry_address", "initializer_address",
            "event_or_copy_address", "update_address", "native_behavior",
            "debug_unit_evidence", "garuda_conclusion",
        ],
        native_rotation_rows,
    )
    particle_graph_rows = tornado_veff_particle_graph(source_data)
    write_csv(
        output / "veff_particle_graph_summary.csv",
        [
            "source", "layer", "veff_resource_id", "primary_control_records",
            "joined_generated_position_root_records",
            "joined_generated_position_world_records",
            "joined_generated_position_pure_world_records",
            "joined_generated_position_local_records", "joined_generate_master_records",
            "joined_draw_resource_records", "interpretation_boundary",
        ],
        particle_graph_rows,
    )
    native_particle_rows = native_vfx_particle_semantics(executable_data)
    write_csv(
        output / "native_vfx_particle_semantics.csv",
        [
            "control", "class_id_hex", "registry_address", "initializer_address",
            "event_or_copy_address", "update_or_dispatch_address", "native_behavior",
            "garuda_joined_instances", "garuda_distribution", "interpretation_boundary",
        ],
        native_particle_rows,
    )
    native_input_rows = native_vfx_runtime_input_semantics(executable_data)
    write_csv(
        output / "native_vfx_runtime_input_semantics.csv",
        [
            "consumer", "parameter", "parameter_offset_hex", "storage",
            "native_address", "native_behavior", "interpretation_boundary",
        ],
        native_input_rows,
    )
    native_graph_module_rows = native_vfx_graph_module_registries(executable_data)
    write_csv(
        output / "native_vfx_graph_module_registries.csv",
        [
            "distribution", "curve_family", "runtime_class", "registry_address",
            "function_0x04", "function_0x08", "function_0x0c", "function_0x10",
            "function_0x14", "function_0x18", "function_0x1c", "class_code_hex",
            "profile_0x24_hex", "profile_0x28_hex", "profile_0x2c_hex",
            "registry_prefix_sha256", "interpretation_boundary",
        ],
        native_graph_module_rows,
    )
    native_graph_type_rows = native_vfx_graph_module_types(executable_data)
    write_csv(
        output / "native_vfx_graph_module_types.csv",
        [
            "distribution", "curve_family", "type_index", "runtime_type",
            "runtime_class", "entry_address", "class_code_hex",
            "class_code_low_byte_hex", "profile_0x24_hex", "profile_0x28_hex",
            "profile_0x2c_hex", "raw_entry_hex", "block_sha256",
            "interpretation_boundary",
        ],
        native_graph_type_rows,
    )
    native_graph_table_rows = native_vfx_graph_type_table(executable_data)
    write_csv(
        output / "native_vfx_graph_type_table.csv",
        [
            "distribution", "type_index_hex", "curve_family_overlay",
            "runtime_type_overlay", "runtime_class", "entry_address",
            "class_code_address", "class_code_hex", "class_code_low_byte_hex",
            "profile_0x24_hex", "profile_0x28_hex", "profile_0x2c_hex",
            "registry_status", "raw_entry_hex", "table_sha256",
            "interpretation_boundary",
        ],
        native_graph_table_rows,
    )
    (
        parameter_record_rows,
        parameter_terminal_rows,
        group_loader_bridge_rows,
    ) = tornado_veff_parameter_records(source_data)
    write_csv(
        output / "veff_parameter_graph_records.csv",
        [
            "source", "layer", "veff_resource_id", "group_index", "root_slot",
            "depth", "traversal_path", "record_offset_hex", "tag_or_key_hex",
            "type_index_overlay_hex", "upper_half_overlay_hex",
            "graph_overflow_id_hex", "reserved_high_byte_hex", "data_offset_hex",
            "data_count", "classification", "raw_record_hex",
            "child_slice_sha256", "interpretation_boundary",
        ],
        parameter_record_rows,
    )
    write_csv(
        output / "veff_parameter_terminal_words.csv",
        [
            "source", "layer", "veff_resource_id", "group_index", "root_slot",
            "depth", "traversal_path", "source_record_offset_hex",
            "source_tag_or_key_hex", "word_index", "word_offset_hex", "raw_word_hex",
            "unsigned_int_overlay", "signed_int_overlay", "float_overlay",
            "raw_word_class", "interpretation_boundary",
        ],
        parameter_terminal_rows,
    )
    write_csv(
        output / "veff_group_loader_bridge.csv",
        [
            "source", "layer", "veff_resource_id",
            "allocation_block_offset_hex", "allocation_block_count",
            "logical_group_index", "visible_group_record_offset_hex",
            "native_descriptor_offset_hex", "native_descriptor_shift",
            "preceding_tail_offset_hex", "preceding_tail_offset_value_hex",
            "preceding_tail_count", "standard_pair_offset_hex",
            "standard_record_offset_hex", "standard_record_count",
            "random_pair_offset_hex", "random_record_offset_hex",
            "random_record_count", "raw_native_descriptor_hex",
            "native_descriptor_sha256", "loader_conclusion",
        ],
        group_loader_bridge_rows,
    )

    polynomial_type_join_rows = veff_polynomial_type_registry_join(
        parameter_record_rows, native_graph_table_rows
    )
    write_csv(
        output / "veff_polynomial_type_registry_join.csv",
        [
            "distribution", "serialized_first_dword_hex",
            "serialized_occurrences", "type_index_hex",
            "graph_overflow_id_hex", "reserved_high_byte_hex",
            "native_type_match_count", "native_type_match",
            "loader_join_conclusion", "overflow_join_conclusion",
            "interpretation_boundary",
        ],
        polynomial_type_join_rows,
    )
    (
        particle_control_rows,
        particle_link_rows,
        particle_dependency_rows,
    ) = tornado_particle_serialized_links(source_data)
    write_csv(
        output / "veff_particle_control_serialization.csv",
        [
            "source", "layer", "veff_resource_id", "node_index", "control",
            "primary_record_offset_hex", "secondary_record_offset_hex",
            "serialized_object_offset_hex", "link_slice_offset_hex",
            "link_descriptor_count", "link_slice_sha256",
            "secondary_tail_offset_hex", "secondary_tail_count",
            "secondary_tail_keys_hex", "primary_words_hex", "secondary_words_hex",
            "interpretation_boundary",
        ],
        particle_control_rows,
    )
    write_csv(
        output / "veff_particle_control_links.csv",
        [
            "source", "layer", "veff_resource_id", "node_index", "control",
            "link_index", "record_offset_hex", "word_0_hex", "word_1_hex",
            "word_2_hex", "raw_record_hex", "interpretation_boundary",
        ],
        particle_link_rows,
    )
    write_csv(
        output / "veff_particle_dependency_handles.csv",
        [
            "source", "layer", "veff_resource_id", "node_index", "control",
            "slice_role", "dependency_index", "record_offset_hex", "raw_key_hex",
            "signed_node_index_overlay", "signed_component_index_overlay",
            "classification", "interpretation_boundary",
        ],
        particle_dependency_rows,
    )
    large_draw_rows, large_material_rows = persistent_large_material_contract(
        source_data
    )
    write_csv(
        output / "persistent_large_draw_contract.csv",
        [
            "source", "veff_layer", "veff_resource_id", "draw_node_index",
            "draw_primary_record_offset_hex", "draw_serialized_object_offset_hex",
            "active_model_resource_id", "active_model_layer", "active_model_sha256",
            "shader_technique", "texture_resource_ids", "texture_dds_names",
            "distortion_amount", "uv_scroll_xyz", "uv_scale_xy", "conclusion",
        ],
        large_draw_rows,
    )
    write_csv(
        output / "persistent_large_material_properties.csv",
        [
            "model_role", "model_resource_id", "model_layer", "model_sha256",
            "shader_technique", "texture_resource_ids", "property_index",
            "property_name", "descriptor_offset_hex", "type_tag_hex", "byte_count",
            "value_offset_hex", "raw_words_hex", "float_overlay", "value_kind",
            "interpretation_boundary",
        ],
        large_material_rows,
    )
    native_lifetime_rows = native_vfx_lifetime_semantics(executable_data)
    write_csv(
        output / "native_vfx_lifetime_semantics.csv",
        [
            "control", "class_id_hex", "registry_address", "base_control",
            "update_address", "value_evaluator_address", "initializer_address",
            "event_handler_address", "runtime_fields", "mode_1_behavior",
            "persistence_conclusion",
        ],
        native_lifetime_rows,
    )
    native_wrapper_rows = native_action_wrapper_semantics(
        executable_data, installed_wrapper_rows
    )
    write_csv(
        output / "native_action_wrapper_semantics.csv",
        [
            "serialized_field", "bit_hex", "native_addresses", "native_test",
            "observed_behavior", "garuda_value", "interpretation_boundary",
            "installed_combined_profile",
        ],
        native_wrapper_rows,
    )
    appearance_rows = direct_appearance_contract(repo)
    write_csv(
        output / "actor_appearance_contract.csv",
        [
            "appearance_id", "base_model", "size", "head_gear", "body_gear",
            "model_join", "database_uniqueness", "runtime_note",
        ],
        appearance_rows,
    )
    native_rows = native_clip_semantics()
    write_csv(
        output / "native_clip_semantics.csv",
        [
            "clip_class", "registration_address", "factory_address",
            "implementation_address", "vtable_address", "override_slot",
            "target_contract", "actionclip_factory_address",
            "actionclip_constructor_address", "actionclip_vtable_address",
            "actionclip_effect_end_address", "native_action",
            "destruction_semantics", "evidence",
        ],
        native_rows,
    )
    write_csv(
        output / "payload_intersections.csv",
        ["left", "right", "shared_sha256", "shared_count"],
        intersection_rows,
    )
    write_csv(
        output / "clip_classes.csv",
        ["clip_class", "scope"],
        clip_rows,
    )
    write_csv(
        output / "m999_wss_bank_census.csv",
        [
            "wss", "relative_path", "bytes", "sha256", "recursive_resource_rows",
            "wind_authored_tokens", "contains_tatumaki", "contains_taihuu_family",
            "contains_wind_hit_resource", "classification",
        ],
        m999_bank_rows,
    )
    write_csv(
        output / "retail_lua_tornado_surfaces.csv",
        [
            "class", "luac_relative_path", "lua_relative_path", "bytes", "sha256",
            "require_statement", "class_declaration", "decompiled_statement_count",
            "method_count", "cadence_or_potency_override", "conclusion",
        ],
        retail_lua_rows,
    )
    write_csv(
        output / "lentigo_inheritance_boundary.csv",
        [
            "class_or_module", "role", "base_or_owner", "luac_relative_path",
            "bytes", "sha256", "method_count", "movement_method_count",
            "only_behavior", "conclusion",
        ],
        lentigo_rows,
    )
    write_csv(
        output / "movement_packet_authority.csv",
        [
            "opcode", "source", "server_authored_fields", "absent_decision_fields",
            "client_role", "garuda_boundary",
        ],
        movement_rows,
    )
    write_csv(
        output / "native_lentigo_string_boundary.csv",
        [
            "token", "ascii_match_count", "source", "source_sha256",
            "interpretation", "caveat",
        ],
        native_lentigo_rows,
    )
    write_csv(
        output / "command_geometry.csv",
        ["command_id", "name", "raw_column_65_range", "raw_column_67", "raw_column_80_recast", "raw_column_97_damage_swing", "raw_column_109_property", "raw_column_111_element", "element_name", "interpretation"],
        command_geometry(repo),
    )
    selector_rows = command_selector_boundary(repo)
    write_csv(
        output / "command_selector_boundary.csv",
        [
            "evidence_class", "source", "id_or_opcode", "name", "range",
            "packed_animation", "decoded_wss", "stored_model_animation",
            "action_property_element", "damage_swing", "animation_payload_offset",
            "command_payload_offset", "conclusion",
        ],
        selector_rows,
    )

    model_state_rows = [
        {
            "mode_bit": 4,
            "mask": "0x10",
            "off_scheduler": "init_msb4_0",
            "on_scheduler": "init_msb4_1",
            "on_effect": "tatumaki_loop / tatumaki",
            "off_effect": "cancel init_msb4_1",
            "off_active_seconds": 0.10,
            "on_active_seconds": 2.01,
            "effect_end_signal_seconds": 0.09,
            "effect_end_target": "timeline clip 2 / ActionClip",
            "lifetime_note": "activation-time EffectEnd dispatch; visible lifetime belongs to the owner-coupled ActionClip state and explicit off/cancel scheduler",
            "authored_role": "small persistent tornado state",
        },
        {
            "mode_bit": 5,
            "mask": "0x20",
            "off_scheduler": "init_msb5_0",
            "on_scheduler": "init_msb5_1",
            "on_effect": "taihu_loop / taihu01m",
            "off_effect": "taihu_end",
            "off_active_seconds": 0.79,
            "on_active_seconds": 2.25,
            "effect_end_signal_seconds": 0.20,
            "effect_end_target": "timeline clip 2 / ActionClip",
            "lifetime_note": "activation-time EffectEnd dispatch; visible lifetime belongs to the owner-coupled ActionClip state and explicit off/cancel scheduler",
            "authored_role": "large persistent typhoon state",
        },
    ]
    write_csv(
        output / "model_state_contract.csv",
        [
            "mode_bit",
            "mask",
            "off_scheduler",
            "on_scheduler",
            "on_effect",
            "off_effect",
            "off_active_seconds",
            "on_active_seconds",
            "effect_end_signal_seconds",
            "effect_end_target",
            "lifetime_note",
            "authored_role",
        ],
        model_state_rows,
    )

    model_state_packet_rows = [
        {
            "packet_opcode_hex": "0x0144",
            "packet_field": "breakage",
            "payload_offset_hex": "0x00",
            "native_handler_va_hex": "0x006638A4",
            "queue_type": 2,
            "apply_route": "separate breakage queue",
            "scheduler_format": "",
            "garuda_usage": "none for m999 init_msb4/init_msb5",
            "confidence": "exact_native_route",
        },
        {
            "packet_opcode_hex": "0x0144",
            "packet_field": "mode",
            "payload_offset_hex": "0x04",
            "native_handler_va_hex": "0x006638A4",
            "queue_type": 3,
            "apply_route": "FUN_007BF2E0 case 3 -> FUN_007A82F0",
            "scheduler_format": "init_msb%u_1 for set bits; init_msb%u_0 for cleared bits",
            "garuda_usage": "0x10 bit4 tornado; 0x20 bit5 typhoon",
            "confidence": "exact_native_route",
        },
        {
            "packet_opcode_hex": "0x0144",
            "packet_field": "motionPack",
            "payload_offset_hex": "0x06",
            "native_handler_va_hex": "0x006638A4",
            "queue_type": "",
            "apply_route": "motion-pack setter",
            "scheduler_format": "",
            "garuda_usage": "not used by persistent wind masks",
            "confidence": "exact_native_route",
        },
    ]
    write_csv(
        output / "model_state_packet_route.csv",
        [
            "packet_opcode_hex", "packet_field", "payload_offset_hex",
            "native_handler_va_hex", "queue_type", "apply_route",
            "scheduler_format", "garuda_usage", "confidence",
        ],
        model_state_packet_rows,
    )

    action_rows = [
        {
            "wss": 15,
            "source": "m999_wss15",
            "caster_scheduler": "mon_main / skl15_cas",
            "caster_active_seconds": 1.86,
            "target_scheduler": "m999_0015 / skl15_tar",
            "target_active_seconds": 0.50,
            "target_damage_selector_seconds": 0.06,
            "caster_action_refs": "skl15_cas@0.00",
            "target_action_ref": "skl15_tar@0.00",
            "effect_paths": "tatumaki.veffbin; tn_hit01m.veffbin",
            "semantic_join": "Great Whirlwind / small tornado",
            "confidence": "strong named inference; exact command selector not recovered",
        },
        {
            "wss": 18,
            "source": "m999_wss18",
            "caster_scheduler": "mon_main / skl18_cas",
            "caster_active_seconds": 1.50,
            "target_scheduler": "m999_0018 / skl18_tar",
            "target_active_seconds": 0.50,
            "target_damage_selector_seconds": 0.07,
            "caster_action_refs": "end@0.00; skl18_cas@0.00",
            "target_action_ref": "skl18_tar@0.00",
            "effect_paths": "taihuu01.veffbin; tm_hit01m.veffbin; taihu_end.veffbin",
            "semantic_join": "Eye of the Storm / arena typhoon",
            "confidence": "strong named inference; exact command selector not recovered",
        },
    ]
    write_csv(
        output / "action_contract.csv",
        [
            "wss",
            "source",
            "caster_scheduler",
            "caster_active_seconds",
            "target_scheduler",
            "target_active_seconds",
            "target_damage_selector_seconds",
            "caster_action_refs",
            "target_action_ref",
            "effect_paths",
            "semantic_join",
            "confidence",
        ],
        action_rows,
    )

    boss_action_rows = [
        {
            "wss": 5,
            "source": "m851_wss05",
            "motion": "cbbm_sp_b02",
            "frames": 65,
            "motion_seconds_30fps": 65 / 30,
            "caster_scheduler_seconds": 1.20,
            "target_scheduler_seconds": 0.35,
            "target_damage_selector_seconds": 0.03,
            "caster_action_refs": "m851_05_ca1@0.20",
            "target_action_ref": "skl05_tar1@0.00",
            "effect_paths": "skl05cas01m.veffbin; skl05tar01m.veffbin",
            "tornado_markers": "tatumaki",
            "notable_controls": "CameraShake",
            "non_generic_m999_payload_matches": 0,
            "safe_conclusion": "Garuda-owned cast package, distinct from m999 hazard actions/state",
            "retail_mapping": "unresolved",
        },
        {
            "wss": 11,
            "source": "m851_wss11",
            "motion": "cbbm_sp_b04",
            "frames": 90,
            "motion_seconds_30fps": 3.0,
            "caster_scheduler_seconds": 1.60,
            "target_scheduler_seconds": 0.60,
            "target_damage_selector_seconds": 0.07,
            "caster_action_refs": "skl11_cas1@0.00; skl11_cas2@0.26",
            "target_action_ref": "skl11_tar1@0.00",
            "effect_paths": "m851skl11m_c1.veffbin; m851skl11m_c2.veffbin; m851skl11m_t1.veffbin",
            "tornado_markers": "tatumaki; LOOP",
            "notable_controls": "SceneTexture; camera/draw/filter family",
            "non_generic_m999_payload_matches": 0,
            "safe_conclusion": "elaborate Garuda-owned tornado cast; strongest Aerial Blast candidate",
            "retail_mapping": "candidate only; exact selector unresolved",
        },
    ]
    write_csv(
        output / "garuda_boss_tornado_actions.csv",
        [
            "wss", "source", "motion", "frames", "motion_seconds_30fps",
            "caster_scheduler_seconds", "target_scheduler_seconds",
            "target_damage_selector_seconds", "caster_action_refs",
            "target_action_ref", "effect_paths", "tornado_markers", "notable_controls",
            "non_generic_m999_payload_matches", "safe_conclusion", "retail_mapping",
        ],
        boss_action_rows,
    )

    summary = {
        "scope": "installed_ffxiv_1x_client_and_repository_data",
        "client_modified": False,
        "sources": len(source_rows),
        "m999_wss_bank_census_rows": len(m999_bank_rows),
        "m999_wss_wind_authored_banks": [
            row["wss"] for row in m999_bank_rows if row["wind_authored_tokens"]
        ],
        "retail_lua_surface_rows": len(retail_lua_rows),
        "retail_lua_surface_method_count": sum(
            int(row["method_count"]) for row in retail_lua_rows
        ),
        "lentigo_inheritance_rows": len(lentigo_rows),
        "lentigo_inheritance_method_count": sum(
            int(row["method_count"]) for row in lentigo_rows
        ),
        "lentigo_inheritance_movement_method_count": sum(
            int(row["movement_method_count"]) for row in lentigo_rows
        ),
        "movement_packet_authority_rows": len(movement_rows),
        "native_lentigo_string_rows": len(native_lentigo_rows),
        "native_lentigo_ascii_match_count": sum(
            int(row["ascii_match_count"]) for row in native_lentigo_rows
        ),
        "recursive_resources": len(resource_rows),
        "scheduler_rows": len(scheduler_rows),
        "scheduler_graph_entries": len(scheduler_graph_rows),
        "model_state_scheduler_graph_entries": len(model_state_graph_rows),
        "veff_control_occurrences": len(vfx_control_rows),
        "action_wrapper_flag_rows": len(action_wrapper_rows),
        "installed_action_wrapper_census_rows": len(installed_wrapper_rows),
        "installed_action_wrapper_flag_counts": dict(Counter(
            f"{row['action_field_0x9c_hex']}/{row['action_field_0xa0_hex']}"
            for row in installed_wrapper_rows
        )),
        "persistent_leaf_parameter_rows": len(leaf_parameter_rows),
        "vfx_leaf_transform_rows": len(transform_rows),
        "vfx_leaf_transform_diff_rows": len(transform_diff_rows),
        "native_vfx_transform_rows": len(native_transform_rows),
        "vfx_model_bounds_rows": len(model_bounds_rows),
        "vfx_root_bounds_rows": len(root_bounds_rows),
        "veff_rotation_graph_rows": len(rotation_summary_rows),
        "veff_rotation_class_usage_rows": len(rotation_usage_rows),
        "veff_angle_control_allocation_rows": len(angle_allocation_rows),
        "native_vfx_rotation_rows": len(native_rotation_rows),
        "veff_particle_graph_rows": len(particle_graph_rows),
        "native_vfx_particle_rows": len(native_particle_rows),
        "native_vfx_runtime_input_rows": len(native_input_rows),
        "native_vfx_graph_module_registry_rows": len(native_graph_module_rows),
        "native_vfx_graph_module_type_rows": len(native_graph_type_rows),
        "native_vfx_graph_type_table_rows": len(native_graph_table_rows),
        "veff_parameter_graph_record_rows": len(parameter_record_rows),
        "veff_group_loader_bridge_rows": len(group_loader_bridge_rows),
        "veff_polynomial_type_registry_join_rows": len(polynomial_type_join_rows),
        "veff_parameter_terminal_word_rows": len(parameter_terminal_rows),
        "veff_particle_control_serialization_rows": len(particle_control_rows),
        "veff_particle_control_link_rows": len(particle_link_rows),
        "veff_particle_dependency_handle_rows": len(particle_dependency_rows),
        "persistent_large_draw_contract_rows": len(large_draw_rows),
        "persistent_large_material_property_rows": len(large_material_rows),
        "vfx_leaf_lifetime_comparison_rows": len(lifetime_comparison_rows),
        "native_vfx_lifetime_rows": len(native_lifetime_rows),
        "native_action_wrapper_semantic_rows": len(native_wrapper_rows),
        "native_persistent_policy_census_rows": sum(
            1 for row in installed_wrapper_rows
            if row["action_field_0x9c_hex"] == "0x000000C0"
            and row["action_field_0xa0_hex"] == "0x00000101"
        ),
        "ffxivgame_exe_sha256": sha256_bytes(executable_data),
        "command_selector_boundary_rows": len(selector_rows),
        "model_state_packet_route_rows": len(model_state_packet_rows),
        "m999_e003_appearance_id": appearance_rows[0]["appearance_id"],
        "verified_tokens": len(token_rows),
        "wss15_wss18_shared_payloads": len(wss_shared),
        "persistent_vs_combat_shared_payloads": 0,
        "garuda_boss_vs_m999_non_generic_shared_payloads": 0,
        "cinematic_vs_combat_shared_payloads": 0,
        "ownership_conclusion": (
            "m851 WSS5/WSS11 own Garuda cast tornado components; m999/e003 owns "
            "persistent tornado/typhoon states; m999 WSS15/WSS18 own separate "
            "one-shot hazard combat presentations"
        ),
        "lifetime_boundary": (
            "LeafLife/LeafLifeEx mode 1 is an owner-coupled fade evaluator, not an "
            "infinite generator. Persistent on wrappers take the native 0x40/0x100 "
            "ActionClip policy; visible lifetime still belongs to the selected model-state "
            "effect/scheduler and its explicit off/cancel transition."
        ),
        "transform_boundary": (
            "Native CoordRoot registries and defaults resolve the VLeafIns XYZ groups as "
            "position, angle, and scale. The persistent large state is raised 0.75 client "
            "units and scaled 1.2/1.1/1.2; every audited leaf angle vector is zero. Model "
            "bounds and the common VEFF +/-20 root envelope are render/culling data, not "
            "server collision radii."
        ),
        "rotation_boundary": (
            "The serialized graph join distinguishes class dependencies from instantiated controls. "
            "The eight tornado graphs instantiate no Angle3DGenerated control. Native generated-angle "
            "support exists as angle + speed*t + 0.5*acceleration*t^2, but it is not used by these "
            "graphs. Seventeen joined Angle3D:CoordRoot allocations are preserved as raw words because "
            "some contain links/flags; class names alone do not prove a visible spin curve or hazard yaw."
        ),
        "particle_boundary": (
            "Generated-position controls are instantiated only in WSS18 main (2) and the "
            "persistent small tornado (9). Native code evaluates linear/parabolic or damped "
            "translation, not circular rotation. GenerateMaster is a movement-distance particle "
            "emitter used by WSS15 main and the target-hit graphs. Native field offsets resolve count, "
            "travel spacing, randomized spacing, and probability inputs, while the generic evaluator "
            "resolves signed int16 node/component handles. The executable registers standard and random "
            "immediate/linear/parabolical/polynomial evaluators in two 64-slot tables. The native builder "
            "maps serialized pair 2 to standard and pair 3 to random, then indexes the selected "
            "table as base + uint16_type*0x30. The eight VEFF trees preserve 1,194 exact "
            "records: 367 polynomial type records, 800 terminal-slice descriptors, 23 inline "
            "native-type candidates, and four unresolved inline records, plus 1,068 raw "
            "terminal DWORDs. Serialized byte +2 is validated as graph overflow id 0 or 1 "
            "and copied to runtime +0x24; its behavior and the exact property-to-runtime-input "
            "join remain unresolved. Their 22 serialized controls expose 165 "
            "nested I/HH relocation/link records, not flat coefficient fields; 28 secondary words are "
            "handle-layout candidates and ten are distinct 0x10000000 sentinels. DrawResource is renderer "
            "dispatch. The persistent-large active ring uses TechCgfxShader2 with distortion 0.2, "
            "authored UV scroll 0/0/0, and scale 1/1. These controls explain particle presentation, "
            "not actor pursuit, hazard yaw, or hitboxes."
        ),
        "selector_boundary": (
            "Across all 20 installed m999 WSS banks, only WSS15 and WSS18 are wind-authored. "
            "WSS15 carries tatumaki/tn_hit; WSS18 carries taihuu/tm_hit/taihu_end "
            "and embeds a tatumaki marker in the typhoon VFX. Command-result packets still "
            "carry commandId and animationId independently, so the exact retail selector "
            "edge requires original server data or a retail packet capture."
        ),
        "model_state_packet_boundary": (
            "Opcode 0x0144 mode byte +0x04, not breakage byte +0x00, feeds queue type 3 and "
            "the init_msb%u on/off formatter. Garuda masks 0x10/0x20 are therefore mode bits "
            "4/5. Queue type 3 commits through the battle/action event path; exact retail "
            "publication and kick ordering remains capture-only."
        ),
        "command_data_boundary": (
            "Canonical commands 23556 and 23559 both serialize element 7 (Wind), recast 0, "
            "and damageSwing 0. Their recovered Garuda-specific Lua surfaces are identity-only "
            "subclasses with zero methods, so cadence and potency remain server-side evidence gaps."
        ),
        "south_wind_movement_boundary": (
            "LentigoGarudaTyphoon and four cross-content Lentigo specializations are identity-only. "
            "LentigoBaseClass only returns false from isMapMarkerVisibleForTalkable; MonsterBaseClass "
            "adds no methods, and NpcBaseClass_battle adds metadata/accessors but no movement method. "
            "The exact ffxivgame.exe has no ASCII Lentigo/GarudaTyphoon class token. Instantiate opcode "
            "0x00CC identifies the runtime class, while position opcode 0x00CF and speed opcode 0x00D0 "
            "are server-authored; exact target choice, path, speed, retargeting, and lifetime therefore "
            "require original server logic or a retail capture."
        ),
    }
    (output / "contract_summary.json").write_text(
        json.dumps(summary, indent=2) + "\n", encoding="utf-8", newline="\n"
    )
    print(json.dumps(summary, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

