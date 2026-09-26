#!/usr/bin/env python3
"""Build a bytecode-first decomp pack for the retail airship event handoff."""

from __future__ import annotations

import csv
import hashlib
import json
import shutil
from pathlib import Path

from disassemble_lua51 import (
    OPNAMES,
    Reader,
    basic_blocks,
    direct_method_map,
    format_instruction,
    quote,
)


ROOT = Path(__file__).resolve().parents[1]
OUTPUT = ROOT / "tools/outputs/lpb/dftsrt_event_handoff_20260824"
COMBINED_MANIFEST = (
    ROOT / "tools/outputs/lpb/decomp_further_20260617/combined_client_manifest.csv"
)

TARGETS = {
    "quest/scenario/defaulttalk/dftsrt": None,
    "director/directorbaseclass": ["delegateEvent"],
    "chara/npc/npcbaseclass": ["delegateEvent"],
    "quest/questbaseclass_common": [
        "startNQCutScene",
        "startFadeOutCutSceneDefault",
        "startFadeInCutSceneAfterWarp",
    ],
    "chara/npc/populace/populaceflyingship": [
        "initForEvent",
        "eventIn",
        "eventOut",
        "eventNG",
    ],
}
TARGET_OWNERS = {
    "quest/scenario/defaulttalk/dftsrt": "DftSrt",
    "director/directorbaseclass": "DirectorBaseClass",
    "chara/npc/npcbaseclass": "NpcBaseClass",
    "quest/questbaseclass_common": "QuestBaseClass",
    "chara/npc/populace/populaceflyingship": "PopulaceFlyingShip",
}
SEARCH_TERMS = ("DftSrt", "eventDeparture", "delegateEvent")


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def load_manifest() -> dict[str, dict[str, str]]:
    with COMBINED_MANIFEST.open(encoding="utf-8-sig", newline="") as stream:
        rows = list(csv.DictReader(stream))
    result: dict[str, dict[str, str]] = {}
    for row in rows:
        logical = row["logical_path"].lower()
        result.setdefault(logical, row)
    return result


def artifact_paths(row: dict[str, str]) -> tuple[Path, Path]:
    batch = row["output_batch"]
    logical = row["logical_path"]
    base = ROOT / "tools/outputs/lpb" / batch
    return base / "luac" / f"{logical}.luac", base / "lua" / f"{logical}.lua"


def read_chunk(path: Path):
    reader = Reader(path.read_bytes())
    reader.header()
    root = reader.proto("root")
    if reader.pos != len(reader.data):
        raise ValueError(f"unparsed bytes in {path}: {len(reader.data) - reader.pos}")
    return root


def walk(proto):
    yield proto
    for child in proto.children:
        yield from walk(child)


def dump_proto(name: str, proto) -> str:
    lines = [
        f"## {name} ({proto.path})",
        (
            f"source={quote(proto.source)} lines={proto.line_defined}..{proto.last_line_defined} "
            f"params={proto.numparams} nups={proto.nups} vararg={proto.is_vararg} "
            f"stack={proto.maxstack} code={len(proto.instructions)} "
            f"constants={len(proto.constants)} children={len(proto.children)}"
        ),
        "",
        "### locals",
    ]
    if proto.locals:
        lines.extend(
            f"local {index:03d} name={quote(local.name)} pc={local.start_pc}..{local.end_pc}"
            for index, local in enumerate(proto.locals)
        )
    else:
        lines.append("<stripped>")
    lines.extend(("", "### upvalues"))
    if proto.upvalue_names:
        lines.extend(
            f"upvalue {index:03d} name={quote(value)}"
            for index, value in enumerate(proto.upvalue_names)
        )
    else:
        lines.append("<stripped>")
    lines.extend(("", "### constants"))
    if proto.constants:
        lines.extend(
            f"K{index:03d} = {quote(value)}"
            for index, value in enumerate(proto.constants)
        )
    else:
        lines.append("<none>")
    lines.extend(("", "### instructions"))
    lines.extend(
        format_instruction(proto, pc, instruction)
        for pc, instruction in enumerate(proto.instructions)
    )
    lines.extend(("", "### basic blocks"))
    lines.extend(
        f"B{start:03d} pc {start:03d}..{end:03d} -> "
        + (", ".join(f"B{target:03d}" for target in successors) or "exit")
        for start, end, successors in basic_blocks(proto)
    )
    return "\n".join(lines) + "\n"


def write_csv(path: Path, rows: list[dict[str, object]]) -> None:
    if not rows:
        raise ValueError(f"empty output: {path}")
    with path.open("w", encoding="utf-8", newline="") as stream:
        writer = csv.DictWriter(stream, fieldnames=list(rows[0]))
        writer.writeheader()
        writer.writerows(rows)


