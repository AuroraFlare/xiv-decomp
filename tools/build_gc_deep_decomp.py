#!/usr/bin/env python3
"""Reproduce every GC quest's client bytecode contract without running game APIs.

All 102 main-SQL GC rows are included, including empty named/internal classes.
Noc001 is an explicitly separate GC-adjacent service quest. The helper agents'
scope, native and runtime audits occupy separate subdirectories of this pack.
"""
from __future__ import annotations

import argparse
import csv
import json
import re
import shutil
import uuid
from collections import Counter
from pathlib import Path

from build_gc_mission_decomp import ROOT, RECOVERED, read_chunk, source_info, write_json
from build_job_gc_decomp import (Object, Symbol, SCENE_APIS, build_shared, load_texts,
                                 render_value as base_render_value, write_csv)
from disassemble_lua51 import direct_method_map, format_instruction, basic_blocks
from gc_deep_symbolic import trace_method

OUTPUT = ROOT / "outputs/grand-company-deep-decomp-20260926"
QUEST_PATTERN = re.compile(
    r"\((\d+), '((?:\\.|[^'])*)', '((?:Com[05][lgu]\d|Gc[lgu]\d{3}|Noc001))', (\d+), (\d+)\)", re.I)


def quest_rows():
    path = ROOT / "Data/sql/gamedata_quests.sql"
    result = []
    for line, text in enumerate(path.read_text(encoding="utf-8-sig").splitlines(), 1):
        for match in QUEST_PATTERN.finditer(text):
            quest_id, title, code, previous, level = match.groups()
            result.append(dict(quest_id=int(quest_id), code=code.lower(),
                               title=title.replace("\\'", "'"), sql_prerequisite=int(previous),
                               sql_level=int(level), sql_line=line,
                               scope="auxiliary" if code.lower() == "noc001" else "core"))
    if len({r["code"] for r in result}) != len(result):
        raise ValueError("Duplicate quest code")
    return result


def all_protos(root):
    yield root
    for child in root.children:
        yield from all_protos(child)


def render_value(value):
    if isinstance(value, dict) and "lua_type_of" in value:
        return f"type({render_value(value['lua_type_of'])})"
    return base_render_value(value)


def render_condition(condition):
    if condition["op"] == "TRUTHY":
        expression = f"lua_truth({render_value(condition['left'])})"
    else:
        operator = {"EQ": "==", "LE": "<=", "LT": "<"}[condition["op"]]
        expression = f"{render_value(condition['left'])} {operator} {render_value(condition['right'])}"
    return f"({expression}) is {str(condition['result']).lower()} [pc {condition['pc']}, {condition['offset']}]"


def render_paths(name, record):
    lines = [f"\n## {name}\n\n",
             f"Parameters: {record['parameter_count']}; prototype `{record['prototype']}`; "
             f"{record['instruction_count']} instructions.\n\n"]
    if record.get("status") != "traced":
        return "".join(lines) + f"Static disassembly only: `{record['error']}`.\n"
    lines.append(f"{len(record['variants'])} bounded path templates; "
                 f"{record['loop_templates']} loop continuations; "
                 f"{len(record['uncovered_feasible_instructions'])} uncovered feasible instructions.\n\n")
    if name == "getTextIdStewart":
        lines.append("This is a scalar helper: arg2 is the input text row and arg3 the literal-boolean variant flag.\n\n")
    for ordinal, variant in enumerate(record["variants"], 1):
        lines.append(f"### Path {ordinal}\n\n```text\n")
        for condition in variant["conditions"]:
            lines.append("require " + render_condition(condition) + "\n")
        for call in variant["calls"]:
            arguments = ", ".join(map(render_value, call["args"]))
            results = ", ".join(map(render_value, call["returns"]))
            lines.append((results + " = " if results else "") +
                         f"{render_value(call['owner'])}:{call['method']}({arguments}) "
                         f"[pc {call['pc']}, {call['offset']}]\n")
        terminal = variant["terminal"]
        lines.append("return " + ", ".join(map(render_value, terminal["values"]))
                     if terminal["kind"] == "return" else f"continue loop at pc {terminal['resume_pc']}")
        lines.append("\n```\n\n")
    return "".join(lines)


