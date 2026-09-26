#!/usr/bin/env python3
"""Build a reproducible Ifrit ground-VFX and Infernal Nail evidence bundle.

The installed 1.23b client is read-only.  This tool verifies the principal
candidate files, recursively inventories PWIB/SEDB resources, compares the
effect-only m852 banks with their native m999 counterparts, and records the
serialized VEFF/control and scheduler vocabulary used by the candidates.
"""

from __future__ import annotations

import argparse
import collections
import csv
import hashlib
import json
import re
import struct
from dataclasses import dataclass
from pathlib import Path


DEFAULT_CLIENT = Path(r"C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV")
DEFAULT_OUTPUT = Path("tools/outputs/ifrit-ground-vfx-decomp-20260805")

SOURCE_DEFS = {
    "m852_wss05": (
        r"client\chara\mon\m852\act\emp_emp\wss\base\0005",
        "2c01f01d23b873e56b870e5ff10704d70f6f12bca187a45e8a6e4d65f5d56f0f",
        "radial/generated Ifrit-owned candidate",
    ),
    "m852_wss12": (
        r"client\chara\mon\m852\act\emp_emp\wss\base\0012",
        "e3072750c0d82ed77932c93ad620e65f66b931a7f584a9d5e2b74da83d8713d2",
        "large fire-layout family A",
    ),
    "m852_wss13": (
        r"client\chara\mon\m852\act\emp_emp\wss\base\0013",
        "6361322e500c5292ae93c05468fa3eb6d01ffa3744cb6f7be10b2b45c9079629",
        "large fire-layout family B",
    ),
    "m852_wss14": (
        r"client\chara\mon\m852\act\emp_emp\wss\base\0014",
        "46f750379dafa78f65360de3f9aca5034c94ea968d39d422bd4ed1539dfca3e4",
        "large fire-layout family C",
    ),
    "m852_wss17": (
        r"client\chara\mon\m852\act\emp_emp\wss\base\0017",
        "fc11450d9c3459fb70af1e6a2b623786a3aa5ea07c9002002a3273cebe5ab8b3",
        "three-second paw/hand-offset ring; live-negative for Eruption",
    ),
    "m852_wss21": (
        r"client\chara\mon\m852\act\emp_emp\wss\base\0021",
        "d365c2f62241323971e73880bddd3b1908bfa8ffea269d17fa3dd158f25ecd34",
        "m999 WSS2 import wrapper",
    ),
    "m852_wss22": (
        r"client\chara\mon\m852\act\emp_emp\wss\base\0022",
        "035e5346203e2d9a715b8c89cee14d8f0001fc38d7b43bc1bf74c44db24e78e3",
        "m999 WSS3 import wrapper",
    ),
    "m999_wss02": (
        r"client\chara\mon\m999\act\emp_emp\wss\base\0002",
        "495d76a562dbe2bebfb2698468dd114cd2aa024e6f22004b9fd0520ddd72cfc1",
        "native small Eruption impact package",
    ),
    "m999_wss03": (
        r"client\chara\mon\m999\act\emp_emp\wss\base\0003",
        "0ddecf22508dcd151e302c7484981932b52db02f8ca926c3a114c65168046ac6",
        "native large Eruption impact package",
    ),
    "m524_wss01": (
        r"client\chara\mon\m524\act\emp_emp\wss\base\0001",
        "c64e37d06b0cf34df4e5c77d8de4b3fb9c6aad4851af223b61502a07c36e35df",
        "Infernal Nail rise/ignite action",
    ),
    "m524_bid00": (
        r"client\chara\mon\m524\act\emp_emp\bid\base\0000",
        "d2b2761da954a4704145e7ed644e31d39b20d6742b499d76eba9adfbf5df8c17",
        "Infernal Nail persistent/activation/death state bank",
    ),
    "bowl_layout": (
        r"data\61\5A\00\08.DAT",
        "56b24e6aca53911810848baf7be254a2c20038d8c127bcc0c8603ba6b0614e7c",
        "Bowl layout and persistent boundary ring",
    ),
}

PAIR_DEFS = (
    ("m852_wss21", "m999_wss02"),
    ("m852_wss22", "m999_wss03"),
)

