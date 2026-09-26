#!/usr/bin/env python3
"""Build a focused inventory for Ifrit/Kuroko model-state VFX packages.

This complements build_ifrit_ground_vfx_decomp.py.  It focuses on the
model-state carriers that are not ordinary WSS impact banks and records
resource identity across native m999 and imported m852 packages.
"""

from __future__ import annotations

import argparse
import collections
import json
from pathlib import Path

from build_ifrit_ground_vfx_decomp import (
    CONTROL_PATTERN,
    SCHEDULER_PATTERN,
    ascii_strings,
    digest,
    payload_tag,
    walk_resources,
    write_csv,
)


DEFAULT_CLIENT = Path(r"C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV")
DEFAULT_OUTPUT = Path("tools/outputs/ifrit-model-state-decomp-20260805")

SOURCE_DEFS = {
    "m999_wss04": (
        r"client\chara\mon\m999\act\emp_emp\wss\base\0004",
        "769514e370b57a5024e1f646fbe7ab05563f802c615e2f32890c51895d7a9423",
        "native Kuroko state-kick action used by command 23595",
    ),
    "m999_wss05": (
        r"client\chara\mon\m999\act\emp_emp\wss\base\0005",
        "d5f262f0d06fe1fa8f1f990df3333cc8093a1c72fea22aedc507aba16baaec72",
        "unmapped native Kuroko state-kick sibling",
    ),
    "m999_e001": (
        r"client\chara\mon\m999\equ\e001\met_mdl\0001",
        "c80a1e587b5b0e21cc19cad2baa08c75ed31482ea3fd5219e125053c00e3b105",
        "native Kuroko model-state resources, including state 4 and state 5",
    ),
    "m852_bid00": (
        r"client\chara\mon\m852\act\emp_emp\bid\base\0000",
        "d628997bfead8781208960fb5c7bde0f73a57a51acc1a66e9d497c7f2deb7e50",
        "canonical Ifrit BID and imported Kuroko states",
    ),
    "m524_e002": (
        r"client\chara\mon\m524\equ\e002\met_mdl\0001",
        "5a5a4414c7327ca5dd0f04d78677e76827d535126b8db3edd5633a7ea24784ff",
        "Infernal Nail active aura and complete death package",
    ),
}

STATE_TOKENS = (
    "init_msb4_0",
    "init_msb4_1",
    "init_msb5_0",
    "init_msb5_1",
    "init_msb7_0",
    "init_msb7_1",
    "msb4",
    "msb5",
    "dead",
    "dedpose",
)


def relevant(row: dict[str, object]) -> bool:
    text = " ".join(
        str(row.get(key, ""))
        for key in ("layer", "resource_id", "resource_path")
    ).lower()
    return any(token in text for token in STATE_TOKENS)


