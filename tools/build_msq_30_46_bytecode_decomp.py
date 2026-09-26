#!/usr/bin/env python3
"""Trace the five level 30–46 MSQ scenario chunks with inert client API stubs."""
from __future__ import annotations

import argparse
import csv
import itertools
import json
from pathlib import Path

from build_gc_mission_decomp import (
    ROOT, RECOVERED, CLIENT, read_chunk, trace, source_info, write_json, write_csv,
)
from disassemble_lua51 import OPNAMES, direct_method_map, format_instruction

QUESTS = {"man300": 110015, "man304": 110016, "man308": 110017,
          "man402": 110018, "man406": 110019}
OUTPUT = ROOT / "outputs/msq-30-46-bytecode-20260904"
SCENE_APIS = {"startNQCutScene", "startHQCutScene", "startSnpcNQCutScene", "startSnpcHQCutScene"}
DOMAIN = (None, False, True, *range(11))


def methods_for(code):
    return direct_method_map(read_chunk(RECOVERED / f"luac/quest/scenario/man/{code}.luac"))


def trace_event(proto, args, choice=1, scene_result=1):
    # These are explicit boundary fixtures, not an implementation of scene APIs.
    # Independent choice/scene results distinguish the initial offer from a
    # subsequent cinematic's returned result.
    returns = {name: scene_result for name in SCENE_APIS}
    returns.update(getSnpcActorClassID=1070123, getSnpcSexualityToSkin=2)
    return trace(proto, args, choice=choice, api_returns=returns)


def input_cases(count):
    if count <= 2:
        return list(itertools.product(DOMAIN, repeat=count))
    if count not in (5, 6):
        raise ValueError(f"Unclassified MSQ argument shape: {count}")
    # Keep the tuple lanes recognizable in the recorded scene arguments.
    # Test every personality and tail flag together, then each other lane
    # independently. This is not the Cartesian product of every input lane.
    base = ["NicknameFixture", 123, 1, 456, 3] + ([False] if count == 6 else [])
    cases = []
    for personality in DOMAIN:
        for tail in DOMAIN if count == 6 else (None,):
            row = base.copy()
            row[2] = personality
            if count == 6:
                row[5] = tail
            cases.append(tuple(row))
    for index in (0, 1, 3, 4):
        for value in DOMAIN:
            row = base.copy()
            row[index] = value
            cases.append(tuple(row))
    return cases


def build(output, client_root):
    output.mkdir(parents=True, exist_ok=True)
    inventory, traces, text_rows, scene_methods = [], [], [], []
    disassembly = []
    for code, quest_id in QUESTS.items():
        path = RECOVERED / f"luac/quest/scenario/man/{code}.luac"
        with (ROOT / f"docs/Dat Mining/{code}.csv").open(encoding="utf-8-sig", newline="") as stream:
            texts = {int(row[0]): row[2] for row in csv.reader(stream) if row and row[0].isdigit()}
        for name, proto in methods_for(code).items():
            if name == "initText":
                continue
            variants, seen, edges, scenes = [], set(), set(), set()
            cases = input_cases(proto.numparams - 3)
            for args in cases:
                for choice, scene_result in itertools.product((0, 1), repeat=2):
                    result = trace_event(proto, args, choice, scene_result)
                    edges.update(tuple(edge) for edge in result["eq_edges"])
                    signature = json.dumps([result["calls"], result["returns"]], sort_keys=True)
                    if signature not in seen:
                        seen.add(signature)
                        result["scene_result_fixture"] = scene_result
                        variants.append(result)
                    scenes.update(c["args"][0] for c in result["calls"] if c["method"] in SCENE_APIS)
            eqs = [pc for pc, ins in enumerate(proto.instructions) if OPNAMES[ins.op] == "EQ"]
            missing = [[pc, to] for pc in eqs for to in (pc + 1, pc + 2) if (pc, to) not in edges]
            if missing:
                raise ValueError(f"Uncovered comparison edges {code}.{name}: {missing}")
            inventory.append({"quest_id": quest_id, "code": code, "method": name,
                              "extra_parameters": proto.numparams - 3, "instructions": len(proto.instructions),
                              "sampled_eq_edges": len(edges), "distinct_traces": len(variants),
                              "scenes": ";".join(sorted(scenes))})
            traces.append({"quest_id": quest_id, "code": code, "method": name,
                           "source": source_info(path), "parameter_count": proto.numparams,
                           "sampled_eq_edges": sorted(edges), "variants": variants})
            for scene in sorted(scenes):
                scene_methods.append({"quest_id": quest_id, "code": code, "method": name, "scene": scene})
            referenced = sorted({int(c["args"][1]) for v in variants for c in v["calls"]
                                 if c["method"] in ("say", "ask")})
            for text_id in referenced:
                if text_id not in texts:
                    raise ValueError(f"Missing text {code}/{text_id}")
                text_rows.append({"quest_id": quest_id, "code": code, "method": name,
                                  "text_id": text_id, "english": texts[text_id]})
            disassembly.append(f"\n## {quest_id} {code}.{name} params={proto.numparams}\n")
            disassembly.extend(format_instruction(proto, pc, ins) + "\n"
                               for pc, ins in enumerate(proto.instructions))
    scene_files = []
    for scene in sorted({row["scene"].lower() for row in scene_methods}):
        path = client_root / "client/cut" / scene / scene
        scene_files.append({"scene": scene, **source_info(path, client_root)})
    write_json(output / "event-traces.json", {
        "boundary": "Only scenario instructions execute. Client APIs are inert boundary fixtures.",
        "argument_domain": DOMAIN, "choice_and_scene_result_domain": [0, 1],
        "actor_class_result_fixture": 1070123, "sexuality_result_fixture": 2,
        "methods": traces})
    write_csv(output / "method-inventory.csv", inventory)
    write_csv(output / "event-text.csv", text_rows)
    write_csv(output / "scene-callers.csv", scene_methods)
    write_json(output / "scene-files.json", scene_files)
    (output / "bytecode.txt").write_text("".join(disassembly), encoding="utf-8")
    # Include the actual shared-bridge instructions used for the class-vs-skin finding.
    path = RECOVERED / "luac/quest/questbaseclass_common.luac"
    helpers = direct_method_map(read_chunk(path))
    bridge = [json.dumps(source_info(path)) + "\n"]
    for name in ("getSnpcActorClassID", "getSnpcSexualityToSkin", "startSnpcNQCutScene"):
        proto = helpers[name]
        bridge.append(f"\n## {name} params={proto.numparams}\n")
        bridge.extend(format_instruction(proto, pc, ins) + "\n" for pc, ins in enumerate(proto.instructions))
    (output / "companion-bridge-bytecode.txt").write_text("".join(bridge), encoding="utf-8")
    summary = {"quests": len(QUESTS), "event_methods": len(inventory),
               "sampled_eq_edges": sum(r["sampled_eq_edges"] for r in inventory),
               "distinct_traces": sum(r["distinct_traces"] for r in inventory),
               "scene_callers": len(scene_methods), "unique_scene_files": len(scene_files)}
    write_json(output / "summary.json", summary)
    return summary


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, default=OUTPUT)
    parser.add_argument("--client-root", type=Path, default=CLIENT)
    args = parser.parse_args()
    print(json.dumps(build(args.output, args.client_root), indent=2))


if __name__ == "__main__":
    main()
