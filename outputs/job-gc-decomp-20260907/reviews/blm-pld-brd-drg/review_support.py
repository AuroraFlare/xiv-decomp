"""Reproduce journal links and narrow raw-bytecode observations for 24 job quests.

No game code executes. The parent evidence builder owns the full path and scene
inventory; this supplement retains the journal-stage source rows used to decide
whether a recovered presentation belongs before or after combat.
"""
from __future__ import annotations

import csv
import hashlib
import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[4]
OUT = Path(__file__).resolve().parent
sys.path.insert(0, str(ROOT / "tools"))
from build_gc_mission_decomp import read_chunk
from disassemble_lua51 import OPNAMES, direct_method_map, format_instruction

QUESTS = {f"{job}0j{n}": base + n for job, base in
          (("blm", 111260), ("pld", 111280), ("brd", 111300), ("drg", 111320))
          for n in range(1, 7)}
DATA = ROOT / "docs/Dat Mining"
RECOVERED = ROOT / "tools/outputs/lpb/decomp_more_20260617/luac"
PARENT = OUT.parents[1]


def rows(path):
    with path.open(encoding="utf-8-sig", newline="") as stream:
        return {int(row[0]): row for row in csv.reader(stream)
                if row and row[0].isdigit()}


def write_json(name, value):
    (OUT / name).write_text(json.dumps(value, ensure_ascii=False, indent=2) + "\n",
                            encoding="utf-8")


def pretty(value):
    if value is None:
        return "nil"
    if isinstance(value, bool):
        return "true" if value else "false"
    if isinstance(value, (int, float)):
        return str(int(value)) if int(value) == value else str(value)
    if isinstance(value, str):
        return repr(value)
    if isinstance(value, dict):
        return value.get("object", value.get("symbol", str(value)))
    return str(value)


def build_parent_index():
    if not (PARENT / "quests/blm0j1.json").exists():
        return
    command_names = {key: value[3] for key, value in rows(DATA / "xtx_command.csv").items()}
    item_names = {key: value[6] for key, value in rows(DATA / "xtx_itemName.csv").items()}
    index = ["# Detailed method-path index: BLM / PLD / BRD / DRG\n\n",
             "Generated from the parent's raw-bytecode path inventory. `arg4` is the fourth Lua parameter, "
             "called `arg1` (first extra argument) in the narrative report. Each path keeps its own predicates; "
             "this table does not combine mutually exclusive calls. The local-text column includes only calls "
             "whose text owner is the quest. Full scheduler/talk/wait sequencing remains in the linked source JSON.\n\n"]
    rewards = []
    stats = {"quests": 0, "methods": 0, "path_templates": 0, "covered_eq_edges": 0,
             "uncovered_branch_edges": 0, "loop_templates": 0}
    skip = {"say", "_runCharaScheduler", "_waitForCharaSchedulerFinished", "_wait",
            "startCliantTalkTurn", "finishCliantTalkTurn"}
    for code, quest_id in QUESTS.items():
        data = json.loads((PARENT / f"quests/{code}.json").read_text(encoding="utf-8"))
        stats["quests"] += 1
        index.append(f"## {quest_id} `{code}`\n\n[Exact calls, predicates, and terminals](../../quests/{code}.json) · "
                     f"[Raw instructions](../../bytecode/{code}.txt)\n\n")
        index.append("| Method (Lua parameters) | Path predicate | Local text rows in order | Other API calls, exact arguments and byte offset | Return |\n"
                     "| --- | --- | --- | --- | --- |\n")
        for name, method in data["methods"].items():
            stats["methods"] += 1
            stats["path_templates"] += len(method["variants"])
            stats["covered_eq_edges"] += len(method["covered_branch_edges"])
            stats["uncovered_branch_edges"] += len(method["uncovered_branch_edges"])
            stats["loop_templates"] += method["loop_templates"]
            for variant in method["variants"]:
                conditions = [f"{pretty(c['left'])} {'==' if c['result'] else '~='} {pretty(c['right'])} @ {c['offset']}"
                              for c in variant["conditions"]]
                texts = []
                specials = []
                for call in variant["calls"]:
                    args = call["args"]
                    if call["method"] == "say" and args and args[0] == {"object": "quest"}:
                        texts.append(f"{pretty(call['owner'])}:{pretty(args[1])}")
                    elif call["method"] not in skip:
                        specials.append(f"{pretty(call['owner'])}.{call['method']}({', '.join(pretty(a) for a in args)}) @ {call['offset']}")
                    if call["method"] in {"showGetJobAbilityWidget", "showGetJobItemWidget"}:
                        value = args[1]
                        lookup = command_names if call["method"] == "showGetJobAbilityWidget" else item_names
                        row = {"code": code, "quest_id": quest_id, "method": name,
                               "api": call["method"], "offset": call["offset"], "args": args,
                               "name_source": "docs/Dat Mining/xtx_command.csv" if lookup is command_names else "docs/Dat Mining/xtx_itemName.csv",
                               "decoded_name": lookup.get(int(value), "") if isinstance(value, (int, float)) else "caller-supplied item"}
                        if row not in rewards:
                            rewards.append(row)
                term = variant["terminal"]
                returned = ", ".join(pretty(v) for v in term.get("values", [])) or "no values"
                cells = [f"`{name}` ({method['parameter_count']})", "; ".join(conditions) or "unconditional",
                         ", ".join(texts) or "—", "<br>".join(specials) or "—", returned]
                index.append("| " + " | ".join(c.replace("|", "\\|").replace("\n", " ") for c in cells) + " |\n")
        index.append("\n")
    assert stats["methods"] == 239 and stats["uncovered_branch_edges"] == 0 and stats["loop_templates"] == 0, stats
    (OUT / "method-path-index.md").write_text("".join(index), encoding="utf-8")
    write_json("reward-display-names.json", rewards)
    write_json("review-path-coverage.json", stats)