CONTROL_PATTERN = re.compile(
    r"(?:ManyGenerate[A-Za-z0-9_:]+|GenerateMaster[A-Za-z0-9_:]*|"
    r"Position3D[A-Za-z0-9_:]*|Rotation3D[A-Za-z0-9_:]*|"
    r"Scale3D[A-Za-z0-9_:]*)"
)
SCHEDULER_PATTERN = re.compile(
    r"(?:Rapture[A-Za-z0-9_]+Clip|Lay[A-Za-z0-9_]+Clip|"
    r"system/[A-Za-z0-9_./-]+|[A-Za-z0-9_./-]+\.sch\.pkl)"
)


@dataclass(frozen=True)
class Resource:
    index: int
    kind: int
    resource_type: int
    resource_id: str
    resource_path: str
    payload: bytes


def digest(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


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
        if file_size != len(data) or resource_offset != 0x10:
            raise ValueError("unsupported PWIB header")
        if not resource_offset <= data_offset <= len(data):
            raise ValueError("invalid PWIB data offset")
        root = resource_offset
    elif data[:8] == b"SEDBRES ":
        root = 0
    else:
        raise ValueError("not a PWIB/SEDBRES resource container")

    if data[root : root + 8] != b"SEDBRES ":
        raise ValueError("resource root is not SEDBRES")
    count, strings_offset, string_count, _ = struct.unpack_from("<IIII", data, root + 0x30)
    if count < 2 or string_count != count:
        raise ValueError("unsupported SEDBRES table")
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
            Resource(index, kind, resource_type, resource_ids[index], resource_paths[index], payload)
        )
    return resources


def payload_tag(payload: bytes) -> str:
    if payload.startswith(b"PWIB"):
        return "PWIB"
    if payload.startswith(b"SEDB"):
        return payload[:8].rstrip(b"\0 ").decode("ascii", errors="replace")
    return ""


def ascii_strings(data: bytes, minimum: int = 4) -> list[tuple[int, str]]:
    pattern = rb"[\x20-\x7E]{" + str(minimum).encode("ascii") + rb",}"
    return [(match.start(), match.group().decode("ascii", errors="replace")) for match in re.finditer(pattern, data)]


def walk_resources(source: str, data: bytes) -> tuple[list[dict[str, object]], list[tuple[str, Resource]]]:
    rows: list[dict[str, object]] = []
    objects: list[tuple[str, Resource]] = []

    def walk(blob: bytes, layer: str) -> None:
        for resource in parse_pwib(blob):
            tag = payload_tag(resource.payload)
            rows.append(
                {
                    "source": source,
                    "layer": layer,
                    "index": resource.index,
                    "resource_id": resource.resource_id,
                    "resource_path": resource.resource_path,
                    "payload_tag": tag,
                    "bytes": len(resource.payload),
                    "sha256": digest(resource.payload),
                }
            )
            objects.append((layer, resource))
            if resource.payload.startswith((b"PWIB", b"SEDBRES ")):
                walk(resource.payload, f"{layer}/RES:{resource.resource_id or resource.index}")

    walk(data, "outer")
    return rows, objects


def write_csv(path: Path, rows: list[dict[str, object]]) -> None:
    fieldnames = list(rows[0]) if rows else []
    with path.open("w", encoding="utf-8", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)


