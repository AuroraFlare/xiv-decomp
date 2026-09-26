#!/usr/bin/env python3
"""Recover Atomos action/control graphs from the installed 1.x client.

Read-only against client and older evidence. Writes a focused evidence bundle.
SCB/MCB timestamps stay in authored units: the older parser's microsecond
conversion is deliberately discarded. Only explicit MTB fps/frame durations
are reported as seconds.
"""
from __future__ import annotations

import argparse
import collections
import csv
import hashlib
import json
import re
import struct
from pathlib import Path

from build_garuda_tornado_decomp import (
    ascii_strings, payload_tag, pe_va_to_file_offset, scb_clip_classes, walk_pwib_resources,
)
from build_monster_action_scheduler_contract import (
    TYPE_CIBC, TYPE_CIBT, parse_cibc, parse_cibt, parse_mcb, parse_mtb,
    parse_scheduler,
)

ROOT = Path(__file__).resolve().parents[1]
CLIENT = Path(r"C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV")
OUT = ROOT / "outputs/atomos-deepvoid-decomp-20260907/atomos-actions"


def sha(blob: bytes) -> str:
    return hashlib.sha256(blob).hexdigest()


def write_csv(path: Path, rows: list[dict]) -> None:
    keys = list(dict.fromkeys(k for row in rows for k in row))
    with path.open("w", encoding="utf-8", newline="") as stream:
        writer = csv.DictWriter(stream, fieldnames=keys, lineterminator="\n")
        writer.writeheader()
        writer.writerows(rows)


def raw_record(payload: bytes, row: dict) -> dict:
    offset = int(row["record_offset_hex"], 16)
    size = int(row.get("record_size", row.get("record_bytes", 0)))
    raw = payload[offset:offset + size]
    return {
        "record_hex": raw.hex(" "),
        "record_sha256": sha(raw),
        "record_ascii": ";".join(ascii_strings(raw)),
        "extra_u16_le": ";".join(str(x) for x in struct.unpack(
            f"<{max(0, len(raw) - 16) // 2}H", raw[16:])) if len(raw) >= 16 else "",
    }


def children(node: dict, nodes: list[dict], tag: str) -> list[dict]:
    return [n for n in nodes if n["payload_tag"] == tag and n["resource_id"]
            and n["resource_id"].encode("ascii") in node["payload"]]