def build_scene_index():
    callers_path = PARENT / "scene-callers.csv"
    if not callers_path.exists():
        return
    with callers_path.open(encoding="utf-8-sig", newline="") as stream:
        callers = [row for row in csv.DictReader(stream) if row["code"] in QUESTS]
    scenes = sorted({row["scene"] for row in callers})
    report = ["# Scene actor and PC placement review\n\n",
              "Only class-registry-identified `SetPosClip` records are spatial here. Actor-class bindings come "
              "from the validated per-scene 0x3C proxy dictionary, joined by CACT index, preserving duplicate "
              "labels. A zero pose is still an authored zero pose, not a missing-data replacement. "
              "Positions are scene-local; no persistent zone transform, travel destination, final playback "
              "pose, enemy spawn, or party count is inferred. The raw JSON retains full float precision; "
              "this table rounds to six decimals. `ProxyActor` is the serialized actor kind for these "
              "PC/NPC bindings; it must not be confused with serialized `CharacterActor`, which can "
              "describe a stage/background slot. CATT indices vary by scene.\n\n",
              "Block order is storage order. Scene branching, motion resources, and later movement mean "
              "that the last listed SetPos is not necessarily an executed scene-exit pose. `start_units` "
              "is preserved as raw authored block timing; it is not a global quest clock.\n\n"]
    pc_tracks = []
    scene_summary = []

    def vec(position):
        return "(" + ", ".join(f"{v:.6f}" for v in position) + ")"

    for scene in scenes:
        data = json.loads((PARENT / f"scenes/{scene}.json").read_text(encoding="utf-8"))
        if "timeline" not in data:
            return
        actor_map = {actor["index"]: actor for actor in data["actors"]}
        assert len(actor_map) == len(data["actors"]), scene
        placements = [clip for clip in data["timeline"]["clips"]
                      if clip["clip_class"] == "SetPosClip" and clip["actor_index"] in actor_map]
        pc = [clip for clip in placements if actor_map[clip["actor_index"]]["actor_id"] == 0]
        initial = [clip for clip in data["setup_records"]
                   if clip["clip_class"] == "SetPosClip" and clip["actor_index"] in actor_map]
        summary = {"scene": scene, "source": data["source"], "actor_class_bound_dictionary_entries": len(actor_map),
                   "timeline_blocks": len(data["timeline"]["blocks"]),
                   "timeline_clips": len(data["timeline"]["clips"]),
                   "actor_class_bound_setpos_clips": len(placements), "pc_setpos_clips": len(pc),
                   "initial_actor_class_bound_setpos_clips": len(initial),
                   "pc_initial_setpos": [clip for clip in initial if actor_map[clip["actor_index"]]["actor_id"] == 0]}
        scene_summary.append(summary)
        report.append(f"## `{scene}`\n\n[Complete typed scene evidence](../../scenes/{scene}.json). "
                      f"Source `{data['source']['path']}`; SHA-256 `{data['source']['sha256']}`. "
                      f"{summary['timeline_blocks']} blocks; {summary['timeline_clips']} typed clips; "
                      f"{len(placements)} actor-class-bound SetPos clips; {len(pc)} PC SetPos clips.\n\n")
        report.append("Callers: " + "; ".join(f"`{r['code']}.{r['method']}` pc{r['pc']} / {r['offset']}"
                                               for r in callers if r["scene"] == scene) + ".\n\n")
        report.append("| CACT index | Exact label | Bound actor class ID | Dictionary byte offset | Initial SetPos evidence |\n"
                      "| --- | --- | --- | --- | --- |\n")
        for actor in actor_map.values():
            poses = [clip for clip in initial if clip["actor_index"] == actor["index"]]
            pose_text = "<br>".join(f"{clip['offset_hex']}: {vec(clip['position'])}; r={clip['rotation']:.6f}"
                                    for clip in poses) or "No typed SetPos in initial block"
            report.append(f"| {actor['index']} | `{actor['label'].replace('|', chr(92)+'|')}` | {actor['actor_id']} | "
                          f"{actor['dictionary_offset']} | {pose_text} |\n")
        report.append("\n### Every PC SetPos record across authored blocks\n\n")
        report.append("| Block ordinal / label | PC slot | Start units | Track / flags | Byte offset | Position | Rotation radians |\n"
                      "| --- | --- | --- | --- | --- | --- | --- |\n")
        for clip in pc:
            actor = actor_map[clip["actor_index"]]
            pc_tracks.append({"scene": scene, "proxy_dictionary_offset": actor["dictionary_offset"],
                              "bound_actor_label": actor["label"], "bound_actor_class_id": actor["actor_id"], **clip})
            label = clip["block_label"].replace("|", "\\|")
            report.append(f"| {clip['block_ordinal']} / `{label}` | {clip['actor_index']} | {clip['start_units']} | "
                          f"{clip['target_track_id']} / {clip['flags_hex']} | {clip['offset_hex']} | "
                          f"{vec(clip['position'])} | {clip['rotation']:.6f} |\n")
        if not pc:
            report.append("| — | — | — | — | — | No typed PC SetPos found | — |\n")
        report.append("\n")
    assert len(scenes) == 16, scenes
    (OUT / "scene-placement-review.md").write_text("".join(report), encoding="utf-8")
    write_json("scene-pc-tracks.json", pc_tracks)
    write_json("scene-review-summary.json", scene_summary)