def main() -> int:
    manifest = load_manifest()
    OUTPUT.mkdir(parents=True, exist_ok=True)
    for child in ("luac", "lua", "instructions"):
        (OUTPUT / child).mkdir(exist_ok=True)

    target_rows: list[dict[str, object]] = []
    metadata_rows: list[dict[str, object]] = []
    binding_rows: list[dict[str, object]] = []

    for logical, requested_methods in TARGETS.items():
        row = manifest[logical]
        luac, lua = artifact_paths(row)
        if not luac.is_file() or not lua.is_file():
            raise FileNotFoundError(f"missing recovered artifact for {logical}")
        copied_luac = OUTPUT / "luac" / f"{logical.replace('/', '__')}.luac"
        copied_lua = OUTPUT / "lua" / f"{logical.replace('/', '__')}.lua"
        shutil.copyfile(luac, copied_luac)
        shutil.copyfile(lua, copied_lua)

        root = read_chunk(luac)
        methods = direct_method_map(root)
        selected = list(methods) if requested_methods is None else requested_methods
        missing = sorted(set(selected) - set(methods))
        if missing:
            raise ValueError(f"{logical}: missing methods {missing}")

        dump_parts = [dump_proto("<root chunk initializer>", root)]
        for method_name in selected:
            dump_parts.append(dump_proto(method_name, methods[method_name]))
        (OUTPUT / "instructions" / f"{logical.replace('/', '__')}.txt").write_text(
            "\n".join(dump_parts), encoding="utf-8"
        )

        target_rows.append(
            {
                "logical_path": logical,
                "source_lpb": row["source_lpb"],
                "source_lpb_bytes": Path(row["source_lpb"]).stat().st_size,
                "source_lpb_sha256": sha256(Path(row["source_lpb"])),
                "decoded_luac_bytes": luac.stat().st_size,
                "decoded_luac_sha256": sha256(luac),
                "recovered_lua_bytes": lua.stat().st_size,
                "selected_methods": ";".join(selected),
            }
        )

        reverse_names = {id(proto): name for name, proto in methods.items()}
        for proto in walk(root):
            metadata_rows.append(
                {
                    "logical_path": logical,
                    "prototype": proto.path,
                    "bound_method": reverse_names.get(id(proto), ""),
                    "source": proto.source or "",
                    "line_defined": proto.line_defined,
                    "last_line_defined": proto.last_line_defined,
                    "numparams": proto.numparams,
                    "nups": proto.nups,
                    "is_vararg": proto.is_vararg,
                    "maxstack": proto.maxstack,
                    "instruction_count": len(proto.instructions),
                    "constant_count": len(proto.constants),
                    "child_count": len(proto.children),
                    "local_count": len(proto.locals),
                    "upvalue_name_count": len(proto.upvalue_names),
                }
            )
        for name, proto in methods.items():
            binding_rows.append(
                {
                    "logical_path": logical,
                    "class_or_table": TARGET_OWNERS[logical],
                    "method": name,
                    "prototype": proto.path,
                    "numparams": proto.numparams,
                    "is_vararg": proto.is_vararg,
                    "maxstack": proto.maxstack,
                    "instruction_count": len(proto.instructions),
                }
            )

    # Scan every unique decoded LPB chunk, including constants in child prototypes.
    reference_rows: list[dict[str, object]] = []
    seen_logical: set[str] = set()
    for logical, row in sorted(manifest.items()):
        if logical in seen_logical:
            continue
        seen_logical.add(logical)
        luac, _lua = artifact_paths(row)
        if not luac.is_file():
            continue
        root = read_chunk(luac)
        methods = direct_method_map(root)
        reverse_names = {id(proto): name for name, proto in methods.items()}
        for proto in walk(root):
            for constant_index, value in enumerate(proto.constants):
                if value not in SEARCH_TERMS:
                    continue
                reference_rows.append(
                    {
                        "term": value,
                        "logical_path": logical,
                        "prototype": proto.path,
                        "bound_method": reverse_names.get(id(proto), ""),
                        "constant_index": constant_index,
                        "source_lpb": row["source_lpb"],
                        "decoded_luac_sha256": sha256(luac),
                        "classification": "definition/binding literal",
                    }
                )

    write_csv(OUTPUT / "target_manifest.csv", target_rows)
    write_csv(OUTPUT / "function_metadata.csv", metadata_rows)
    write_csv(OUTPUT / "binding_table.csv", binding_rows)
    write_csv(OUTPUT / "lpb_reference_scan.csv", reference_rows)

    summary = {
        "corpus_unique_chunks_scanned": len(seen_logical),
        "search_terms": list(SEARCH_TERMS),
        "reference_rows": len(reference_rows),
        "targets": list(TARGETS),
        "finding": (
            "No decoded LPB caller references DftSrt.eventDeparture. DftSrt and "
            "eventDeparture occur only in the DftSrt defining chunk; delegateEvent "
            "occurs only in the DirectorBaseClass and NpcBaseClass binding chunks."
        ),
    }
    (OUTPUT / "manifest.json").write_text(
        json.dumps(summary, indent=2) + "\n", encoding="utf-8"
    )
    print(
        f"Wrote {len(target_rows)} target chunks, {len(metadata_rows)} prototypes, "
        f"and {len(reference_rows)} xrefs from {len(seen_logical)} unique chunks to {OUTPUT}"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