def extract_model_metadata(client_root: Path, out: Path) -> dict:
    """Validate the installed CIBB bit-4 gate separately from the action banks."""
    rel = "client/chara/mon/m070/skl/0001"
    data = (client_root / rel).read_bytes()
    assert sha(data) == "54325160e1cf992afacffa08b76f1c0d8b6582bee7e1e545ae93f5edc660b95f"
    matches = [r for layer, r in walk_pwib_resources(data)
               if layer == "outer" and r.resource_type == int.from_bytes(b"bbic", "little")]
    assert len(matches) == 1
    res = matches[0]
    raw = res.payload
    assert res.resource_id == "info_m070" and len(raw) == 0x54
    assert (raw[0], raw[3], raw[0x35], raw[0x3b]) == (1, 0, 4, 0x10)
    ordinal_mask = (1 << raw[0x35]) - 1
    bit_mask = (~ordinal_mask) & 0xff
    row = {
        "source_relative_path": rel, "source_bytes": len(data), "source_sha256": sha(data),
        "resource_id": res.resource_id, "resource_path": res.resource_path,
        "resource_bytes": len(raw), "resource_sha256": sha(raw),
        "version_byte_0x00": raw[0], "serialized_flags_byte_0x03": f"0x{raw[3]:02X}",
        "ordinal_split_byte_0x35": raw[0x35], "supported_mask_byte_0x3b": f"0x{raw[0x3b]:02X}",
        "derived_msn_ordinal_mask": f"0x{ordinal_mask:02X}",
        "derived_msb_bit_mask": f"0x{bit_mask:02X}",
        "bit4_advertised_and_in_msb_partition": bool(raw[0x3b] & bit_mask & 0x10),
        "loaded_ready_flag": "0x80 is set by Cibb initializer 0x850C10 after version/size validation",
        "raw_record_hex": raw.hex(" "),
    }
    executable = ROOT / ".tmp/ffxivgame-ifrit.exe"
    if executable.exists():
        from capstone import Cs, CS_ARCH_X86, CS_MODE_32
        exe = executable.read_bytes()
        assert sha(exe) == "9341f2b4567440b310a4d494f5cc5599ca334ba51c8042247317ff466492f2e9"
        md = Cs(CS_ARCH_X86, CS_MODE_32)
        native_lines = [f"source={executable}", f"sha256={sha(exe)}", ""]
        for label, address, size in [("Cibb constructor", 0x852120, 0x22),
                                     ("Cibb initializer", 0x850c10, 0x52)]:
            offset = pe_va_to_file_offset(exe, address)
            code = exe[offset:offset + size]
            native_lines.extend([f"{label}: VA 0x{address:08X}, bytes={size}, sha256={sha(code)}",
                                 f"raw={code.hex(' ')}"])
            native_lines.extend(f"{ins.address:08X}  {ins.mnemonic} {ins.op_str}"
                                for ins in md.disasm(code, address))
            native_lines.append("")
        (out / "cibb_loader_native.txt").write_text("\n".join(native_lines), encoding="utf-8")
        row["executable_sha256"] = sha(exe)
        row["native_listing"] = "cibb_loader_native.txt"
    else:
        row["native_listing"] = "executable unavailable; addresses refer to inspected retail revision"
    write_csv(out / "model_state_metadata.csv", [row])
    (out / "model_state_metadata.json").write_text(json.dumps(row, indent=2) + "\n", encoding="utf-8")
    return row


