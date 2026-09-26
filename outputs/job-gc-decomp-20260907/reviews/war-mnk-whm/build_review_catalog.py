"""WAR/MNK/WHM review: inert Lua-call transcripts with explicit branch inputs.

No game API or quest dispatcher executes. The imported eight-opcode tracer
records calls; raw branch PCs and Lua type-sensitive equality remain visible.
"""
from pathlib import Path
import csv
import hashlib
import itertools
import json
import sys

ROOT = Path(__file__).resolve().parents[4]
sys.path.insert(0, str(ROOT / "tools"))
from build_gc_mission_decomp import ObjectRef, read_chunk, trace
from disassemble_lua51 import OPNAMES, direct_method_map, format_instruction

OUT = Path(__file__).resolve().parent
BRANCH_ARGS = {
    ("war0j1", "processEventStart"): [(0,), (1,)],
    ("mnk0j1", "processEventGAGARUNAStart"): list(itertools.product((False, True), repeat=2)),
    ("mnk0j6", "processEvent005"): [(False,), (True,)],
    ("whm0j1", "processEventRayao"): [(0,), (1,)],
}


def val(value):
    if isinstance(value, dict) and "object" in value:
        return value["object"]
    if isinstance(value, float) and value.is_integer():
        return str(int(value))
    return json.dumps(value, ensure_ascii=False)


def quest_text_id(call):
    args = call["args"]
    if call["method"] in ("say", "notify", "openPublicInformDialogWidget", "openPublicInformLongDialogWidget"):
        if len(args) > 1 and args[0] == {"object": "quest"}:
            return int(args[1])
    if call["method"] == "sayFreeDisplayName":
        if len(args) > 2 and args[1] == {"object": "quest"}:
            return int(args[2])
    return None


def main():
    inventory = []
    all_methods = []
    for group, base in (("war", 111200), ("mnk", 111220), ("whm", 111240)):
        for number in range(1, 7):
            code = f"{group}0j{number}"
            path = ROOT / f"tools/outputs/lpb/decomp_more_20260617/luac/quest/scenario/{group}/{code}.luac"
            methods = []
            texts = {}
            text_path = ROOT / f"docs/Dat Mining/{code}.csv"
            with text_path.open(encoding="utf-8-sig", newline="") as stream:
                texts = {int(row[0]): row[2] for row in csv.reader(stream) if row and row[0].isdigit()}
            docs = [f"# {base + number} {code}: exact recorded client calls\n\n",
                    "`quest`, `player`, and `eventOwner` name R0, R1, and R2; `arg4`/`arg5` are passed parameters, not recovered semantic names. Calls retain source PCs and chunk offsets. Client APIs are inert stubs. Choices 0/1 below are explicit test inputs; each offer returns its single stored API result.\n\n"]
            disassembly = []
            for name, proto in direct_method_map(read_chunk(path)).items():
                args_domain = BRANCH_ARGS.get((code, name), [tuple(ObjectRef(f"arg{i+4}") for i in range(max(0, proto.numparams - 3)))])
                choices = (0, 1) if "showQuestInfomation" in proto.constants else (1,)
                variants = []
                edges = set()
                seen = set()
                for args, choice in itertools.product(args_domain, choices):
                    result = trace(proto, args, choice, api_returns={
                        "startNQCutScene": ObjectRef("opaque_startNQCutScene_result"),
                        "showQuestInfomation": choice,
                    })
                    edges.update(tuple(edge) for edge in result["eq_edges"])
                    signature = json.dumps([result["calls"], result["returns"]], sort_keys=True)
                    if signature not in seen:
                        seen.add(signature)
                        variants.append(result)
                expected_edges = {(pc, pc + delta) for pc, ins in enumerate(proto.instructions) if OPNAMES[ins.op] == "EQ" for delta in (1, 2)}
                missing = sorted(expected_edges - edges)
                if missing:
                    raise ValueError(f"Uncovered branch edges {code}.{name}: {missing}")
                first = f"0x{proto.instructions[0].offset:X}"
                method = {"code": code, "quest_id": base + number, "method": name, "params": proto.numparams,
                          "first_offset": first, "instructions": len(proto.instructions), "variants": variants,
                          "covered_eq_edges": sorted(edges), "missing_eq_edges": missing}
                methods.append(method)
                disassembly.append(f"## {code}.{name} params={proto.numparams} code={len(proto.instructions)}\n")
                disassembly.extend(format_instruction(proto, pc, ins) + "\n" for pc, ins in enumerate(proto.instructions))
                docs.append(f"## {name} ({proto.numparams} parameters; {first}; {len(proto.instructions)} instructions)\n\n")
                for v, result in enumerate(variants, 1):
                    if len(variants) > 1:
                        docs.append(f"Variant {v}: extras `[{', '.join(val(a) for a in result['args'])}]`, offer result `{result['choice']}`.\n\n")
                    docs.append("```text\n")
                    for call in result["calls"]:
                        docs.append(f"pc{call['pc']:03} {call['offset']}: {call['owner']}:{call['method']}({', '.join(val(a) for a in call['args'])})\n")
                    docs.append(f"return {', '.join(val(a) for a in result['returns']) or '(no values)'}\n```\n\n")
                ids = sorted({text_id for result in variants for call in result["calls"]
                              if (text_id := quest_text_id(call)) is not None})
                if ids:
                    docs.append("Quest-text references:\n\n")
                    for text_id in ids:
                        docs.append(f"- `{text_id}`: {texts.get(text_id, '[not found in quest text table]')}\n")
                    docs.append("\n")
                inventory.append({"code": code, "method": name, "params": proto.numparams, "first_offset": first,
                                  "instructions": len(proto.instructions), "variants": len(variants), "eq_edges": len(edges),
                                  "text_ids": ";".join(map(str, ids))})
            (OUT / f"{code}.calls.md").write_text("".join(docs), encoding="utf-8")
            (OUT / f"{code}.bytecode.txt").write_text("".join(disassembly), encoding="utf-8")
            (OUT / f"{code}.review-traces.json").write_text(json.dumps({"source": path.relative_to(ROOT).as_posix(),
                "sha256": hashlib.sha256(path.read_bytes()).hexdigest(), "methods": methods}, indent=2) + "\n", encoding="utf-8")
            all_methods.extend(methods)
    with (OUT / "review-methods.csv").open("w", encoding="utf-8", newline="") as stream:
        writer = csv.DictWriter(stream, fieldnames=list(inventory[0]))
        writer.writeheader()
        writer.writerows(inventory)
    summary = {"quests": 18, "methods_including_initText": len(all_methods),
               "methods_excluding_initText": sum(m["method"] != "initText" for m in all_methods),
               "recorded_variants": sum(len(m["variants"]) for m in all_methods),
               "covered_eq_edges": sum(len(m["covered_eq_edges"]) for m in all_methods),
               "missing_eq_edges": 0, "boundary": "Inert API recording only; symbolic passthrough arguments; explicit branch representatives."}
    (OUT / "review-summary.json").write_text(json.dumps(summary, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(summary, indent=2))


if __name__ == "__main__":
    main()