def main():
    quests = rows(DATA / "xtx_quest.csv")
    markers = rows(DATA / "quest_marker.csv")
    journal = {path.stem.removeprefix("xtx_"): rows(path)
               for path in DATA.glob("xtx_journal*.csv")}
    journal_evidence = []
    event_signatures = []
    branch_bytes = []
    marker_evidence = []
    for code, quest_id in QUESTS.items():
        quest_row = quests[quest_id]
        refs = sorted(set(re.findall(r"(journalxtx\w+),(\d+),", ",".join(quest_row))),
                      key=lambda ref: (ref[0], int(ref[1])))
        journal_evidence.append({
            "code": code, "quest_id": quest_id, "title": quest_row[3],
            "quest_source": "docs/Dat Mining/xtx_quest.csv", "quest_row": quest_id,
            "journal_rows": [{"source": f"docs/Dat Mining/xtx_{sheet}.csv",
                              "row": int(row), "english": journal[sheet][int(row)][2]}
                             for sheet, row in refs],
        })
        family_base = {"blm": 11223000, "pld": 11224000, "brd": 11225000, "drg": 11226000}[code[:3]]
        marker_prefix = family_base + (int(code[-1]) - 1) * 100
        for marker_id, marker_row in markers.items():
            if marker_prefix < marker_id < marker_prefix + 100:
                marker_evidence.append({
                    "code": code, "quest_id": quest_id, "source": "docs/Dat Mining/quest_marker.csv",
                    "marker_id": marker_id, "x": float(marker_row[3]), "z": float(marker_row[4]),
                    "display_name_id": int(marker_row[5]), "map_region": int(marker_row[9]),
                    "map_area": int(marker_row[10]), "raw_row": marker_row,
                    "boundary": "Quest-marker family corroborated by runtime config; no Y, rotation, actor class, or item ordinal inferred.",
                })
        path = RECOVERED / f"quest/scenario/{code[:3]}/{code}.luac"
        methods = direct_method_map(read_chunk(path))
        for name, proto in methods.items():
            if name == "initText":
                continue
            comparisons = [{"pc": pc, "offset": f"0x{ins.offset:X}",
                            "raw": f"{ins.raw:08X}", "instruction": format_instruction(proto, pc, ins)}
                           for pc, ins in enumerate(proto.instructions) if OPNAMES[ins.op] == "EQ"]
            event_signatures.append({"code": code, "quest_id": quest_id, "method": name,
                                     "parameters": proto.numparams,
                                     "extra_parameters": max(0, proto.numparams - 3),
                                     "instructions": len(proto.instructions),
                                     "start_offset": f"0x{proto.instructions[0].offset:X}",
                                     "end_offset": f"0x{proto.instructions[-1].offset:X}",
                                     "source": path.relative_to(ROOT).as_posix(),
                                     "sha256": hashlib.sha256(path.read_bytes()).hexdigest(),
                                     "comparisons": comparisons})
            if comparisons:
                branch_bytes.append(f"## {code}.{name}\n")
                branch_bytes.extend(format_instruction(proto, pc, ins) + "\n"
                                    for pc, ins in enumerate(proto.instructions))
    write_json("journal-evidence.json", journal_evidence)
    write_json("method-signatures.json", event_signatures)
    write_json("marker-evidence.json", marker_evidence)
    (OUT / "branch-method-bytecode.txt").write_text("".join(branch_bytes), encoding="utf-8")
    build_parent_index()
    build_scene_index()
    print(json.dumps({"quests": len(journal_evidence), "journal_rows": sum(len(q["journal_rows"]) for q in journal_evidence),
                      "non_init_methods": len(event_signatures), "eq_sites": sum(len(m["comparisons"]) for m in event_signatures)}))


if __name__ == "__main__":
    main()
