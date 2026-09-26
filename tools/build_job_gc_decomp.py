#!/usr/bin/env python3
"""Recover the 87 requested job/GC client contracts without executing client APIs.

The symbolic evaluator handles only opcodes observed in this scope. It preserves
Lua's boolean/number distinction, independent multiple API returns, and exact
call offsets. Menu back edges are bounded templates, not unrolled retail runs.
Scene setup coordinates are scene-local; this tool never invents world warps.
"""
from __future__ import annotations

import argparse
import copy
import csv
import json
import math
import re
from collections import Counter
from dataclasses import asdict, dataclass
from pathlib import Path

from build_gc_mission_decomp import CLIENT, RECOVERED, ROOT, read_chunk, source_info, write_json
from decompile_totorak_cutscene_setup import ActorRecord
from decompile_job_gc_scene_timeline import parse_timeline
from disassemble_lua51 import OPNAMES, direct_method_map, format_instruction, successors

OUTPUT = ROOT / "outputs/job-gc-decomp-20260907"
QUESTS = {
    **{f"{job}0j{n}": base + n for job, base in
       (("war", 111200), ("mnk", 111220), ("whm", 111240), ("blm", 111260),
        ("pld", 111280), ("brd", 111300), ("drg", 111320)) for n in range(1, 7)},
    **{f"com0{city}{n}": base + n for city, base in
       (("l", 111400), ("g", 111600), ("u", 111800)) for n in range(1, 8)},
    **{f"com5{city}{n}": base + 10 + n for city, base in
       (("l", 111400), ("g", 111600), ("u", 111800)) for n in range(2)},
    **{f"gc{city}{suffix}": base + offset for city, base in
       (("l", 111400), ("g", 111600), ("u", 111800)) for suffix, offset in
       (("101", 16), ("102", 27), ("301", 17), ("302", 18), ("304", 20), ("701", 28))},
}
SCENE_APIS = {"startNQCutScene", "startHQCutScene", "startSnpcNQCutScene", "startSnpcHQCutScene"}


@dataclass(frozen=True)
class Symbol:
    name: str


@dataclass(frozen=True)
class Object:
    name: str


@dataclass(frozen=True)
class Method:
    owner: Object | Symbol
    name: str


def serial(value):
    if isinstance(value, Symbol):
        return {"symbol": value.name}
    if isinstance(value, Object):
        return {"object": value.name}
    if isinstance(value, (list, tuple)):
        return [serial(v) for v in value]
    return value


def key(value):
    if value is None:
        return ("nil", None)
    if isinstance(value, bool):
        return ("boolean", value)
    if isinstance(value, (int, float)):
        return ("number", value)
    if isinstance(value, str):
        return ("string", value)
    return (type(value).__name__, value)


def compare(op, left, right):
    if op == "EQ":
        return key(left) == key(right)
    if op == "LE":
        if key(left)[0] != key(right)[0] or key(left)[0] not in ("number", "string"):
            raise TypeError("Lua ordering requires compatible numbers or strings")
        return left <= right
    raise ValueError(op)


def branch_domain(proto):
    # One representative for each comparison-equivalence class, plus values on
    # both sides of ordering thresholds. This is NOT a client argument schema.
    values = [None, False, True, -1, 0, 1, 2, "<other string>"]
    for value in proto.constants:
        if isinstance(value, (str, int, float)):
            values.append(value)
            if isinstance(value, (int, float)) and not isinstance(value, bool):
                values.extend((value - 1, value + 1))
    return tuple(dict((key(v), v) for v in values).values())


def constrain(state, op, left, right, result, domain):
    symbols = [v for v in (left, right) if isinstance(v, Symbol)]
    if not symbols:
        return compare(op, left, right) == result
    if len(symbols) == 2:
        if left == right and op == "EQ":
            return result
        raise ValueError("Unclassified comparison between independent symbols")
    symbol = symbols[0]
    candidates = state["domains"].get(symbol.name, domain)
    allowed = []
    for value in candidates:
        a, b = (value if isinstance(left, Symbol) else left), (value if isinstance(right, Symbol) else right)
        try:
            matches = compare(op, a, b)
        except TypeError:
            continue
        if matches == result:
            allowed.append(value)
    if not allowed:
        return False
    state["domains"][symbol.name] = tuple(allowed)
    return True