def pure_helper_returns(proto, arguments):
    """Compose a local pure helper for concrete scalar arguments; reject API use."""
    record = trace_method(proto, event_parameters=False, initial_values=[Object("quest"), *arguments])
    values = []
    for variant in record["variants"]:
        if variant["calls"] or variant["terminal"]["kind"] != "return":
            raise ValueError("Helper is not a pure scalar-return function")
        values.append(variant["terminal"]["values"])
    if len(values) != 1:
        raise ValueError("Concrete helper input does not have one return path")
    return values[0]


def dialogue_reference(call, code):
    """Observed API signatures carry text-owner objects in different slots."""
    api, args = call["method"], call["args"]
    if api == "sayFreeDisplayName" and len(args) >= 3:
        owner, text_id = args[1], args[2]
    elif api == "askMultipleTextMacro" and len(args) >= 4:
        owner, text_id = args[1], args[3]
    elif api == "ask" and call["owner"] == {"object": "worldMaster"} and len(args) >= 4:
        owner, text_id = args[1], args[2]
    elif api in ("say", "ask", "askExtendWidget") and len(args) >= 2:
        owner, text_id = args[0], args[1]
    else:
        return None
    sheet = code if owner == {"object": "quest"} else "worldMaster" if owner == {"object": "worldMaster"} else None
    return sheet, text_id


def render_context(quest):
    """Attach independently reconciled journal/reward/runtime provenance to each dossier."""
    def citation(evidence):
        return f"[{evidence['path']}:{evidence['line']}](<../../../{evidence['path']}#L{evidence['line']}>)"
    native, runtime, availability = quest["native_quest"], quest["runtime"], quest["availability"]
    lines = ["## Quest context and progression\n\n",
             f"Company: **{quest['company']}**. Patch bucket: `{availability['bucket']}`. "
             f"Source offer enabled: **{availability['uncommented']}**. Runtime family: `{runtime['family']}`.\n\n",
             f"Native level: {native.get('level_column_51')}; native category: {native.get('category_column_52')}. "
             f"SQL dependency provenance: {quest.get('prerequisite_provenance', 'repository metadata')}.\n\n"]
    if quest.get("prerequisite_runtime_override"):
        lines.append("Runtime override: " + quest["prerequisite_runtime_override"]["meaning"] + ".\n\n")
    for archive in quest.get("archive_transcription", []):
        lines.append("Archived route transcription (not bytecode-derived): " + archive["route"] + " " + citation(archive["evidence"]) + "\n\n")
    lines.extend(["### Rewards\n\n", quest["runtime_reward_summary"] + "\n\n",
                  "Native direct company-seal slots: `" + json.dumps(quest["native_rewards"].get("direct_company_seals", [])) + "`. "
                  "Full raw reward slots and journal expressions remain in [the independent inventory](../scope/inventory.json). "
                  "Formula selectors are not treated as literal EXP.\n\n"])
    for archive in quest.get("archive_transcription", []):
        lines.append("Archive-transcribed reward: " + archive["reward"] + ".\n\n")
    lines.append("### Native journal text\n\n")
    for journal in quest["journals"]["resolved_rows"]:
        lines.append(f"- `{journal['sheet']}:{journal['row']}` — {journal['english']} " + citation(journal["evidence"]) + "\n")
    if not quest["journals"]["resolved_rows"]:
        lines.append("No resolved journal row in this source.\n")
    lines.append("\n### Current server source evidence\n\n")
    for evidence in runtime.get("evidence", []) + runtime.get("config_evidence", []):
        lines.append(f"- {citation(evidence)}: `{evidence['text'].strip().replace('`', '')}`\n")
    lines.append("\n[Detailed runtime contracts and gaps](../../../docs/grand-company-deep-decomp-20260926/runtime-and-gaps.md). "
                 "These observations describe repository source, not the running server or client acceptance.\n\n")
    return "".join(lines)