def append_metadata_report(out: Path, metadata: dict) -> None:
    marker = "## Installed model metadata and loader closure"
    report_path = out / "REPORT.md"
    report = report_path.read_text(encoding="utf-8").split(marker)[0].rstrip()
    report += f"""

{marker}

The installed Atomos skeleton bank **does advertise bit 4**, so the asset
gate is now confirmed rather than conditional:

| Field | Recovered value |
|---|---|
| Source | `client/chara/mon/m070/skl/0001` |
| Source size / SHA-256 | `{metadata['source_bytes']}` / `{metadata['source_sha256']}` |
| Metadata resource | `info_m070`, `cib\\cibb\\mon\\info_m070` |
| Metadata size / SHA-256 | `84 (0x54)` / `{metadata['resource_sha256']}` |
| Version byte `+0` | `1` |
| Serialized flags byte `+3` | `0x00` |
| Ordinal split byte `+0x35` | `4` |
| Supported-state mask byte `+0x3B` | `0x10` |
| Derived ordinal / independent-bit partitions | `0x0F` / `0xF0` |

The raw `+3=0` byte is expected. Retail Cibb constructor `0x852120`
installs vtable `0x10409F4`, stores its resource pointer, and calls initializer
`0x850C10`. That initializer accepts version 1 records of at least `0x54`
bytes, then sets `record[3] |= 0x80`. This exact installed record therefore
passes validation and acquires the runtime-ready flag consumed by
`0x65BE50` / `0x65C550`. Raw bytes, function hashes and disassembly are saved
in `model_state_metadata.json` and `cibb_loader_native.txt`.

**Correction to older gate descriptions:** `0x7A82F0` uses the low mask
`(1 << split) - 1` for `init_msnNNN`, and its eight-bit complement for
independent `init_msbN_*` on/off states. The older Ifrit report's statement
that bit 4 requires a split count of at least 5 is incorrect. Atomos's
split 4 leaves bit 4 in the independent-state partition. Its supported
mask `0x10` advertises precisely that bit. Thus, with the model loaded,
the desired mode transition and a consumed status kick, `0 -> 0x10`
reaches `init_msb4_1` and `0x10 -> 0` reaches `init_msb4_0`.

This closes the installed client state gate; it still does not establish
which original event phase requested that mode or what its effects look
like in a faithful live render.
"""
    report_path.write_text(report, encoding="utf-8")
    summary_path = out / "summary.json"
    if summary_path.exists():
        summary = json.loads(summary_path.read_text(encoding="utf-8"))
        summary["model_state_metadata"] = metadata
        summary_path.write_text(json.dumps(summary, indent=2) + "\n", encoding="utf-8")


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--client-root", type=Path, default=CLIENT)
    parser.add_argument("--output-dir", type=Path, default=OUT)
    args = parser.parse_args()
    out = args.output_dir.resolve()
    out.mkdir(parents=True, exist_ok=True)
    base = args.client_root / "client/chara"
    sources, resources, schedulers, blocks, clips = [], [], [], [], []
    inventory_path = ROOT / "outputs/dungeon-animation-inventory-20260722/installed_action_banks.csv"
    with inventory_path.open(encoding="utf-8-sig", newline="") as stream:
        inventory = {r["relative_path"]: r for r in csv.DictReader(stream)}
    motions, motion_clips, cibt, cibc, effects, wrappers = [], [], [], [], [], []
    control_equalities = []
    cached = {}
    bank_nodes = {}
    for bank_number in range(11):
        lane = "bid" if bank_number == 0 else "wss"
        bank = f"{lane.upper()}{bank_number:04}"
        rel = f"mon/m070/act/emp_emp/{lane}/base/{bank_number:04}"
        data = (base / rel).read_bytes()
        expected = inventory[rel]
        if len(data) != int(expected["bytes"]) or sha(data) != expected["sha256"]:
            raise ValueError(f"installed action differs from recorded inventory: {rel}")
        sources.append({"bank": bank, "relative_path": rel,
                        "bytes": len(data), "sha256": sha(data)})
        common = {"bank": bank, "bank_relative_path": rel,
                  "raw_animation_id": f"0x{0x13000000 + bank_number * 0x1000:08X}" if bank_number else "",
                  "bank_sha256": sha(data)}
        nodes = []
        for layer, res in walk_pwib_resources(data):
            row = {**common, "layer": layer, "resource_index": res.index,
                   "resource_id": res.resource_id, "resource_path": res.resource_path,
                   "payload_tag": payload_tag(res.payload), "resource_type": res.resource_type,
                   "payload_bytes": len(res.payload), "payload_sha256": sha(res.payload)}
            resources.append(row)
            nodes.append({**row, "payload": res.payload})
        bank_nodes[bank] = nodes
        by_id_tag = collections.defaultdict(list)
        for node in nodes:
            by_id_tag[node["resource_id"], node["payload_tag"]].append(node)
        for node in nodes:
            payload, tag, rid = node["payload"], node["payload_tag"], node["resource_id"]
            public = {k: v for k, v in node.items() if k != "payload"}
            if tag == "SEDBSCB":
                cached[bank, rid] = payload
                summary, actors, block_rows, clip_rows = parse_scheduler(payload)
                schedulers.append({**public, **summary})
                for row in block_rows:
                    row.pop("duration_seconds", None)
                    blocks.append({**public, **row})
                for row in clip_rows:
                    row.pop("start_seconds", None)
                    clip = {**public, **row, **raw_record(payload, row)}
                    if row["clip_class"] == "RaptureEffectAtoBClip":
                        # Native handler 0x821820: int16 count at record+0x12,
                        # target clip indices at +0x16. It annotates ActionClips.
                        offset = int(row["record_offset_hex"], 16)
                        count = struct.unpack_from("<h", payload, offset + 0x12)[0]
                        assert 0 < count <= 64 and 0x16 + 2 * count <= row["record_size"]
                        indices = struct.unpack_from(f"<{count}h", payload, offset + 0x16)
                        selected = [c for index in indices for c in clip_rows
                                    if c["timeline_clip_id"] == index]
                        assert len(selected) == count and all(c["clip_class"] == "ActionClip" for c in selected)
                        clip.update({"effect_atob_reference_count": count,
                                     "effect_atob_clip_indices": ";".join(map(str, indices)),
                                     "effect_atob_action_ids": ";".join(c["resource_ref_id"] for c in selected)})
                    clips.append(clip)
                    if row["clip_class"] != "ActionClip":
                        continue
                    matches = by_id_tag[row["resource_ref_id"], "SEDBACB"]
                    if not matches:
                        effects.append({"bank": bank, "scheduler": rid,
                                        "clip_id": row["timeline_clip_id"],
                                        "start_units": row["start_units"],
                                        "action_id": row["resource_ref_id"],
                                        "resolution": "external resource absent from this bank"})
                        continue
                    assert len(matches) == 1
                    action = matches[0]
                    for vins in children(action, nodes, "SEDBvins"):
                        for leaf in children(vins, nodes, "SEDBleaf"):
                            for veff in children(leaf, nodes, "SEDBveff"):
                                effects.append({
                                    "bank": bank, "scheduler": rid,
                                    "clip_id": row["timeline_clip_id"], "start_units": row["start_units"],
                                    "action_id": action["resource_id"], "vins_id": vins["resource_id"],
                                    "leaf_id": leaf["resource_id"], "veff_id": veff["resource_id"],
                                    "veff_path": veff["resource_path"],
                                    "authored_veff_paths": ";".join(x for x in ascii_strings(leaf["payload"]) if ".veffbin" in x),
                                    "binding_tokens": ";".join(x for x in ascii_strings(vins["payload"]) if x.startswith("EID_")),
                                    "vins_controls": ";".join(x for x in ascii_strings(vins["payload"]) if "/Controls/" in x),
                                    "veff_controls": ";".join(x for x in ascii_strings(veff["payload"]) if "/Controls/" in x),
                                    "action_sha256": action["payload_sha256"], "veff_sha256": veff["payload_sha256"],
                                    "resolution": "exact same-bank serialized ACB -> VINS -> leaf -> VEFF",
                                })
            elif tag == "SEDBMCB":
                summary, rows = parse_mcb(payload, rid)
                companions = by_id_tag[rid, "SEDBmtb"]
                assert len(companions) == 1
                mtb = parse_mtb(companions[0]["payload"])
                motions.append({**public, **summary, **{f"mtb_{k}": v for k, v in mtb.items()},
                                "mtb_sha256": companions[0]["payload_sha256"],
                                "units_per_authored_frame": summary["duration_units"] / mtb["frames"]})
                for row in rows:
                    motion_clips.append({**public, **row, **raw_record(payload, row)})
            elif node["resource_type"] in (TYPE_CIBT, TYPE_CIBC):
                _summary, rows = (parse_cibt(payload) if node["resource_type"] == TYPE_CIBT else parse_cibc(payload))
                target = cibt if node["resource_type"] == TYPE_CIBT else cibc
                target.extend({**public, **r} for r in rows)
            elif tag == "SEDBACB":
                marker = payload.find(b"@BLK")
                assert marker >= 0
                duration, count = struct.unpack_from("<II", payload, marker + 0x0C)
                wrappers.append({**public, "block_offset_hex": f"0x{marker:X}",
                                 "block_duration_units": duration, "block_entry_count": count,
                                 "field_0x9c_hex": f"0x{struct.unpack_from('<I', payload, 0x9c)[0]:08X}",
                                 "field_0xa0_hex": f"0x{struct.unpack_from('<I', payload, 0xa0)[0]:08X}",
                                 "classes": ";".join(scb_clip_classes(payload))})
    for rid in ("main", "mon_main"):
        identical = cached["WSS0009", rid] == cached["WSS0010", rid]
        assert identical
        control_equalities.append({"left_bank": "WSS0009", "right_bank": "WSS0010",
                                   "resource_id": rid, "byte_identical": identical,
                                   "payload_bytes": len(cached["WSS0009", rid]),
                                   "sha256": sha(cached["WSS0009", rid])})

    tables = {"source_manifest": sources, "resource_manifest": resources,
              "scheduler_manifest": schedulers, "scheduler_blocks": blocks,
              "scheduler_clips": clips, "motion_metrics": motions,
              "motion_command_clips": motion_clips, "cibt_transitions": cibt,
              "cibc_slots": cibc, "effect_bindings": effects,
              "action_wrapper_fields": wrappers, "wss9_wss10_equality": control_equalities}
    for name, rows in tables.items():
        write_csv(out / f"{name}.csv", rows)
    bundle = {"scope": "Atomos m070 BID0000 and WSS0001..0010",
              "timing_boundary": "SCB/MCB authored units preserved; MTB duration seconds only from explicit frame/fps header",
              "counts": {key: len(value) for key, value in tables.items()},
              "control_equalities": control_equalities,
              "model_state_mapping": {"init_msb4_1": ["skill09/m070sk9c0c", "skill09/m070sk9c1c"],
                                      "init_msb4_0": ["skill10/m070sk10c0c", "skill10/m070sk10c1c"]},
              "sources": sources}
    (out / "summary.json").write_text(json.dumps(bundle, indent=2) + "\n", encoding="utf-8")
    write_report(out, motions, blocks, clips, effects, wrappers)
    append_metadata_report(out, extract_model_metadata(args.client_root, out))
    print(json.dumps(bundle["counts"], indent=2))