def trace_method(proto):
    domain = branch_domain(proto)
    registers = {i: None for i in range(proto.maxstack)}
    for i in range(proto.numparams):
        registers[i] = Object(("quest", "player", "eventOwner")[i]) if i < 3 else Symbol(f"arg{i + 1}")
    stack = [{"pc": 0, "registers": registers, "domains": {}, "conditions": [],
              "calls": [], "edges": [], "visits": {}, "call_counts": {}}]
    finished, covered, branch_edges = [], set(), set()
    while stack:
        state = stack.pop()
        for _ in range(20000):
            pc = state["pc"]
            if not 0 <= pc < len(proto.instructions):
                raise ValueError(f"Invalid branch target {pc}")
            # Revisit a loop header once so its exit using the first menu result
            # is represented. Further traversals are explicit loop terminals.
            if state["visits"].get(pc, 0) >= 2:
                state["terminal"] = {"kind": "loop", "resume_pc": pc,
                                     "registers": {str(k): serial(v) for k, v in state["registers"].items()
                                                   if not isinstance(v, Method)}}
                finished.append(state)
                break
            state["visits"][pc] = state["visits"].get(pc, 0) + 1
            covered.add(pc)
            ins = proto.instructions[pc]
            op = OPNAMES[ins.op]
            reg = state["registers"]

            def rk(operand):
                return proto.constants[operand & 255] if operand & 256 else reg[operand]

            next_pc = pc + 1
            if op == "LOADK":
                reg[ins.a] = proto.constants[ins.bx]
            elif op == "LOADBOOL":
                reg[ins.a] = bool(ins.b)
                if ins.c:
                    next_pc += 1
            elif op == "MOVE":
                reg[ins.a] = reg[ins.b]
            elif op == "GETGLOBAL":
                reg[ins.a] = Object(proto.constants[ins.bx])
            elif op == "SELF":
                owner, name = reg[ins.b], rk(ins.c)
                if not isinstance(owner, (Object, Symbol)) or not isinstance(name, str):
                    raise ValueError(f"Unsupported method receiver at {pc}: {owner!r}")
                reg[ins.a + 1], reg[ins.a] = owner, Method(owner, name)
            elif op == "CALL":
                method = reg[ins.a]
                if not isinstance(method, Method) or ins.b == 0 or ins.c == 0:
                    raise ValueError(f"Unclassified CALL at {pc}")
                args = [reg[i] for i in range(ins.a + 1, ins.a + ins.b)]
                if args[0] != method.owner:
                    raise ValueError(f"Receiver mismatch at {pc}")
                ordinal = state["call_counts"].get(pc, 0) + 1
                state["call_counts"][pc] = ordinal
                returns = [Symbol(f"call{pc}.{ordinal}.return{n + 1}") for n in range(ins.c - 1)]
                state["calls"].append({"pc": pc, "offset": f"0x{ins.offset:X}",
                                       "owner": serial(method.owner), "method": method.name,
                                       "args": serial(args[1:]), "returns": serial(returns)})
                for n, value in enumerate(returns):
                    reg[ins.a + n] = value
            elif op in ("EQ", "LE"):
                left, right = rk(ins.b), rk(ins.c)
                for result in (False, True):
                    child = copy.deepcopy(state)
                    if not constrain(child, op, left, right, result, domain):
                        continue
                    target = pc + 1 if result == bool(ins.a) else pc + 2
                    child["conditions"].append({"pc": pc, "offset": f"0x{ins.offset:X}", "op": op,
                                                "left": serial(left), "right": serial(right),
                                                "result": result, "next_pc": target})
                    child["edges"].append((pc, target))
                    branch_edges.add((pc, target))
                    child["pc"] = target
                    stack.append(child)
                break
            elif op == "JMP":
                next_pc += ins.sbx
            elif op == "RETURN":
                if ins.b == 0:
                    raise ValueError("Variable RETURN is outside this scope")
                state["terminal"] = {"kind": "return", "pc": pc, "offset": f"0x{ins.offset:X}",
                                     "values": serial([reg[i] for i in range(ins.a, ins.a + ins.b - 1)])}
                finished.append(state)
                break
            else:
                raise ValueError(f"Unsupported {op} at {pc}")
            state["pc"] = next_pc
        else:
            raise ValueError("Instruction limit exhausted")
        if len(stack) + len(finished) > 10000:
            raise ValueError("Unclassified path explosion")
    variants = [{"conditions": s["conditions"], "calls": s["calls"], "terminal": s["terminal"]}
                for s in finished]
    expected = {(pc, target) for pc, ins in enumerate(proto.instructions)
                if OPNAMES[ins.op] in ("EQ", "LE") for target in (pc + 1, pc + 2)}
    reachable, queue = set(), [0]
    while queue:
        pc = queue.pop()
        if pc in reachable:
            continue
        reachable.add(pc)
        queue.extend(successors(proto, pc))
    return {"variants": variants, "covered_instructions": sorted(covered),
            "uncovered_instructions": sorted(set(range(len(proto.instructions))) - covered),
            "structurally_unreachable_instructions": sorted(set(range(len(proto.instructions))) - reachable),
            "uncovered_reachable_instructions": sorted(reachable - covered),
            "covered_branch_edges": sorted(branch_edges), "uncovered_branch_edges": sorted(expected - branch_edges),
            "loop_templates": sum(v["terminal"]["kind"] == "loop" for v in variants)}


