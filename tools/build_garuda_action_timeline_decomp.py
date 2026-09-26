#!/usr/bin/env python3
"""Read-only native Garuda/feather/stone action timeline recovery.

Reuses the validated PWIB, SCB, MCB and MTB parsers. Writes derived JSON,
not a patched client. Unknown scheduler shapes remain explicit diagnostics.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import re
from pathlib import Path

from build_garuda_tornado_decomp import (
    DEFAULT_CLIENT, TYPE_LABELS, ascii_strings,
    payload_tag, read_executable_verified, scb_resource_table, walk_pwib_resources,
)
from build_monster_action_scheduler_contract import parse_mcb, parse_mtb, parse_scheduler


def digest(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def sources(client: Path):
    # A control-only m999 scheduler commits queued persistent wind states.
    yield "m999_wss16", client / "client/chara/mon/m999/act/emp_emp/wss/base/0016"
    for model, count in ((851, 14), (527, 4), (526, 5)):
        root = client / f"client/chara/mon/m{model}"
        yield f"m{model}_bid", root / "act/emp_emp/bid/base/0000"
        for index in range(1, count + 1):
            yield f"m{model}_wss{index:02}", root / f"act/emp_emp/wss/base/{index:04}"
        for path in sorted((root / "equ").glob("*/*_mdl/*")):
            yield f"m{model}_" + "_".join(path.relative_to(root / "equ").parts), path


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--client-root", type=Path, default=DEFAULT_CLIENT)
    parser.add_argument("--output-dir", type=Path,
                        default=Path("outputs/garuda-action-timeline-decomp-20260907"))
    args = parser.parse_args()
    # Pin the installed client generation before deriving evidence from it.
    read_executable_verified(args.client_root)
    output = args.output_dir
    output.mkdir(parents=True, exist_ok=True)
    manifest, summaries, diagnostics = [], [], []
    all_clips, all_motions = [], []
    for source, path in sources(args.client_root):
        data = path.read_bytes()
        relative = path.relative_to(args.client_root).as_posix()
        manifest.append(dict(source=source, path=relative, bytes=len(data), sha256=digest(data)))
        resources, clips, motions = [], [], []
        for layer, resource in walk_pwib_resources(data):
            payload = resource.payload
            row = dict(layer=layer, id=resource.resource_id, path=resource.resource_path,
                       type=TYPE_LABELS.get(resource.resource_type, hex(resource.resource_type)),
                       tag=payload_tag(payload), bytes=len(payload), sha256=digest(payload))
            strings = ascii_strings(payload)
            # Only textual payload tokens; never assign an ability from its WSS ordinal.
            row["effect_paths"] = sorted(set(s for s in strings if ".veffbin" in s))
            row["motion_names"] = sorted(set(s for s in strings if re.fullmatch(r"c[bn][bm][mp]_[\w]+", s)))
            if payload.startswith(b"SEDBSCB"):
                try:
                    header, actors, blocks, graph = parse_scheduler(payload)
                    row["scheduler_header"] = header
                    row["scheduler_actors"] = actors
                    row["scheduler_blocks"] = blocks
                    for clip in graph:
                        clip["source"] = source
                        clip["layer"] = layer
                        clip["scheduler"] = resource.resource_id
                        start = int(clip["record_offset_hex"], 16) + 8
                        body = payload[start:start + clip["body_bytes"]]
                        clip["entry_payload_hex"] = body.hex(" ")
                        clip["payload_ascii"] = ascii_strings(body)
                    clips.extend(graph)
                    row["resource_references"] = scb_resource_table(payload)
                except ValueError as error:
                    diagnostic = dict(source=source, layer=layer, resource=resource.resource_id,
                                      tag=row["tag"], error=str(error))
                    diagnostics.append(diagnostic)
                    row["parse_diagnostic"] = str(error)
            elif payload.startswith(b"SEDBmtb"):
                metrics = parse_mtb(payload)
                row["motion_metrics"] = metrics
                motions.append(dict(source=source, layer=layer, resource=resource.resource_id, **metrics))
            elif payload.startswith(b"SEDBMCB"):
                try:
                    metrics, entries = parse_mcb(payload, resource.resource_id)
                    row["motion_command_header"] = metrics
                    row["motion_command_entries"] = entries
                except ValueError as error:
                    diagnostics.append(dict(source=source, layer=layer, resource=resource.resource_id,
                                            tag=row["tag"], error=str(error)))
                    row["parse_diagnostic"] = str(error)
            resources.append(row)
        all_clips.extend(clips)
        all_motions.extend(motions)
        record = dict(source=source, relative_path=relative, sha256=digest(data),
                      resources=resources, scheduler_clips=clips)
        (output / f"{source}.json").write_text(json.dumps(record, indent=2) + "\n", encoding="utf-8")
        summaries.append(dict(source=source, resources=len(resources), clips=len(clips),
                              motions=len(motions), effect_paths=sorted(set(
                                  effect for row in resources for effect in row["effect_paths"]))))
    for name, value in (("manifest", manifest), ("summary", summaries),
                        ("scheduler_clips", all_clips), ("motion_metrics", all_motions),
                        ("parse_diagnostics", diagnostics)):
        (output / f"{name}.json").write_text(json.dumps(value, indent=2) + "\n", encoding="utf-8")
    totals = dict(sources=len(manifest), resources=sum(row["resources"] for row in summaries),
                  clips=len(all_clips), motions=len(all_motions), diagnostics=len(diagnostics))
    print(json.dumps(totals, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