def write_report(out: Path, motions: list[dict], blocks: list[dict],
                 clips: list[dict], effects: list[dict], wrappers: list[dict]) -> None:
    lines = [
        "# Atomos action timelines and model-state closure — 2026-09-07", "",
        "This bundle independently rereads the installed client and resolves the full",
        "scheduler → action → effect chain. No game/runtime files were changed.", "",
        "## New conclusions", "",
        "1. **WSS9 and WSS10 have byte-identical functional schedulers.** They contain",
        "   the same `main` and `mon_main` payloads, packaged in opposite order. Each",
        "   `mon_main` binds the actor and runs `RaptureActionSubStatusSchKickClip`",
        "   at authored time zero. Neither action hardcodes its similarly numbered",
        "   visual effect. The old apparent 600000-vs-300000 duration difference was",
        "   caused by reading the first scheduler instead of comparing matching IDs.",
        "2. **Skill09 and skill10 are state effects in BID0000.** `init_msb4_1`",
        "   explicitly launches `m070sk9c0c` and `m070sk9c1c`; `init_msb4_0` launches",
        "   `m070sk10c0c` and `m070sk10c1c`. The established native mode-state path",
        "   in the repository maps bit 4 (`0x10`) set/clear to those names when",
        "   supported by loaded-model metadata. The mode update must be queued and",
        "   consumed by a real status-kick action; playing WSS9 or WSS10 alone does",
        "   not specify which state is wanted.",
        "3. **The c0 and c1 state effects bind differently.** The c0 instances use",
        "   `ActorBind` with `EID_CURRENT`; c1 uses `LeafMatrixCib` with `EID_BODY_DYN`.",
        "   This is an actor effect plus a body-associated effect, with no skeletal",
        "   `MotionClip` in either state scheduler.",
        "4. **WSS3 is target-dependent, but the aetheryte-drain label remains a",
        "   candidate.** Its target scheduler `m070_0003` starts target effect clip 2",
        "   and `RaptureEffectAtoBClip` clip 3 at zero. WSS2/4 also have target",
        "   effects. Native handler `0x821820` reads count 1 and clip index 2 from",
        "   this AtoB record, verifies that index 2 is an ActionClip and sets that",
        "   existing clip's mode to 2. It loads no separate tether resource.",
        "   A generic actor-to-actor effect clip does not by itself prove",
        "   an energy siphon or establish that its original target was a crystal.",
        "5. **`cbbm_activ` is not established as a spawn/materialization animation.**",
        "   It and `cbbm_deact` are 30-frame motions at 30 fps, with only a",
        "   `MotionCommandClip`. Their CIBT tables link normal `cbnm_id0` and battle",
        "   `cbbm_id0`; the corresponding idle tables refer back to activ/deact.",
        "   Those transition links support battle-ready/unready motion. There is",
        "   no color, fade, effect, visibility or spawn instruction in either MCB.",
        "6. **The A/B looping poses are separate from WSS2–4.** BID contains",
        "   `cbbm_sp_a_2lp` and `cbbm_sp_b_2lp`, each 50 frames at 30 fps. CIBC",
        "   `info_m070` slots 24 and 26 select the A loop; slot 28 selects the B",
        "   loop. The WSS2–4 `MotionClip`s select the one-shot `b01/a01/a02`, not",
        "   those loops. Their CIBT records explicitly cross-link `b01` to the B",
        "   loop and `a01/a02` to the A loop, using controls `03020000`; this",
        "   establishes a transition relationship, not an infinitely looping WSS.", "",
        "## Timing convention", "",
        "All scheduler starts/durations below are original integer **authored units**.",
        "Do not divide them by one million and publish them as seconds. Paired MTB",
        "headers provide explicit 30 fps and frame counts: for example WSS3's MCB",
        "duration is 900000 while its MTB is 90 frames, i.e. 3.0 s of source motion.",
        "The motion pair therefore encodes 10000 units per authored frame. This is",
        "evidence against treating these numbers as microseconds. Scheduler clocks,",
        "playback speed, sync stalls and packet-driven scheduling still need native",
        "timing closure before wall-clock action timings can be asserted.", "",
        "## Exact visual chain", "",
        "Source paths and content hashes for every step are in `effect_bindings.csv`.", "",
        "| Bank | Scheduler | Clip | Start units | ACB | Effect | Binding |",
        "|---|---|---:|---:|---|---|---|",
    ]
    for row in effects:
        if not row.get("veff_path"):
            continue
        authored = row.get("authored_veff_paths", "").replace("\\", "/")
        path = authored.rsplit("/", 1)[-1] if authored else row["veff_path"].replace("\\", "/")
        lines.append(f"| {row['bank']} | `{row['scheduler']}` | {row['clip_id']} | {row['start_units']} | `{row['action_id']}` | `{path}` | `{row['binding_tokens']}` |")
    lines.extend(["", "## Actual source motion durations", "",
                  "These seconds come only from the MTB's explicit frame count / fps.", "",
                  "| Bank | Motion | Frames | FPS | Source seconds | MCB units |",
                  "|---|---|---:|---:|---:|---:|"])
    for row in motions:
        if row["bank"] == "BID0000" and not any(x in row["resource_id"] for x in ("activ", "deact", "sp_", "ft_ded")):
            continue
        lines.append(f"| {row['bank']} | `{row['resource_id']}` | {row['mtb_frames']:g} | {row['mtb_fps']:g} | {row['mtb_duration_seconds']:.6g} | {row['duration_units']} |")
    lines.extend(["", "## Scheduler phases", "",
        "For WSS1–10 the shared `main` requests `sht00` at zero, then `mon_main`",
        "at 100000, with `ClipSyncClip` at 580000. Its authored block is 600000.",
        "`sht00` is not embedded in these m070 banks, so external scheduler loading",
        "and packet-selected owner/targets remain part of the full runtime path.", "",
        "The following rows are local to each scheduler. Parent and child numbers",
        "must not be added as wall-clock times without resolving the sync behavior.", "",
        "| Bank | Scheduler | Duration units | Meaningful phase starts |",
        "|---|---|---:|---|"])
    keep = {"MotionClip", "ActionClip", "RaptureCasterSchClip", "RaptureEffectAtoBClip",
            "RaptureActionSubStatusSchKickClip", "RaptureChantSyncClip", "RaptureEffectEndClip",
            "RaptureActionSelectDamageMccClip", "ClipSyncClip"}
    for block in blocks:
        rid, bank = block["resource_id"], block["bank"]
        if rid == "main" or (bank == "BID0000" and rid not in {"init_msb4_0", "init_msb4_1", "dead1", "dead2", "dead"}):
            continue
        events = []
        for row in clips:
            if row["bank"] != bank or row["resource_id"] != rid or row["clip_class"] not in keep:
                continue
            target = row["resource_ref_id"] or row["scheduler_target_name"] or row["effect_end_target_ids"]
            events.append(f"{row['start_units']}: {row['clip_class']} `{target}`")
        lines.append(f"| {bank} | `{rid}` | {block['duration_units']} | {'; '.join(events)} |")
    lines.extend(["", "## State lifecycle and lifetime limits", "",
        "`init_msb4_1` starts two ActionClips at zero, reaches a chant-sync clip at",
        "30000, and has explicit EffectEnd clips for action IDs 2 and 3 at 60000.",
        "`init_msb4_0` starts its two skill10 actions at zero without matching",
        "EffectEnd clips. A chant-sync instruction can stall the timeline; therefore",
        "the short encoded times are not proof that the state-on effect lasts only",
        "a fixed fraction of a second. Whether its lifetime tracks mode, chant or",
        "another status must be checked in native or live playback.", "",
        "The two state-on ACBs have `+0x9C=0xC0, +0xA0=0x101`; the two state-off",
        "ACBs have `0x80, 0x1`. This matches the persistent-on versus ordinary/off",
        "wrapper pattern already recovered for Garuda's model-state VFX. These",
        "flags strengthen the sustained-state interpretation of skill09, with",
        "skill10 as the transition out; they do not establish the historical",
        "event trigger or identify the rendered appearance without playback.", "",
        "WSS9/10 supply a kick, not a distinct pair of hardcoded toggles. Both are",
        "valid candidate dispatch envelopes after queueing the desired mode. The",
        "historical event's original skill ID, mode sequencing and target choices",
        "are not recovered by this asset-only pass.", "",
        "## Corrected reading of WSS5/7/8", "",
        "WSS5 launches `m070_0005` through `RaptureCasterSchClip` at zero and its",
        "child scheduler selects ACBs `m070_0005tar1` and `m070_0005tar2`, even though",
        "their terminal VFX are named caster `c0/c1`. Consequently a c/t suffix",
        "alone cannot establish runtime actor ownership. WSS7's `mon_main` starts",
        "ACB `m070_0007tar` at zero (terminal skill07 caster VFX), then launches a",
        "child using the skill01 target effect. WSS8 has the same source motion as",
        "WSS7 but no ActionClip, and retains a sound clip at 310000. It is not",
        "strictly a silent motion-only bank.", "",
        "## Reproduce and inspect", "",
        "```powershell", "python tools/decompile_atomos_action_timelines.py", "```", "",
        "- `source_manifest.csv`: byte counts and SHA-256 for all 11 input banks.",
        "- `scheduler_clips.csv`: every clip, actor index, flags, raw record and offset.",
        "- `effect_bindings.csv`: exact ACB/VINS/leaf/VEFF identity and attachment tokens.",
        "- `motion_metrics.csv`, `motion_command_clips.csv`: MTB metrics and all MCB commands.",
        "- `cibt_transitions.csv`, `cibc_slots.csv`: normal/battle transitions and cast loop slots.",
        "- `wss9_wss10_equality.csv`: byte-for-byte functional scheduler comparison.",
        "- `action_wrapper_fields.csv`: authored wrapper lifetimes/flags without inferred semantics.", "",
        "This extraction does not recover server spawn/wave logic, exact event-state",
        "bindings, a semantic attack-name mapping, or the proprietary effect renderer.", "",
        "Native mechanism reference: `outputs/flan-spirit-color-transition-decomp-20260831/`",
        "and `docs/ifrit-animation-decomp-2026-08-02/MODEL_STATE_KICK_PLUME_ERUPTION_BREAKTHROUGH_2026-08-05.md`.",
        "The independently decompiled AtoB handler is in sibling `../native/effect-atob-native.txt`.",
    ])
    (out / "REPORT.md").write_text("\n".join(lines) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