def write_csv(path, rows, empty_fields=()):
    with path.open("w", newline="", encoding="utf-8") as stream:
        writer = csv.DictWriter(stream, fieldnames=list(rows[0]) if rows else empty_fields)
        writer.writeheader()
        writer.writerows(rows)


def load_texts(code):
    path = ROOT / f"docs/Dat Mining/{code}.csv"
    if not path.exists():
        return {}
    with path.open(encoding="utf-8-sig", newline="") as stream:
        return {int(row[0]): row[2] for row in csv.reader(stream) if row and row[0].isdigit()}


def render_value(value):
    if isinstance(value, dict):
        return value.get("symbol", value.get("object", repr(value)))
    if value is None:
        return "nil"
    if isinstance(value, bool):
        return str(value).lower()
    return repr(value)


def render_method(name, record):
    lines = [f"## {name} — {record['parameter_count']} parameters\n"]
    if record["loop_templates"]:
        lines.append("Menu loops are bounded path templates; repeat the indicated header for further iterations.\n")
    for index, variant in enumerate(record["variants"]):
        lines.append(f"### Path {index + 1}\n\n```text\n")
        for c in variant["conditions"]:
            op = "==" if c["op"] == "EQ" else "<="
            expression = f"{render_value(c['left'])} {op} {render_value(c['right'])}"
            lines.append(f"require ({expression}) is {str(c['result']).lower()}  [pc {c['pc']}, {c['offset']}]\n")
        for call in variant["calls"]:
            args = ", ".join(render_value(v) for v in call["args"])
            result = ", ".join(render_value(v) for v in call["returns"])
            prefix = result + " = " if result else ""
            lines.append(f"{prefix}{render_value(call['owner'])}:{call['method']}({args})  [pc {call['pc']}, {call['offset']}]\n")
        terminal = variant["terminal"]
        lines.append(("return " + ", ".join(render_value(v) for v in terminal["values"]))
                     if terminal["kind"] == "return" else f"loop -> pc {terminal['resume_pc']}")
        lines.append("\n```\n\n")
    return "".join(lines)


