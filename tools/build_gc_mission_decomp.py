#!/usr/bin/env python3
"""Reproduce the 18-mission GC bytecode/scene evidence pass without running game code.

The tiny evaluator accepts only the eight opcodes present in these chunks.
Client APIs are recording stubs: their internals, server state, and gameplay
are NOT emulated. All unsupported instructions and API return uses fail closed.
"""
from __future__ import annotations

import argparse
import csv
import hashlib
import itertools
import json
import math
import re
from dataclasses import asdict, dataclass
from pathlib import Path

from decompile_totorak_cutscene_setup import decode_actor_dictionary, decode_setup_records
from disassemble_lua51 import OPNAMES, Reader, direct_method_map, format_instruction

ROOT = Path(__file__).resolve().parents[1]
RECOVERED = ROOT / "tools/outputs/lpb/decomp_more_20260617"
CLIENT = Path(r"C:/Program Files (x86)/SquareEnix/FINAL FANTASY XIV")
OUTPUT = ROOT / "outputs/gc-mission-decomp-20260904"
QUESTS = {
    **{f"com0{city}{n}": base + n for city, base in (("l", 111400), ("g", 111600), ("u", 111800)) for n in range(1, 5)},
    **{f"com5{city}{n}": base + 10 + n for city, base in (("l", 111400), ("g", 111600), ("u", 111800)) for n in range(2)},
}
SCENES = tuple(f"com0{city}{tail}" for city in "lgu" for tail in ("105", "110", "410"))


@dataclass(frozen=True)
class ObjectRef:
    name: str


@dataclass(frozen=True)
class MethodRef:
    owner: ObjectRef
    name: str


def lua_equal(left, right):
    # Python's True == 1 and False == 0 must never leak into Lua EQ.
    if isinstance(left, bool) or isinstance(right, bool):
        return type(left) is type(right) and left == right
    return left == right


def serial(value):
    if isinstance(value, ObjectRef):
        return {"object": value.name}
    if isinstance(value, (list, tuple)):
        return [serial(v) for v in value]
    return value


def read_chunk(path):
    reader = Reader(path.read_bytes())
    reader.header()
    proto = reader.proto("root")
    if reader.pos != len(reader.data):
        raise ValueError(f"Unconsumed bytecode in {path}")
    return proto


def trace(proto, extra_args=(), choice=1, salute=0, api_returns=None):
    """Execute one method's control flow with explicit external-return assumptions."""
    values = [ObjectRef("quest"), ObjectRef("player"), ObjectRef("eventOwner"), *extra_args]
    registers = {i: values[i] if i < len(values) else None for i in range(proto.numparams)}
    calls, edges = [], []
    pc = 0

    def register(index):
        if index not in registers:
            raise ValueError(f"Uninitialized R{index} at {pc}")
        return registers[index]

    def rk(operand):
        return proto.constants[operand & 255] if operand & 256 else register(operand)

    for _ in range(20000):
        ins = proto.instructions[pc]
        op = OPNAMES[ins.op]
        next_pc = pc + 1
        if op == "LOADK":
            registers[ins.a] = proto.constants[ins.bx]
        elif op == "MOVE":
            registers[ins.a] = register(ins.b)
        elif op == "GETGLOBAL":
            name = proto.constants[ins.bx]
            if name not in ("worldMaster", "desktopWidget"):
                raise ValueError(f"Unsupported global {name}")
            registers[ins.a] = ObjectRef(name)
        elif op == "SELF":
            owner, method = register(ins.b), rk(ins.c)
            if not isinstance(owner, ObjectRef) or not isinstance(method, str):
                raise ValueError(f"Unsupported SELF at {pc}")
            registers[ins.a + 1] = owner
            registers[ins.a] = MethodRef(owner, method)
        elif op == "CALL":
            method = register(ins.a)
            if not isinstance(method, MethodRef) or ins.b == 0 or ins.c not in (1, 2):
                raise ValueError(f"Unsupported CALL at {pc}")
            args = [register(i) for i in range(ins.a + 1, ins.a + ins.b)]
            if args[0] != method.owner:
                raise ValueError(f"Invalid method receiver at {pc}")
            calls.append({"pc": pc, "offset": f"0x{ins.offset:X}", "owner": method.owner.name,
                          "method": method.name, "args": serial(args[1:])})
            if ins.c == 2:
                if api_returns is not None and method.name in api_returns:
                    result = api_returns[method.name]
                    registers[ins.a] = result(args[1:]) if callable(result) else result
                elif method.name in ("ask", "showQuestInfomation"):
                    registers[ins.a] = choice
                elif method.name == "doSalute":
                    registers[ins.a] = salute
                else:
                    raise ValueError(f"No return model for {method.name} at {pc}")
        elif op == "EQ":
            if lua_equal(rk(ins.b), rk(ins.c)) != bool(ins.a):
                next_pc += 1
            edges.append([pc, next_pc])
        elif op == "JMP":
            next_pc += ins.sbx
        elif op == "RETURN":
            if ins.b == 0:
                raise ValueError("Variable return unsupported")
            return {"args": serial(extra_args), "choice": choice, "salute": salute,
                    "returns": serial([register(i) for i in range(ins.a, ins.a + ins.b - 1)]),
                    "calls": calls, "eq_edges": edges}
        else:
            raise ValueError(f"Unsupported {op} at {pc}")
        if not 0 <= next_pc < len(proto.instructions):
            raise ValueError(f"Invalid branch target {next_pc}")
        pc = next_pc
    raise ValueError("Instruction budget exhausted")


