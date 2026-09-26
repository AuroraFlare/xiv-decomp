#!/usr/bin/env python3
"""Hash-check and decompile both shipped ferry SCB timelines and travel Lua ABI.

No asset modifications. Cinematic placements remain separate from world homes.
Use build to save the audit, check to compare it against fresh native reads.
"""
from __future__ import annotations
import argparse
from dataclasses import asdict
import hashlib
import json
from pathlib import Path
import re
import struct

from decompile_airship_cutscene_setup import decode_actor_dictionary
from inspect_dzemael_gate_scenes import strings
from build_garuda_tornado_decomp import scb_clip_classes, scb_resource_table
from build_ifrit_ground_vfx_decomp import walk_resources, payload_tag
from build_dftsrt_event_handoff_decomp import load_manifest, artifact_paths, read_chunk, dump_proto
from disassemble_lua51 import direct_method_map

ROOT = Path(__file__).resolve().parents[1]
CLIENT = Path('C:/Program Files (x86)/SquareEnix/FINAL FANTASY XIV')
OUTPUT = ROOT / 'outputs/ferry-scenes-20260916'
SCENES = {
    'vsl0l010': ('Limsa to Western Thanalan', 514224,
        '6df2130a46e3683e94b1522b4d1bce4399464b7fca28698d1e1e90c4f5ccf083'),
    'vsl0u010': ('Western Thanalan to Limsa', 517936,
        'fef60bfdfa00ca8c26d697569cdcaefdb1192d66858f1f7ab0d35a369bd06b80'),
}
METHODS = {
    'quest/scenario/defaulttalk/dftsrt': ['eventDeparture'],
    'chara/npc/npcbaseclass': ['delegateEvent'],
    'quest/questbaseclass_common': ['startNQCutScene', 'startFadeOutCutSceneDefault',
        'startFadeInCutSceneAfterWarp', 'processAfterWarpFadeOutGeneral'],
    'gamedata/cutscene_common': ['startCutScene'],
}


def decode_scene(key, client):
    direction, size, digest = SCENES[key]
    path = f'client/cut/{key}/{key}'
    raw = (client / path).read_bytes()
    assert len(raw) == size and hashlib.sha256(raw).hexdigest() == digest, f'Source drift: {key}'
    actors = decode_actor_dictionary(raw)
    assert any(a.actor_id == 1200091 and a.label == 'Ship' for a in actors.values())
    inventory, resources = walk_resources(key, raw)
    schedules = [r for _, r in resources if payload_tag(r.payload) == 'SEDBSCB']
    assert len(schedules) == 1 and schedules[0].resource_id == key
    raw = schedules[0].payload
    names = strings(raw)
    classes = scb_clip_classes(raw)
    blocks = []
    for match in re.finditer(b'@CBLK', raw):
        start = match.start()
        name = raw[start + 16:start + 36].split(b'\0', 1)[0].decode('cp932')
        duration, count = struct.unpack_from('<II', raw, start + 36)
        cursor = start + 64
        clips = []
        for _ in range(count):
            length, kind, actor, time = struct.unpack_from('<HBBI', raw, cursor)
            assert length >= 8 and cursor + length <= len(raw) and kind < len(classes)
            body = raw[cursor + 8:cursor + length]
            row = dict(offset=hex(cursor), length=length, clip=classes[kind], actor_index=actor,
                start_units=time, body_hex=body.hex())
            if actor in actors:
                row['actor_label'] = actors[actor].label
            if row['clip'] == 'SetPosClip' and len(body) == 56:
                row['scene_local_xyz'] = list(struct.unpack_from('<3f', body, 8))
            elif row['clip'] == 'RaptureBgSetupClip' and len(body) >= 40:
                row['scene_root_xyz'] = list(struct.unpack_from('<3f', body, 28))
            elif row['clip'] == 'RaptureBgActionClip':
                words = struct.unpack('<7I', body)
                row['layout'] = names[words[3]]['value']
                row['target'] = names[words[4]]['value']
                row['selector_words'] = list(words[5:])
            clips.append(row)
            cursor += length
        blocks.append(dict(name=name, offset=hex(start), duration_units=duration, clips=clips))
    assert len(blocks) == 6
    return dict(scene=key, direction=direction, path=path, bytes=size, sha256=digest,
        resource_inventory=inventory, scheduler_resources=scb_resource_table(raw),
        offset_scope='Actor offsets: main PWIB; blocks/clips/strings: SEDBSCB payload',
        actors=[asdict(a) for a in actors.values()], strings=names, clip_classes=classes, blocks=blocks,
        boundary='Scene-local actor data, not world spawns. Raw SCB time units; no inferred retail voyage duration.')


def artifacts(client):
    result = {}
    summary = []
    for key in SCENES:
        scene = decode_scene(key, client)
        result[key + '.json'] = json.dumps(scene, indent=2, ensure_ascii=False) + '\n'
        summary.append({k: scene[k] for k in ('scene', 'direction', 'path', 'bytes', 'sha256')})
    manifest = load_manifest()
    lua_sources = []
    for logical, methods in METHODS.items():
        luac, lua = artifact_paths(manifest[logical])
        parsed = direct_method_map(read_chunk(luac))
        key = logical.replace('/', '__')
        result[key + '.instructions.txt'] = '\n'.join(dump_proto(m, parsed[m]) for m in methods)
        lua_sources.append(dict(logical=logical, bytecode=str(luac.relative_to(ROOT)).replace('\\', '/'),
            sha256=hashlib.sha256(luac.read_bytes()).hexdigest(), methods=methods))
    result['manifest.json'] = json.dumps(dict(scenes=summary, lua_sources=lua_sources,
        inventory=sorted(p.name for p in (client / 'client/cut').glob('vsl*')),
        native_evidence='native-dispatch.txt (separate read-only Ghidra export)',
        runtime_status='Offline protocol correction; both-direction live rendering/skip acceptance pending.'), indent=2) + '\n'
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('mode', choices=('build', 'check'))
    parser.add_argument('--client-root', type=Path, default=CLIENT)
    parser.add_argument('--output-dir', type=Path, default=OUTPUT)
    args = parser.parse_args()
    outputs = artifacts(args.client_root)
    if args.mode == 'build':
        args.output_dir.mkdir(parents=True, exist_ok=True)
        for name, value in outputs.items():
            (args.output_dir / name).write_text(value, encoding='utf-8')
    else:
        for name, value in outputs.items():
            assert (args.output_dir / name).read_text(encoding='utf-8') == value, f'Audit drift: {name}'
    print(f'{args.mode}: both ferry timelines and {len(METHODS)} Lua owners verified ({len(outputs)} artifacts)')


if __name__ == '__main__':
    main()