def build_quests(output):
    inventory, callers, fades, dialogue, sources, scope = [], [], [], [], [], []
    availability = (ROOT / "Data/scripts/quests/quest_availability.lua").read_text(encoding="utf-8-sig")
    for code, quest_id in sorted(QUESTS.items(), key=lambda row: row[1]):
        path = RECOVERED / f"luac/quest/scenario/{code[:3]}/{code}.luac"
        root = read_chunk(path)
        source = source_info(path)
        sources.append(source)
        match = re.search(rf"^.*\b{quest_id},\s*--\s*(.*?)\s*\[Lv\.\s*(\d+)\].*$", availability, re.M)
        scope.append({"quest_id": quest_id, "code": code, "title": match[1] if match else "",
                      "level": int(match[2]) if match else None,
                      "availability_row": match[0].strip() if match else "missing"})
        methods, asm, readable = {}, [f"# {quest_id} {code}\n"], [f"# {quest_id} {code}: reconstructed client path templates\n\n"]
        texts = load_texts(code)
        # Include the registration and every method, including initText, in raw
        # disassembly. initText is outside the event trace count.
        for name, proto in [("<root>", root), *direct_method_map(root).items()]:
            asm.append(f"\n## {name} params={proto.numparams} proto={proto.path}\n")
            asm.extend(format_instruction(proto, pc, ins) + "\n" for pc, ins in enumerate(proto.instructions))
            if name in ("<root>", "initText"):
                continue
            record = trace_method(proto)
            record.update(parameter_count=proto.numparams, instruction_count=len(proto.instructions),
                          prototype=proto.path, source=source)
            methods[name] = record
            all_calls = {json.dumps(c, sort_keys=True): c for v in record["variants"] for c in v["calls"]}.values()
            method_scenes, text_ids = set(), set()
            for call in all_calls:
                base = {"quest_id": quest_id, "code": code, "method": name, "pc": call["pc"], "offset": call["offset"]}
                if call["method"] in SCENE_APIS:
                    scene = call["args"][0]
                    if not isinstance(scene, str):
                        raise ValueError(f"Dynamic scene key: {code}.{name}")
                    method_scenes.add(scene.lower())
                    callers.append({**base, "scene": scene.lower(), "literal_scene": scene,
                                    "args": json.dumps(call["args"], ensure_ascii=False)})
                if "Fade" in call["method"]:
                    fades.append({**base, "api": call["method"], "args": json.dumps(call["args"])})
                if call["method"] in ("say", "ask", "sayFreeDisplayName", "askExtendWidget"):
                    if len(call["args"]) > 1 and isinstance(call["args"][1], (int, float)):
                        text_ids.add(int(call["args"][1]))
            for text_id in sorted(text_ids):
                dialogue.append({"quest_id": quest_id, "code": code, "method": name, "text_id": text_id,
                                 "english": texts.get(text_id, "<not present in local text export>")})
            inventory.append({"quest_id": quest_id, "code": code, "method": name, "parameters": proto.numparams,
                              "instructions": len(proto.instructions), "path_templates": len(record["variants"]),
                              "branch_edges": len(record["covered_branch_edges"]),
                              "uncovered_branch_edges": len(record["uncovered_branch_edges"]),
                              "uncovered_instructions": ";".join(map(str, record["uncovered_instructions"])),
                              "uncovered_reachable_instructions": len(record["uncovered_reachable_instructions"]),
                              "structurally_unreachable_instructions": len(record["structurally_unreachable_instructions"]),
                              "loop_templates": record["loop_templates"], "scenes": ";".join(sorted(method_scenes))})
            readable.append(render_method(name, record))
        write_json(output / f"quests/{code}.json", {"quest_id": quest_id, "code": code, "source": source,
                                                   "root_constants": root.constants, "methods": methods})
        (output / f"bytecode/{code}.txt").write_text("".join(asm), encoding="utf-8")
        (output / f"reconstructed/{code}.md").write_text("".join(readable), encoding="utf-8")
    for filename, rows in (("method-inventory", inventory), ("scene-callers", callers),
                           ("fade-callers", fades), ("event-text", dialogue), ("scope", scope)):
        write_csv(output / f"{filename}.csv", rows)
    index = ["# Complete requested quest index\n\n",
             "Each reconstruction contains every non-init method's typed conditions, "
             "ordered calls, return values, and raw instruction offsets. Root registration "
             "and initText are in the adjacent bytecode file. Review reports interpret "
             "battle chronology, actors, objectives and unavailable server data.\n\n",
             "| ID | Quest | Complete reconstruction | Methods | Scene resources |\n",
             "| --- | --- | --- | ---: | --- |\n"]
    for quest in scope:
        code = quest["code"]
        scenes = sorted({r["scene"] for r in callers if r["code"] == code})
        index.append(f"| {quest['quest_id']} | {quest['title']} | [{code}](reconstructed/{code}.md) | "
                     f"{sum(r['code'] == code for r in inventory)} | "
                     + ", ".join(f"[{s}](scenes/{s}.json)" for s in scenes) + " |\n")
    index.extend(["\nDetailed reviews:\n\n",
                  "- [WAR / MNK / WHM](../../docs/job_war_mnk_whm_decomp_2026-09-07.md)\n",
                  "- [BLM / PLD / BRD / DRG](../../docs/job_blm_pld_brd_drg_decomp_2026-09-07.md)\n",
                  "- [Grand Company](../../docs/grand_company_requested_decomp_2026-09-07.md)\n"])
    (output / "QUEST_INDEX.md").write_text("".join(index), encoding="utf-8")
    return inventory, callers, sources