def write_json(path, value):
    path.write_text(json.dumps(value, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")


def write_csv(path, rows):
    if not rows:
        raise ValueError(f"No rows for {path}")
    with path.open("w", encoding="utf-8", newline="") as stream:
        writer = csv.DictWriter(stream, fieldnames=list(rows[0]))
        writer.writeheader()
        writer.writerows(rows)


def source_info(path, relative_to=ROOT):
    data = path.read_bytes()
    return {"path": path.relative_to(relative_to).as_posix(), "bytes": len(data),
            "sha256": hashlib.sha256(data).hexdigest()}


def build_methods(output):
    methods, inventory, dialogue = [], [], []
    disassembly = []
    for code, quest_id in sorted(QUESTS.items(), key=lambda row: row[1]):
        path = RECOVERED / f"luac/quest/scenario/com/{code}.luac"
        protos = direct_method_map(read_chunk(path))
        with (ROOT / f"docs/Dat Mining/{code}.csv").open(encoding="utf-8-sig", newline="") as stream:
            texts = {int(row[0]): row[2] for row in csv.reader(stream) if row and row[0].isdigit()}
        for name, proto in protos.items():
            if not name.startswith("processEvent"):
                continue
            extras = proto.numparams - 3
            if extras < 0 or extras > 3:
                raise ValueError(f"Unexpected signature {code}.{name}")
            variants, seen, edges = [], set(), set()
            # Exhaustive over this finite sample domain, NOT arbitrary client inputs.
            for args in itertools.product((None, 0, 1, False, True), repeat=extras):
                for choice, salute in itertools.product((0, 1), repeat=2):
                    result = trace(proto, args, choice, salute)
                    edges.update(tuple(edge) for edge in result["eq_edges"])
                    signature = json.dumps([result["calls"], result["returns"]], sort_keys=True)
                    if signature not in seen:
                        seen.add(signature)
                        variants.append(result)
            comparisons = [pc for pc, ins in enumerate(proto.instructions) if OPNAMES[ins.op] == "EQ"]
            missing_edges = [[pc, target] for pc in comparisons for target in (pc + 1, pc + 2)
                             if (pc, target) not in edges]
            method = {"quest_id": quest_id, "code": code, "method": name, "source": source_info(path),
                      "parameter_count": proto.numparams, "extra_parameter_count": extras,
                      "instructions": len(proto.instructions), "sampled_eq_edges": sorted(edges),
                      "unsampled_eq_edges": missing_edges, "variants": variants}
            methods.append(method)
            text_ids = sorted({int(call["args"][1]) for v in variants for call in v["calls"]
                               if call["method"] in ("say", "ask")})
            inventory.append({"quest_id": quest_id, "code": code, "method": name,
                              "extra_parameters": extras, "instructions": len(proto.instructions),
                              "distinct_traces": len(variants), "eq_edges": len(edges),
                              "unsampled_eq_edges": len(missing_edges),
                              "text_ids": ";".join(map(str, text_ids))})
            for text_id in text_ids:
                if text_id not in texts:
                    raise ValueError(f"Missing text {code}/{text_id}")
                dialogue.append({"quest_id": quest_id, "code": code, "method": name,
                                 "text_id": text_id, "english": texts[text_id]})
            disassembly.append(f"\n## {quest_id} {code}.{name} params={proto.numparams}\n")
            disassembly.extend(format_instruction(proto, pc, ins) + "\n"
                               for pc, ins in enumerate(proto.instructions))
    write_json(output / "event-traces.json", {"boundary": "Only bytecode flow executes; client APIs are stubs.",
               "input_domain": [None, 0, 1, False, True], "external_choice_and_salute_domain": [0, 1],
               "methods": methods})
    write_csv(output / "method-inventory.csv", inventory)
    write_csv(output / "event-text.csv", dialogue)
    (output / "bytecode.txt").write_text("".join(disassembly), encoding="utf-8")
    return inventory


def build_directors(output):
    rows, disassembly = [], []
    paths = [f"director/quest/simplequestbattle/questdirectorcom0{city}{number}01"
             for city in "lgu" for number in (1, 4)]
    paths.append("chara/npc/monster/empire/empireconjurerquestcom0x4")
    for logical in paths:
        path = RECOVERED / f"luac/{logical}.luac"
        root = read_chunk(path)
        rows.append({**source_info(path), "logical_path": logical,
                     "child_prototypes": len(root.children), "method_count": len(direct_method_map(root)),
                     "constants": root.constants})
        disassembly.append(f"\n## {logical}\n")
        disassembly.extend(format_instruction(root, pc, ins) + "\n" for pc, ins in enumerate(root.instructions))
    write_json(output / "director-evidence.json", rows)
    (output / "director-bytecode.txt").write_text("".join(disassembly), encoding="utf-8")


def build_scenes(output, client_root):
    scene_rows, actor_rows, setup_rows = [], [], []
    class_text = (ROOT / "Data/sql/gamedata_actor_class.sql").read_text(encoding="utf-8-sig")
    classes = {int(m[1]): (m[2], int(m[3]), int(m[4])) for m in re.finditer(
        r"\(\s*(\d+), '([^']*)', (\d+), (\d+),", class_text)}
    for scene in SCENES:
        path = client_root / "client/cut" / scene / scene
        data = path.read_bytes()
        actors = decode_actor_dictionary(data)
        start, records = decode_setup_records(data)
        scene_rows.append({"scene": scene, **source_info(path, client_root), "actor_count": len(actors),
                           "setup_start": f"0x{start:X}", "setup_record_count": len(records)})
        for actor in actors.values():
            class_path, name_id, flags = classes.get(actor.actor_id, (None, None, None))
            actor_rows.append({"scene": scene, "label": actor.label, "index": actor.index,
                               "actor_class_id": actor.actor_id, "dictionary_offset": f"0x{actor.offset:X}",
                               "class_path": class_path, "display_name_id": name_id, "property_flags": flags,
                               "spatial_setup_records": sum(r.size == 0x40 and r.actor_index == actor.index for r in records)})
        for record in records:
            if record.position and not all(math.isfinite(v) for v in record.position):
                raise ValueError(f"Non-finite setup position {scene}/{record.offset}")
            setup_rows.append({"scene": scene, **asdict(record), "offset_hex": f"0x{record.offset:X}",
                               "raw_hex": data[record.offset:record.offset + record.size].hex()})
    write_json(output / "scenes.json", {"boundary": "Scene-local setup data; no world transform or combat spawn inferred.",
               "scenes": scene_rows, "actors": actor_rows, "setup_records": setup_rows})
    write_csv(output / "scene-actors.csv", actor_rows)
    return scene_rows, actor_rows, setup_rows


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--client-root", type=Path, default=CLIENT)
    parser.add_argument("--output", type=Path, default=OUTPUT)
    args = parser.parse_args()
    args.output.mkdir(parents=True, exist_ok=True)
    inventory = build_methods(args.output)
    build_directors(args.output)
    scenes, actors, records = build_scenes(args.output, args.client_root)
    summary = {"quests": len(QUESTS), "methods": len(inventory),
               "distinct_traces": sum(r["distinct_traces"] for r in inventory),
               "sampled_eq_edges": sum(r["eq_edges"] for r in inventory),
               "unsampled_eq_edges": sum(r["unsampled_eq_edges"] for r in inventory),
               "scenes": len(scenes), "scene_actors": len(actors), "setup_records": len(records)}
    write_json(args.output / "summary.json", summary)
    print(json.dumps(summary, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