def build(output, scope_inventory=OUTPUT / "scope/inventory.json"):
    if not scope_inventory.exists():
        raise ValueError("Build the scope inventory first: python -B tools/audit_gc_deep_scope.py build")
    scope_audit = json.loads(scope_inventory.read_text(encoding="utf-8"))
    contexts = {q["code"].lower(): q for q in scope_audit["quests"]}
    for directory in ("quests", "bytecode", "reconstructed", "dialogue", "cfg", "shared"):
        (output / directory).mkdir(parents=True, exist_ok=True)
    sources = [source_info(ROOT / "Data/sql/gamedata_quests.sql"), source_info(scope_inventory)]
    sources.append(source_info(ROOT / "docs/Dat Mining/worldMaster.csv"))
    world_texts = load_texts("worldMaster")
    inventory, calls, scenes, text_calls, scope, helper_rows, failures = [], [], [], [], [], [], []
    for row in quest_rows():
        code = row["code"]
        path = RECOVERED / f"luac/quest/scenario/{code[:3]}/{code}.luac"
        source = source_info(path)
        sources.append(source)
        text_path = ROOT / f"docs/Dat Mining/{code}.csv"
        if text_path.exists():
            sources.append(source_info(text_path))
        root = read_chunk(path)
        methods = direct_method_map(root)
        texts = load_texts(code)
        records, cfg = {}, {}
        readable = [f"# {row['quest_id']} {row['title']} — {code}\n\n",
                    f"Scope: {row['scope']}. SQL level {row['sql_level']}; SQL prerequisite {row['sql_prerequisite']}. "
                    "These are current repository values, not a recovered retail server state machine.\n\n",
                    f"Bytecode: `{source['path']}`; SHA-256 `{source['sha256']}`.\n\n",
                    f"[Raw instructions](../bytecode/{code}.txt) · [Structured paths](../quests/{code}.json) · "
                    f"[Control-flow graphs](../cfg/{code}.json) · [All exported dialogue rows](../dialogue/{code}.csv)\n\n",
                    "Event inputs use quest/player/eventOwner then arg4 onward. API return symbols are independent per call/result. "
                    "Scalar helper arguments are preserved separately. Conditions describe client branches; they do not establish "
                    "the server producer or legal range of each input. Calls to native APIs stay opaque. Local helper calls are "
                    "cross-linked in local-helper-returns.csv. Loops end in explicit continuation templates.\n\n"]
        readable.append(render_context(contexts[code]))
        asm = [f"# {code}: {source['sha256']}\n"]
        names = {p.path: name for name, p in methods.items()}
        for proto in all_protos(root):
            name = names.get(proto.path, "<root>" if proto is root else "<nested>")
            asm.append(f"\n## {name} {proto.path} params={proto.numparams}\n")
            asm.append("constants=" + json.dumps(proto.constants, ensure_ascii=False) + "\n")
            asm.extend(format_instruction(proto, pc, ins) + "\n" for pc, ins in enumerate(proto.instructions))
            cfg[proto.path] = {"method": name, "blocks": [dict(start=a, end=b, successors=c)
                                                          for a, b, c in basic_blocks(proto)]}
        for name, proto in methods.items():
            if name == "initText":
                continue
            meta = dict(parameter_count=proto.numparams, instruction_count=len(proto.instructions),
                        prototype=proto.path)
            try:
                record = trace_method(proto, event_parameters=name != "getTextIdStewart")
                record.update(meta, status="traced")
                if record["uncovered_feasible_instructions"]:
                    raise ValueError(f"Uncovered feasible instructions: {record['uncovered_feasible_instructions']}")
            except ValueError as error:
                if row["scope"] == "core":
                    raise ValueError(f"{code}.{name}: {error}") from error
                record = dict(meta, status="static_only", error=str(error))
                failures.append(dict(code=code, method=name, error=str(error)))
            records[name] = record
            readable.append(render_paths(name, record))
            inventory.append({"quest_id": row["quest_id"], "scope": row["scope"], "code": code, "method": name,
                              "status": record["status"], "parameters": proto.numparams,
                              "instructions": len(proto.instructions), "path_templates": len(record.get("variants", [])),
                              "loop_templates": record.get("loop_templates", 0),
                              "uncovered_feasible_instructions": len(record.get("uncovered_feasible_instructions", [])),
                              "uncovered_branch_edges": len(record.get("uncovered_branch_edges", [])),
                              "structurally_unreachable_instructions": len(record.get("structurally_unreachable_instructions", []))})
            distinct = {}
            for number, variant in enumerate(record.get("variants", []), 1):
                for call in variant["calls"]:
                    signature = json.dumps(call, sort_keys=True)
                    entry = distinct.setdefault(signature, {**call, "variant_ids": []})
                    entry["variant_ids"].append(number)
            for call in distinct.values():
                base = dict(quest_id=row["quest_id"], code=code, method=name, pc=call["pc"], offset=call["offset"])
                calls.append({**base, "owner": json.dumps(call["owner"]), "api": call["method"],
                              "args": json.dumps(call["args"], ensure_ascii=False),
                              "returns": json.dumps(call["returns"]), "variant_ids": json.dumps(call["variant_ids"])})
                if call["method"] in SCENE_APIS:
                    if not isinstance(call["args"][0], str):
                        raise ValueError(f"Dynamic scene key {code}.{name}")
                    scenes.append({**base, "scene": call["args"][0].lower(), "api": call["method"],
                                   "args": json.dumps(call["args"]), "variant_ids": json.dumps(call["variant_ids"])})
                reference = dialogue_reference(call, code)
                if reference is not None:
                    sheet, text_id = reference
                    literal = isinstance(text_id, (int, float)) and not isinstance(text_id, bool)
                    target_texts = texts if sheet == code else world_texts if sheet == "worldMaster" else {}
                    text_calls.append({**base, "api": call["method"], "text_id": int(text_id) if literal else json.dumps(text_id),
                                       "text_sheet": sheet or "unresolved_owner",
                                       "resolution": "literal" if literal and sheet else "dynamic_row_or_owner",
                                       "english": target_texts.get(int(text_id), "<missing export or unresolved owner>") if literal else "<see local-helper-returns.csv / argument producer>"})
                if call["method"] == "getTextIdStewart":
                    for flag in (False, True, 1, 0, None):
                        returned = pure_helper_returns(methods[call["method"]], [call["args"][0], flag])
                        text_id = int(returned[0])
                        helper_rows.append({**base, "helper": call["method"], "input_text_id": int(call["args"][0]),
                                            "flag": json.dumps(flag), "output_text_id": text_id,
                                            "english": texts.get(text_id, "<missing export>")})

        if not records:
            readable.append("## Empty client class\n\nThis chunk declares no event methods. Its registration/initText instructions "
                            "are preserved in the raw file. Shared-company dialogue elsewhere does not prove inheritance or "
                            "authorize dispatch through this class.\n")
        write_json(output / f"quests/{code}.json", {**row, "source": source, "root_constants": root.constants,
                                                   "registered_methods": list(methods), "methods": records})
        write_json(output / f"cfg/{code}.json", cfg)
        (output / f"bytecode/{code}.txt").write_text("".join(asm), encoding="utf-8")
        (output / f"reconstructed/{code}.md").write_text("".join(readable), encoding="utf-8")
        write_csv(output / f"dialogue/{code}.csv", [{"text_id": k, "english": v} for k, v in sorted(texts.items())], ("text_id", "english"))
        scope.append({**row, "event_methods": sum(n.startswith("processEvent") for n in records),
                      "non_init_methods": len(records), "text_rows": len(texts), "sha256": source["sha256"]})
    for filename, rows in (("quest-inventory", scope), ("method-inventory", inventory), ("api-callers", calls),
                           ("scene-callers", scenes), ("dialogue-callers", text_calls), ("local-helper-returns", helper_rows)):
        write_csv(output / f"{filename}.csv", rows)
    sources.extend(build_shared(output))
    for filename in ("build_gc_deep_decomp.py", "gc_deep_symbolic.py", "build_job_gc_decomp.py", "build_gc_mission_decomp.py",
                     "disassemble_lua51.py", "build_dftsrt_event_handoff_decomp.py"):
        sources.append(source_info(ROOT / "tools" / filename))
    write_json(output / "source-manifest.json", sorted({s["path"]: s for s in sources}.values(), key=lambda s: s["path"]))
    core = [r for r in inventory if r["scope"] == "core"]
    summary = dict(core_quest_rows=sum(r["scope"] == "core" for r in scope),
                   named_core_quests=sum(r["scope"] == "core" and r["title"] != "[en]" for r in scope),
                   internal_core_quests=sum(r["scope"] == "core" and r["title"] == "[en]" for r in scope),
                   auxiliary_quests=[r["code"] for r in scope if r["scope"] == "auxiliary"],
                   core_non_init_methods=len(core), core_path_templates=sum(r["path_templates"] for r in core),
                   core_instructions=sum(r["instructions"] for r in core),
                   core_uncovered_feasible_instructions=sum(r["uncovered_feasible_instructions"] for r in core),
                   core_uncovered_branch_edges=sum(r["uncovered_branch_edges"] for r in core),
                   core_loop_templates=sum(r["loop_templates"] for r in core),
                   auxiliary_non_init_methods=sum(r["scope"] == "auxiliary" for r in inventory),
                   auxiliary_path_templates=sum(r["path_templates"] for r in inventory if r["scope"] == "auxiliary"),
                   distinct_scenes=len({r["scene"] for r in scenes}), scene_call_sites=len(scenes),
                   empty_core_classes=[r["code"] for r in scope if r["scope"] == "core" and not r["non_init_methods"]],
                   auxiliary_static_only=failures)
    write_json(output / "summary.json", summary)
    index = ["# Grand Company quest bytecode index\n\n",
             "Every row has a dossier, bytecode with offsets, CFG and exported dialogue. "
             "Read the companion scope/native/runtime audits for progression, rewards and implementation limits.\n\n",
             "| ID | Code | Quest | Methods | Level (SQL) | Prerequisite (SQL) |\n|---|---|---|---:|---:|---:|\n"]
    for r in scope:
        index.append(f"| {r['quest_id']} | [{r['code']}](reconstructed/{r['code']}.md) | {r['title']} | "
                     f"{r['non_init_methods']} | {r['sql_level']} | {r['sql_prerequisite']} |\n")
    (output / "QUEST_INDEX.md").write_text("".join(index), encoding="utf-8")
    return summary


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, default=OUTPUT)
    parser.add_argument("--scope-inventory", type=Path, default=OUTPUT / "scope/inventory.json")
    parser.add_argument("--check", action="store_true", help="Rebuild in a temporary directory and compare owned artifacts")
    args = parser.parse_args()
    if args.check:
        scratch_parent = (ROOT / "outputs").resolve()
        # Python 3.14's Windows tempfile mode 0700 can create an ACL that excludes
        # the sandbox token. Use an ordinary inherited-ACL directory instead.
        scratch = (scratch_parent / ("gc_deep_check_" + uuid.uuid4().hex)).resolve()
        if scratch.parent != scratch_parent or not scratch.name.startswith("gc_deep_check_"):
            raise ValueError("Unexpected temporary directory parent")
        scratch.mkdir()
        try:
            summary = build(scratch, args.scope_inventory)
            mismatches = [p.relative_to(scratch).as_posix() for p in scratch.rglob("*") if p.is_file()
                          and (not (args.output / p.relative_to(scratch)).exists()
                               or p.read_bytes() != (args.output / p.relative_to(scratch)).read_bytes())]
            if mismatches:
                raise SystemExit("Stale or missing artifacts: " + ", ".join(mismatches))
            print(f"PASS: {summary['core_quest_rows']} core quests + Noc001; deterministic bytecode artifacts match")
        finally:
            if scratch.resolve().parent != scratch_parent:
                raise ValueError("Unexpected cleanup target")
            shutil.rmtree(scratch)
        return
    print(json.dumps(build(args.output, args.scope_inventory), indent=2))


if __name__ == "__main__":
    main()