def build_scenes(output, client_root, callers):
    classes = {int(m[1]): (m[2], int(m[3]), int(m[4])) for m in re.finditer(
        r"\(\s*(\d+), '([^']*)', (\d+), (\d+),",
        (ROOT / "Data/sql/gamedata_actor_class.sql").read_text(encoding="utf-8-sig"))}
    called = {r["scene"] for r in callers}
    # Retain family-matched scene resources that have no literal scenario caller.
    discovered = {p.name.lower() for p in (client_root / "client/cut").iterdir()
                  if p.is_dir() and any(p.name.lower().startswith(c) for c in QUESTS)}
    inventory, placements, sources, timeline_placements, clip_rows, block_rows, false_size_rows = [], [], [], [], [], [], []
    for scene in sorted(called | discovered):
        path = client_root / "client/cut" / scene / scene
        if not path.exists():
            inventory.append({"scene": scene, "referenced": scene in called, "status": "missing",
                              "actors": 0, "setup_records": 0, "error": "resource missing"})
            continue
        data = path.read_bytes()
        source = source_info(path, client_root)
        sources.append({"client_root": str(client_root), **source})
        timeline = parse_timeline(data)
        actors = [ActorRecord(a["index"], a["label"], a["actor_class_id"], a["offset"])
                  for a in timeline["actors"] if a["actor_class_id"] is not None]
        setup_blocks = [b for b in timeline["blocks"] if b["label"] in ("setup", "header")]
        if len(setup_blocks) != 1:
            raise ValueError(f"Ambiguous initial block for {scene}")
        initial = setup_blocks[0]
        start, error = initial["offset"] + 64, ""
        records = [c for c in timeline["clips"] if c["block_ordinal"] == initial["ordinal"]]
        # Keep compatibility with the earlier setup evidence JSON field names,
        # while using the real per-scene class registry for spatial semantics.
        setup = [{**r, "opcode": r["class_index"]} for r in records]
        block_rows.extend({"scene": scene, **b} for b in timeline["blocks"])
        for clip in timeline["clips"]:
            row = {"scene": scene, **{k: v for k, v in clip.items()
                    if k not in ("raw_hex", "position", "rotation", "motion_resource")}}
            row["motion_resource"] = json.dumps(clip["motion_resource"]) if clip["motion_resource"] else ""
            clip_rows.append(row)
            if clip["position"] is not None:
                timeline_placements.append({**row, "x": clip["position"][0], "y": clip["position"][1],
                                            "z": clip["position"][2], "rotation_radians": clip["rotation"],
                                            "provenance": "typed SetPosClip; scene-local authored track"})
            elif clip["size"] == 0x40 and clip["block_ordinal"] == initial["ordinal"]:
                false_size_rows.append({"scene": scene, "offset": clip["offset_hex"], "actor": clip["actor_label"],
                                        "class_index": clip["class_index"], "clip_class": clip["clip_class"],
                                        "reason": "0x40 bytes does not imply a placement"})
        actor_rows = []
        for actor in actors:
            class_path, display, flags = classes.get(actor.actor_id, (None, None, None))
            actor_rows.append({**asdict(actor), "dictionary_offset": f"0x{actor.offset:X}",
                               "class_path": class_path, "display_name_id": display, "property_flags": flags})
            for record in records:
                if record["clip_class"] != "SetPosClip" or record["actor_index"] != actor.index:
                    continue
                if not all(math.isfinite(v) for v in (*record["position"], record["rotation"])):
                    raise ValueError(f"Non-finite position: {scene}/{record['offset']}")
                placements.append({"scene": scene, "label": actor.label, "actor_index": actor.index,
                                   "actor_class_id": actor.actor_id, "display_name_id": display,
                                   "x": record["position"][0], "y": record["position"][1], "z": record["position"][2],
                                   "rotation_radians": record["rotation"], "offset": record["offset_hex"],
                                   "provenance": f"typed SetPosClip in {initial['label']}; no world transform asserted"})
        write_json(output / f"scenes/{scene}.json", {"scene": scene, "source": source,
                                                   "boundary": "Scene-local setup, not persistent world/battle transforms.",
                                                   "setup_start": start, "initial_block_label": initial["label"], "decode_error": error,
                                                   "actors": actor_rows, "setup_records": setup, "timeline": timeline})
        inventory.append({"scene": scene, "referenced": scene in called, "status": "decoded" if not error else "partial",
                          "actors": len(timeline["actors"]), "character_actors": len(actors),
                          "setup_records": len(records), "timeline_blocks": len(timeline["blocks"]),
                          "timeline_clips": len(timeline["clips"]), "error": error})
    write_csv(output / "scene-inventory.csv", inventory)
    write_csv(output / "scene-placements.csv", placements)
    write_csv(output / "scene-timeline-placements.csv", timeline_placements)
    write_csv(output / "scene-clips.csv", clip_rows)
    write_csv(output / "scene-blocks.csv", block_rows)
    write_csv(output / "rejected-size-only-placements.csv", false_size_rows)
    return inventory, placements, sources