def resource_signature(row: dict[str, object]) -> tuple[str, str]:
    return str(row["payload_tag"]), str(row["sha256"])


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--client", type=Path, default=DEFAULT_CLIENT)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    args = parser.parse_args()

    repo = Path(__file__).resolve().parents[1]
    output = args.output if args.output.is_absolute() else repo / args.output
    output.mkdir(parents=True, exist_ok=True)

    source_rows: list[dict[str, object]] = []
    resource_rows: list[dict[str, object]] = []
    control_rows: list[dict[str, object]] = []
    scheduler_rows: list[dict[str, object]] = []
    raw_by_source: dict[str, bytes] = {}
    rows_by_source: dict[str, list[dict[str, object]]] = {}

    for source, (relative, expected, role) in SOURCE_DEFS.items():
        path = args.client / relative
        data = path.read_bytes()
        actual = digest(data)
        if actual != expected:
            raise ValueError(f"{source}: expected {expected}, got {actual} ({path})")
        raw_by_source[source] = data
        source_rows.append(
            {
                "source": source,
                "role": role,
                "relative_path": relative.replace("\\", "/"),
                "bytes": len(data),
                "sha256": actual,
            }
        )

        if data.startswith(b"PWIB"):
            rows, objects = walk_resources(source, data)
            resource_rows.extend(rows)
            rows_by_source[source] = rows
            for layer, resource in objects:
                tag = payload_tag(resource.payload)
                for offset, value in ascii_strings(resource.payload):
                    for match in CONTROL_PATTERN.finditer(value) if tag == "SEDBveff" else ():
                        control_rows.append(
                            {
                                "source": source,
                                "layer": layer,
                                "resource_id": resource.resource_id,
                                "resource_path": resource.resource_path,
                                "payload_tag": tag,
                                "payload_sha256": digest(resource.payload),
                                "string_offset_hex": f"0x{offset + match.start():X}",
                                "control": match.group(),
                            }
                        )
                    for match in SCHEDULER_PATTERN.finditer(value) if tag == "SEDBSCB" else ():
                        scheduler_rows.append(
                            {
                                "source": source,
                                "layer": layer,
                                "resource_id": resource.resource_id,
                                "resource_path": resource.resource_path,
                                "payload_tag": tag,
                                "payload_sha256": digest(resource.payload),
                                "string_offset_hex": f"0x{offset + match.start():X}",
                                "scheduler_token": match.group(),
                            }
                        )
        else:
            rows_by_source[source] = []
            for offset, value in ascii_strings(data):
                for match in SCHEDULER_PATTERN.finditer(value):
                    scheduler_rows.append(
                        {
                            "source": source,
                            "layer": "raw",
                            "resource_id": "",
                            "resource_path": relative.replace("\\", "/"),
                            "payload_tag": data[:8].decode("ascii", errors="replace"),
                            "payload_sha256": actual,
                            "string_offset_hex": f"0x{offset + match.start():X}",
                            "scheduler_token": match.group(),
                        }
                    )

    comparison_rows: list[dict[str, object]] = []
    comparison_detail: dict[str, object] = {}
    for left, right in PAIR_DEFS:
        left_rows = rows_by_source[left]
        right_rows = rows_by_source[right]
        left_counts = collections.Counter(resource_signature(row) for row in left_rows)
        right_counts = collections.Counter(resource_signature(row) for row in right_rows)
        shared = left_counts & right_counts
        left_only = left_counts - right_counts
        right_only = right_counts - left_counts
        pair = f"{left}__{right}"
        comparison_rows.append(
            {
                "pair": pair,
                "left_resource_count": sum(left_counts.values()),
                "right_resource_count": sum(right_counts.values()),
                "shared_identical_count": sum(shared.values()),
                "left_only_count": sum(left_only.values()),
                "right_only_count": sum(right_only.values()),
            }
        )
        comparison_detail[pair] = {
            "shared": [
                {"payload_tag": tag, "sha256": sha, "count": count}
                for (tag, sha), count in sorted(shared.items())
            ],
            "left_only": [
                {"payload_tag": tag, "sha256": sha, "count": count}
                for (tag, sha), count in sorted(left_only.items())
            ],
            "right_only": [
                {"payload_tag": tag, "sha256": sha, "count": count}
                for (tag, sha), count in sorted(right_only.items())
            ],
        }

    source_tokens: list[dict[str, object]] = []
    for source, data in raw_by_source.items():
        strings = [value for _, value in ascii_strings(data)]
        for token in (
            "RaptureActionSubStatusSchKickClip",
            "Position3DMapBind:CoordRoot",
            "ManyGenerateUnitTime",
            "ManyGenerateFormSphere",
            "ManyGenerateMotionEmission",
            "ManyGenerateDrawLine",
            "sgrp_vfx_ifring",
            "isgrp_016280",
            "cbbm_sp_01",
            "cbxs_st0to1",
            "cbbm_ded",
            "cbbm_dedpose",
            "cbbm_msb4_1",
        ):
            source_tokens.append(
                {"source": source, "token": token, "present": int(any(token in value for value in strings))}
            )

    write_csv(output / "sources.csv", source_rows)
    write_csv(output / "resources.csv", resource_rows)
    write_csv(output / "veff_controls.csv", control_rows)
    write_csv(output / "scheduler_tokens.csv", scheduler_rows)
    write_csv(output / "pair_equivalence.csv", comparison_rows)
    write_csv(output / "source_tokens.csv", source_tokens)
    (output / "pair_equivalence_detail.json").write_text(
        json.dumps(comparison_detail, indent=2), encoding="utf-8"
    )

    summary = {
        "source_count": len(source_rows),
        "resource_count": len(resource_rows),
        "veff_control_occurrences": len(control_rows),
        "scheduler_token_occurrences": len(scheduler_rows),
        "comparisons": comparison_rows,
    }
    (output / "summary.json").write_text(json.dumps(summary, indent=2), encoding="utf-8")
    print(json.dumps(summary, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