def signature(row: dict[str, object]) -> tuple[str, str]:
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
    rows_by_source: dict[str, list[dict[str, object]]] = {}

    for source, (relative, expected_sha, role) in SOURCE_DEFS.items():
        path = args.client / relative
        data = path.read_bytes()
        actual_sha = digest(data)
        if actual_sha != expected_sha:
            raise ValueError(
                f"{source}: expected {expected_sha}, got {actual_sha} ({path})"
            )

        source_rows.append(
            {
                "source": source,
                "role": role,
                "relative_path": relative.replace("\\", "/"),
                "bytes": len(data),
                "sha256": actual_sha,
            }
        )

        rows, objects = walk_resources(source, data)
        rows_by_source[source] = rows
        resource_rows.extend(rows)

        for layer, resource in objects:
            tag = payload_tag(resource.payload)
            for offset, value in ascii_strings(resource.payload):
                if tag == "SEDBveff":
                    for match in CONTROL_PATTERN.finditer(value):
                        control_rows.append(
                            {
                                "source": source,
                                "layer": layer,
                                "resource_id": resource.resource_id,
                                "resource_path": resource.resource_path,
                                "payload_sha256": digest(resource.payload),
                                "string_offset_hex": f"0x{offset + match.start():X}",
                                "control": match.group(),
                            }
                        )
                if tag == "SEDBSCB":
                    for match in SCHEDULER_PATTERN.finditer(value):
                        scheduler_rows.append(
                            {
                                "source": source,
                                "layer": layer,
                                "resource_id": resource.resource_id,
                                "resource_path": resource.resource_path,
                                "payload_sha256": digest(resource.payload),
                                "string_offset_hex": f"0x{offset + match.start():X}",
                                "scheduler_token": match.group(),
                            }
                        )

    state_rows = [row for row in resource_rows if relevant(row)]
    state_controls = [row for row in control_rows if relevant(row)]
    state_schedulers = [row for row in scheduler_rows if relevant(row)]

    write_csv(output / "sources.csv", source_rows)
    write_csv(output / "resources.csv", resource_rows)
    write_csv(output / "state_resources.csv", state_rows)
    write_csv(output / "veff_controls.csv", control_rows)
    write_csv(output / "state_veff_controls.csv", state_controls)
    write_csv(output / "scheduler_tokens.csv", scheduler_rows)
    write_csv(output / "state_scheduler_tokens.csv", state_schedulers)

    wss4 = collections.Counter(signature(row) for row in rows_by_source["m999_wss04"])
    wss5 = collections.Counter(signature(row) for row in rows_by_source["m999_wss05"])
    wss_shared = wss4 & wss5
    wss_comparison = {
        "wss4_resource_count": sum(wss4.values()),
        "wss5_resource_count": sum(wss5.values()),
        "shared_identical_count": sum(wss_shared.values()),
        "wss4_only_count": sum((wss4 - wss5).values()),
        "wss5_only_count": sum((wss5 - wss4).values()),
        "shared": [
            {"payload_tag": tag, "sha256": sha, "count": count}
            for (tag, sha), count in sorted(wss_shared.items())
        ],
    }
    (output / "wss04_wss05_equivalence.json").write_text(
        json.dumps(wss_comparison, indent=2), encoding="utf-8"
    )

    native_by_signature: dict[tuple[str, str], list[dict[str, object]]] = {}
    imported_by_signature: dict[tuple[str, str], list[dict[str, object]]] = {}
    for row in rows_by_source["m999_e001"]:
        native_by_signature.setdefault(signature(row), []).append(row)
    for row in rows_by_source["m852_bid00"]:
        imported_by_signature.setdefault(signature(row), []).append(row)

    shared_rows: list[dict[str, object]] = []
    for shared_signature in sorted(native_by_signature.keys() & imported_by_signature.keys()):
        tag, sha = shared_signature
        for native in native_by_signature[shared_signature]:
            for imported in imported_by_signature[shared_signature]:
                if relevant(native) or relevant(imported):
                    shared_rows.append(
                        {
                            "payload_tag": tag,
                            "sha256": sha,
                            "native_layer": native["layer"],
                            "native_resource_id": native["resource_id"],
                            "native_resource_path": native["resource_path"],
                            "imported_layer": imported["layer"],
                            "imported_resource_id": imported["resource_id"],
                            "imported_resource_path": imported["resource_path"],
                        }
                    )
    write_csv(output / "m999_m852_shared_state_resources.csv", shared_rows)

    summary = {
        "source_count": len(source_rows),
        "resource_count": len(resource_rows),
        "state_resource_count": len(state_rows),
        "veff_control_count": len(control_rows),
        "state_veff_control_count": len(state_controls),
        "state_scheduler_token_count": len(state_schedulers),
        "shared_native_import_state_rows": len(shared_rows),
        "wss04_wss05": wss_comparison,
    }
    (output / "summary.json").write_text(json.dumps(summary, indent=2), encoding="utf-8")
    print(json.dumps(summary, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
