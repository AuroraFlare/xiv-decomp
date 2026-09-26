#!/usr/bin/env python3
"""Refresh this review's scene snapshots and verify retained raw-byte evidence.

Actor-class membership is an index join to scene.actors, never a numeric CACT
kind assumption. This checks existing evidence; it does not execute a scene.
"""
from __future__ import annotations

import csv
import hashlib
import json
import re
import struct
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
PACK = HERE.parents[1]
CLIENT = Path(r"C:/Program Files (x86)/SquareEnix/FINAL FANTASY XIV")
DOC = ROOT / "docs/job_war_mnk_whm_decomp_2026-09-07.md"
SCENES = (
    "mnk0j110", "mnk0j310", "mnk0j610", "mnk0j620",
    "war0j310", "war0j610", "war0j620",
    "whm0j110", "whm0j210", "whm0j410", "whm0j605", "whm0j610",
)


def write(name, value):
    (HERE / name).write_text(json.dumps(value, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")


def crosscheck_methods():
    def normalize(value):
        if isinstance(value, dict):
            if set(value) in ({"object"}, {"symbol"}):
                return {"ref": next(iter(value.values()))}
            return {key: normalize(val) for key, val in value.items()}
        if isinstance(value, list):
            return [normalize(val) for val in value]
        return value

    def calls(variants):
        sequences = set()
        for variant in variants:
            sequence = []
            for call in variant["calls"]:
                owner = call["owner"]
                if isinstance(owner, str):
                    owner = {"object": owner}
                sequence.append([call["pc"], int(call["offset"], 16),
                                 normalize(owner), call["method"], normalize(call["args"])])
            sequences.add(json.dumps(sequence, sort_keys=True))
        return sequences

    compared, mismatches = 0, []
    for file in sorted(HERE.glob("*.review-traces.json")):
        own = json.loads(file.read_text(encoding="utf-8"))
        assert hashlib.sha256((ROOT / own["source"]).read_bytes()).hexdigest() == own["sha256"]
        code = file.name.split(".", 1)[0]
        universal = json.loads((PACK / "quests" / f"{code}.json").read_text(encoding="utf-8"))
        for method in own["methods"]:
            name = method["method"]
            if name == "initText":
                continue
            compared += 1
            if calls(method["variants"]) != calls(universal["methods"][name]["variants"]):
                mismatches.append(f"{code}.{name}")
    assert compared == 199 and not mismatches, (compared, mismatches)
    result = {
        "methods_compared": compared,
        "comparison": "Distinct ordered calls with exact PCs, offsets, receivers, arguments; branch representative assignments not compared as universal uses symbolic predicates.",
        "mismatches": mismatches,
    }
    write("universal-crosscheck.json", result)
    return result


def main():
    method_check = crosscheck_methods()
    text = DOC.read_text(encoding="utf-8")
    cited = {int(x, 16) for x in re.findall(r"0x[0-9a-fA-F]+", text)}
    prior = json.loads((HERE / "typed-timeline-samples.json").read_text(encoding="utf-8"))
    selected = {(r["scene"], r["offset"]) for r in prior}
    with (PACK / "scene-placements.csv").open(encoding="utf-8-sig", newline="") as stream:
        placements = list(csv.DictReader(stream))
    reviews, summary, samples, checks = [], [], [], []
    for scene in SCENES:
        data = json.loads((PACK / "scenes" / f"{scene}.json").read_text(encoding="utf-8"))
        raw = (CLIENT / data["source"]["path"]).read_bytes()
        assert len(raw) == data["source"]["bytes"], scene
        assert hashlib.sha256(raw).hexdigest() == data["source"]["sha256"], scene
        timeline = data["timeline"]
        by_index = {a["index"]: a for a in timeline["actors"]}
        bound_indexes = {a["index"] for a in data["actors"]}
        for actor in timeline["actors"]:
            payload = bytes.fromhex(actor["raw_hex"])
            assert raw[actor["offset"]:actor["offset"] + len(payload)] == payload, (scene, actor)
        setpos = [c for c in timeline["clips"] if c["clip_class"] == "SetPosClip"]
        bound_setpos = [c for c in setpos if c["actor_index"] in bound_indexes]
        initial = [c for c in bound_setpos if c["block_label"] == data["initial_block_label"]]
        for clip in timeline["clips"]:
            payload = bytes.fromhex(clip["raw_hex"])
            assert raw[clip["offset"]:clip["offset"] + len(payload)] == payload, (scene, clip["offset_hex"])
            assert clip["actor_index"] in by_index, (scene, clip["offset_hex"])
            if clip["clip_class"] == "SetPosClip":
                assert list(struct.unpack_from("<3f", payload, 16)) == clip["position"]
                assert struct.unpack_from("<f", payload, 32)[0] == clip["rotation"]
            if (scene, clip["offset"]) in selected or clip["offset"] in cited:
                samples.append({"scene": scene, **clip})
        reviews.append({
            "scene": scene, "source": data["source"],
            "initial_block_label": data["initial_block_label"],
            "setup_start": hex(data["setup_start"]) if isinstance(data["setup_start"], int) else data["setup_start"],
            "actors": data["actors"], "full_actor_slots": timeline["actors"],
            "clip_classes": timeline["clip_classes"],
            "placements": [r for r in placements if r["scene"] == scene],
        })
        summary.append({
            "scene": scene, "full_actor_slots": len(timeline["actors"]),
            "actor_class_entries": len(bound_indexes), "blocks": len(timeline["blocks"]),
            "typed_clips": len(timeline["clips"]), "setpos_clips": len(setpos),
            "actor_class_bound_setpos": len(bound_setpos),
            "initial_actor_class_bound_setpos": len(initial),
            "initial_all_setpos": sum(c["block_label"] == data["initial_block_label"] for c in setpos),
            "bind_clips": sum(c["clip_class"] == "BindActorClip" for c in timeline["clips"]),
            "unbind_clips": sum(c["clip_class"] == "UnbindActorClip" for c in timeline["clips"]),
            "if_clips": sum(c["clip_class"] == "IfClip" for c in timeline["clips"]),
            "kill_clips": sum(c["clip_class"] == "KillClip" for c in timeline["clips"]),
        })
        checks.append({"scene": scene, "source_hash_match": True,
                       "actor_records_raw_matched": len(timeline["actors"]),
                       "clip_records_raw_matched": len(timeline["clips"]),
                       "setpos_payloads_verified": len(setpos)})
    links = re.findall(r"\[[^\]]*\]\(([^)]+)\)", text)
    missing = []
    for link in links:
        if "://" in link or link.startswith("#"):
            continue
        path = link.split("#", 1)[0].strip("<>")
        if not (DOC.parent / path).exists():
            missing.append(link)
    assert not missing, missing
    write("scene-review.json", reviews)
    write("typed-timeline-summary.json", summary)
    write("typed-timeline-samples.json", samples)
    write("report-verification.json", {
        "method_crosscheck": method_check,
        "scene_verification": checks,
        "scene_totals": {key: sum(r[key] for r in summary) for key in summary[0] if key != "scene"},
        "document_links_checked": len(links), "missing_links": missing,
        "selected_clip_samples": len(samples),
        "boundary": "Raw bytes/offsets/payloads and local links verified; no scene execution or gameplay transform asserted.",
    })
    print(json.dumps({"scenes_verified": len(checks), "links_checked": len(links),
                      "samples": len(samples), "missing_links": missing}))


if __name__ == "__main__":
    main()