def build_directors(output):
    rows, sources = [], []
    paths = sorted(p for p in (RECOVERED / "luac/director").rglob("*.luac")
                   if any(code in p.stem.lower() for code in QUESTS))
    for path in paths:
        root = read_chunk(path)
        source = source_info(path)
        sources.append(source)
        methods = direct_method_map(root)
        rows.append({**source, "child_prototypes": len(root.children), "method_names": list(methods),
                     "constants": root.constants})
        lines = [f"# {source['path']}\n"]
        for name, proto in [("<root>", root), *methods.items()]:
            lines.append(f"\n## {name}\n")
            lines.extend(format_instruction(proto, pc, ins) + "\n" for pc, ins in enumerate(proto.instructions))
        (output / f"directors/{path.stem}.txt").write_text("".join(lines), encoding="utf-8")
    write_json(output / "director-evidence.json", rows)
    return rows, sources


def build_shared(output):
    from build_dftsrt_event_handoff_decomp import dump_proto
    targets = {
        "quest/questbaseclass_common": ["startNQCutScene", "startFadeOutCutSceneDefault",
            "startFadeInCutSceneDefault", "startFadeInCutSceneAfterWarp", "questBaseRewardSeting"],
        "gamedata/cutscene_common": ["startCutScene"],
        "widget/cutsceneskipwidget": ["processAskResult"],
        "director/directorbaseclass": ["delegateEvent"],
        "chara/npc/npcbaseclass": ["delegateEvent"],
        "chara/player/playerbaseclass_u": ["_fadeInAfterWarp_inl", "_fadeInNowLoadingForNoticeEventJustInArea_inl"],
    }
    with (ROOT / "tools/outputs/lpb/decomp_further_20260617/combined_client_manifest.csv").open(encoding="utf-8-sig", newline="") as f:
        manifest = {r["logical_path"].lower(): r for r in csv.DictReader(f)}
    rows, sources = [], []
    for logical, names in targets.items():
        path = ROOT / f"tools/outputs/lpb/{manifest[logical]['output_batch']}/luac/{logical}.luac"
        source = source_info(path)
        sources.append(source)
        methods = direct_method_map(read_chunk(path))
        for name in names:
            proto = methods[name]
            rows.append({"logical_path": logical, "method": name, "prototype": proto.path,
                         "parameters": proto.numparams, "instructions": len(proto.instructions), **source})
        (output / f"shared/{logical.replace('/', '__')}.txt").write_text(
            "\n".join(dump_proto(name, methods[name]) for name in names), encoding="utf-8")
    write_json(output / "shared/manifest.json", rows)
    return sources


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, default=OUTPUT)
    parser.add_argument("--client-root", type=Path, default=CLIENT)
    parser.add_argument("--skip-scenes", action="store_true")
    args = parser.parse_args()
    for directory in ("quests", "bytecode", "reconstructed", "scenes", "directors", "shared"):
        (args.output / directory).mkdir(parents=True, exist_ok=True)
    methods, callers, sources = build_quests(args.output)
    directors, director_sources = build_directors(args.output)
    sources.extend(director_sources)
    sources.extend(build_shared(args.output))
    for path in ("tools/build_job_gc_decomp.py", "tools/decompile_job_gc_scene_timeline.py",
                 "tools/disassemble_lua51.py", "tools/build_gc_mission_decomp.py",
                 "tools/build_dftsrt_event_handoff_decomp.py", "tools/build_garuda_tornado_decomp.py",
                 "tools/decompile_totorak_cutscene_setup.py", "Data/sql/gamedata_actor_class.sql",
                 "Data/scripts/quests/quest_availability.lua"):
        sources.append(source_info(ROOT / path))
    scenes, placements = [], []
    if not args.skip_scenes:
        scenes, placements, scene_sources = build_scenes(args.output, args.client_root, callers)
        sources.extend(scene_sources)
    summary = {"quests": len(QUESTS), "job_quests": 42, "grand_company_quests": 45,
               "methods": len(methods), "instructions": sum(r["instructions"] for r in methods),
               "path_templates": sum(r["path_templates"] for r in methods),
               "covered_branch_edges": sum(r["branch_edges"] for r in methods),
               "uncovered_branch_edges": sum(r["uncovered_branch_edges"] for r in methods),
               "structurally_unreachable_instructions": sum(r["structurally_unreachable_instructions"] for r in methods),
               "uncovered_reachable_instructions": sum(r["uncovered_reachable_instructions"] for r in methods),
               "loop_templates": sum(r["loop_templates"] for r in methods), "director_chunks": len(directors),
               "scene_resources": len(scenes), "scene_status": dict(Counter(r["status"] for r in scenes)),
               "scene_character_setup_placements": len(placements),
               "scene_actor_slots": sum(r["actors"] for r in scenes),
               "scene_blocks": sum(r["timeline_blocks"] for r in scenes),
               "scene_clips": sum(r["timeline_clips"] for r in scenes)}
    write_json(args.output / "summary.json", summary)
    write_json(args.output / "source-manifest.json", sources)
    (args.output / "README.md").write_text(
        "# Job and Grand Company client decomp evidence\n\n"
        "Scope: 87 requested quests. `scope.csv` retains IDs and current availability rows.\n\n"
        "Start with [the complete quest index](QUEST_INDEX.md) or "
        "[the main findings](../../docs/job_gc_full_decomp_2026-09-07.md).\n\n"
        "`quests/` contains typed symbolic API-call paths and exact PCs/byte offsets; "
        "`reconstructed/` renders every non-init method as readable path templates; "
        "`bytecode/` also includes registration and initText. Symbols arg4 etc. name "
        "the 1-based client parameter slot, including self/quest, player, event owner. "
        "callPC.occurrence.returnN preserves independent multiple API results.\n\n"
        "Only recovered opcodes execute. All client calls are inert, uninterpreted "
        "boundaries. Branch coverage is coverage of bytecode predicates, not of game "
        "states, arbitrary API values, all menu repetitions, scene skipping, or server "
        "encounter behavior. Lua booleans remain distinct from numeric 0/1; LE paths "
        "require Lua-compatible ordered types. Uncovered instructions/edges are explicit.\n\n"
        "`scene-callers.csv`, `fade-callers.csv`, and per-scene JSON join method calls "
        "to installed scene resources. `scene-placements.csv` lists scene-local actor "
        "typed SetPosClip character setup positions (rotation in radians). All other "
        "clip classes retain raw records; a 0x40/0x48 size alone proves no transform. "
        "`scene-timeline-placements.csv` spans all authored blocks; `scene-clips.csv` "
        "and per-scene `timeline` retain class, track, flags, motion resources and offsets. These "
        "are neither final scene poses nor verified server world/battle placements. "
        "`director-evidence.json` records exact class shells and any methods.\n\n"
        "Reproduce: `python tools/build_job_gc_decomp.py`. Source hashes are recorded "
        "in `source-manifest.json`; client assets themselves are not copied.\n",
        encoding="utf-8")
    print(json.dumps(summary, indent=2))


if __name__ == "__main__":
    main()
